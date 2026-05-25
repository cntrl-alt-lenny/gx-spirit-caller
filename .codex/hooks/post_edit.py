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

Silent-pass on non-Python edits (Markdown docs, YAML workflows, …)
so the hook doesn't add latency where it can't help.

The goal is catching cases like:
  - F401 unused imports (I hit this twice in session: test_scratch_bundle,
    test_install_git_hooks)
  - F541 f-strings without placeholders (permute.py)
  - A new function breaks an unrelated test

…before commit/push, not after CI's feedback loop.

Reads the hook input JSON from stdin (Claude Code's hook contract).
Exit codes:
  0 = success (edit was clean or nothing to check)
  1 = warning (ruff / tests found issues; agent should fix)
"""

from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent


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


def main() -> int:
    data = _read_hook_input()
    edited = _extract_edited_path(data)
    if edited is None:
        return 0
    rel = _relative_path(edited)
    if rel is None:
        return 0
    # Only lint Python files.
    if rel.suffix != ".py":
        return 0
    # Only care about project-local sources.
    parts = rel.parts
    if not parts or parts[0] not in ("tools", "tests"):
        return 0

    issues: list[str] = []

    rc, out = _run_ruff(rel)
    if rc != 0:
        issues.append(
            f"[post-edit-hook] ruff check {rel}:\n{out.rstrip()}"
        )

    # Tests: only run when tools/ or tests/ changed (already filtered
    # above, kept explicit). Skip if ruff already flagged — running a
    # broken file through unittest wastes the cycles.
    if rc == 0:
        rc_t, out_t = _run_unittests()
        if rc_t != 0:
            # Keep the output to the last ~2k chars so the agent
            # sees the failing test name + traceback.
            tail = out_t[-2000:] if len(out_t) > 2000 else out_t
            issues.append(
                f"[post-edit-hook] unittest discover failed "
                f"after editing {rel}:\n{tail.rstrip()}"
            )

    if issues:
        print("\n\n".join(issues), file=sys.stderr)
        return 1  # Non-blocking warning.
    return 0


if __name__ == "__main__":
    sys.exit(main())
