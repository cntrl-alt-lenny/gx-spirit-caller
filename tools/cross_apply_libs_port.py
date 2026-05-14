#!/usr/bin/env python3

"""
cross_apply_libs_port.py — apply a libs/nitro/ port across
EUR + USA + JPN regions.

Brief 073 deliverable. Solves the "libs/ ports are region-
neutral but their function-symbol names aren't" problem
surfaced by brief 071 wave 2 (PR #445). Pre-073 a port like
`libs/nitro/func_02007218.legacy.c` only contributed to EUR's
match count — USA and JPN had different placeholder names at the
byte-equivalent addresses (`func_020071fc` for both), so the
file's symbol name didn't resolve in those regions' link.

This tool implements **Approach A** (per-region rename to match
EUR's port name) per brief 073's smoke-test decision:

  1. For each region (USA, JPN), find the byte-equivalent
     placeholder via `find_region_siblings`'s HIGH candidate.
  2. Rename `func_<region_addr>` → `func_<eur_addr>` in
     `config/<region>/<module>/symbols.txt` via the existing
     `rename_symbol.py` helper.
  3. Add a `libs/nitro/<port>.legacy.c:` entry to the region's
     `delinks.txt` at the region-local address.

The result: all three regions' symbols.txt have the same name
(EUR's `func_<eur_addr>`) at their respective byte-equivalent
addresses. The shared libs/ port resolves cleanly under each
region's linker.

Approach A trade-off (per `docs/research/libs-region-naming.md`):
  + Mechanical, well-understood
  + Doesn't touch port .c files (87 existing ports stay as-is)
  - EUR addresses leak into USA + JPN symbol names

Usage:

    # Apply ONE port to USA + JPN (default regions)
    python tools/cross_apply_libs_port.py \\
        libs/nitro/func_02007218.legacy.c

    # Specific regions
    python tools/cross_apply_libs_port.py \\
        libs/nitro/func_02007218.legacy.c --regions usa,jpn

    # Dry-run — show what would happen, write nothing
    python tools/cross_apply_libs_port.py <port> --dry-run

    # JSON output for batch wrappers
    python tools/cross_apply_libs_port.py <port> --json

The single-port operation is atomic per region: either all the
rename + delinks edits land for that region, or none do (rollback
is up to the caller via git revert; this tool errors loudly).
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
LIBS_NITRO = ROOT / "libs" / "nitro"
CONFIG_DIR = ROOT / "config"

# Default regions to cross-apply to. Caller can narrow via
# `--regions usa` etc.
DEFAULT_TARGET_REGIONS = ("usa", "jpn")
SOURCE_REGION = "eur"


# Filename pattern for a libs/nitro/ port — must encode the EUR
# address so we can find the byte-equivalent in the other regions.
# Brief 076 D1: also accept the overlay-qualified form
# `func_ov<NNN>_<addr>.legacy[_sp3].c` (29 of brief 075 wave-1's
# port-pool used this shape). The `overlay` group is None for
# main-module ports.
_PORT_FILENAME_RE = re.compile(
    r"^func_(?:ov(?P<overlay>\d+)_)?(?P<addr>[0-9a-fA-F]{8})"
    r"(?P<routing>\.legacy(?:_sp3)?)\.c$"
)


@dataclass(frozen=True)
class CrossApplyPlan:
    """One per-region application plan, fully resolved before
    we make any filesystem edits. Lets `--dry-run` print the
    full plan without mutating anything.

    `data_renames` covers the brief 073 wave-1 smoke-test gotcha:
    a port like `func_02007218.legacy.c` also references
    `data_020c3f48` (EUR's address). USA's symbols.txt has the
    byte-equivalent data symbol at a DIFFERENT address; the
    linker fails with `Undefined : "data_020c3f48"` unless we
    also rename USA's data symbol to match the EUR name.
    """
    port_file: Path
    eur_addr: int
    eur_size: int                 # bytes — needed for delinks .text end
    target_region: str            # "usa" / "jpn"
    target_addr: int              # byte-equivalent in target region
    target_old_name: str          # "func_<target_addr>" pre-rename
    target_new_name: str          # "func_<eur_addr>" post-rename
    target_module: str            # "main", "ov002", etc.
    delinks_path: Path            # where the new entry lands
    # `data_renames` is a tuple of (target_old_name, target_new_name)
    # pairs — one per data symbol the port references that needs
    # cross-applying. Same shape as the function rename.
    data_renames: tuple[tuple[str, str], ...] = ()


@dataclass
class CrossApplyResult:
    plan: CrossApplyPlan
    status: str                   # "ok" / "skipped" / "refused"
    detail: str = ""

    def to_dict(self) -> dict:
        return {
            "port_file": str(self.plan.port_file.relative_to(ROOT)),
            "eur_addr": f"0x{self.plan.eur_addr:08x}",
            "target_region": self.plan.target_region,
            "target_addr": f"0x{self.plan.target_addr:08x}",
            "target_module": self.plan.target_module,
            "target_old_name": self.plan.target_old_name,
            "target_new_name": self.plan.target_new_name,
            "status": self.status,
            "detail": self.detail,
        }


# --------------------------------------------------------------------------- #
# Plan derivation
# --------------------------------------------------------------------------- #


def parse_port_filename(port_file: Path) -> tuple[int, str] | None:
    """Extract `(eur_addr, routing_suffix)` from a libs/nitro/
    port filename. Returns None for filenames that don't follow
    the `func_<8hex>.legacy.c` / `.legacy_sp3.c` convention.

    `routing_suffix` is `.legacy` or `.legacy_sp3` — preserved
    in plan generation but not used for the rename / delinks
    work (libs files are unmodified per brief 073).
    """
    m = _PORT_FILENAME_RE.match(port_file.name)
    if m is None:
        return None
    return int(m.group("addr"), 16), m.group("routing")


def _reloc_parity(eur_func, cand_func) -> bool:
    """Strict reloc-parity check: EUR + candidate must have
    identical reloc-sig tuples (same length, same offset/kind/
    to_module structure). The `to_addr` field is excluded from
    the comparison (region-specific by design — see
    find_region_siblings.Function.reloc_sig docstring).

    Brief 076 D2: catches the BL-offset-divergence trap that the
    pure byte-similarity gate misses. Two functions can be
    byte-identical (after reloc masking) yet have different
    reloc tables — those bytes mean different things at link
    time. Reloc parity ensures both functions call into the
    same downstream functions and load the same data modules.
    """
    return tuple(eur_func.reloc_sig) == tuple(cand_func.reloc_sig)


def _raw_bytes_equal(
    eur_func, cand_func, source_region: str, target_region: str,
) -> bool:
    """Strict raw-bytes equality with reloc-slot masking.
    Returns True iff EUR's masked bytes match cand's masked bytes
    EXACTLY (no Hamming tolerance — every byte position outside
    the reloc slots must agree)."""
    sys.path.insert(0, str(ROOT / "tools"))
    import find_region_siblings as frs  # noqa: E402

    eur_bytes = frs._function_bytes(
        source_region, eur_func.module,
        eur_func.addr, eur_func.size,
    )
    cand_bytes = frs._function_bytes(
        target_region, cand_func.module,
        cand_func.addr, cand_func.size,
    )
    if eur_bytes is None or cand_bytes is None:
        return False
    if len(eur_bytes) != len(cand_bytes):
        return False

    eur_reloc_offsets = [
        eur_func.addr + ro for ro, _, _ in eur_func.reloc_sig
    ]
    cand_reloc_offsets = [
        cand_func.addr + ro for ro, _, _ in cand_func.reloc_sig
    ]
    eur_masked = frs._mask_relocs(
        eur_bytes, eur_func.addr, eur_reloc_offsets)
    cand_masked = frs._mask_relocs(
        cand_bytes, cand_func.addr, cand_reloc_offsets)
    return eur_masked == cand_masked


def find_byte_equivalent(
    eur_module: str, eur_addr: int, target_region: str,
) -> tuple[int, str] | None:
    """Locate the byte-equivalent placeholder in `target_region`.
    Returns `(target_addr, target_old_name)` for a unique HIGH
    match, or None if ambiguous/missing.

    Two-pass disambiguation:

    1. **Primary**: `find_region_siblings`'s scoring path (PR
       #418's byte-disambiguation v2). Pass if exactly one HIGH
       candidate at sim ≥ 0.99.

    2. **Fallback** (brief 076 D2): if (1) returns 0 or ≥2 HIGH
       candidates, run a strict raw-bytes + reloc-parity check
       across every same-size same-module candidate in the
       target region. Accept only if EXACTLY ONE candidate
       passes BOTH:
         - Raw masked bytes match byte-for-byte (no Hamming
           tolerance)
         - Reloc-sig tuples are identical (catches BL-offset
           divergence — 1 silent corruption in wave 1)

    The fallback covers the 5-10 size-16+ ports decomper hit in
    wave 1 where the primary path's compiled-`.o` signatures
    couldn't disambiguate the uncompiled USA/JPN gap (no source
    `.c` exists for those functions in either region yet).
    """
    sys.path.insert(0, str(ROOT / "tools"))
    import find_region_siblings as frs  # noqa: E402

    eur_regions = frs.load_region(SOURCE_REGION)
    target_regions = frs.load_region(target_region)

    eur_func = None
    for f in eur_regions.get(eur_module, []):
        if f.addr == eur_addr:
            eur_func = f
            break
    if eur_func is None:
        return None

    matches = frs.find_siblings(
        eur_func, target_regions,
        source_region=SOURCE_REGION,
        target_region_name=target_region,
    )

    high_matches = [m for m in matches if m.confidence == "HIGH"]
    if len(high_matches) == 1:
        top = high_matches[0]
        return top.func.addr, top.func.name

    # Fallback (brief 076 D2) — raw bytes + reloc parity. Walk
    # every same-size same-module candidate, not just the
    # HIGH-tagged ones from find_siblings (which uses softer
    # thresholds). Require EXACTLY ONE pass-through on BOTH
    # criteria.
    candidates = target_regions.get(eur_module, [])
    strict_winners: list = []
    for cand in candidates:
        if cand.size != eur_func.size:
            continue
        if not _reloc_parity(eur_func, cand):
            continue
        if not _raw_bytes_equal(
                eur_func, cand,
                SOURCE_REGION, target_region):
            continue
        strict_winners.append(cand)

    if len(strict_winners) == 1:
        w = strict_winners[0]
        return w.addr, w.name
    return None


def find_eur_function(
    eur_addr: int,
) -> tuple[str, int] | None:
    """Find which EUR module contains `eur_addr` and the function
    size. Returns `(module_name, size)` or None if no match."""
    sys.path.insert(0, str(ROOT / "tools"))
    import find_region_siblings as frs  # noqa: E402

    eur_regions = frs.load_region(SOURCE_REGION)
    for module, funcs in eur_regions.items():
        for f in funcs:
            if f.addr == eur_addr:
                return module, f.size
    return None


def _delinks_path_for(
    region: str, module: str,
) -> Path:
    """Map (region, module) → the delinks.txt file path matching
    that module. Mirrors port_to_region.py's module convention."""
    region_dir = CONFIG_DIR / region / "arm9"
    if module == "main":
        return region_dir / "delinks.txt"
    if module in ("itcm", "dtcm"):
        return region_dir / module / "delinks.txt"
    if module.startswith("ov"):
        n = module[2:]
        return (region_dir / "overlays"
                / ("ov" + n.zfill(3)) / "delinks.txt")
    raise ValueError(f"unknown module: {module!r}")


