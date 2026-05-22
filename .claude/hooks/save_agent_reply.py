#!/usr/bin/env python3

"""save_agent_reply.py — Claude Code Stop hook.

Captures the final assistant turn of an agent's Claude Code session and
writes it to a shared inbox so the *brain* worktree can read what the
*decomper* / *scaffolder* worktrees said without the human user
shuttling text manually.

# Why this exists

The brain's job is to coordinate across the three agents (brain,
decomper, scaffolder), each running in its own Claude Code session in
its own git worktree. When an agent finishes a session that does NOT
ship a PR (e.g. blocked on a non-scope dependency, research-only,
aborted), the brain has no native way to see what the agent said —
the user has historically copy-pasted the reply to a `.txt` file and
fed the path to the brain.

This hook closes that gap: every time an agent session ends, the last
assistant turn is appended to `<shared-git-dir>/agent-inbox/<role>-
latest.md`. The brain reads from there directly.

# Why these path choices

- **`git rev-parse --git-common-dir`** gives the repo's shared `.git/`
  path — same value from every worktree of the same clone. Works no
  matter where the user cloned the repo (`~/Dev/...`, `D:\projects\...`,
  etc.). Sibling-of-`.git/` would also work but require slightly more
  path arithmetic.

- **`<git-common-dir>/agent-inbox/`** — inside `.git/`, which git
  treats as private and never version-controls. No `.gitignore` entry
  needed. The directory survives `git clean -fdx` and gets removed
  cleanly with `rm -rf .git/` (i.e. when the user nukes the clone).

- **`git rev-parse --show-toplevel`** gives the *current* worktree's
  root. The basename of that path matches the agent slug by the
  project convention (`~/Dev/spirit-caller/{brain,decomper,
  scaffolder}`). If the user renames a worktree, the role tag adapts
  automatically.

# Portability

Tracked in git (`tools/`-style location under `.claude/hooks/` to
match the project's existing hook layout), so a fresh `git clone` on
any machine picks the script up automatically. The only runtime
requirements are `python3` and `git`, both of which the project
already requires per CLAUDE.md.

# Hook event input

Claude Code passes a JSON event on stdin to Stop hooks. We only need
`transcript_path`; everything else can be derived from the
filesystem + git. If the event lacks a transcript path (older Claude
Code, manual `echo {} | python ...` invocation, test harness), the
hook exits silently with code 0 — Stop hooks should never block a
session from ending.
"""

from __future__ import annotations

import json
import subprocess
import sys
from datetime import datetime
from pathlib import Path


def _git(args: list[str]) -> str | None:
    """Run a git command, return stdout stripped, or None on failure."""
    try:
        return subprocess.check_output(
            ["git", *args],
            stderr=subprocess.DEVNULL,
            text=True,
        ).strip()
    except (subprocess.CalledProcessError, FileNotFoundError):
        return None


def _last_assistant_text(transcript_path: Path) -> str | None:
    """Extract the final assistant turn's plain-text content from a
    JSONL transcript. Returns None if no assistant turn is found or
    the file is unreadable.
    """
    try:
        lines = transcript_path.read_text(encoding="utf-8").splitlines()
    except (OSError, UnicodeDecodeError):
        return None

    last_assistant = None
    for line in lines:
        try:
            entry = json.loads(line)
        except json.JSONDecodeError:
            continue
        # Transcript entries vary in shape between Claude Code versions.
        # Look for the canonical assistant-turn marker.
        role = entry.get("role") or entry.get("message", {}).get("role")
        if role == "assistant":
            last_assistant = entry

    if last_assistant is None:
        return None

    # Content can be a string or a list of {type, text} blocks.
    content = last_assistant.get("content") or (
        last_assistant.get("message", {}).get("content")
    )
    if isinstance(content, str):
        return content.strip() or None
    if not isinstance(content, list):
        return None

    parts: list[str] = []
    for block in content:
        if isinstance(block, str):
            parts.append(block)
        elif isinstance(block, dict) and block.get("type") == "text":
            text = block.get("text")
            if isinstance(text, str):
                parts.append(text)
    out = "\n".join(parts).strip()
    return out or None


def _seed_readme(inbox: Path) -> None:
    """Drop a README on first creation so future readers (human or
    LLM) understand what these files are.
    """
    readme = inbox / "README.md"
    if readme.exists():
        return
    readme.write_text(
        "# .git/agent-inbox/\n\n"
        "Auto-populated by `.claude/hooks/save_agent_reply.py` (a Stop\n"
        "hook). Each file `<role>-latest.md` holds the final assistant\n"
        "turn of the most recent Claude Code session that ran in the\n"
        "matching worktree (`brain`, `decomper`, `scaffolder`).\n\n"
        "The brain reads these to see what the other agents said\n"
        "without the human user shuttling text manually. Files are\n"
        "overwritten on each session end — treat them as a rolling\n"
        "snapshot, not an archive.\n\n"
        "**Not under version control** (lives inside `.git/`, which\n"
        "git treats as private). Wipes cleanly with `rm -rf .git/` or\n"
        "with a `git clone` to a fresh path.\n",
        encoding="utf-8",
    )


def main() -> int:
    # Read the Stop hook event from stdin. Bail silently if nothing.
    try:
        raw = sys.stdin.read()
    except (OSError, KeyboardInterrupt):
        return 0
    if not raw.strip():
        return 0
    try:
        event = json.loads(raw)
    except json.JSONDecodeError:
        return 0

    transcript = event.get("transcript_path")
    if not transcript:
        return 0
    transcript_path = Path(transcript)
    if not transcript_path.exists():
        return 0

    text = _last_assistant_text(transcript_path)
    if not text:
        return 0

    # Find shared inbox (works from any worktree of this repo).
    common_dir = _git(["rev-parse", "--git-common-dir"])
    if not common_dir:
        return 0
    common = Path(common_dir)
    if not common.is_absolute():
        # `--git-common-dir` returns a relative path inside the worktree
        # when the worktree IS the main checkout. Resolve against cwd.
        common = (Path.cwd() / common).resolve()
    inbox = common / "agent-inbox"
    inbox.mkdir(parents=True, exist_ok=True)
    _seed_readme(inbox)

    # Infer role from worktree basename.
    worktree_root = _git(["rev-parse", "--show-toplevel"])
    role = Path(worktree_root).name if worktree_root else "unknown"
    # Sanitise — basename should already be one of brain/decomper/
    # scaffolder, but defend against odd characters anyway.
    role = "".join(c for c in role if c.isalnum() or c in "-_") or "unknown"

    session_id = event.get("session_id", "")
    ts = datetime.now().isoformat(timespec="seconds")
    header = (
        f"<!-- captured {ts} from worktree role={role}"
        f"{f' session={session_id}' if session_id else ''} -->\n\n"
    )

    out = inbox / f"{role}-latest.md"
    try:
        out.write_text(header + text + "\n", encoding="utf-8")
    except OSError:
        # Disk full / permission denied / etc. — Stop hooks must not
        # block session end, so swallow the error.
        return 0

    # Also append to an audit log so prior replies aren't lost on the
    # next session end. Lightweight — one file, append-only.
    log = inbox / f"{role}-log.md"
    try:
        with log.open("a", encoding="utf-8") as f:
            f.write(f"\n\n---\n\n{header}{text}\n")
    except OSError:
        pass
    return 0


if __name__ == "__main__":
    sys.exit(main())
