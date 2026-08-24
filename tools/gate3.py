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
    generated-output clean when a change *deletes or moves* source (the
    masking class), not merely adds it (the drain's pure-addition waves are
    safe without it). Downloaded tool binaries are preserved.

  * A synthesized "PASS" that hides the real evidence. gate3 NEVER prints a
    PASS it didn't read: it streams each region's real configure + sha1 output
    live, so its stdout IS the paste-able proof AGENTS.md's integrity controls
    require. It reports PASS/FAIL off the actual process exit status, never a
    hand-typed verdict.

Per-region sequence (the canonical CLAUDE.md re-verify command):
    python3.13 tools/configure.py <ver>
    rm -f objdiff.json gx-spirit-caller_<ver>.nds
    [--clean: clean generated outputs; preserve downloaded tools]
    ninja sha1

Then once: `pytest -q tests` (a hard gate). `--invariants`
additionally runs tools/check_match_invariants.py as an ADVISORY report (it
never gates — see run_tests).

Usage:
    python tools/gate3.py                # full 3-region gate + invariants + tests
    python tools/gate3.py --scope eur     # one region (fast smoke)
    python tools/gate3.py --scope tests    # invariants + pytest only (wine-free)
    python tools/gate3.py --clean          # force a full rebuild each region

Exit codes:
    0   every requested region byte-identical (+ invariants/tests green)
    1   a region diverged, or invariants/tests failed (message names which)
    2   infrastructure error or vacuous invocation (wrong cwd, missing
        configure.py, `--scope tests --no-tests`, ...)
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PY = sys.executable  # the python3.13 running this script
REGIONS = ["eur", "usa", "jpn"]
DSD_MARKER = "0.11"  # the pinned dsd tag (configure.DSD_VERSION = v0.11.0)
TOOLCHAIN_RULE = "download_tool"
TOOLCHAIN_MARKERS = (
    "mwccarm.exe",
    "mwldarm.exe",
    "mwasmarm.exe",
    "wibo",
    "download_tool.py",
    "permissionerror",
    "permission denied",
    "access is denied",
    "requests.exceptions.",
    "zipfile.badzipfile",
)
STATE_PATH = ROOT / "build" / "gate3-state.json"


@dataclass(frozen=True)
class CommandResult:
    """The observable result of one gate subprocess."""

    returncode: int
    output: str = ""
    infrastructure: bool = False


@dataclass(frozen=True)
class RegionResult:
    ok: bool
    infrastructure: bool = False
    pass_line: str = ""


def current_commit_sha() -> str | None:
    """Return HEAD, or None when git cannot identify this checkout."""
    try:
        result = subprocess.run(
            ["git", "rev-parse", "HEAD"], cwd=ROOT,
            capture_output=True, text=True, check=False,
        )
    except OSError:
        return None
    sha = result.stdout.strip()
    return sha if result.returncode == 0 and sha else None


def worktree_clean() -> bool:
    """Resume only from a checkout with no tracked or untracked changes."""
    try:
        result = subprocess.run(
            ["git", "status", "--porcelain"], cwd=ROOT,
            capture_output=True, text=True, check=False,
        )
    except OSError:
        return False
    return result.returncode == 0 and not result.stdout.strip()


def load_gate_state() -> dict[str, object] | None:
    """Load a valid resume record; malformed or missing state fails closed."""
    try:
        state = json.loads(STATE_PATH.read_text(encoding="utf-8"))
    except (FileNotFoundError, OSError, json.JSONDecodeError):
        return None
    if not isinstance(state, dict) or not isinstance(state.get("sha"), str):
        return None
    regions = state.get("regions")
    if not isinstance(regions, dict):
        return None
    return state


def save_gate_state(sha: str, region: str, pass_line: str) -> None:
    """Record one observed region pass as a gitignored build artifact."""
    state = load_gate_state()
    if state is None or state.get("sha") != sha:
        state = {"sha": sha, "regions": {}}
    regions = state["regions"]
    assert isinstance(regions, dict)
    regions[region] = {"sha": sha, "pass": pass_line}
    STATE_PATH.parent.mkdir(parents=True, exist_ok=True)
    STATE_PATH.write_text(json.dumps(state, indent=2) + "\n", encoding="utf-8")


def resume_regions(sha: str | None, *, clean: bool) -> dict[str, str]:
    """Return only same-HEAD, clean-tree, non-cleaned region records."""
    if sha is None:
        print("gate3: resume disabled — HEAD could not be identified; re-running all regions")
        return {}
    if not worktree_clean():
        print("gate3: resume disabled — working tree is dirty; re-running all regions")
        return {}
    state = load_gate_state()
    if clean:
        print("gate3: --clean invalidates saved region results; re-running all regions")
        try:
            STATE_PATH.unlink()
        except FileNotFoundError:
            pass
        return {}
    if state is None or state.get("sha") != sha:
        print("gate3: resume disabled — state missing or from another commit; re-running all regions")
        return {}
    regions = state.get("regions", {})
    assert isinstance(regions, dict)
    valid: dict[str, str] = {}
    for region, record in regions.items():
        if isinstance(region, str) and isinstance(record, dict):
            if record.get("sha") == sha and isinstance(record.get("pass"), str):
                valid[region] = record["pass"]
    return valid


