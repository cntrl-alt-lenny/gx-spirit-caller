#!/usr/bin/env python3

"""
post_edit.py — Claude Code PostToolUse hook for Edit/Write/MultiEdit.

Runs on every file edit the agent makes. Behaviour:

  1. If the edited path is a Python file under `tools/` or `tests/`,
     run `python -m ruff check <file>`. Ruff errors → print to
     stderr and exit 1 (non-blocking warning; agent sees it in the
     tool output and can fix before commit).

  2. Additionally, if the edited path is under `tools/` or `tests/`,
     run the full `python -m unittest discover -s tests` suite and
     surface any failures. Also non-blocking (exit 1).

  3. If the edited path is a game source file (`src/**/*.{c,cpp,s}`),
     run a non-blocking per-TU compile (`ninja build/<region>/<path>.o`,
     region auto-detected from the currently-configured build.ninja)
     and, on a clean compile, a single-unit `objdiff-cli` diff to
     report that function's match% — closing the in-loop feedback
     gap for the C-match lane (brief 566 / improvement-swarm r4 S1).
     Silent-skips (no build.ninja yet, wrong region configured for a
     region-specific source, missing toolchain) rather than erroring;
     this must never block or slow down an edit to a non-buildable
     tree. A hard subprocess timeout caps the worst case even though
     a single leaf `.o` normally compiles in ~1-3s.

Silent-pass on non-Python, non-game-source edits (Markdown docs, YAML
workflows, …) so the hook doesn't add latency where it can't help.

The goal is catching cases like:
  - F401 unused imports (I hit this twice in session: test_scratch_bundle,
    test_install_git_hooks)
  - F541 f-strings without placeholders (permute.py)
  - A new function breaks an unrelated test
  - A src/**/*.c edit that doesn't compile, or regresses a match% —
    previously invisible until the agent remembered to run
    `ninja` + `ninja objdiff` by hand

…before commit/push, not after CI's feedback loop.

Reads the hook input JSON from stdin (Claude Code's hook contract).
Exit codes:
  0 = success (edit was clean or nothing to check)
  1 = warning (ruff / tests / compile / match% found something the
      agent should see; non-blocking — the edit already happened)
"""

from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent
_TOOLS = ROOT / "tools"
sys.path.insert(0, str(_TOOLS))

from routing_suffixes import ROUTING_SUFFIXES  # noqa: E402

# The region marker appears in every per-TU build rule's variables
# block (`game_version = eur`); build.ninja is single-region at a
# time (each `configure.py <ver>` run overwrites the root
# build.ninja), so the first match tells us which region is active.
_REGION_RE = re.compile(r"game_version = (eur|usa|jpn)\b")
_GAME_SRC_SUFFIXES = (".c", ".cpp", ".s")

# Hard caps so a stuck compiler/objdiff invocation can't block the
# agent's edit loop indefinitely. A single leaf .o compile / one-unit
# diff normally finishes in ~1-3s; these are safety nets, not the
# expected runtime.
_COMPILE_TIMEOUT_S = 8
_OBJDIFF_TIMEOUT_S = 5


def _read_hook_input() -> dict:
    try:
        return json.load(sys.stdin)
    except (json.JSONDecodeError, ValueError):
        # No stdin or malformed — hook can't do anything useful. Pass.
        return {}


def _extract_edited_path(data: dict) -> str | None:
    """Pull `file_path` from the tool_input for Edit / Write /
    MultiEdit. Returns None on any other tool."""
    tool = data.get("tool_name", "")
    inp = data.get("tool_input", {})
    if tool in ("Edit", "Write", "MultiEdit"):
        path = inp.get("file_path")
        return path if isinstance(path, str) else None
    return None


def _relative_path(abs_or_rel: str) -> Path | None:
    """Return the path relative to ROOT, or None if it's outside
    the repo (tmp files, external scratches, etc.)."""
    p = Path(abs_or_rel)
    if not p.is_absolute():
        return p
    try:
        return p.relative_to(ROOT)
    except ValueError:
        return None


