#!/usr/bin/env python3
"""
batch_sha1.py — amortized sha1 confirmation for a batch of C-match candidates.

Given a region and a list of accepted candidate .c files (already passing
fastmatch-resolved), this tool:

  1. Applies all candidates by flipping their delinks.txt entries from .s to .c.
  2. Runs sort_delinks.py on each modified delinks.txt.
  3. Runs ONE `ninja sha1` to confirm all candidates byte-for-byte.
  4. If sha1 passes → all candidates are confirmed; changes remain applied.
  5. If sha1 fails → BISECTS to isolate the culprit(s):
       - Recursively reverts half the candidates and re-runs sha1.
       - Continues until every culprit is isolated to a single candidate.
       - Reverts only the culprits; leaves the clean set applied.
  6. Reports the confirmed set and the culprits in human-readable and JSON form.

AMORTIZATION: one `ninja sha1` run relinks the entire ROM (the expensive
shared-delinks recompile). Confirming 5–10 candidates in one run instead of
one-per-candidate saves 4–9 recompile cycles per batch.

Campaign loop:
  fastmatch.py resolved (seconds) → collect accepts
  → batch_sha1.py (one sha1 per batch of 5-10)

Prerequisites:
  - build.ninja configured for the target region
  - Candidate .c files already exist in src/ and are known to build.ninja
    (re-run configure.py if a .c was just added)
  - config/<region>/arm9/**/delinks.txt entries reference the .s ships

Usage:
    python tools/batch_sha1.py eur src/main/func_A.c src/main/func_B.c

Arguments:
    region          eur | usa | jpn
    cfiles          .c source paths that passed fastmatch-resolved

Options:
    --dry-run       Show what would change; do not modify files or run sha1
    --json          Machine-readable JSON output
    --verbose       Show ninja sha1 stdout/stderr during bisect runs

Exit codes:
    0   All candidates confirmed (sha1 passes; changes applied)
    1   One or more culprits found; partial set applied; culprits reverted
    2   Infrastructure error (build.ninja missing, delinks entry not found, etc.)
"""
from __future__ import annotations

import argparse
import dataclasses
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
_KNOWN_REGIONS = ("eur", "usa", "jpn")


# ---------------------------------------------------------------------------
# Candidate bookkeeping
# ---------------------------------------------------------------------------

@dataclasses.dataclass
class Candidate:
    c_path: Path
    s_rel: str          # relative .s path (forward-slash) as it appears in delinks.txt
    c_rel: str          # relative .c path (forward-slash)
    delinks_path: Path
    applied: bool = dataclasses.field(default=False, init=False)


def _rel_posix(path: Path) -> str:
    return str(path.relative_to(ROOT)).replace("\\", "/")


def _c_to_s_rel(c_rel: str) -> str:
    """'src/main/func_X.c' → 'src/main/func_X.s'."""
    if not c_rel.endswith(".c"):
        raise ValueError(f"Expected .c path, got: {c_rel}")
    return c_rel[:-2] + ".s"


# ---------------------------------------------------------------------------
# Delinks discovery
# ---------------------------------------------------------------------------

def _find_delinks(s_rel: str, region: str) -> Path | None:
    """Scan config/<region>/arm9/**/delinks.txt for a TU block whose header
    line is exactly `s_rel:`.  Returns the first match, or None."""
    config_arm9 = ROOT / "config" / region / "arm9"
    if not config_arm9.is_dir():
        return None
    # TU header lines are non-indented: "src/main/func_X.s:"
    # They appear at the start of the file or after a newline.
    marker_mid = f"\n{s_rel}:"
    marker_sof = f"{s_rel}:"
    for delinks in sorted(config_arm9.rglob("delinks.txt")):
        try:
            content = delinks.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        if marker_mid in content or content.startswith(marker_sof):
            return delinks
    return None


def _is_already_applied(c_rel: str, region: str) -> Path | None:
    """Return the delinks.txt path if c_rel is already the active entry, else None."""
    config_arm9 = ROOT / "config" / region / "arm9"
    if not config_arm9.is_dir():
        return None
    marker_mid = f"\n{c_rel}:"
    marker_sof = f"{c_rel}:"
    for delinks in sorted(config_arm9.rglob("delinks.txt")):
        try:
            content = delinks.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        if marker_mid in content or content.startswith(marker_sof):
            return delinks
    return None


# ---------------------------------------------------------------------------
# Apply / Revert
# ---------------------------------------------------------------------------

