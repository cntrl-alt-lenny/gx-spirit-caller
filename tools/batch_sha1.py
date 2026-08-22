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
import re
import subprocess
import sys
from pathlib import Path

from routing_suffixes import strip_routing_suffix

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
    # Set by _displace_stale_sibling when this candidate's .s sibling had to
    # be moved out of the way to self-heal a ninja config error (see
    # _ninja_config_error). None means "never displaced" -- _revert_one
    # only needs to restore it in the displaced case.
    s_backup: bytes | None = dataclasses.field(default=None, init=False)


def _rel_posix(path: Path) -> str:
    return str(path.relative_to(ROOT)).replace("\\", "/")


# Longest-first: each of these also ends with plain ".c", so a routing-
# tier suffix must be tried before the bare ".c" fallback or it never
# matches.
_TIER_SUFFIXES = (".legacy_sp3.c", ".legacy.c", ".thumb.c")


def _c_to_s_rel(c_rel: str) -> str:
    """'src/main/func_X.c' → 'src/main/func_X.s'.
    Also handles the routing-tier filename suffixes (.legacy.c,
    .legacy_sp3.c, .thumb.c): their .s revert target never carries the
    tier suffix, because a tier only selects which mwcc invocation
    compiles a .c -- a .s has no tier concept, it's assembled directly.
    Confirmed against a real ship: func_ov004_021dcd1c.thumb.c's own
    delinks history shows the .s it replaced was plain
    func_ov004_021dcd1c.s, not func_ov004_021dcd1c.thumb.s. Before this
    fix, the naive c_rel[:-2] suffix strip produced
    'func_X.legacy_sp3.s' (or '.legacy.s' / '.thumb.s') for these three
    families -- a revert target that never exists, defeating
    batch_sha1's bisection the moment a tier-suffixed candidate needed
    reverting.
    """
    for suffix in _TIER_SUFFIXES:
        if c_rel.endswith(suffix):
            return c_rel[: -len(suffix)] + ".s"

    if not c_rel.endswith(".c"):
        raise ValueError(f"Expected .c path, got: {c_rel}")
    return strip_routing_suffix(c_rel[:-2]) + ".s"


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


def _missing_revert_target_error(s_rel: str, c_rel: str) -> str | None:
    """None if s_rel exists on disk as a valid bisection fallback, else a
    precise, ready-to-print error string explaining why not.

    By the time this is called, delinks.txt still routes to s_rel (a
    caller-side _find_delinks lookup already succeeded) -- but the file
    itself can still be gone, e.g. deleted by an earlier batch-prep step
    that didn't also flip delinks.txt. Left unchecked, that doesn't fail
    here: it fails LATER, deep inside a bisect run, as a ninja "missing
    input" build error that _run_sha1 can't distinguish from a real sha1
    mismatch -- every candidate in the batch gets misreported as a
    culprit (brief 675's "FALSE 0 confirmed across an entire correct
    batch"). Checking this as an infra precondition, alongside the other
    delinks/already-applied checks, turns that into one loud, specific,
    immediate error instead.
    """
    if (ROOT / s_rel).is_file():
        return None
    return (
        f"Revert target missing: {s_rel} is still the active delinks.txt "
        f"entry for {c_rel}, but the .s file itself doesn't exist on disk.\n"
        f"  batch_sha1 needs the pre-ship .s as a bisection fallback -- "
        f"restore it (e.g. `git checkout -- {s_rel}`) before running this batch, "
        f"or omit {c_rel} from this invocation."
    )


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
        # The .s is the superseded build input as soon as delinks routes this
        # TU to .c.  Remove it now, while retaining an exact in-memory backup
        # for a later bisect/revert.  Waiting for configure.py's self-heal
        # leaves a silent .c/.s pair on disk and can make the next configure
        # fail with "multiple rules generate".
        _displace_stale_sibling(cand)
    return ok


def _revert_one(cand: Candidate) -> bool:
    ok = _flip_delinks(cand.delinks_path, cand.c_rel, cand.s_rel)
    if ok:
        cand.applied = False
        _restore_stale_sibling(cand)
    return ok


