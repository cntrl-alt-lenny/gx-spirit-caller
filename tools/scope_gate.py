#!/usr/bin/env python3
"""
scope_gate.py — a pre-merge COMPLETENESS + rename-safety gate (R&D r9, §4).

`gate3.py` (3-region sha1) is the correctness arbiter, but it is **scope-blind**:
a thin PR that renames 40 of 150 targets, or does EUR and skips USA/JPN, passes
byte-identically. And a *rename* can be byte-neutral in one region yet break
another (b610 dup-symbol; b612 half-applied rename). This gate closes both holes
for the naming lane — the lane that burned two rounds — with three checks that,
together, would have caught b610 AND b612:

  1. SCOPE      — real-named-function delta (head vs --base, summed over regions)
                  must be >= --target. Catches "fast agent did 4 of 150".
  2. DUP-SYMBOL — no function name bound to >=2 addresses in any region.
                  Catches b610 (renamed to a name already used elsewhere).
  3. CASCADE    — no renamed-AWAY placeholder name (func_*/__sinit_* removed from
                  symbols.txt) still appears in COMPILED SOURCE (src/ libs/
                  include/). Catches b612 (symbols.txt renamed, the region .c
                  that defines/references the old name left untouched).

Deterministic, wine-free, CI-safe — pure git + text analysis, no build. Run it in
the PR worktree; it reads `--base` via `git show` so no checkout is needed.

Usage:
    python3.13 tools/scope_gate.py --kind naming --base origin/main --target 150
    python3.13 tools/scope_gate.py --kind naming --target 4 --regions eur,usa,jpn
    python3.13 tools/scope_gate.py --kind carve --base origin/main --target 20

Exit codes: 0 all checks pass · 1 a check failed · 2 usage/IO error.

For carve briefs, `--kind carve` checks both the requested complete-unit delta
and the three-way reconciliation between newly complete delinks TUs, newly
added `src/*.{c,s}` files, and that complete-unit delta.
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
import tempfile
from pathlib import Path

from progress import parse_delinks_file

ROOT = Path(__file__).resolve().parent.parent
_FUNC_RE = re.compile(r"^(\S+)\s+kind:function\([^)]*\)\s+addr:(0x[0-9a-fA-F]+)", re.M)
_PLACEHOLDER = ("func_", "__sinit_")
_SRC_DIRS = ("src", "libs", "include")
REGIONS = ("eur", "usa", "jpn")


def _symbols_paths(region: str) -> list[Path]:
    base = ROOT / "config" / region / "arm9"
    out = [base / "symbols.txt"]
    out += sorted((base / "overlays").glob("*/symbols.txt"))
    for extra in ("itcm", "dtcm"):
        p = base / extra / "symbols.txt"
        if p.exists():
            out.append(p)
    return [p for p in out if p.exists()]


def _read(ref: str | None, path: Path) -> str:
    """Read a repo file at a git ref (None => working tree)."""
    rel = path.relative_to(ROOT)
    if ref is None:
        return path.read_text(encoding="utf-8") if path.exists() else ""
    try:
        return subprocess.run(
            ["git", "show", f"{ref}:{rel}"],
            cwd=ROOT, capture_output=True, text=True, check=True,
        ).stdout
    except subprocess.CalledProcessError:
        return ""  # file absent at that ref


def parse_functions(text: str) -> dict[str, str]:
    """name -> addr for every kind:function line."""
    return {m.group(1): m.group(2).lower() for m in _FUNC_RE.finditer(text)}


def _is_placeholder(name: str) -> bool:
    return name.startswith(_PLACEHOLDER)


def region_funcs(ref: str | None, region: str) -> dict[str, str]:
    merged: dict[str, str] = {}
    for p in _symbols_paths(region):
        merged.update(parse_functions(_read(ref, p)))
    return merged


# ---- checks -----------------------------------------------------------------

def check_scope(base: str, regions: list[str], target: int) -> tuple[bool, str, dict]:
    per_region_new: dict[str, set[str]] = {}
    for r in regions:
        b = region_funcs(base, r)
        h = region_funcs(None, r)
        # a real name present at head but not at base = a newly-applied name
        newly_real = {n for n in h if not _is_placeholder(n) and n not in b}
        per_region_new[r] = newly_real
    total = sum(len(s) for s in per_region_new.values())
    ok = total >= target
    detail = f"real-named delta = {total} across {len(regions)} region(s) " \
             f"({', '.join(f'{r}:{len(per_region_new[r])}' for r in regions)}); target {target}"
    return ok, detail, {"per_region_new": {r: s for r, s in per_region_new.items()}}


def region_name_addrs(ref: str | None, region: str) -> dict[str, set[str]]:
    """name -> {addrs} across a region's symbol files (multiplicity preserved)."""
    by_name: dict[str, set[str]] = {}
    for p in _symbols_paths(region):
        for m in _FUNC_RE.finditer(_read(ref, p)):
            by_name.setdefault(m.group(1), set()).add(m.group(2).lower())
    return by_name