def _flip_delinks(delinks_path: Path, old_rel: str, new_rel: str) -> bool:
    """Replace TU header `old_rel:` with `new_rel:` in delinks_path.

    Preserves the original line-ending style (CRLF or LF).
    Returns True if the substitution was made.
    """
    try:
        raw = delinks_path.read_bytes()
    except OSError as exc:
        print(f"  ERROR reading {delinks_path}: {exc}", file=sys.stderr)
        return False

    nl = b"\r\n" if b"\r\n" in raw else b"\n"
    old_header = (old_rel + ":").encode()
    new_header = (new_rel + ":").encode()

    # Match TU header: at start-of-file OR immediately after a newline.
    # We do a simple line-by-line replacement to avoid regex edge cases.
    lines = raw.split(nl)
    found = False
    for i, line in enumerate(lines):
        if line == old_header:
            lines[i] = new_header
            found = True
            break  # delinks.txt has exactly one entry per TU path
    if not found:
        return False
    try:
        delinks_path.write_bytes(nl.join(lines))
    except OSError as exc:
        print(f"  ERROR writing {delinks_path}: {exc}", file=sys.stderr)
        return False
    return True


def _apply_one(cand: Candidate) -> bool:
    ok = _flip_delinks(cand.delinks_path, cand.s_rel, cand.c_rel)
    if ok:
        cand.applied = True
    return ok


def _revert_one(cand: Candidate) -> bool:
    ok = _flip_delinks(cand.delinks_path, cand.c_rel, cand.s_rel)
    if ok:
        cand.applied = False
    return ok


def _apply_many(candidates: list[Candidate]) -> None:
    for c in candidates:
        _apply_one(c)


def _revert_many(candidates: list[Candidate]) -> None:
    for c in candidates:
        _revert_one(c)


# ---------------------------------------------------------------------------
# sort_delinks helper
# ---------------------------------------------------------------------------

def _sort_delinks(delinks_paths: set[Path]) -> None:
    """Run sort_delinks.sort_delinks() on each modified file."""
    try:
        import sort_delinks as _sd
    except ImportError:
        print(
            "  WARNING: could not import sort_delinks — skipping sort step",
            file=sys.stderr,
        )
        return
    for dp in sorted(delinks_paths):
        try:
            _sd.sort_delinks(str(dp))
        except Exception as exc:
            print(f"  WARNING: sort_delinks failed on {dp.name}: {exc}", file=sys.stderr)


# ---------------------------------------------------------------------------
# sha1 runner
# ---------------------------------------------------------------------------

def _run_sha1(verbose: bool = False) -> int:
    """Run `ninja sha1` from ROOT. Returns the exit code."""
    kwargs: dict = {"cwd": ROOT}
    if not verbose:
        kwargs["capture_output"] = True
        kwargs["text"] = True
    result = subprocess.run(["ninja", "sha1"], **kwargs)
    return result.returncode


# ---------------------------------------------------------------------------
# Bisect
# ---------------------------------------------------------------------------