# ---------------------------------------------------------------------------
# Stale-sibling self-heal (delinks-flip-before-.s-removal race)
# ---------------------------------------------------------------------------
#
# configure.py adds an unconditional ninja build rule for EVERY .c and
# EVERY .s file it finds under src/, regardless of what delinks.txt
# currently routes to (confirmed directly: `tools/cmatch_loop.py`'s
# `displace_sibling_s` hits the identical mechanism during compile-testing,
# and the project convention is that zero already-.c-converted functions
# anywhere in this tree keep a sibling .s). A candidate's .s sibling is
# REQUIRED to exist on disk by the time batch_sha1 starts (see
# `_missing_revert_target_error` -- it's the bisection fallback), so every
# batch begins in exactly the state that produces this collision the
# moment build.ninja is next regenerated: two build edges both writing
# `build/<region>/<...>.o`, which ninja refuses to parse at all with
# `ninja: error: build.ninja:N: multiple rules generate <path>` -- a
# CONFIGURATION fatal that fires before sha1.py ever runs, not a byte
# divergence. Reproduced directly against this tree (brief 682 fix,
# 2026-07-25): writing a throwaway .c beside an untouched, delinks-routed
# `src/main/VBlankIntrWait.s` and reconfiguring hit this exact error;
# deleting the .s WITHOUT reconfiguring left the error in place (build.ninja
# is a static snapshot -- ninja never rescans the filesystem on its own);
# reconfiguring afterward cleared it. The fix below automates precisely
# that manual recovery for whichever candidate in THIS batch triggered it.


def _reconfigure(region: str) -> tuple[int, str]:
    """Re-run configure.py for `region`. Returns (returncode, combined
    stdout+stderr) so callers can surface a failure verbatim."""
    result = subprocess.run(
        [sys.executable, "tools/configure.py", region],
        cwd=ROOT, capture_output=True, text=True,
    )
    return result.returncode, (result.stdout or "") + (result.stderr or "")


def _displace_stale_sibling(cand: Candidate) -> bool:
    """Move cand's .s sibling out of the way (delete, keep the exact bytes
    in-memory on the Candidate). Returns True if a file was displaced.

    Mirrors `cmatch_loop.py`'s `displace_sibling_s` -- same mechanism,
    same reason. Uses read_bytes/write_bytes (not text) so line endings
    and encoding round-trip byte-for-byte through the backup.
    """
    s_path = ROOT / cand.s_rel
    if not s_path.is_file():
        return False
    cand.s_backup = s_path.read_bytes()
    s_path.unlink()
    return True


def _restore_stale_sibling(cand: Candidate) -> None:
    """Undo _displace_stale_sibling: put the .s file back verbatim if it
    was ever displaced (no-op otherwise, including the common case where
    self-heal never triggered for this candidate)."""
    if cand.s_backup is not None:
        (ROOT / cand.s_rel).write_bytes(cand.s_backup)
        cand.s_backup = None


# ninja's own fatal-configuration-error line. Distinct from sha1.py's own
# failure report (`f"{file_path}: FAILED"`, no "ninja: error:" prefix --
# see tools/sha1.py) by construction, so this can never misfire on a real
# byte mismatch: this prefix only appears when ninja refused to even
# start the build.
_NINJA_ERROR_RE = re.compile(r"^ninja: error:.*$", re.M)
_MULTIPLE_RULES_RE = re.compile(r"multiple rules generate (?P<path>\S+)")


def _ninja_config_error(output: str) -> str | None:
    """None if `output` (ninja's combined stdout+stderr) shows no
    ninja-level fatal; otherwise the matched error line(s), joined."""
    hits = _NINJA_ERROR_RE.findall(output)
    return "\n".join(hits) if hits else None


def _expected_s_object_rel(s_rel: str, region: str) -> str:
    """'src/main/func_X.s' -> 'build/eur/src/main/func_X.o' -- the output
    path a stale, still-on-disk .s sibling's own assemble rule would
    target. A .s has no routing-tier concept (see `_c_to_s_rel`'s
    docstring), so this is always the bare stem, matching what a
    colliding *plain* `.c` (same stem) would ALSO target -- exactly the
    collision this whole self-heal exists to resolve."""
    assert s_rel.endswith(".s")
    return f"build/{region}/{s_rel[:-2]}.o"