def is_infrastructure_failure(cmd: list[str], output: str, returncode: int) -> bool:
    """Classify toolchain/download failures without hiding SHA-1 divergence.

    Compiler, linker, assembler, downloader, and locked-file errors mean the
    build never reached a valid ROM comparison. The SHA-1 script's ordinary
    ``FAILED`` report contains none of these markers and remains a content
    failure.
    """
    del cmd  # The output carries the tool invocation and its diagnostic.
    if returncode == 0:
        return False
    lowered = output.lower()
    return any(marker in lowered for marker in TOOLCHAIN_MARKERS)


def check_dsd_binary() -> bool:
    """Fail loud if ./dsd isn't the real dsd. Incident 2026-07-19: ./dsd got
    clobbered byte-for-byte with objdiff-cli, so `dsd rom extract` errored
    ("Unrecognized argument: rom") and the whole 3-region gate FAILED on a
    build error that looked exactly like a content divergence — a full gate
    cycle wasted before the wrong binary was spotted. This catches it in ms."""
    # Windows ships the binary as dsd.exe. Path.exists() on the extensionless
    # name is False there even though CreateProcess resolves `dsd` -> `dsd.exe`
    # at exec time, so probing only "dsd" made every Windows worktree fail this
    # preflight in ~0s with a message that reads like a content divergence,
    # while the build itself ran dsd perfectly happily.
    dsd = next((c for c in (ROOT / "dsd", ROOT / "dsd.exe") if c.exists()), None)
    if dsd is None:
        print("gate3: ./dsd (or ./dsd.exe) missing — run `python3.13 "
              "tools/download_tool.py dsd v0.11.0 --path ./dsd`", file=sys.stderr)
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


def run(cmd: list[str]) -> CommandResult:
    """Run from ROOT, stream output live, and retain it for attribution."""
    print(f"\n$ {' '.join(cmd)}", flush=True)
    try:
        proc = subprocess.Popen(
            cmd, cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
            text=True, encoding="utf-8", errors="replace", bufsize=1,
        )
    except OSError as exc:
        output = f"{type(exc).__name__}: {exc}"
        print(output, flush=True)
        return CommandResult(1, output, True)
    lines: list[str] = []
    assert proc.stdout is not None
    for line in proc.stdout:
        print(line, end="", flush=True)
        lines.append(line)
    returncode = proc.wait()
    output = "".join(lines)
    return CommandResult(
        returncode, output, is_infrastructure_failure(cmd, output, returncode)
    )


def clean_non_toolchain_outputs() -> CommandResult:
    """Clean generated outputs while preserving downloaded tool binaries.

    `ninja -t clean` without rule selection also removes outputs of the
    `download_tool` rule, forcing every `--clean` gate to re-download the
    compiler bundle and creating avoidable locked-file races between
    worktrees. Clean every current generated-output rule except the
    downloader so newly added output rules remain covered automatically.
    """
    rules_result = run(["ninja", "-t", "rules"])
    if rules_result.returncode != 0:
        return rules_result
    rules = sorted({
        line.strip() for line in rules_result.output.splitlines()
        if line.strip() and not line.startswith("$")
        and line.strip() != TOOLCHAIN_RULE
    })
    if not rules:
        return CommandResult(1, "ninja reported no generated-output rules", True)
    return run(["ninja", "-t", "clean", "-r", *rules])


