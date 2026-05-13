#!/usr/bin/env python3

"""
port_to_region.py — mechanical EUR-to-region source porting.

Given a matched EUR `.c` source, rewrite all cross-region symbol
references (function names, callees, data symbols) to their USA
or JPN siblings via `find_region_siblings.find_siblings()`. Write
the ported source to `src/<region>/<module>/<func>.c` and emit the
`delinks.txt` TU header decomper adds when accepting the port.

Usage:

    # Port one source to USA, write into src/usa/
    python tools/port_to_region.py src/main/func_02006164.c --target usa

    # Dry-run (print rewritten source + delinks header, no write)
    python tools/port_to_region.py src/main/func_02006164.c \
        --target usa --dry-run

    # JSON output for tool chaining
    python tools/port_to_region.py src/main/func_02006164.c \
        --target usa --json

    # Refuse to write unless every symbol resolves at HIGH conf
    python tools/port_to_region.py <path> --target usa \
        --confidence-floor HIGH    # default

**Layout convention (strawman pending brain's confirmation in
PR review):** per-region trees. EUR sources live at
`src/main/`, `src/overlay002/`, ... (unchanged). USA ports go to
`src/usa/main/`, `src/usa/overlay002/`, ... — same module layout,
prefixed by region. JPN is symmetrical at `src/jpn/...`.

The alternative — a single shared `src/` with `#ifdef REGION_USA`
blocks — was considered and ruled out: region-specific symbol
addresses, callee renames, and Style A/B routing tier all already
diverge per region; `#ifdef` proliferation would dwarf the
mechanical port itself.

Symbol references covered:

1. **`func_<addr>` (bare):** main-module function. Looked up in
   the source's *referrer* module if the referrer is main; else
   in main directly.
2. **`func_ov<NNN>_<addr>` (prefixed):** overlay N function.
   Looked up in `ovNNN`.
3. **`data_<addr>` (bare):** main-module data symbol.
4. **`data_ov<NNN>_<addr>` (prefixed):** overlay N data symbol.

Data-symbol lookups currently fall back to address-equality
matching in the target region's `symbols.txt` (data symbols
aren't fingerprinted by `find_region_siblings` v2; their port
is straight name-substitution per address). See *Limitations*
in the file header for the full scope.

Out of scope for v1:

- Symbols that have been renamed in EUR but not in the target
  region (e.g. `Task_InvokeLocked` in EUR, still `func_<addr>`
  in USA). Cross-region rename mapping is a future enhancement.
- Sources that have `#include "..."` from `libs/` or
  `include/` — the headers are region-shared in the current
  layout; the port_to_region tool emits the same `#include`
  lines verbatim.
- Conditional-compilation (Style A vs Style B per-routing-tier)
  source layouts (`*.legacy.c`, `*.legacy_sp3.c`): the tool
  preserves the `.legacy.c` suffix verbatim if the EUR source
  has it; brain decides per-target whether the target region
  needs the same routing tier.

Brief 064 deliverable #2 of 3.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
SRC_DIR = ROOT / "src"

# Pattern matches `func_<addr>` and `func_ov<NNN>_<addr>` and the
# analogous `data_*` forms. Single regex with named groups so we
# can identify the kind (func vs data) and the qualifier
# (bare vs overlay-prefixed) in one pass.
SYMBOL_RE = re.compile(
    r"\b(?P<kind>func|data)"
    r"(?:_ov(?P<overlay>\d+))?"
    r"_(?P<addr>[0-9a-fA-F]{8})\b"
)


@dataclass(frozen=True)
class SymbolRef:
    """A parsed symbol reference in the source."""
    text: str       # raw matched text (e.g. "func_ov002_021b3c10")
    kind: str       # 'func' or 'data'
    module: str     # 'main', 'ov002', etc.
    addr: int       # decimal address


@dataclass
class Resolution:
    """A symbol's cross-region resolution."""
    eur_ref: SymbolRef
    target_name: str | None  # target region's symbol name; None if unresolved
    confidence: str          # 'HIGH', 'MEDIUM', 'LOW', 'NONE', or 'EXACT_ADDR' for data
    notes: str               # human-readable rationale


# --------------------------------------------------------------------------- #
# Source path → module
# --------------------------------------------------------------------------- #