def _correlate_stale_sibling(
    config_error: str, candidates: list[Candidate], region: str,
) -> Candidate | None:
    """If `config_error` is a 'multiple rules generate <path>' fatal whose
    path matches one of `candidates`' own .s sibling, return that
    candidate. None if the conflict doesn't belong to this batch (a
    stray, unrelated .c/.s pair elsewhere in the tree) -- self-healing
    something outside the batch is out of scope; report it instead."""
    m = _MULTIPLE_RULES_RE.search(config_error)
    if m is None:
        return None
    hit_path = m.group("path").replace("\\", "/")
    for cand in candidates:
        if _expected_s_object_rel(cand.s_rel, region) == hit_path:
            return cand
    return None


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

def _run_sha1(verbose: bool = False) -> tuple[int, str]:
    """Run `ninja sha1` from ROOT. Returns (exit code, combined
    stdout+stderr).

    Always captures now (previously only when not verbose) so callers can
    tell a ninja-level configuration fatal (see `_ninja_config_error`)
    apart from a real sha1 mismatch -- both look identical as a bare
    nonzero return code. When verbose, the captured output is echoed
    after the run instead of streaming live; a minor UX trade for being
    able to inspect every run's output uniformly.
    """
    result = subprocess.run(
        ["ninja", "sha1"], cwd=ROOT, capture_output=True, text=True,
    )
    output = (result.stdout or "") + (result.stderr or "")
    if verbose:
        print(output, end="")
    return result.returncode, output


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
    rc, _output = _run_sha1(verbose)
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
    rc2, _output = _run_sha1(verbose)
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
    rc3, _output = _run_sha1(verbose)
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

        revert_err = _missing_revert_target_error(s_rel, c_rel)
        if revert_err is not None:
            infra_errors.append(revert_err)
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

    # --- Run sha1, self-healing a stale-.s-sibling ninja config error once
    # per candidate before ever treating a failure as a byte mismatch ---
    print(f"\nninja sha1  ({len(candidates)} candidate(s) applied)...")
    healed: list[str] = []
    already_healed: set[str] = set()
    while True:
        rc, output = _run_sha1(args.verbose)
        if rc == 0:
            break
        config_error = _ninja_config_error(output)
        if config_error is None:
            break  # a real sha1 mismatch -- fall through to bisect below

        culprit = _correlate_stale_sibling(config_error, candidates, args.region)
        if culprit is None or culprit.c_rel in already_healed:
            # Not one of this batch's own candidates (a stray .c/.s pair
            # elsewhere in the tree), or we already tried healing this one
            # once and it's still broken -- this is an infra problem, not
            # something bisection can meaningfully attribute to a culprit.
            for c in candidates:
                if c.applied:
                    _revert_one(c)
            _sort_delinks(modified_delinks)
            already_str = (
                f" (already attempted a self-heal for {culprit.c_rel})"
                if culprit is not None else ""
            )
            print(
                f"ERROR: ninja configuration error, not a byte mismatch"
                f"{already_str}:\n{config_error}\n"
                "  build.ninja itself is broken -- commonly a stray .c/.s "
                "pair for the same translation unit existed when "
                "configure.py last ran (configure.py adds a build rule "
                "for every .c AND every .s file it finds under src/, "
                "regardless of delinks.txt). All candidates in this batch "
                "have been reverted.\n"
                "  Fix: locate the stray file pair named above, remove "
                f"the extra one, then re-run "
                f"`python tools/configure.py {args.region}` before retrying.",
                file=sys.stderr,
            )
            return 2

        already_healed.add(culprit.c_rel)
        print(
            f"  ninja config error: {culprit.c_rel}'s .s sibling "
            f"({culprit.s_rel}) is still on disk and collides with its "
            f"own build rule now that delinks.txt routes to the .c. "
            f"Self-healing: removing {culprit.s_rel}, reconfiguring, "
            f"retrying...",
            file=sys.stderr,
        )
        _displace_stale_sibling(culprit)
        reconf_rc, reconf_output = _reconfigure(args.region)
        if reconf_rc != 0:
            for c in candidates:
                if c.applied:
                    _revert_one(c)
            _sort_delinks(modified_delinks)
            print(
                f"ERROR: configure.py failed during stale-sibling self-heal "
                f"for {culprit.c_rel}:\n{reconf_output}\n"
                "  All candidates in this batch have been reverted.",
                file=sys.stderr,
            )
            return 2
        healed.append(culprit.c_rel)
        # Loop back and retry `ninja sha1` now that build.ninja is clean.

    if healed:
        print(f"  self-healed stale .s sibling(s) for: {', '.join(healed)}")

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
        "self_healed_stale_siblings": healed,
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