_DATA_REF_RE = re.compile(r"\bdata_(?P<addr>[0-9a-fA-F]{8})\b")


def _find_data_refs_in_port(port_file: Path) -> list[int]:
    """Scan a port `.c` file for `data_<addr>` references.
    Returns a list of EUR addresses (unique, sorted)."""
    text = port_file.read_text(encoding="utf-8")
    addrs = {int(m.group("addr"), 16)
             for m in _DATA_REF_RE.finditer(text)}
    return sorted(addrs)


def _build_data_renames(
    eur_module: str, eur_func_addr: int, target_region: str,
    eur_data_addrs: list[int],
) -> tuple[tuple[tuple[str, str], ...] | None, str]:
    """For each EUR data address referenced by the port, find
    the byte-equivalent address in `target_region` via
    `port_to_region.derive_data_address_mapping`. Returns
    `(rename_pairs, error_message)`.

    The bridge is the same parallel-reloc map port_to_region.py
    uses cross-region (PR #419): when EUR and target functions
    are byte-identical (verified ≥0.99 by our caller), their
    reloc tables share offset+kind structure even when the
    data symbol target addresses differ per region.
    """
    sys.path.insert(0, str(ROOT / "tools"))
    import port_to_region as ptr  # noqa: E402
    import find_region_siblings as frs  # noqa: E402

    eur_regions = frs.load_region(SOURCE_REGION)
    target_regions = frs.load_region(target_region)

    eur_func = None
    for f in eur_regions.get(eur_module, []):
        if f.addr == eur_func_addr:
            eur_func = f
            break
    target_func = None
    target_match = find_byte_equivalent(
        eur_module, eur_func_addr, target_region,
    )
    if target_match is None:
        return None, "no unique target byte-equivalent for func"
    target_addr, _name = target_match
    for f in target_regions.get(eur_module, []):
        if f.addr == target_addr:
            target_func = f
            break
    if eur_func is None or target_func is None:
        return None, "could not load both region's Function objects"

    eur_relocs = ptr.load_full_relocs(SOURCE_REGION).get(
        eur_module, {})
    target_relocs = ptr.load_full_relocs(target_region).get(
        eur_module, {})

    addr_map = ptr.derive_data_address_mapping(
        eur_func, target_func, eur_relocs, target_relocs,
    )
    # addr_map keys are (target_module, eur_addr) → values are
    # (target_module, target_addr). Look up each port data ref.
    out: list[tuple[str, str]] = []
    for eur_data_addr in eur_data_addrs:
        # Try the function's local module first, then any other
        # module the data symbol might live in (data symbols can
        # cross-module via overlay vs main relocs).
        target_data_addr = None
        for (_mod, e_addr), (_tmod, t_addr) in addr_map.items():
            if e_addr == eur_data_addr:
                target_data_addr = t_addr
                break
        if target_data_addr is None:
            return None, (
                f"no parallel-reloc match for data_"
                f"{eur_data_addr:08x} (port reloc table differs "
                f"from local function's; manual remap required)"
            )
        out.append((
            f"data_{target_data_addr:08x}",
            f"data_{eur_data_addr:08x}",
        ))
    return tuple(out), ""