def infer_module_from_path(source_path: Path) -> str:
    """Map a src/ path to a module name.

    `src/main/func_X.c`              → "main"
    `src/overlay002/func_X.c`        → "ov002"
    `src/main/func_X.legacy.c`       → "main"
    `src/usa/main/func_X.c`          → "main" (region prefix stripped)
    """
    try:
        rel = source_path.resolve().relative_to(SRC_DIR.resolve())
    except ValueError:
        return ""
    parts = rel.parts
    if not parts:
        return ""
    # If first part is a known region prefix, skip it
    if parts[0] in ("eur", "usa", "jpn") and len(parts) > 1:
        parts = parts[1:]
    head = parts[0]
    if head == "main":
        return "main"
    if head.startswith("overlay"):
        suffix = head[len("overlay"):]
        if suffix.isdigit():
            return "ov" + suffix.zfill(3)
    return ""


def module_to_src_dir(module: str) -> str:
    """Inverse of infer_module_from_path's overlay handling.

    "main"   → "main"
    "ov002"  → "overlay002"
    """
    if module == "main":
        return "main"
    if module.startswith("ov") and module[2:].isdigit():
        return "overlay" + module[2:].zfill(3)
    return module


# --------------------------------------------------------------------------- #
# Symbol parsing + resolution
# --------------------------------------------------------------------------- #

def parse_symbols_in_source(source_text: str, default_module: str) -> dict[tuple[str, str, int], SymbolRef]:
    """Extract all unique `func_*` / `data_*` references in the source.

    Returns dict keyed by (kind, module, addr) → SymbolRef so duplicate
    references collapse to one resolution.
    """
    out: dict[tuple[str, str, int], SymbolRef] = {}
    for m in SYMBOL_RE.finditer(source_text):
        text = m.group(0)
        kind = m.group("kind")
        overlay = m.group("overlay")
        addr = int(m.group("addr"), 16)
        if overlay is not None:
            module = "ov" + overlay.zfill(3)
        else:
            # Bare symbol — defaults to main-module reference
            # regardless of referrer module.
            module = "main"
        key = (kind, module, addr)
        if key not in out:
            out[key] = SymbolRef(text=text, kind=kind, module=module,
                                 addr=addr)
    return out


def resolve_symbol(
    ref: SymbolRef,
    target_region: str,
    eur_regions: dict[str, list],
    target_regions: dict[str, list],
    target_data_symbols: dict[str, dict[int, str]],
    find_siblings_fn,
    data_addr_map: dict[tuple[str, int], tuple[str, int]] | None = None,
) -> Resolution:
    """Resolve one EUR symbol reference to its target-region name.

    For `func_*`: uses find_region_siblings to fingerprint-match.
    For `data_*`: first tries the derived parallel-reloc mapping
    (built from the function being ported's reloc table), then
    falls back to exact-address match in target's symbols.txt.
    """
    if ref.kind == "data":
        # Try the parallel-reloc-derived mapping first (most
        # reliable for data symbols referenced by the function
        # being ported).
        if data_addr_map is not None:
            mapped = data_addr_map.get((ref.module, ref.addr))
            if mapped is not None:
                mapped_module, mapped_addr = mapped
                data_table = target_data_symbols.get(mapped_module, {})
                target_name = data_table.get(mapped_addr)
                if target_name:
                    return Resolution(
                        eur_ref=ref,
                        target_name=target_name,
                        confidence="EXACT_ADDR",
                        notes=f"parallel-reloc map → "
                              f"{mapped_module}/0x{mapped_addr:08x}",
                    )

        # Fallback: exact-address match in target's symbols.txt
        # (works when EUR and target share the data layout for
        # this symbol — common for libraries / lookup tables that
        # don't shift across regions).
        data_table = target_data_symbols.get(ref.module, {})
        target_name = data_table.get(ref.addr)
        if target_name:
            return Resolution(
                eur_ref=ref,
                target_name=target_name,
                confidence="EXACT_ADDR",
                notes=f"exact-address match in {target_region}/{ref.module}",
            )
        return Resolution(
            eur_ref=ref,
            target_name=None,
            confidence="NONE",
            notes=f"no {target_region}/{ref.module} data symbol at "
                  f"0x{ref.addr:08x} (parallel-reloc map didn't cover "
                  f"this address)",
        )

    # func — use find_region_siblings
    eur_func = None
    for f in eur_regions.get(ref.module, []):
        if f.addr == ref.addr:
            eur_func = f
            break
    if eur_func is None:
        return Resolution(
            eur_ref=ref,
            target_name=None,
            confidence="NONE",
            notes=f"no EUR symbol at {ref.module}/0x{ref.addr:08x} — "
                  f"may be a renamed symbol (not yet supported by v1)",
        )

    matches = find_siblings_fn(
        eur_func, target_regions,
        max_results=1,
        source_region="eur",
        target_region_name=target_region,
        byte_disambiguate=True,
    )
    if not matches:
        return Resolution(
            eur_ref=ref,
            target_name=None,
            confidence="NONE",
            notes=f"no candidate in {target_region}/{ref.module}",
        )

    top = matches[0]
    return Resolution(
        eur_ref=ref,
        target_name=top.func.name,
        confidence=top.confidence,
        notes=top.rationale,
    )