def check_dup_symbol(regions: list[str]) -> tuple[bool, str, dict]:
    """No function name bound to >=2 distinct addresses in a region (b610)."""
    offenders: dict[str, dict[str, list[str]]] = {}
    for r in regions:
        by_name = region_name_addrs(None, r)
        dups = {n: sorted(a) for n, a in by_name.items() if len(a) > 1}
        if dups:
            offenders[r] = dups
    ok = not offenders
    if ok:
        return True, "no function name bound to 2+ addresses in any region", {}
    detail = "; ".join(f"{r}: " + ", ".join(f"{n}@{'/'.join(a)}" for n, a in d.items())
                       for r, d in offenders.items())
    return False, f"DUPLICATE symbol names (b610 class): {detail}", {"offenders": offenders}


def check_cascade(base: str, regions: list[str]) -> tuple[bool, str, dict]:
    """No renamed-AWAY placeholder name still present in compiled source (b612)."""
    renamed_away: set[str] = set()
    for r in regions:
        b = region_funcs(base, r)
        h = region_funcs(None, r)
        renamed_away |= {n for n in b if _is_placeholder(n) and n not in h}
    if not renamed_away:
        return True, "no placeholder names were renamed away (nothing to cascade)", {}
    leaked: dict[str, list[str]] = {}
    for name in sorted(renamed_away):
        hits = _grep_source(name)
        if hits:
            leaked[name] = hits
    ok = not leaked
    if ok:
        return True, f"all {len(renamed_away)} renamed-away name(s) fully cascaded out of source", {}
    detail = "; ".join(f"{n} still in {', '.join(f[:2])}" for n, f in leaked.items())
    return False, f"HALF-APPLIED rename (b612 class): {detail}", {"leaked": leaked}


def _grep_source(name: str) -> list[str]:
    """Files under src/libs/include whose CONTENT still references `name`
    (filename-only hits excluded — the cascade renames content, and a lone file
    rename without content change can't leave the old symbol)."""
    try:
        out = subprocess.run(
            ["git", "grep", "-l", "-w", name, "--", *(f"{d}/**" for d in _SRC_DIRS)],
            cwd=ROOT, capture_output=True, text=True,
        )
    except OSError:
        return []
    return [ln for ln in out.stdout.splitlines() if ln.strip()]


def _delinks_paths(ref: str | None, region: str) -> list[str]:
    """Return delinks paths for a region at a ref or in the worktree."""
    prefix = f"config/{region}/arm9/"
    if ref is None:
        base = ROOT / prefix
        return [p.relative_to(ROOT).as_posix() for p in sorted(base.rglob("delinks.txt"))]
    out = subprocess.run(
        ["git", "ls-tree", "-r", "--name-only", ref, "--", prefix],
        cwd=ROOT, capture_output=True, text=True, check=True,
    ).stdout.splitlines()
    return [p for p in out if p.endswith("/delinks.txt")]


def _delinks_tus(ref: str | None, rel: str) -> list[dict]:
    """Parse one delinks file through progress.py at a git ref or HEAD."""
    if ref is None:
        return parse_delinks_file(ROOT / rel)[1]
    try:
        text = subprocess.run(
            ["git", "show", f"{ref}:{rel}"],
            cwd=ROOT, capture_output=True, text=True, check=True,
        ).stdout
    except subprocess.CalledProcessError:
        return []
    with tempfile.NamedTemporaryFile("w", encoding="utf-8") as f:
        f.write(text)
        f.flush()
        return parse_delinks_file(Path(f.name))[1]


def complete_tus(ref: str | None, regions: list[str]) -> set[tuple[str, str, str]]:
    """Return `(region, delinks path, TU source)` for complete non-gap TUs.

    This uses the canonical parser and complete-unit definition as the
    `progress.py` delinks tier; retaining the path keeps duplicate source
    names in different modules distinct.
    """
    complete: set[tuple[str, str, str]] = set()
    for region in regions:
        for rel in _delinks_paths(ref, region):
            for tu in _delinks_tus(ref, rel):
                source = tu.get("source", "")
                if tu.get("status") == "complete" and not source.startswith("_dsd_gap"):
                    complete.add((region, rel, source))
    return complete