def derive_plan(
    port_file: Path, target_region: str,
) -> CrossApplyPlan | None:
    """Build a CrossApplyPlan for `port_file` × `target_region`
    or return None with a printable reason via stderr."""
    parsed = parse_port_filename(port_file)
    if parsed is None:
        print(f"error: {port_file.name} not a func_<addr>.legacy.c port",
              file=sys.stderr)
        return None
    eur_addr, _routing = parsed

    eur_info = find_eur_function(eur_addr)
    if eur_info is None:
        print(f"error: EUR symbol at 0x{eur_addr:08x} not found "
              f"in config/eur/", file=sys.stderr)
        return None
    eur_module, eur_size = eur_info

    target_match = find_byte_equivalent(
        eur_module, eur_addr, target_region,
    )
    if target_match is None:
        print(f"error: no unique byte-equivalent for "
              f"0x{eur_addr:08x} in {target_region}",
              file=sys.stderr)
        return None
    target_addr, target_old_name = target_match
    target_new_name = f"func_{eur_addr:08x}"
    delinks_path = _delinks_path_for(target_region, eur_module)

    # Scan the port for data refs; build per-region data renames.
    eur_data_addrs = _find_data_refs_in_port(port_file)
    data_renames: tuple[tuple[str, str], ...] = ()
    if eur_data_addrs:
        renames, err = _build_data_renames(
            eur_module, eur_addr, target_region, eur_data_addrs,
        )
        if renames is None:
            print(f"error: data-ref mapping failed for "
                  f"{port_file.name} → {target_region}: {err}",
                  file=sys.stderr)
            return None
        data_renames = renames

    return CrossApplyPlan(
        port_file=port_file,
        eur_addr=eur_addr,
        eur_size=eur_size,
        target_region=target_region,
        target_addr=target_addr,
        target_old_name=target_old_name,
        target_new_name=target_new_name,
        target_module=eur_module,
        delinks_path=delinks_path,
        data_renames=data_renames,
    )


