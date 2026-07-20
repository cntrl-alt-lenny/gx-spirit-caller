#!/usr/bin/env python3
"""
gate3.py — the brain's one-command 3-region clean-tree gate.

The merge gate (`ninja sha1` for eur, usa AND jpn, byte-identical) is the
most-repeated, highest-stakes brain action, yet it's entirely manual:
`configure.py` is single-region, so a real gate means reconfiguring +
rebuilding for all three regions in sequence. Doing that by hand invites two
documented failure modes this driver closes:

  * FALSE PASS from a stale incremental `.o`. A stale object once faked a JPN
    sha1 PASS for ~2 weeks; only a clean-tree rebuild caught it (docs/state.md,
    the "latent JPN link break" incident). gate3 removes the built ROM (and
    `objdiff.json`) before every region's `ninja sha1` so the ROM is always
    relinked from current inputs, and offers `--clean` for a full
    `ninja -t clean` when a change *deletes or moves* source (the masking
    class), not merely adds it (the drain's pure-addition waves are safe
    without it).

  * A synthesized "PASS" that hides the real evidence. gate3 NEVER prints a
    PASS it didn't read: it streams each region's real configure + sha1 output
    live, so its stdout IS the paste-able proof AGENTS.md's integrity controls
    require. It reports PASS/FAIL off the actual process exit status, never a
    hand-typed verdict.

Per-region sequence (the canonical CLAUDE.md re-verify command):
    python3.13 tools/configure.py <ver>
    rm -f objdiff.json gx-spirit-caller_<ver>.nds
    [--clean: ninja -t clean]
    ninja sha1

Then once, unless --no-tests: `pytest -q tests` (a hard gate). `--invariants`
additionally runs tools/check_match_invariants.py as an ADVISORY report (it
never gates — see run_tests).

Usage:
    python3.13 tools/gate3.py                # full 3-region gate + invariants + tests
    python3.13 tools/gate3.py --scope eur     # one region (fast smoke)
    python3.13 tools/gate3.py --scope tests    # invariants + pytest only (wine-free)
    python3.13 tools/gate3.py --clean          # force a full rebuild each region

Exit codes:
    0   every requested region byte-identical (+ invariants/tests green)
    1   a region diverged, or invariants/tests failed (message names which)
    2   infrastructure error (wrong cwd, missing configure.py, ...)
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PY = sys.executable  # the python3.13 running this script
REGIONS = ["eur", "usa", "jpn"]
DSD_MARKER = "0.11"  # the pinned dsd tag (configure.DSD_VERSION = v0.11.0)


def check_dsd_binary() -> bool:
    """Fail loud if ./dsd isn't the real dsd. Incident 2026-07-19: ./dsd got
    clobbered byte-for-byte with objdiff-cli, so `dsd rom extract` errored
    ("Unrecognized argument: rom") and the whole 3-region gate FAILED on a
    build error that looked exactly like a content divergence — a full gate
    cycle wasted before the wrong binary was spotted. This catches it in ms."""
    dsd = ROOT / "dsd"
    if not dsd.exists():
        print(f"gate3: ./dsd missing — run `python3.13 tools/download_tool.py "
              f"dsd v0.11.0 --path ./dsd`", file=sys.stderr)
        return False
    try:
        out = subprocess.run([str(dsd), "--version"], cwd=ROOT,
                             capture_output=True, text=True, timeout=15).stdout
    except (subprocess.SubprocessError, OSError) as e:
        print(f"gate3: ./dsd --version failed ({e})", file=sys.stderr)
        return False
    if DSD_MARKER not in out:
        print(f"gate3: ./dsd is the WRONG binary (version {out.strip()!r}, "
              f"expected dsd {DSD_MARKER}.x — likely clobbered with objdiff-cli). "
              f"Restore: `python3.13 tools/download_tool.py dsd v0.11.0 --path ./dsd`",
              file=sys.stderr)
        return False
    return True


def run(cmd: list[str]) -> int:
    """Run a command from ROOT, streaming its output live. Returns the exit code."""
    print(f"\n$ {' '.join(cmd)}", flush=True)
    return subprocess.run(cmd, cwd=ROOT).returncode


def gate_region(ver: str, clean: bool) -> bool:
    print(f"\n{'=' * 20} {ver} {'=' * 20}", flush=True)
    if run([PY, "tools/configure.py", ver]) != 0:
        print(f"[{ver}] CONFIGURE-FAIL", flush=True)
        return False
    # Clean-tree: always remove the built ROM so `ninja sha1` relinks from
    # current inputs (never trusts a lingering .nds); --clean also wipes the
    # object tree to defeat stale-.o masking on delete/move changes.
    for stale in ("objdiff.json", f"gx-spirit-caller_{ver}.nds"):
        try:
            (ROOT / stale).unlink()
        except FileNotFoundError:
            pass
    if clean and run(["ninja", "-t", "clean"]) != 0:
        print(f"[{ver}] CLEAN-FAIL", flush=True)
        return False
    if run(["ninja", "sha1"]) != 0:
        print(f"[{ver}] SHA1 FAIL", flush=True)
        return False
    print(f"[{ver}] SHA1 PASS", flush=True)
    return True


def run_tests(invariants: bool) -> bool:
    """pytest (a hard gate) + optional advisory invariants. Returns True iff
    pytest passed.

    pytest is scoped to our `tests/` suite: a bare run from ROOT also collects
    the vendored decomp-permuter tests under tools/_vendor/, which error on
    import and are not ours to gate on.

    check_match_invariants.py is ADVISORY only (opt in with --invariants) and
    never gates: on this project it is a no-baserom PR-comment check, the tree
    carries standing pre-existing drift (errors + thousands of orphan-extern
    warnings from the region-port headers), and none of it affects the
    byte-identical ROM — `ninja sha1` is the real gate.
    """
    tests_ok = run([PY, "-m", "pytest", "-q", "tests"]) == 0
    print("[pytest] " + ("OK" if tests_ok else "FAIL"), flush=True)
    if invariants and (ROOT / "tools" / "check_match_invariants.py").exists():
        rc = run([PY, "tools/check_match_invariants.py"])
        print(f"[invariants] advisory only, NOT a gate (exit {rc}) - the real "
              f"gate is ninja sha1", flush=True)
    return tests_ok


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Brain 3-region clean-tree `ninja sha1` gate driver."
    )
    ap.add_argument(
        "--scope", default="all",
        help="all (default: 3 regions + invariants + tests) | eur|usa|jpn (single "
             "region) | tests (invariants + pytest only, wine-free)",
    )
    ap.add_argument(
        "--clean", action="store_true",
        help="force `ninja -t clean` before each region (stale-.o masking guard; "
             "use when a change deletes or moves source, not for pure additions)",
    )
    ap.add_argument("--no-tests", action="store_true",
                    help="skip the pytest step")
    ap.add_argument("--invariants", action="store_true",
                    help="also run tools/check_match_invariants.py (ADVISORY only: "
                         "noisy, carries standing pre-existing drift, never gates)")
    args = ap.parse_args()

    if not (ROOT / "tools" / "configure.py").exists():
        print("gate3: tools/configure.py not found - run from the repo root.",
              file=sys.stderr)
        return 2

    scope = args.scope.lower()
    if scope == "tests":
        regions: list[str] = []
    elif scope in REGIONS:
        regions = [scope]
    elif scope == "all":
        regions = list(REGIONS)
    else:
        print(f"gate3: unknown --scope {args.scope!r} "
              f"(expected all|eur|usa|jpn|tests)", file=sys.stderr)
        return 2

    # Preflight (only when we're about to build): a duplicate delink makes
    # `dsd lcf` abort "overlaps with previous file" mid-build — catch it in
    # milliseconds and skip the wasted wine lane.
    if regions:
        print(f"\n{'=' * 20} preflight: dsd binary {'=' * 20}", flush=True)
        if not check_dsd_binary():
            print("\n==================== GATE FAIL ====================", flush=True)
            print("  ./dsd is missing or the wrong binary (see above) — not a "
                  "content divergence; restore dsd and re-run", flush=True)
            return 2
    if regions and (ROOT / "tools" / "check_delink_dupes.py").exists():
        print(f"\n{'=' * 20} preflight: delink dupes {'=' * 20}", flush=True)
        if run([PY, "tools/check_delink_dupes.py"]) != 0:
            print("\n==================== GATE FAIL ====================", flush=True)
            print("  duplicate delink (see above) - fix before gating", flush=True)
            return 1

    failed = [ver for ver in regions if not gate_region(ver, args.clean)]

    tests_ok = True
    if not args.no_tests and scope in ("all", "tests"):
        # The pytest step is documented as running against a known-good
        # tree, but the region loop above leaves `configure.py`'s state
        # pointing at whichever region ran LAST (usa/jpn for --scope all)
        # -- several toolchain-dependent tests hardcode region="eur" (the
        # project's own baseline region, CLAUDE.md) and silently produce
        # wrong-but-plausible results against a mismatched tree (iterate
        # instead of accept, a None match_percent) rather than a loud
        # config error, indistinguishable from a real regression until
        # traced back here (brief 620). Restore eur before tests, but
        # only when the loop actually left it in some other state.
        if regions and regions[-1] != "eur":
            print(f"\n{'=' * 20} restoring eur config for tests {'=' * 20}", flush=True)
            run([PY, "tools/configure.py", "eur"])
        tests_ok = run_tests(args.invariants)

    passed = not failed and tests_ok
    print(f"\n{'=' * 20} GATE {'PASS' if passed else 'FAIL'} {'=' * 20}", flush=True)
    if failed:
        print(f"  diverging region(s): {', '.join(failed)}", flush=True)
    if not tests_ok:
        print("  invariants/tests failed", flush=True)
    return 0 if passed else 1


if __name__ == "__main__":
    sys.exit(main())