# --------------------------------------------------------------------------- #
# Rewriting
# --------------------------------------------------------------------------- #

def apply_substitutions(
    source_text: str,
    resolutions: list[Resolution],
) -> str:
    """Apply each resolved EUR symbol → target name substitution.

    Replacements use word-boundary regex so partial-name collisions
    don't fire (e.g. rewriting `func_02006164` doesn't touch
    `func_020061640` if such a thing existed).
    """
    out = source_text
    # Apply longest-first so prefixed names (e.g. func_ov002_X) get
    # replaced before the bare func_X variant would be considered.
    sorted_res = sorted(
        [r for r in resolutions if r.target_name is not None],
        key=lambda r: -len(r.eur_ref.text),
    )
    for r in sorted_res:
        pattern = r"\b" + re.escape(r.eur_ref.text) + r"\b"
        out = re.sub(pattern, r.target_name, out)
    return out


def compute_output_path(
    source_path: Path,
    target_region: str,
    target_func_name: str,
    module: str,
) -> Path:
    """Compute the per-region output path for a ported source.

    `src/main/func_02006164.c` + target=usa + target_func=func_02006148
    → `src/usa/main/func_02006148.c`

    `src/overlay002/func_ov002_X.c` + target=jpn → `src/jpn/overlay002/...`

    `.legacy.c` and `.legacy_sp3.c` suffixes are preserved.
    """
    name_stem = source_path.stem
    suffix = source_path.suffix
    # Detect compound suffix (.legacy.c / .legacy_sp3.c) — these
    # show up in `name_stem` because source_path.stem only strips
    # the final ".c".
    routing_suffix = ""
    if name_stem.endswith(".legacy_sp3"):
        routing_suffix = ".legacy_sp3"
        name_stem = name_stem[:-len(".legacy_sp3")]
    elif name_stem.endswith(".legacy"):
        routing_suffix = ".legacy"
        name_stem = name_stem[:-len(".legacy")]

    new_filename = f"{target_func_name}{routing_suffix}{suffix}"
    src_subdir = module_to_src_dir(module)
    return SRC_DIR / target_region / src_subdir / new_filename


def compute_delinks_entry(
    target_path: Path,
    target_func,
) -> str:
    """Emit the delinks.txt entry the decomper adds.

    Format (matches existing config/eur/...delinks.txt convention):

        src/<region>/<module>/<func>.c:
            complete
            .text start:0x<addr> end:0x<addr+size>
    """
    rel = target_path.relative_to(ROOT)
    return (
        f"{rel}:\n"
        f"    complete\n"
        f"    .text start:0x{target_func.addr:08x} "
        f"end:0x{target_func.addr + target_func.size:08x}\n"
    )


# --------------------------------------------------------------------------- #
# Data-symbol table loader
# --------------------------------------------------------------------------- #

DATA_RE = re.compile(
    r"^(?P<name>\S+)\s+kind:(?:data|bss)(?:\([^)]*\))?\s+addr:0x(?P<addr>[0-9a-fA-F]+)"
)


def load_region_data_symbols(region: str) -> dict[str, dict[int, str]]:
    """Return dict[module] → {addr: data_symbol_name} for one region."""
    out: dict[str, dict[int, str]] = {}
    config_arm9 = ROOT / "config" / region / "arm9"
    if not config_arm9.is_dir():
        return out

    def _parse(path: Path) -> dict[int, str]:
        result: dict[int, str] = {}
        if not path.is_file():
            return result
        for line in path.read_text(encoding="utf-8",
                                   errors="replace").splitlines():
            m = DATA_RE.match(line)
            if m:
                result[int(m.group("addr"), 16)] = m.group("name")
        return result

    out["main"] = _parse(config_arm9 / "symbols.txt")
    overlays_dir = config_arm9 / "overlays"
    if overlays_dir.is_dir():
        for ov_dir in sorted(overlays_dir.iterdir()):
            if not (ov_dir / "symbols.txt").is_file():
                continue
            out[ov_dir.name] = _parse(ov_dir / "symbols.txt")
    return out