# --------------------------------------------------------------------------- #
# Application
# --------------------------------------------------------------------------- #


def _run_rename(plan: CrossApplyPlan, dry_run: bool) -> tuple[bool, str]:
    """Invoke `tools/rename_symbol.py` for the per-region symbol
    rename. Returns `(ok, message)`. The existing tool refuses
    if old_name is missing, ambiguous, or new_name collides —
    those errors surface verbatim."""
    cmd = [
        sys.executable, str(ROOT / "tools" / "rename_symbol.py"),
        plan.target_old_name, plan.target_new_name,
        "--version", plan.target_region,
    ]
    if dry_run:
        cmd.append("--dry")
    r = subprocess.run(cmd, capture_output=True, text=True)
    return r.returncode == 0, (r.stderr or r.stdout).strip()


def _append_delinks_entry(plan: CrossApplyPlan, dry_run: bool) -> str:
    """Append a `libs/nitro/<port>.legacy.c:` entry to the
    target region's delinks.txt. Idempotent — if an entry for
    the same .text range already exists, do nothing."""
    libs_rel = plan.port_file.relative_to(ROOT)
    new_entry = (
        f"\n{libs_rel}:\n"
        f"    complete\n"
        f"    .text start:0x{plan.target_addr:08x} "
        f"end:0x{plan.target_addr + plan.eur_size:08x}\n"
    )
    text = plan.delinks_path.read_text(encoding="utf-8")
    if (f"start:0x{plan.target_addr:08x}"
            in text and str(libs_rel) in text):
        return "delinks-entry already present (idempotent skip)"
    if dry_run:
        return f"would append delinks entry to {plan.delinks_path}"
    with plan.delinks_path.open("a", encoding="utf-8") as f:
        f.write(new_entry)
    return f"delinks entry appended to {plan.delinks_path}"