def gate_region(ver: str, clean: bool) -> RegionResult:
    print(f"\n{'=' * 20} {ver} {'=' * 20}", flush=True)
    configured = run([PY, "tools/configure.py", ver])
    if configured.returncode != 0:
        if configured.infrastructure:
            print(f"[{ver}] INFRASTRUCTURE ERROR", flush=True)
            return RegionResult(False, True)
        print(f"[{ver}] CONFIGURE-FAIL", flush=True)
        return RegionResult(False)
    # Clean-tree: always remove the built ROM so `ninja sha1` relinks from
    # current inputs (never trusts a lingering .nds); --clean also wipes the
    # object tree to defeat stale-.o masking on delete/move changes.
    for stale in ("objdiff.json", f"gx-spirit-caller_{ver}.nds"):
        try:
            (ROOT / stale).unlink()
        except FileNotFoundError:
            pass
    if clean:
        cleaned = clean_non_toolchain_outputs()
        if cleaned.returncode != 0:
            if cleaned.infrastructure:
                print(f"[{ver}] INFRASTRUCTURE ERROR", flush=True)
                return RegionResult(False, True)
            print(f"[{ver}] CLEAN-FAIL", flush=True)
            return RegionResult(False)
    checked = run(["ninja", "sha1"])
    if checked.returncode != 0:
        if checked.infrastructure:
            print(f"[{ver}] INFRASTRUCTURE ERROR", flush=True)
            return RegionResult(False, True)
        print(f"[{ver}] SHA1 FAIL", flush=True)
        return RegionResult(False)
    pass_line = f"[{ver}] SHA1 PASS"
    print(pass_line, flush=True)
    return RegionResult(True, pass_line=pass_line)


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
    tests_ok = run([PY, "-m", "pytest", "-q", "tests"]).returncode == 0
    print("[pytest] " + ("OK" if tests_ok else "FAIL"), flush=True)
    if invariants and (ROOT / "tools" / "check_match_invariants.py").exists():
        rc = run([PY, "tools/check_match_invariants.py"]).returncode
        print(f"[invariants] advisory only, NOT a gate (exit {rc}) - the real "
              f"gate is ninja sha1", flush=True)
    return tests_ok


def verdict(*, failed: list[str], checks_run: int, tests_ok: bool,
            infrastructure: bool = False) -> tuple[str, int]:
    """Return the gate label and exit code from observable checks.

    A zero-check invocation is not a successful gate: it is a caller error
    that must be surfaced distinctly from a real build or test failure.
    """
    if checks_run == 0:
        return "VACUOUS", 2
    if infrastructure:
        return "INFRASTRUCTURE", 2
    if failed or not tests_ok:
        return "FAIL", 1
    return "PASS", 0


def main(argv: list[str] | None = None) -> int:
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
        help="clean generated outputs before each region (preserves downloaded "
             "tools; use when a change deletes or moves source, not for pure additions)",
    )
    ap.add_argument("--no-tests", action="store_true",
                    help="skip the pytest step")
    ap.add_argument("--invariants", action="store_true",
                    help="also run tools/check_match_invariants.py (ADVISORY only: "
                         "noisy, carries standing pre-existing drift, never gates)")
    args = ap.parse_args(argv)

    if args.scope.lower() == "tests" and args.no_tests:
        ap.error(
            "GATE VACUOUS: --scope tests --no-tests would execute zero checks"
        )

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
        dupes = run([PY, "tools/check_delink_dupes.py"])
        if dupes.returncode != 0:
            print("\n==================== GATE FAIL ====================", flush=True)
            print("  duplicate delink (see above) - fix before gating", flush=True)
            return 2 if dupes.infrastructure else 1
    if regions and (ROOT / "tools" / "fix_delink_suffixes.py").exists():
        print(f"\n{'=' * 20} preflight: delink suffixes {'=' * 20}", flush=True)
        suffixes = run([PY, "tools/fix_delink_suffixes.py"])
        if suffixes.returncode != 0:
            print("\n==================== GATE FAIL ====================", flush=True)
            print("  routed delink header mismatch (see above) - run "
                  "`python tools/fix_delink_suffixes.py --fix`", flush=True)
            return 2 if suffixes.infrastructure else 1

    if scope == "all":
        saved = resume_regions(current_commit_sha(), clean=args.clean)
        region_results: list[RegionResult] = []
        for ver in regions:
            if ver in saved:
                print(f"[{ver}] SKIP — already verified at this commit: {saved[ver]}", flush=True)
                region_results.append(RegionResult(True, pass_line=saved[ver]))
                continue
            result = gate_region(ver, args.clean)
            region_results.append(result)
            if result.ok and result.pass_line and worktree_clean():
                sha = current_commit_sha()
                if sha is not None:
                    save_gate_state(sha, ver, result.pass_line)
    else:
        region_results = [gate_region(ver, args.clean) for ver in regions]
    failed = [ver for ver, result in zip(regions, region_results, strict=True)
              if not result.ok]
    infrastructure = any(result.infrastructure for result in region_results)

    tests_ok = True
    tests_ran = False
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
        tests_ran = True
        tests_ok = run_tests(args.invariants)

    label, exit_code = verdict(
        failed=failed,
        checks_run=len(regions) + int(tests_ran),
        tests_ok=tests_ok,
        infrastructure=infrastructure,
    )
    print(f"\n{'=' * 20} GATE {label} {'=' * 20}", flush=True)
    if failed and infrastructure:
        print(f"  infrastructure error in: {', '.join(failed)}", flush=True)
    elif failed:
        print(f"  diverging region(s): {', '.join(failed)}", flush=True)
    if not tests_ok:
        print("  invariants/tests failed", flush=True)
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