def _bisect_culprits(
    suspects: list[Candidate],
    verbose: bool,
    depth: int = 0,
) -> tuple[list[Candidate], list[Candidate]]:
    """Isolate which candidates in `suspects` break sha1.

    Precondition: sha1 FAILS with all candidates in `suspects` currently applied.
    Returns (culprits, clean).  Culprits are reverted; clean remain applied.
    """
    indent = "  " * depth
    print(f"{indent}bisect: testing {len(suspects)} suspect(s)...", file=sys.stderr)

    if not suspects:
        return [], []

    if len(suspects) == 1:
        cand = suspects[0]
        _revert_one(cand)
        print(f"{indent}CULPRIT: {cand.c_rel}", file=sys.stderr)
        return [cand], []

    mid = len(suspects) // 2
    first = suspects[:mid]
    second = suspects[mid:]

    # --- Test without first half ---
    _revert_many(first)
    rc = _run_sha1(verbose)
    if rc == 0:
        # Removing first half fixed sha1 → all culprits are in first half.
        # Re-apply first, then recurse to isolate specific ones.
        _apply_many(first)
        culprits, clean_first = _bisect_culprits(first, verbose, depth + 1)
        # second is known clean (sha1 passed without first)
        return culprits, clean_first + second

    # sha1 still fails without first half → second half has independent culprits.
    # Restore first, revert second, test.
    _apply_many(first)
    _revert_many(second)
    rc2 = _run_sha1(verbose)
    if rc2 == 0:
        # Removing second half fixed sha1 → all culprits are in second half.
        _apply_many(second)
        culprits, clean_second = _bisect_culprits(second, verbose, depth + 1)
        return culprits, first + clean_second

    # sha1 fails with EITHER half independently → culprits in both halves.
    # Bisect each half with the other reverted so results are independent.

    # First half is applied, second is reverted; sha1 fails → bisect first.
    culprits_first, clean_first = _bisect_culprits(first, verbose, depth + 1)
    # Now: culprits_first reverted, clean_first applied, second still reverted.

    _apply_many(second)
    rc3 = _run_sha1(verbose)
    if rc3 == 0:
        # Second half turned out clean (sha1 passes once culprits_first are out)
        return culprits_first, clean_first + second

    # Second half still causes failure → bisect it too.
    culprits_second, clean_second = _bisect_culprits(second, verbose, depth + 1)
    return culprits_first + culprits_second, clean_first + clean_second


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Amortized sha1 confirmation for a batch of C-match candidates. "
            "Applies all candidates (delinks .s→.c), runs ONE ninja sha1, and "
            "bisects to isolate culprits if sha1 fails."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="Exit: 0=all confirmed, 1=culprits isolated, 2=infra error",
    )
    ap.add_argument("region", choices=list(_KNOWN_REGIONS),
                    help="Region (must match the last configure.py run)")
    ap.add_argument("cfiles", nargs="+", metavar="cfile", type=Path,
                    help="Candidate .c paths that passed fastmatch-resolved")
    ap.add_argument("--dry-run", action="store_true",
                    help="Print what would change; do not modify files or run sha1")
    ap.add_argument("--json", action="store_true",
                    help="Machine-readable JSON output")
    ap.add_argument("--verbose", action="store_true",
                    help="Show ninja sha1 output during each bisect run")
    args = ap.parse_args(argv)

    if not (ROOT / "build.ninja").is_file():
        print(
            f"ERROR: build.ninja not found in {ROOT}.\n"
            f"  Run `python tools/configure.py {args.region}` first.",
            file=sys.stderr,
        )
        return 2

    # --- Resolve candidates ---
    candidates: list[Candidate] = []
    infra_errors: list[str] = []

    for raw_path in args.cfiles:
        c_path = raw_path if raw_path.is_absolute() else ROOT / raw_path
        if not str(c_path).endswith(".c"):
            infra_errors.append(f"Not a .c file: {raw_path}")
            continue
        c_rel = _rel_posix(c_path)
        s_rel = _c_to_s_rel(c_rel)

        delinks = _find_delinks(s_rel, args.region)
        if delinks is None:
            # Already applied?
            existing = _is_already_applied(c_rel, args.region)
            if existing:
                infra_errors.append(
                    f"Already applied ({c_rel} is already in delinks as .c): "
                    f"{existing.relative_to(ROOT)}"
                )
            else:
                infra_errors.append(
                    f"No delinks.txt entry found for .s ship: {s_rel}\n"
                    f"  Check config/{args.region}/arm9/**/delinks.txt"
                )
            continue

        candidates.append(Candidate(c_path=c_path, s_rel=s_rel, c_rel=c_rel,
                                    delinks_path=delinks))

    if infra_errors:
        for e in infra_errors:
            print(f"ERROR: {e}", file=sys.stderr)
        return 2

    if not candidates:
        print("No candidates to process.", file=sys.stderr)
        return 2

    print(f"batch_sha1: {len(candidates)} candidate(s) for {args.region}")
    for cand in candidates:
        print(f"  + {cand.c_rel}  [delinks: {cand.delinks_path.relative_to(ROOT)}]")

    if args.dry_run:
        print(
            f"\n[dry-run] Would flip {len(candidates)} delinks entries (.s→.c) "
            f"and run `ninja sha1`.\nNo files modified."
        )
        return 0

    # --- Apply all candidates ---
    modified_delinks: set[Path] = set()
    for cand in candidates:
        ok = _apply_one(cand)
        if not ok:
            print(
                f"ERROR: could not flip delinks entry for {cand.c_rel}\n"
                f"  File: {cand.delinks_path}\n"
                f"  Expected header: {cand.s_rel}:",
                file=sys.stderr,
            )
            for c in candidates:
                if c.applied:
                    _revert_one(c)
            return 2
        modified_delinks.add(cand.delinks_path)

    _sort_delinks(modified_delinks)

    # --- Run sha1 ---
    print(f"\nninja sha1  ({len(candidates)} candidate(s) applied)...")
    rc = _run_sha1(args.verbose)

    confirmed: list[Candidate]
    culprits: list[Candidate]

    if rc == 0:
        confirmed = list(candidates)
        culprits = []
        print(f"SHA1 PASS — all {len(confirmed)} candidate(s) confirmed.")
    else:
        print(f"SHA1 FAIL — bisecting {len(candidates)} suspect(s)...", file=sys.stderr)
        culprits, confirmed = _bisect_culprits(candidates, args.verbose)
        # Final sort on the confirmed state
        _sort_delinks(modified_delinks)
        print(
            f"\nBisect complete: "
            f"{len(confirmed)} confirmed, {len(culprits)} culprit(s)."
        )

    # --- Report ---
    def _fmt(path: Path) -> str:
        try:
            return str(path.relative_to(ROOT)).replace("\\", "/")
        except ValueError:
            return str(path)

    report: dict = {
        "region": args.region,
        "sha1_passed": rc == 0,
        "confirmed": [_fmt(c.c_path) for c in confirmed],
        "culprits": [_fmt(c.c_path) for c in culprits],
    }

    if args.json:
        print(json.dumps(report, indent=2))
    else:
        if confirmed:
            print("\nConfirmed (sha1-clean, changes applied):")
            for c in confirmed:
                print(f"  OK  {c.c_rel}")
        if culprits:
            print("\nCulprits (sha1-breaking, reverted):")
            for c in culprits:
                print(f"  !!  {c.c_rel}")

    return 0 if not culprits else 1


if __name__ == "__main__":
    sys.exit(main())