def _run_ruff(rel_path: Path) -> tuple[int, str]:
    """Returns (returncode, combined_stdout_stderr)."""
    proc = subprocess.run(
        [sys.executable, "-m", "ruff", "check", str(rel_path)],
        cwd=str(ROOT),
        capture_output=True,
        text=True,
    )
    return proc.returncode, (proc.stdout or "") + (proc.stderr or "")


def _run_unittests() -> tuple[int, str]:
    proc = subprocess.run(
        [sys.executable, "-m", "unittest", "discover", "-s", "tests"],
        cwd=str(ROOT),
        capture_output=True,
        text=True,
    )
    # Unittest writes its summary to stderr.
    return proc.returncode, (proc.stderr or "") + (proc.stdout or "")


# --------------------------------------------------------------------------- #
# C-match in-loop feedback (brief 566 / improvement-swarm r4 S1)
# --------------------------------------------------------------------------- #


def _detect_active_region() -> str | None:
    """Return the region ('eur'/'usa'/'jpn') the root build.ninja is
    currently configured for, or None if build.ninja doesn't exist or
    carries no recognisable region marker (never configured yet)."""
    ninja_file = ROOT / "build.ninja"
    if not ninja_file.is_file():
        return None
    try:
        content = ninja_file.read_text(encoding="utf-8", errors="ignore")
    except OSError:
        return None
    m = _REGION_RE.search(content)
    return m.group(1) if m else None


def _game_source_region(rel: Path) -> str | None:
    """If `rel` is under a region-specific `src/<region>/` tree,
    return that region; otherwise None (region-neutral EUR-baseline
    source under `src/<module>/`, which compiles under whichever
    region is currently active)."""
    parts = rel.parts
    if len(parts) >= 2 and parts[0] == "src" and parts[1] in ("eur", "usa", "jpn"):
        return parts[1]
    return None


def _unit_and_symbol(rel: Path) -> tuple[str, str]:
    """Derive the objdiff unit name and function symbol from a
    `src/**/*.{c,cpp,s}` path.

    unit: the path with only the file extension stripped (keeps a
      `.legacy`/`.legacy_sp3`/`.thumb` infix) in forward-slash form,
      matching delinks.txt's TU-header convention — e.g.
      'src/main/func_0208f850.legacy' for 'src/main/func_0208f850.legacy.c'.
    symbol: the function name — the filename stem with BOTH the file
      extension and any routing-tier infix stripped (brief 587: was
      `.legacy`/`.legacy_sp3`-only, silently leaving a stray `.thumb` on
      the symbol for every Thumb-tier edit — see routing_suffixes.py).
      Valid for both address-named (`func_X`) and already-renamed
      (`ModuleName_Verb`) files, since decomper convention keeps the
      filename in sync with the symbol name in both cases.
    """
    unit = rel.as_posix().rsplit(".", 1)[0]
    stem = rel.stem
    for suf in ROUTING_SUFFIXES:
        if stem.endswith(suf):
            stem = stem[: -len(suf)]
            break
    return unit, stem


def _objdiff_bin() -> Path | None:
    sys.path.insert(0, str(_TOOLS))
    try:
        from get_platform import get_platform  # noqa: E402
    except ImportError:
        return None
    plat = get_platform()
    exe = plat.exe if plat else ""
    return ROOT / f"objdiff-cli{exe}"


def _compile_tu(region: str, unit: str) -> tuple[bool, str]:
    """Run `ninja build/<region>/<unit>.o`. Returns (success, combined
    stdout+stderr) — never raises; a timeout or missing `ninja` on
    PATH is reported as a (False, message) pair like a real failure."""
    target = f"build/{region}/{unit}.o"
    try:
        proc = subprocess.run(
            ["ninja", target],
            cwd=str(ROOT),
            capture_output=True,
            text=True,
            timeout=_COMPILE_TIMEOUT_S,
        )
    except subprocess.TimeoutExpired:
        return False, f"ninja {target} timed out after {_COMPILE_TIMEOUT_S}s"
    except OSError as e:
        return False, f"couldn't invoke ninja: {e}"
    out = (proc.stdout or "") + (proc.stderr or "")
    return proc.returncode == 0, out