# Parallel-reloc helper for data-symbol mapping.
#
# When find_region_siblings pairs EUR func_X with USA func_Y, the
# two functions have parallel relocation tables (same offsets,
# same kinds). The relocation TARGETS differ: EUR's reloc at
# offset N points to EUR_data_addr; USA's reloc at offset N
# points to USA_data_addr.
#
# We use that parallel structure to build the EUR_addr ↔
# USA_addr mapping for every data symbol referenced from any
# matched function. The mapping is per-target-module since
# `to_module` differs between code and data references.

RELOC_FULL_RE = re.compile(
    r"^from:0x(?P<from_addr>[0-9a-fA-F]+)\s+kind:(?P<kind>\S+)\s+"
    r"to:0x(?P<to_addr>[0-9a-fA-F]+)\s+module:(?P<to_mod>\S+)"
)


def load_full_relocs(region: str) -> dict[str, dict[int, list[tuple[str, int, str]]]]:
    """Return dict[source_module] -> dict[from_addr] -> list of
    (kind, to_addr, to_module) tuples for the region.
    """
    out: dict[str, dict[int, list[tuple[str, int, str]]]] = {}
    config_arm9 = ROOT / "config" / region / "arm9"
    if not config_arm9.is_dir():
        return out

    def _parse(path: Path) -> dict[int, list[tuple[str, int, str]]]:
        from collections import defaultdict
        result: dict[int, list[tuple[str, int, str]]] = defaultdict(list)
        if not path.is_file():
            return dict(result)
        for line in path.read_text(encoding="utf-8",
                                   errors="replace").splitlines():
            m = RELOC_FULL_RE.match(line)
            if m:
                result[int(m.group("from_addr"), 16)].append((
                    m.group("kind"),
                    int(m.group("to_addr"), 16),
                    m.group("to_mod"),
                ))
        return dict(result)

    out["main"] = _parse(config_arm9 / "relocs.txt")
    overlays_dir = config_arm9 / "overlays"
    if overlays_dir.is_dir():
        for ov_dir in sorted(overlays_dir.iterdir()):
            if not (ov_dir / "relocs.txt").is_file():
                continue
            out[ov_dir.name] = _parse(ov_dir / "relocs.txt")
    return out


