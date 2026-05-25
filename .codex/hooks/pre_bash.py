#!/usr/bin/env python3

"""
pre_bash.py — Claude Code PreToolUse hook for Bash.

Intercepts Bash calls before they run. Currently guards one thing:
`git push`. If the agent is about to push, run
`tools/check_match_invariants.py --version eur` and block the push
if the check reports errors.

This is the Claude-Code-agent analogue of `.githooks/pre-push` from
PR #154. The git hook catches direct-shell pushes from a human
terminal; this hook catches Claude Code's Bash-tool pushes earlier
in the agent loop — useful because the agent sees the blocking
output and can fix the drift immediately instead of waiting for the
git-level rejection.

#135 was the motivating precedent: shipped `.s` but delinks.txt said
`.c`, CI caught it post-push, cost a round-trip rebase. This hook
catches the same class of drift pre-push.

Bypass for the one-off case: run the Bash with `SKIP_INVARIANTS_HOOK=1
git push ...` or remove the hook from `.claude/settings.json`.

Exit codes:
  0 = continue (pass-through for non-git-push Bash, or invariants clean)
  2 = block the tool call (PreToolUse semantics — invariants errored)
"""

from __future__ import annotations

import json
import os
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

# Match `git push` even with flags / env / redirection around it.
# Intentionally does NOT match `git push --no-verify` — if the user
# went out of their way to bypass hooks, don't second-guess them.
_GIT_PUSH_RE = re.compile(
    r"(^|\s|&&|;|\|)\s*git\s+push\b(?![^\n]*--no-verify)"
)


def _read_hook_input() -> dict:
    try:
        return json.load(sys.stdin)
    except (json.JSONDecodeError, ValueError):
        return {}


def _is_git_push(command: str) -> bool:
    return bool(_GIT_PUSH_RE.search(command or ""))


def _filter_invariants_output(text: str) -> str:
    """Strip the `complete_tu_rename` section from invariants
    output. That section is the ~317-line pre-existing backlog; it
    drowns the signal when the agent is only interested in ERRORS.
    Same filter pattern as `.githooks/pre-push` from PR #154."""
    out_lines: list[str] = []
    in_skip_section = False
    for line in text.splitlines():
        if line.startswith("== complete_tu_rename"):
            in_skip_section = True
            continue
        if line.startswith("== ") and in_skip_section:
            in_skip_section = False
        if not in_skip_section:
            out_lines.append(line)
    return "\n".join(out_lines)


def _run_invariants() -> tuple[int, str]:
    proc = subprocess.run(
        [
            sys.executable,
            "tools/check_match_invariants.py",
            "--version", "eur",
        ],
        cwd=str(ROOT),
        capture_output=True,
        text=True,
    )
    # Tool writes to stdout; combine anyway for safety.
    return proc.returncode, (proc.stdout or "") + (proc.stderr or "")


def main() -> int:
    if os.environ.get("SKIP_INVARIANTS_HOOK"):
        return 0

    data = _read_hook_input()
    tool = data.get("tool_name", "")
    if tool != "Bash":
        return 0
    command = data.get("tool_input", {}).get("command", "")
    if not _is_git_push(command):
        return 0

    rc, output = _run_invariants()
    # Exit code 2 = errors (warnings are 1, clean is 0). Only block
    # on errors — the 300+ placeholder warnings are expected.
    if rc == 2:
        filtered = _filter_invariants_output(output)
        print(
            "[pre-bash-hook] `git push` blocked — "
            "`check_match_invariants.py` reports ERRORS.\n"
            "Fix each and retry:\n",
            file=sys.stderr,
        )
        print(filtered, file=sys.stderr)
        print(
            "\nBypass once:\n"
            "  SKIP_INVARIANTS_HOOK=1 git push ...\n"
            "  # or: git push --no-verify",
            file=sys.stderr,
        )
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