def _objdiff_match_percent(region: str, unit: str, symbol: str) -> float | None:
    """Run a single-unit objdiff-cli diff and return the match
    percentage, or None if objdiff-cli is missing / errors / the
    delinked target object doesn't exist yet.

    Deliberately uses direct two-file mode (`-1 <target.o> -2
    <base.o>`), NOT `-p .` project mode — project mode requires a
    pre-built `objdiff.json` (generated by the slow, whole-project
    `ninja objdiff` / `dsd objdiff --scratch`), which would blow the
    hook's latency budget by orders of magnitude. Direct file mode
    needs no project config and only touches the two .o files for
    this one unit.
    """
    objdiff = _objdiff_bin()
    if objdiff is None or not objdiff.is_file():
        return None
    target = ROOT / "build" / region / "delinks" / f"{unit}.o"
    base = ROOT / "build" / region / f"{unit}.o"
    if not target.is_file() or not base.is_file():
        return None
    try:
        proc = subprocess.run(
            [str(objdiff), "diff", "-1", str(target), "-2", str(base),
             symbol, "-o", "-", "--format", "json"],
            cwd=str(ROOT),
            capture_output=True,
            text=True,
            timeout=_OBJDIFF_TIMEOUT_S,
        )
    except (subprocess.TimeoutExpired, OSError):
        return None
    if proc.returncode != 0 or not proc.stdout.strip():
        return None
    try:
        data = json.loads(proc.stdout)
        return data["left"]["sections"][0]["match_percent"]
    except (json.JSONDecodeError, KeyError, IndexError, TypeError):
        return None


def _cmatch_feedback(rel: Path) -> str | None:
    """For a `src/**/*.{c,cpp,s}` edit, compile the single TU and (on
    a clean compile) run a single-unit objdiff, returning a one-line
    status string for stderr — or None if any precondition is missing
    (never blocks/errors the edit itself)."""
    if rel.suffix not in _GAME_SRC_SUFFIXES:
        return None
    if not rel.parts or rel.parts[0] != "src":
        return None

    region = _detect_active_region()
    if region is None:
        return None  # never configured — nothing to gate against
    src_region = _game_source_region(rel)
    if src_region is not None and src_region != region:
        # e.g. editing src/usa/... while build.ninja is EUR-configured.
        return None

    unit, symbol = _unit_and_symbol(rel)
    ok, out = _compile_tu(region, unit)
    if not ok:
        tail = out[-1500:] if len(out) > 1500 else out
        return (
            f"[post-edit-hook] {region} compile FAILED for {rel}:\n"
            f"{tail.rstrip()}"
        )

    pct = _objdiff_match_percent(region, unit, symbol)
    if pct is None:
        return (
            f"[post-edit-hook] {region} compile OK for {rel} "
            f"(match%: unavailable)"
        )
    return f"[post-edit-hook] {region} compile OK, {symbol} match: {pct:.2f}%"


def main() -> int:
    data = _read_hook_input()
    edited = _extract_edited_path(data)
    if edited is None:
        return 0
    rel = _relative_path(edited)
    if rel is None:
        return 0

    issues: list[str] = []

    if rel.suffix == ".py":
        parts = rel.parts
        if parts and parts[0] in ("tools", "tests"):
            rc, out = _run_ruff(rel)
            if rc != 0:
                issues.append(
                    f"[post-edit-hook] ruff check {rel}:\n{out.rstrip()}"
                )

            # Tests: only run when tools/ or tests/ changed (already
            # filtered above, kept explicit). Skip if ruff already
            # flagged — running a broken file through unittest wastes
            # the cycles.
            if rc == 0:
                rc_t, out_t = _run_unittests()
                if rc_t != 0:
                    # Keep the output to the last ~2k chars so the
                    # agent sees the failing test name + traceback.
                    tail = out_t[-2000:] if len(out_t) > 2000 else out_t
                    issues.append(
                        f"[post-edit-hook] unittest discover failed "
                        f"after editing {rel}:\n{tail.rstrip()}"
                    )
    elif rel.suffix in _GAME_SRC_SUFFIXES:
        feedback = _cmatch_feedback(rel)
        if feedback:
            issues.append(feedback)

    if issues:
        print("\n\n".join(issues), file=sys.stderr)
        return 1  # Non-blocking warning.
    return 0


if __name__ == "__main__":
    sys.exit(main())