def derive_data_address_mapping(
    eur_func,
    target_func,
    eur_relocs: dict[int, list[tuple[str, int, str]]],
    target_relocs: dict[int, list[tuple[str, int, str]]],
) -> dict[tuple[str, int], tuple[str, int]]:
    """Build EUR_(module, addr) → target_(module, addr) mapping
    for each relocation in `eur_func` that has a corresponding
    relocation in `target_func` at the same offset within the
    function.

    Returns dict keyed by (target_module, eur_addr) → (target_module,
    target_addr). Used to translate data-symbol references in the
    EUR source to their target-region equivalents.
    """
    out: dict[tuple[str, int], tuple[str, int]] = {}

    # Collect relocs per offset within each function.
    eur_at_offset: dict[int, list[tuple[str, int, str]]] = {}
    for r_from in range(eur_func.addr, eur_func.addr + eur_func.size, 2):
        if r_from in eur_relocs:
            offset = r_from - eur_func.addr
            eur_at_offset.setdefault(offset, []).extend(eur_relocs[r_from])

    target_at_offset: dict[int, list[tuple[str, int, str]]] = {}
    for r_from in range(target_func.addr,
                        target_func.addr + target_func.size, 2):
        if r_from in target_relocs:
            offset = r_from - target_func.addr
            target_at_offset.setdefault(offset, []).extend(
                target_relocs[r_from])

    # Pair up by offset + kind + to_module. Within a (offset, kind,
    # module) bucket, pair by list-index — if both regions have
    # multiple relocs at the same offset (rare), the order is
    # preserved deterministically.
    for offset, eur_list in eur_at_offset.items():
        target_list = target_at_offset.get(offset, [])
        # Match by (kind, to_module) then by position-in-list.
        eur_by_kind: dict[tuple[str, str], list[int]] = {}
        for eur_addr in eur_list:
            key = (eur_addr[0], eur_addr[2])
            eur_by_kind.setdefault(key, []).append(eur_addr[1])
        target_by_kind: dict[tuple[str, str], list[int]] = {}
        for tgt_addr in target_list:
            key = (tgt_addr[0], tgt_addr[2])
            target_by_kind.setdefault(key, []).append(tgt_addr[1])
        for key, eur_addrs in eur_by_kind.items():
            target_addrs = target_by_kind.get(key, [])
            for eur_a, tgt_a in zip(eur_addrs, target_addrs, strict=False):
                to_mod = key[1]
                out[(to_mod, eur_a)] = (to_mod, tgt_a)

    return out


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Port an EUR matched .c source to USA or JPN.",
    )
    ap.add_argument("source", type=Path,
                    help="Path to the EUR .c source to port.")
    ap.add_argument("--target", required=True, choices=["usa", "jpn"],
                    help="Target region.")
    ap.add_argument("--confidence-floor", default="HIGH",
                    choices=["HIGH", "MEDIUM", "LOW"],
                    help="Refuse to write unless every func symbol "
                         "resolves at this confidence or better. "
                         "Default HIGH.")
    ap.add_argument("--output-path", type=Path, default=None,
                    help="Override the computed output path.")
    ap.add_argument("--dry-run", action="store_true",
                    help="Print rewritten source + delinks header to "
                         "stdout; don't write to disk.")
    ap.add_argument("--json", action="store_true",
                    help="Emit JSON output (resolution table + paths).")
    args = ap.parse_args()

    if not args.source.is_file():
        print(f"error: source file not found: {args.source}", file=sys.stderr)
        return 1

    # Lazy-import find_region_siblings library; it loads region data
    # only when called.
    _TOOLS = Path(__file__).resolve().parent
    sys.path.insert(0, str(_TOOLS))
    from find_region_siblings import load_region, find_siblings  # noqa: E402

    print("Loading region data...", file=sys.stderr)
    eur = load_region("eur")
    target = load_region(args.target)
    target_data = load_region_data_symbols(args.target)
    eur_full_relocs = load_full_relocs("eur")
    target_full_relocs = load_full_relocs(args.target)

    if not eur:
        print("error: config/eur/ not found", file=sys.stderr)
        return 1
    if not target:
        print(f"error: config/{args.target}/ not found "
              f"(run `dsd init` for {args.target} first)",
              file=sys.stderr)
        return 1

    # Parse the source + identify the function being ported.
    source_text = args.source.read_text(encoding="utf-8")
    module = infer_module_from_path(args.source)
    if not module:
        print(f"error: can't infer module from path: {args.source}",
              file=sys.stderr)
        return 1

    # Find the "function being defined" — the one whose name matches
    # the file basename. We look it up in EUR and resolve its target
    # twin first, since the output filename depends on it.
    file_stem = args.source.stem
    # Strip routing-suffix from stem before parsing
    if file_stem.endswith(".legacy_sp3"):
        file_stem = file_stem[:-len(".legacy_sp3")]
    elif file_stem.endswith(".legacy"):
        file_stem = file_stem[:-len(".legacy")]
    m = SYMBOL_RE.match(file_stem)
    if not m or m.group("kind") != "func":
        print(f"error: filename doesn't match a func_<addr> pattern: "
              f"{args.source.name}", file=sys.stderr)
        return 1
    main_func_ref = SymbolRef(
        text=file_stem,
        kind="func",
        module=("ov" + m.group("overlay").zfill(3) if m.group("overlay")
                else module),
        addr=int(m.group("addr"), 16),
    )
    main_func_resolution = resolve_symbol(
        main_func_ref, args.target, eur, target, target_data,
        find_siblings,
    )

    # Build the parallel-reloc data-symbol map for THIS function,
    # if the main function resolved. The map lets `resolve_symbol`
    # rewrite data_<addr> references correctly even when EUR and
    # target have different data layouts.
    data_addr_map: dict[tuple[str, int], tuple[str, int]] = {}
    if main_func_resolution.target_name is not None:
        # Find the EUR + target Function objects.
        eur_main_func = None
        for f in eur.get(main_func_ref.module, []):
            if f.addr == main_func_ref.addr:
                eur_main_func = f
                break
        target_main_func = None
        for f in target.get(main_func_ref.module, []):
            if f.name == main_func_resolution.target_name:
                target_main_func = f
                break
        if eur_main_func and target_main_func:
            data_addr_map = derive_data_address_mapping(
                eur_main_func, target_main_func,
                eur_full_relocs.get(main_func_ref.module, {}),
                target_full_relocs.get(main_func_ref.module, {}),
            )

    # Parse all symbols in the source, including the defined function.
    refs = parse_symbols_in_source(source_text, default_module=module)
    refs[(main_func_ref.kind, main_func_ref.module,
          main_func_ref.addr)] = main_func_ref

    resolutions: list[Resolution] = []
    for ref in refs.values():
        if (ref.kind == main_func_ref.kind
                and ref.module == main_func_ref.module
                and ref.addr == main_func_ref.addr):
            resolutions.append(main_func_resolution)
        else:
            resolutions.append(resolve_symbol(
                ref, args.target, eur, target, target_data,
                find_siblings,
                data_addr_map=data_addr_map,
            ))

    # Check confidence floor.
    floor_rank = {"HIGH": 3, "MEDIUM": 2, "LOW": 1, "NONE": 0,
                  "EXACT_ADDR": 3}
    floor = floor_rank[args.confidence_floor]
    failed = [r for r in resolutions
              if floor_rank.get(r.confidence, 0) < floor]
    # Data symbols: EXACT_ADDR is considered HIGH-equivalent.
    failed = [r for r in failed if r.confidence != "EXACT_ADDR"]

    if failed and not args.dry_run:
        # Refuse to write; surface the failures.
        if args.json:
            print(json.dumps({
                "status": "refused",
                "reason": f"{len(failed)} symbol(s) below confidence floor "
                          f"{args.confidence_floor}",
                "failed": [_resolution_to_dict(r) for r in failed],
                "resolutions": [_resolution_to_dict(r) for r in resolutions],
            }, indent=2))
        else:
            print(f"REFUSED — {len(failed)} symbol(s) below confidence "
                  f"floor {args.confidence_floor}:")
            for r in failed:
                print(f"  {r.eur_ref.text} → {r.target_name or '(none)'} "
                      f"[{r.confidence}] {r.notes}")
            print("\nRe-run with --confidence-floor LOW to accept anyway, "
                  "or fix the renames upstream.")
        return 2

    # Build the rewritten source.
    rewritten = apply_substitutions(source_text, resolutions)

    # Output path.
    if args.output_path:
        out_path = args.output_path
    else:
        # Resolve the target func for output-path naming.
        target_func_name = main_func_resolution.target_name
        if target_func_name is None:
            target_func_name = main_func_ref.text + "_UNRESOLVED"
        out_path = compute_output_path(
            args.source, args.target, target_func_name,
            main_func_ref.module,
        )

    # Compute delinks entry.
    target_func = None
    if main_func_resolution.target_name:
        for f in target.get(main_func_ref.module, []):
            if f.name == main_func_resolution.target_name:
                target_func = f
                break
    if target_func is not None:
        delinks_entry = compute_delinks_entry(out_path, target_func)
    else:
        delinks_entry = (f"# (delinks entry unavailable — target func "
                         f"{main_func_resolution.target_name} not found)\n")

    if args.json:
        print(json.dumps({
            "status": "ok",
            "source": str(args.source),
            "target_region": args.target,
            "module": main_func_ref.module,
            "main_func_resolution": _resolution_to_dict(main_func_resolution),
            "output_path": str(out_path),
            "delinks_entry": delinks_entry,
            "rewritten": rewritten,
            "resolutions": [_resolution_to_dict(r) for r in resolutions],
        }, indent=2))
    elif args.dry_run:
        print(f"# Would write: {out_path}")
        print("# Symbol resolutions:")
        for r in resolutions:
            print(f"#   {r.eur_ref.text:<32} → "
                  f"{(r.target_name or '(none)'):<32} [{r.confidence}]")
        print("#")
        print("# delinks.txt entry:")
        for line in delinks_entry.splitlines():
            print(f"#   {line}")
        print()
        print("# === Rewritten source ===")
        print(rewritten, end="")
    else:
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(rewritten, encoding="utf-8")
        print(f"wrote {out_path}")
        print("# delinks.txt entry:")
        print(delinks_entry, end="")
        # Resolution summary
        n_high = sum(1 for r in resolutions
                     if r.confidence in ("HIGH", "EXACT_ADDR"))
        n_total = len(resolutions)
        print(f"# {n_high}/{n_total} symbols resolved at HIGH/EXACT")

    return 0


def _resolution_to_dict(r: Resolution) -> dict:
    return {
        "eur_ref": r.eur_ref.text,
        "kind": r.eur_ref.kind,
        "module": r.eur_ref.module,
        "addr": f"0x{r.eur_ref.addr:08x}",
        "target_name": r.target_name,
        "confidence": r.confidence,
        "notes": r.notes,
    }


if __name__ == "__main__":
    sys.exit(main())
