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

Brief 095 D2 v2 (auto-promote LOW → MEDIUM by neighbor-shift
consensus) + D3 (data-symbol shift-consensus fallback)
extend the matcher so that the most common LOW/NONE cases —
"size+ish match, no relocs to compare" main functions, and
comment-referenced sibling-function data symbols — resolve
cleanly without per-port operator override. See
`compute_neighbor_shift_consensus` and
`derive_data_shift_consensus` for the rules.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from routing_suffixes import ROUTING_SUFFIXES, split_routing_suffix  # noqa: E402


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


# Filename validation — broader than SYMBOL_RE for source parsing.
# Accepts the four address-keyed translation-unit conventions
# decomper uses in this project (brief 065 wave 1 hit ~10 sources
# of the `<module>_<addr>.c` form that the older `func_*`-only
# validator rejected — see PR #423 / brief 062 follow-up):
#
#   - `func_<addr>`           → main, prefix style "func"
#   - `func_ov<NNN>_<addr>`   → overlay NNN, prefix style "func_ov<NNN>"
#   - `main_<addr>`           → main, prefix style "main"
#   - `ov<NNN>_<addr>`        → overlay NNN, prefix style "ov<NNN>"
#
# The prefix is captured so `compute_output_path` can preserve the
# input naming convention in the output (a `main_<eur>.c` source
# ports to `main_<usa>.c`, not `func_<usa>.c`). The function symbol
# inside the source is always `func_<addr>` / `func_ov<NNN>_<addr>`
# regardless of filename style; only the *file naming* varies.
FILENAME_RE = re.compile(
    r"^(?P<prefix>func_ov\d+|func|main|ov\d+)"
    r"_(?P<addr>[0-9a-fA-F]{8})$"
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
    confidence: str          # 'HIGH', 'MEDIUM', 'LOW', 'NONE', 'EXACT_ADDR' or
                             # 'SYNTHESIZED' (brief 526) for data
    notes: str               # human-readable rationale
    # Brief 526 — set only when confidence == "SYNTHESIZED": the exact new
    # symbols.txt line the target region needs (structured, not re-parsed
    # from `notes`) plus the relative config/ path it belongs in.
    new_symbols_txt_line: str | None = None
    new_symbols_txt_path: str | None = None


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


def parse_filename_stem(stem: str) -> tuple[str, str, int] | None:
    """Parse a source-file stem (already stripped of `.legacy` /
    `.legacy_sp3` routing suffix and `.c` extension). Returns
    `(prefix, module, addr)` or None if the stem doesn't match any
    accepted address-keyed pattern.

    Accepted patterns (see FILENAME_RE):

        func_<addr>          → ("func",         "main",   addr)
        func_ov<NNN>_<addr>  → ("func_ov<NNN>", "ov<NNN>", addr)
        main_<addr>          → ("main",         "main",   addr)
        ov<NNN>_<addr>       → ("ov<NNN>",      "ov<NNN>", addr)

    The `prefix` is the literal text before the `_<addr>` suffix —
    callers should preserve it in the output filename so a
    `main_<eur_addr>.c` source ports to `main_<target_addr>.c`
    rather than to `func_<target_addr>.c` (which would change the
    convention mid-port).

    The function symbol *inside* the source is always
    `func_<addr>` / `func_ov<NNN>_<addr>` regardless of the file
    naming style — only the filename convention varies.
    """
    m = FILENAME_RE.match(stem)
    if not m:
        return None
    prefix = m.group("prefix")
    addr = int(m.group("addr"), 16)
    if prefix == "func":
        module = "main"
    elif prefix == "main":
        module = "main"
    elif prefix.startswith("func_ov"):
        # "func_ov002" → module "ov002"
        module = prefix[len("func_"):]
    else:
        # bare overlay form, "ov002"
        module = prefix
    return prefix, module, addr


def function_symbol_for(module: str, addr: int) -> str:
    """Build the function-symbol name (as it appears in the C
    source and in symbols.txt) for a given (module, address) pair.

    main → `func_<addr>`
    ov<NNN> → `func_ov<NNN>_<addr>`
    """
    if module.startswith("ov") and module[2:].isdigit():
        return f"func_ov{module[2:].zfill(3)}_{addr:08x}"
    return f"func_{addr:08x}"


def synthesize_data_symbol_name(module: str, addr: int) -> str:
    """Build the RAW address-encoded data-symbol name — the default dsd
    naming convention for a data/bss symbol before semantic retriage
    (the `data_*` analogue of `function_symbol_for()`).

    main → `data_<addr>`
    ov<NNN> → `data_ov<NNN>_<addr>`

    Brief 526 — used when a symbol's target-region ADDRESS is known
    (via the parallel-reloc map or the D3 shift-consensus) but the
    target region's `symbols.txt` has no entry there yet. dsd only
    names a data/bss address once SOME already-analyzed reference in
    THAT region touches it; a symbol reachable only from a
    not-yet-ported function is invisible to the target's symbols.txt
    even though the address itself is perfectly well-defined
    (RETRIAGE-tier EUR symbols already carry this exact raw-address
    name — see the two b523 entries this fixes, both plain `data_*`).
    Modeled on the b459/461 porter fix for `_unk`-suffixed placeholder
    symbols: an address-encoded name needs no target-side lookup to be
    valid, only a correct re-address.
    """
    if module.startswith("ov") and module[2:].isdigit():
        return f"data_ov{module[2:].zfill(3)}_{addr:08x}"
    return f"data_{addr:08x}"


def symbols_txt_path_for(region: str, module: str) -> str:
    """The `config/` path (relative, for human-readable messages) whose
    `symbols.txt` a synthesized data symbol needs a new line appended to
    before the port can link."""
    if module == "main":
        return f"config/{region}/arm9/symbols.txt"
    return f"config/{region}/arm9/overlays/{module}/symbols.txt"


def target_stem_for_prefix(prefix: str, target_func_name: str) -> str:
    """Given an input filename prefix (e.g. "main", "ov002",
    "func", "func_ov002") and the resolved target function name
    (e.g. "func_02006148" or "func_ov002_021b4108"), build the
    output filename stem that preserves the input convention.

    Examples:

        prefix="func",        target="func_02006148"      → "func_02006148"
        prefix="main",        target="func_02006148"      → "main_02006148"
        prefix="func_ov002",  target="func_ov002_021b4108" → "func_ov002_021b4108"
        prefix="ov002",       target="func_ov002_021b4108" → "ov002_021b4108"

    The output address comes from the resolved target name's
    trailing 8-hex address; the prefix is the input's literal
    prefix. This is what makes `main_<eur>.c` port to
    `main_<usa>.c` rather than switching naming conventions
    mid-port.
    """
    m = re.search(r"_([0-9a-fA-F]{8})$", target_func_name)
    if not m:
        # Symbol has been renamed already (no trailing 8-hex) —
        # fall back to using the resolved name verbatim. The
        # decomper can re-derive the filename later if needed.
        return target_func_name
    target_addr_hex = m.group(1)
    return f"{prefix}_{target_addr_hex}"


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


def _fmt_shift(shift: int) -> str:
    """Render an EUR→target address shift as a signed hex string.

    Positive: `+0x20`. Negative: `-0x20`. Zero: `0x0`.
    Used by D2 v2 messages so shifts read naturally regardless of
    direction (USA can sit either side of EUR depending on module).
    """
    if shift == 0:
        return "0x0"
    sign = "+" if shift > 0 else "-"
    return f"{sign}0x{abs(shift):x}"


def derive_data_shift_consensus(
    data_addr_map: dict[tuple[str, int], tuple[str, int]],
    module: str,
    *,
    min_agreement: int = 3,
) -> int | None:
    """Compute the consensus EUR→target shift for data symbols in
    `module` from an existing parallel-reloc-derived `data_addr_map`.

    Brief 095 D3 — fallback for data-symbol references that the
    function's own parallel-reloc map didn't cover (typically:
    comment-referenced sibling-function data symbols, or BSS layout
    differences where the EUR symbol exists but the parallel-reloc
    map has a stale entry).

    Returns the mode shift iff `min_agreement` distinct mappings in
    `module` agree on the shift; else None.

    The map's keys are `(module, eur_addr)` → values
    `(module, target_addr)`. Same-module entries provide the shift
    signal; cross-module entries are skipped (overlay-layout shifts
    differ from main-layout shifts).
    """
    from collections import Counter

    shifts: list[int] = []
    for (eur_mod, eur_addr), (tgt_mod, tgt_addr) in data_addr_map.items():
        if eur_mod != module or tgt_mod != module:
            continue
        shifts.append(tgt_addr - eur_addr)

    if len(shifts) < min_agreement:
        return None
    most_common, count = Counter(shifts).most_common(1)[0]
    if count >= min_agreement:
        return most_common
    return None


def compute_neighbor_shift_consensus(
    eur_addr: int,
    module: str,
    eur_regions: dict[str, list],
    target_regions: dict[str, list],
    find_siblings_fn,
    target_region_name: str,
    *,
    n_neighbors: int = 5,
    search_radius: int = 30,
    min_agreement: int = 3,
) -> tuple[int | None, list[int]]:
    """Compute the consensus EUR→target address shift from the N
    nearest HIGH-confidence neighbors of `eur_addr` in `module`.

    Walks outward from `eur_addr` in ordinal-rank order, runs
    find_siblings_fn on each neighbor, collects up to `n_neighbors`
    HIGH-confidence hits, and returns the mode of their shifts iff
    `min_agreement` of them agree on a single shift.

    Returns `(consensus_shift, sampled_shifts)`. `consensus_shift` is
    None when no consensus exists (no HIGH neighbors found, or the
    sampled shifts don't agree).

    Brief 095 D2 v2 — used to auto-promote LOW→MEDIUM when a
    candidate's EUR↔target shift matches the surrounding HIGH-match
    shift pattern.

    Parameters:
      n_neighbors    — number of HIGH neighbors to sample (default 5)
      search_radius  — max ordinal distance to walk (default 30)
      min_agreement  — minimum agreeing-shift count to declare
                       consensus (default 3, i.e. ≥3 of 5)
    """
    from collections import Counter

    eur_module_funcs = sorted(
        eur_regions.get(module, []), key=lambda f: f.addr,
    )
    pivot = next(
        (i for i, f in enumerate(eur_module_funcs) if f.addr == eur_addr),
        None,
    )
    if pivot is None:
        return None, []

    shifts: list[int] = []
    # Walk symmetric +1, -1, +2, -2, ... to bias toward immediate
    # neighbors first. Lower-numbered deltas are most likely to
    # share the same per-region shift.
    for delta in range(1, search_radius + 1):
        for sign in (1, -1):
            idx = pivot + sign * delta
            if idx < 0 or idx >= len(eur_module_funcs):
                continue
            neighbor = eur_module_funcs[idx]
            matches = find_siblings_fn(
                neighbor, target_regions,
                max_results=1,
                source_region="eur",
                target_region_name=target_region_name,
                byte_disambiguate=True,
            )
            if not matches:
                continue
            top = matches[0]
            if top.confidence != "HIGH":
                continue
            shifts.append(top.func.addr - neighbor.addr)
            if len(shifts) >= n_neighbors:
                break
        if len(shifts) >= n_neighbors:
            break

    if len(shifts) < min_agreement:
        return None, shifts

    most_common_shift, count = Counter(shifts).most_common(1)[0]
    if count >= min_agreement:
        return most_common_shift, shifts
    return None, shifts


def _synthesize_data_resolution(
    ref: SymbolRef,
    target_region: str,
    target_module: str,
    target_addr: int,
    eur_data_kinds: dict[str, dict[int, str]] | None,
    *,
    origin: str,
) -> Resolution:
    """Brief 526 — build the `SYNTHESIZED` Resolution for a data symbol
    whose target-region address is known but unnamed. Shared by
    `resolve_symbol()`'s two address-derivation tiers (parallel-reloc
    map and D3 shift-consensus) so both attach the identical companion
    symbols.txt-line message."""
    synth = synthesize_data_symbol_name(target_module, target_addr)
    kind = "data"
    if eur_data_kinds is not None:
        kind = eur_data_kinds.get(ref.module, {}).get(ref.addr, "data")
    new_line = f"{synth} kind:{kind} addr:0x{target_addr:08x}"
    new_path = symbols_txt_path_for(target_region, target_module)
    return Resolution(
        eur_ref=ref,
        target_name=synth,
        confidence="SYNTHESIZED",
        notes=f"{origin} — NOT YET NAMED in {target_region}; synthesized "
              f"`{synth}`. Needs a new symbols.txt line before this port "
              f"links: `{new_line}` in {new_path}",
        new_symbols_txt_line=new_line,
        new_symbols_txt_path=new_path,
    )


def resolve_symbol(
    ref: SymbolRef,
    target_region: str,
    eur_regions: dict[str, list],
    target_regions: dict[str, list],
    target_data_symbols: dict[str, dict[int, str]],
    find_siblings_fn,
    data_addr_map: dict[tuple[str, int], tuple[str, int]] | None = None,
    *,
    auto_promote_low: bool = True,
    consensus_cache: dict[tuple[str, str], tuple[int | None, list[int]]] | None = None,
    eur_data_kinds: dict[str, dict[int, str]] | None = None,
) -> Resolution:
    """Resolve one EUR symbol reference to its target-region name.

    For `func_*`: uses find_region_siblings to fingerprint-match.
    For `data_*`: first tries the derived parallel-reloc mapping
    (built from the function being ported's reloc table), then
    falls back to exact-address match in target's symbols.txt.

    Brief 095 D2 v2: when `auto_promote_low=True` (default) and the
    fingerprint match returns LOW confidence, compute the consensus
    EUR→target shift of the N nearest HIGH neighbors in the same
    module. If the candidate's shift matches the consensus, promote
    LOW → MEDIUM. `consensus_cache` is a caller-supplied dict that
    caches results across calls within one port_to_region invocation
    (keyed by (module, target_region)).

    Brief 526 — the RETRIAGE-tier data-symbol gap: `data_addr_map`
    (ground-truth, reloc-pairing derived) or the D3 shift-consensus can
    determine the CORRECT target address for a data symbol even when
    the target region's `symbols.txt` has never named anything there
    (dsd only names a data/bss address once some already-analyzed
    reference in THAT region touches it — a symbol reachable only from
    a not-yet-ported function is invisible to the target's table
    despite the address being perfectly well-defined). Previously this
    fell through to `NONE`, blocking the whole port. Now: when the
    address is known but unnamed, synthesize the raw address-encoded
    name (`synthesize_data_symbol_name`, same convention as the EUR
    symbol's own RETRIAGE-tier name) and return it at `SYNTHESIZED`
    confidence (HIGH-equivalent — the address itself is exactly as
    reliable as the `EXACT_ADDR` tiers; only the *name* is new) with a
    note describing the exact new `symbols.txt` line the target region
    needs before the port can link. `eur_data_kinds` (from
    `load_region_data_symbol_kinds("eur")`) supplies the `kind:` field
    for that proposed line; omit it only for callers that don't need
    the message (defaults to `data`).
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
                # Brief 526 — address known, but not yet named in the
                # target region. Synthesize rather than give up.
                return _synthesize_data_resolution(
                    ref, target_region, mapped_module, mapped_addr,
                    eur_data_kinds,
                    origin=f"parallel-reloc map → "
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

        # Brief 095 D3 — data-symbol shift-consensus fallback.
        # When the parallel-reloc map didn't cover the address AND
        # exact-addr match fails, derive the shift from other
        # same-module mappings in the map and try the shifted addr.
        # Catches comment-referenced sibling-function data symbols
        # (brief 090 legacy_sp3 refusals).
        if data_addr_map:
            data_shift = derive_data_shift_consensus(
                data_addr_map, ref.module, min_agreement=2,
            )
            if data_shift is not None:
                shifted_addr = ref.addr + data_shift
                shifted_name = data_table.get(shifted_addr)
                if shifted_name:
                    return Resolution(
                        eur_ref=ref,
                        target_name=shifted_name,
                        confidence="EXACT_ADDR",
                        notes=f"D3 data-shift consensus "
                              f"{_fmt_shift(data_shift)} → "
                              f"{target_region}/{ref.module}/"
                              f"0x{shifted_addr:08x}",
                    )
                # Brief 526 — same synthesis fallback: the D3-derived
                # address is known (≥2 agreeing same-module mappings)
                # but unnamed in the target.
                return _synthesize_data_resolution(
                    ref, target_region, ref.module, shifted_addr,
                    eur_data_kinds,
                    origin=f"D3 data-shift consensus "
                           f"{_fmt_shift(data_shift)} → "
                           f"{target_region}/{ref.module}/"
                           f"0x{shifted_addr:08x}",
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
    confidence = top.confidence
    notes = top.rationale

    # Brief 095 D2 v2 — auto-promote LOW → MEDIUM when the candidate's
    # EUR↔target shift matches the consensus shift of N nearest HIGH
    # neighbors. Brief 090 calibration: 15 of 15 substantive LOW ports
    # landed byte-identical under this rule.
    if auto_promote_low and confidence == "LOW":
        cache_key = (ref.module, target_region)
        if consensus_cache is not None and cache_key in consensus_cache:
            consensus_shift, sampled = consensus_cache[cache_key]
        else:
            consensus_shift, sampled = compute_neighbor_shift_consensus(
                ref.addr, ref.module,
                eur_regions, target_regions,
                find_siblings_fn, target_region,
            )
            if consensus_cache is not None:
                consensus_cache[cache_key] = (consensus_shift, sampled)

        if consensus_shift is not None:
            actual_shift = top.func.addr - ref.addr
            if actual_shift == consensus_shift:
                confidence = "MEDIUM"
                notes = (
                    f"{notes} | D2 v2 auto-promoted LOW→MEDIUM "
                    f"(neighbor consensus shift={_fmt_shift(consensus_shift)} "
                    f"from {len(sampled)} HIGH neighbors)"
                )
            else:
                notes = (
                    f"{notes} | D2 v2 anti-match: candidate shift "
                    f"{_fmt_shift(actual_shift)} ≠ consensus "
                    f"{_fmt_shift(consensus_shift)} from {len(sampled)} "
                    f"HIGH neighbors (kept LOW)"
                )
        else:
            notes = (
                f"{notes} | D2 v2: no neighbor consensus "
                f"(sampled {len(sampled)} HIGH neighbors, "
                f"need ≥3 agreement)"
            )

    return Resolution(
        eur_ref=ref,
        target_name=top.func.name,
        confidence=confidence,
        notes=notes,
    )


# --------------------------------------------------------------------------- #
# Rewriting
# --------------------------------------------------------------------------- #

def find_rename_collisions(
    resolutions: list[Resolution],
) -> list[tuple[str, list[Resolution]]]:
    """Detect target-name collisions across distinct EUR symbols.

    A collision means two or more EUR refs (different addresses /
    modules / kinds) resolved to the **same target name**. The
    catastrophic failure mode is parent ↔ callee collision: a
    function being ported maps to the same target name as one of
    its callees, so the rewritten C body calls itself recursively
    where it should be calling a different target. Brief 065 wave
    3 surfaced this; the fix is detect-and-refuse rather than
    ship silently-wrong code.

    Returns a list of `(target_name, [colliding_resolutions])`
    tuples. Empty list = no collisions, safe to substitute.

    Resolutions with `target_name is None` (unresolved) are
    ignored — they're surfaced separately by the confidence-floor
    check.
    """
    by_target: dict[str, list[Resolution]] = {}
    for r in resolutions:
        if r.target_name is None:
            continue
        by_target.setdefault(r.target_name, []).append(r)
    return [
        (name, rs) for name, rs in by_target.items()
        if len(rs) > 1
    ]


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
    target_stem: str,
    module: str,
) -> Path:
    """Compute the per-region output path for a ported source.

    `target_stem` is the new filename's stem (without routing
    suffix or extension) — callers compute this via
    `target_stem_for_prefix()` so the output preserves the input
    filename convention (`main_<eur>.c` → `main_<target>.c`,
    `func_<eur>.c` → `func_<target>.c`, etc.).

    Examples:

        src/main/func_02006164.c + target=usa, stem=func_02006148
            → src/usa/main/func_02006148.c
        src/main/main_020498dc.c + target=usa, stem=main_<usa_addr>
            → src/usa/main/main_<usa_addr>.c
        src/overlay002/ov002_<eur>.c + target=jpn, stem=ov002_<jpn>
            → src/jpn/overlay002/ov002_<jpn>.c

    `.legacy.c`, `.legacy_sp3.c`, and `.thumb.c` suffixes are preserved
    (brief 587: routed through the shared `routing_suffixes` module
    rather than a locally hand-rolled if/elif chain).
    """
    suffix = source_path.suffix
    # Detect compound suffix (.legacy.c / .legacy_sp3.c / .thumb.c) —
    # these show up in `source_path.stem` because Path.stem only
    # strips the final ".c".
    name_stem, routing_suffix = split_routing_suffix(source_path.stem)

    new_filename = f"{target_stem}{routing_suffix}{suffix}"
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


KIND_DATA_RE = re.compile(
    r"^\S+\s+kind:(?P<kind>(?:data|bss)(?:\([^)]*\))?)\s+addr:0x(?P<addr>[0-9a-fA-F]+)"
)


def load_region_data_symbol_kinds(region: str) -> dict[str, dict[int, str]]:
    """Return dict[module] → {addr: kind_string} for one region — the
    kind-preserving companion to `load_region_data_symbols()`.

    Brief 526: when synthesizing a NEW data-symbol name for an address
    the target region hasn't registered yet, the proposed `symbols.txt`
    line needs the correct `kind:data` / `kind:bss` / `kind:data(any)`
    field. That's a property of the EUR side's own entry (bss-ness is
    a source-level fact — initialized vs zero-initialized — that
    transfers across regions for the same underlying game logic), so
    this loader is called on `eur`, not the target.
    """
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
            m = KIND_DATA_RE.match(line)
            if m:
                result[int(m.group("addr"), 16)] = m.group("kind")
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

_OVERLAY_SINGULAR_RE = re.compile(r"^overlay\((\d+)\)$")
_OVERLAY_PLURAL_RE = re.compile(r"^overlays\(([\d,]+)\)$")


def normalize_module_name(m: str) -> str:
    """`relocs.txt`'s `module:` field uses dsd's OWN overlay-reference
    syntax — `overlay(6)`, or `overlays(5,9)` for an overlay-swap zone
    referenced from either sibling — NOT the `ov006` convention every
    other module key in this tool uses (`symbols.txt`-derived tables,
    `SymbolRef.module`, `target_data_symbols` keys, …).

    Brief 526: this format mismatch silently broke the parallel-reloc
    data-symbol mapping for every OVERLAY data reference (main-format
    keys collide fine since `"main"` needs no translation) — a
    `data_addr_map` entry keyed `("overlay(6)", addr)` never matches a
    lookup for `("ov006", addr)`, so the map "misses" even when it
    actually computed the right address. Normalizing at the parse
    boundary (`load_full_relocs`) means every downstream consumer sees
    consistent `ovNNN` keys.

    `overlay(2)` → `ov002`; `overlays(5,9)` → `ov005` (the swap zone's
    first-listed overlay number, matching `_port_overlay.py`'s prior
    `_norm_mod` fix for the same convention — brief 459); anything else
    (`main`, an already-normalized `ovNNN`) passes through unchanged.
    """
    m1 = _OVERLAY_SINGULAR_RE.match(m)
    if m1:
        return f"ov{int(m1.group(1)):03d}"
    m2 = _OVERLAY_PLURAL_RE.match(m)
    if m2:
        return f"ov{int(m2.group(1).split(',')[0]):03d}"
    return m


def load_full_relocs(region: str) -> dict[str, dict[int, list[tuple[str, int, str]]]]:
    """Return dict[source_module] -> dict[from_addr] -> list of
    (kind, to_addr, to_module) tuples for the region. `to_module` is
    normalized to `ovNNN` form (see `normalize_module_name`).
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
                    normalize_module_name(m.group("to_mod")),
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
    ap.add_argument("--no-auto-promote", action="store_true",
                    help="Brief 095 D2 v2: disable the LOW→MEDIUM "
                         "auto-promotion rule (re-runs raw find_siblings "
                         "confidence). Default: auto-promote enabled — "
                         "LOW candidates whose EUR↔target shift matches "
                         "the consensus shift of N=5 nearest HIGH "
                         "neighbors are promoted to MEDIUM.")
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
    # Brief 526 — EUR's own kind:data/kind:bss field, needed to propose a
    # correctly-kinded new symbols.txt line for any synthesized data symbol.
    eur_data_kinds = load_region_data_symbol_kinds("eur")

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
    # Strip routing-suffix from stem before parsing (brief 587: this
    # gate used to hand-roll only .legacy_sp3/.legacy, so any
    # .thumb.c source failed here with "filename doesn't match any
    # accepted pattern" — no Thumb function could region-port at all).
    file_stem = split_routing_suffix(args.source.stem)[0]
    parsed = parse_filename_stem(file_stem)
    if parsed is None:
        print(f"error: filename doesn't match any accepted pattern "
              f"(func_<addr>, func_ov<NNN>_<addr>, main_<addr>, "
              f"ov<NNN>_<addr>): {args.source.name}", file=sys.stderr)
        return 1
    file_prefix, file_module, file_addr = parsed
    # Belt-and-suspenders consistency: the module derived from the
    # *path* (src/main/, src/overlay002/, …) must agree with the
    # one derived from the filename prefix. Disagreement means the
    # file is in the wrong directory — surface that early.
    if file_module != module:
        print(f"warning: path module ({module}) disagrees with "
              f"filename module ({file_module}); using filename's. "
              f"Source: {args.source}", file=sys.stderr)
    main_func_ref = SymbolRef(
        text=function_symbol_for(file_module, file_addr),
        kind="func",
        module=file_module,
        addr=file_addr,
    )
    # Brief 095 D2 v2 — shared cache so the neighbor-shift consensus
    # is computed at most once per (module, target_region) pair within
    # one port_to_region invocation.
    consensus_cache: dict[tuple[str, str], tuple[int | None, list[int]]] = {}
    main_func_resolution = resolve_symbol(
        main_func_ref, args.target, eur, target, target_data,
        find_siblings,
        auto_promote_low=not args.no_auto_promote,
        consensus_cache=consensus_cache,
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
                auto_promote_low=not args.no_auto_promote,
                consensus_cache=consensus_cache,
                eur_data_kinds=eur_data_kinds,
            ))

    # Check confidence floor.
    floor_rank = {"HIGH": 3, "MEDIUM": 2, "LOW": 1, "NONE": 0,
                  "EXACT_ADDR": 3, "SYNTHESIZED": 3}
    floor = floor_rank[args.confidence_floor]
    failed = [r for r in resolutions
              if floor_rank.get(r.confidence, 0) < floor]
    # Data symbols: EXACT_ADDR / SYNTHESIZED are HIGH-equivalent — the
    # address is derived identically reliably in both; SYNTHESIZED just
    # additionally needs the new symbols.txt line surfaced below.
    failed = [r for r in failed
              if r.confidence not in ("EXACT_ADDR", "SYNTHESIZED")]

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

    # Detect rename collisions: two or more distinct EUR refs
    # resolved to the same target name. Worst case is parent ↔
    # callee collision (self-recursive rewrite); any collision is
    # always wrong. Refuse even in --dry-run so the decomper sees
    # the issue before manual review.
    collisions = find_rename_collisions(resolutions)
    if collisions:
        if args.json:
            print(json.dumps({
                "status": "refused",
                "reason": f"{len(collisions)} rename collision(s); "
                          f"two or more EUR symbols resolved to the "
                          f"same target name, which would emit "
                          f"self-recursive or otherwise-broken code",
                "collisions": [
                    {
                        "target_name": name,
                        "eur_refs": [_resolution_to_dict(r) for r in rs],
                    }
                    for name, rs in collisions
                ],
                "resolutions": [_resolution_to_dict(r) for r in resolutions],
            }, indent=2))
        else:
            print(f"REFUSED — {len(collisions)} rename collision(s) "
                  f"detected. Two or more distinct EUR symbols "
                  f"resolved to the same target name. Substituting "
                  f"would emit self-recursive or otherwise-broken "
                  f"code; manual review needed.")
            for name, rs in collisions:
                print(f"\n  target={name}")
                for r in rs:
                    print(f"    ← {r.eur_ref.text:<32} "
                          f"[{r.confidence}] {r.notes}")
            print("\nLikely causes:")
            print("  - find_region_siblings returned a non-unique HIGH")
            print("    candidate (false-positive — re-run with byte-")
            print("    disambiguation if not already on).")
            print("  - One of the EUR symbols has already been renamed")
            print("    upstream and its target name now collides with a")
            print("    sibling. Inspect config/<region>/**/symbols.txt.")
        return 3

    # Build the rewritten source.
    rewritten = apply_substitutions(source_text, resolutions)

    # Output path. Preserve the input filename prefix style
    # (func / func_ov<NNN> / main / ov<NNN>) so the convention
    # stays consistent across the EUR → target port. The address
    # is the target's, derived from the resolved symbol.
    if args.output_path:
        out_path = args.output_path
    else:
        if main_func_resolution.target_name is None:
            target_stem = f"{file_prefix}_UNRESOLVED"
        else:
            target_stem = target_stem_for_prefix(
                file_prefix, main_func_resolution.target_name,
            )
        out_path = compute_output_path(
            args.source, args.target, target_stem,
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

    new_symbols_txt = collect_new_symbols_txt_lines(resolutions)

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
            "new_symbols_txt_lines": new_symbols_txt,
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
        if new_symbols_txt:
            print("#")
            print("# ⚠ NEW symbols.txt lines needed before this port links")
            print("# (brief 526 — RETRIAGE-tier data symbol(s), not yet")
            print("# named in the target region; append these first):")
            for path, lines in new_symbols_txt.items():
                print(f"#   {path}:")
                for line in lines:
                    print(f"#     {line}")
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
                     if r.confidence in ("HIGH", "EXACT_ADDR", "SYNTHESIZED"))
        n_total = len(resolutions)
        print(f"# {n_high}/{n_total} symbols resolved at HIGH/EXACT/SYNTHESIZED")
        if new_symbols_txt:
            print("#")
            print("# ⚠ NEW symbols.txt lines needed before this port links")
            print("# (brief 526 — RETRIAGE-tier data symbol(s), not yet")
            print("# named in the target region; append these first):")
            for path, lines in new_symbols_txt.items():
                print(f"#   {path}:")
                for line in lines:
                    print(f"#     {line}")

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
        "new_symbols_txt_line": r.new_symbols_txt_line,
        "new_symbols_txt_path": r.new_symbols_txt_path,
    }


def collect_new_symbols_txt_lines(
    resolutions: list[Resolution],
) -> dict[str, list[str]]:
    """Brief 526 — group every `SYNTHESIZED` resolution's companion
    symbols.txt line by target path, deduplicated, sorted.

    Returns dict[symbols_txt_path] -> [new_line, ...]. Empty dict if no
    resolution needed synthesis. This is what lets landing a synthesized
    port be copy-paste mechanical: append each listed line to the named
    file before the port's `ninja sha1` gate.
    """
    out: dict[str, set[str]] = {}
    for r in resolutions:
        if r.confidence != "SYNTHESIZED" or not r.new_symbols_txt_path:
            continue
        out.setdefault(r.new_symbols_txt_path, set()).add(
            r.new_symbols_txt_line or "")
    return {path: sorted(lines) for path, lines in sorted(out.items())}


if __name__ == "__main__":
    sys.exit(main())