def new_source_files(
    base: str, regions: list[str] | None = None, *, root: Path = ROOT,
) -> set[str]:
    """Return added selected-region `src/*.{c,s}` paths in the diff."""
    out = subprocess.run(
        ["git", "diff", "--name-status", base, "--", "src"],
        cwd=root, capture_output=True, text=True, check=True,
    ).stdout
    files: set[str] = set()
    for line in out.splitlines():
        fields = line.split("\t")
        if len(fields) < 2 or fields[0] != "A":
            continue
        path = fields[1]
        if not path.startswith("src/") or not path.endswith((".c", ".s")):
            continue
        if regions is None:
            files.add(path)
            continue
        path_region = next((r for r in ("usa", "jpn") if path.startswith(f"src/{r}/")), "eur")
        if path_region in regions:
            files.add(path)
    return files


def check_carve_scope(base: str, regions: list[str], target: int) -> tuple[bool, str, dict]:
    """Require the complete-unit delta to meet the carve target."""
    base_tus = complete_tus(base, regions)
    head_tus = complete_tus(None, regions)
    delta = len(head_tus) - len(base_tus)
    ok = delta >= target
    detail = f"complete_units delta = {delta} (head {len(head_tus)} - base {len(base_tus)}); target {target}"
    return ok, detail, {"base": base_tus, "head": head_tus, "delta": delta}


def check_carve_reconciliation(base: str, regions: list[str]) -> tuple[bool, str, dict]:
    """Reconcile complete TUs, added source files, and complete-unit delta."""
    base_tus = complete_tus(base, regions)
    head_tus = complete_tus(None, regions)
    new_complete = head_tus - base_tus
    delta = len(head_tus) - len(base_tus)
    added_sources = new_source_files(base, regions)
    counts = (len(new_complete), len(added_sources), delta)
    ok = counts[0] == counts[1] == counts[2]
    detail = (
        f"new complete TUs = {counts[0]}; new src files = {counts[1]}; "
        f"complete_units delta = {counts[2]}"
    )
    return ok, detail, {
        "new_complete": new_complete,
        "new_sources": added_sources,
        "delta": delta,
    }


_KINDS = {"carve", "naming"}


def run(kind: str, base: str, regions: list[str], target: int) -> int:
    if kind not in _KINDS:
        print(f"scope_gate: kind '{kind}' not implemented (have: {sorted(_KINDS)})", file=sys.stderr)
        return 2
    if kind == "carve":
        results = [
            ("scope", *check_carve_scope(base, regions, target)[:2]),
            ("reconcile", *check_carve_reconciliation(base, regions)[:2]),
        ]
    else:
        results = [
            ("scope", *check_scope(base, regions, target)[:2]),
            ("dup-symbol", *check_dup_symbol(regions)[:2]),
            ("cascade", *check_cascade(base, regions)[:2]),
        ]
    failed = [k for k, ok, _ in results if not ok]
    for k, ok, detail in results:
        print(f"  {'PASS' if ok else 'FAIL':4} {k:12} {detail}")
    print()
    if failed:
        if kind == "carve":
            print(f"scope_gate: {len(failed)} check(s) failed ({', '.join(failed)}) — "
                  "carve scope/reconciliation is unsafe; do NOT merge.")
        else:
            print(f"scope_gate: {len(failed)} check(s) failed ({', '.join(failed)}) — "
                  f"PR is thin or a rename is unsafe; do NOT merge.")
        return 1
    if kind == "carve":
        print("scope_gate: PASS — carve target met and complete-TU/source reconciliation holds.")
    else:
        print("scope_gate: PASS — scope met, no dup-symbol, renames fully cascaded.")
    return 0


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description="Pre-merge scope + rename-safety gate.")
    ap.add_argument("--kind", default="naming", choices=sorted(_KINDS))
    ap.add_argument("--base", default="origin/main", help="merge-base ref for deltas")
    ap.add_argument("--regions", default=",".join(REGIONS))
    ap.add_argument("--target", type=int, default=1, help="minimum real-named delta")
    args = ap.parse_args(argv[1:])
    regions = [r.strip() for r in args.regions.split(",") if r.strip()]
    try:
        return run(args.kind, args.base, regions, args.target)
    except (subprocess.SubprocessError, OSError) as e:
        print(f"scope_gate: {e}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv))