def _run_data_renames(
    plan: CrossApplyPlan, dry_run: bool,
) -> tuple[bool, str]:
    """Run rename_symbol.py for each data symbol the port
    references. Returns `(ok, summary_message)`. If any
    individual rename fails, the rest are still attempted (the
    caller decides whether to git-revert)."""
    msgs: list[str] = []
    all_ok = True
    for old_name, new_name in plan.data_renames:
        cmd = [
            sys.executable, str(ROOT / "tools" / "rename_symbol.py"),
            old_name, new_name,
            "--version", plan.target_region,
        ]
        if dry_run:
            cmd.append("--dry")
        r = subprocess.run(cmd, capture_output=True, text=True)
        m = (r.stderr or r.stdout).strip()
        msgs.append(m)
        if r.returncode != 0:
            all_ok = False
    return all_ok, "; ".join(msgs)


def apply_plan(plan: CrossApplyPlan, dry_run: bool) -> CrossApplyResult:
    """Run the rename + delinks edit for one CrossApplyPlan.
    Errors from any step short-circuit; the plan is reported
    as `refused` with the underlying tool's message."""
    rename_ok, rename_msg = _run_rename(plan, dry_run)
    if not rename_ok:
        return CrossApplyResult(
            plan=plan, status="refused",
            detail=f"func rename failed: {rename_msg}",
        )

    data_ok, data_msg = _run_data_renames(plan, dry_run)
    if not data_ok:
        return CrossApplyResult(
            plan=plan, status="refused",
            detail=f"data rename failed: {data_msg}",
        )

    try:
        delinks_msg = _append_delinks_entry(plan, dry_run)
    except OSError as e:
        return CrossApplyResult(
            plan=plan, status="refused",
            detail=f"delinks edit failed: {e}",
        )

    detail = rename_msg
    if data_msg:
        detail += f"; data renames: {data_msg}"
    detail += f"; {delinks_msg}"
    return CrossApplyResult(
        plan=plan,
        status="ok" if not dry_run else "dry-run",
        detail=detail,
    )


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(
        description="Cross-apply a libs/nitro/ port to USA + JPN "
                    "(brief 073 Approach A). Renames each "
                    "region's byte-equivalent placeholder to "
                    "EUR's func_<addr> name and appends a "
                    "delinks.txt entry at the region's address.",
    )
    p.add_argument("port_file", type=Path,
                   help="Path to the libs/nitro/ port file "
                        "(e.g. libs/nitro/func_02007218.legacy.c).")
    p.add_argument("--regions",
                   default=",".join(DEFAULT_TARGET_REGIONS),
                   help="Comma-separated target regions "
                        f"(default: {','.join(DEFAULT_TARGET_REGIONS)}).")
    p.add_argument("--dry-run", action="store_true",
                   help="Preview the rename + delinks edits "
                        "without mutating anything.")
    p.add_argument("--format", choices=("text", "json"),
                   default="text",
                   help="Output format (default: text).")
    args = p.parse_args(argv)

    # Normalize to an absolute path so .relative_to(ROOT) works
    # whether the caller passed a project-relative or absolute path.
    args.port_file = args.port_file.resolve()
    if not args.port_file.is_file():
        print(f"error: port file not found: {args.port_file}",
              file=sys.stderr)
        return 1

    target_regions = [r.strip() for r in args.regions.split(",")
                      if r.strip()]
    if not target_regions:
        print("error: --regions cannot be empty", file=sys.stderr)
        return 2

    results: list[CrossApplyResult] = []
    overall_ok = True
    for region in target_regions:
        plan = derive_plan(args.port_file, region)
        if plan is None:
            overall_ok = False
            continue
        result = apply_plan(plan, dry_run=args.dry_run)
        results.append(result)
        if result.status == "refused":
            overall_ok = False

    if args.format == "json":
        print(json.dumps(
            {"results": [r.to_dict() for r in results]},
            indent=2,
        ))
    else:
        for r in results:
            print(f"{r.plan.target_region:>4}: "
                  f"{r.plan.target_old_name} → "
                  f"{r.plan.target_new_name} @ "
                  f"0x{r.plan.target_addr:08x}  "
                  f"[{r.status}]")
            print(f"        {r.detail}")

    return 0 if overall_ok else 3


if __name__ == "__main__":
    sys.exit(main())
