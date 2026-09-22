#!/usr/bin/env python3
"""Mirror a session's final reply to the shared, provider-neutral inbox.

A CONVENIENCE, NOT A CONTROL, and not a second source of truth either. Every
filesystem-capable Worker and Verifier already writes its own completion
report by calling ``tools/report.py`` directly, as part of its contract — see
``framework/reports.md``. This hook exists so that also happens automatically
on this one tool, without the model needing to choose to run the command. It
does the one thing only this tool can do — read a Claude Code transcript — and
then hands off to the exact same writer every other path uses:
``tools/report.py``'s ``write_report``. The inbox location, the role tag, the
atomic write, and the provenance header are that module's job, not this file's;
duplicating them here is exactly the drift ``adapters.md`` warns a restated
policy eventually produces.

Read this part before relying on anything it writes:

  * It fires only for sessions run on this one tool. A round run on any other
    tool writes nothing here, and that is normal.
  * Therefore **a missing or stale file means UNKNOWN** — never "the task did
    not happen", "the agent failed", or "the review did not run". The
    fallbacks, in order, are: check the shared inbox this file writes into
    (also written to directly by any role on any tool that followed its
    contract); the owner pastes the report; inspect repository and pull
    request state directly; and where that genuinely cannot answer, ask the
    owner. Repository state can confirm that execution happened, because
    execution leaves a branch and a diff. It cannot confirm that a review
    happened, because a review leaves only a report.
  * Check the timestamp before trusting a file that is there.

This hook cannot know which brief a session was working from — a Stop event
carries a session id, not a task identifier, and only the agent following its
own contract knows the brief. The report this hook writes is therefore tagged
with the session id, not a brief id, which is honest about what this path
actually knows rather than guessing. A role that writes its own report via its
contract supplies the real task identifier; this hook is the fallback for
sessions that end without having done that — and only the fallback: if the
checkout already holds a report at the CURRENT head that the agent wrote
itself (any source other than this hook's own), this hook leaves it alone
rather than overwriting the real brief identifier with a session-id mirror.
See ``_agent_already_reported_this_work`` below for exactly what "current"
and "itself" mean, including the stale-report case that must still be
captured.

Requirements: python and git — reached through ``run_python.sh``'s
wrapper, which tries the Python 3 this host actually has rather than one
hardcoded name — and ``tools/report.py`` at the project root, installed by
`adopt.py` for every project regardless of which adapter, if any, is also
installed. Non-blocking by design — any error exits 0, since a session must
never fail to end because of this, including the case where ``tools/report.py``
is missing from an older adopted tree that has not re-run adoption.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

_PROJECT_ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(_PROJECT_ROOT / "tools"))
try:
    import report as _report
except ImportError:
    _report = None


def _last_assistant_text(transcript_path: Path) -> str | None:
    """Final assistant turn from a JSONL transcript, or None."""
    try:
        lines = transcript_path.read_text(encoding="utf-8").splitlines()
    except (OSError, UnicodeDecodeError):
        return None

    last = None
    for line in lines:
        try:
            entry = json.loads(line)
        except json.JSONDecodeError:
            continue
        role = entry.get("role") or entry.get("message", {}).get("role")
        if role == "assistant":
            last = entry
    if last is None:
        return None

    content = last.get("content") or last.get("message", {}).get("content")
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
    return "\n".join(parts).strip() or None


#: Tags a report this hook itself wrote, as opposed to one the agent wrote by
#: following its own contract (`tools/report.py write`, called directly --
#: source defaults to "cli" there). Only that distinction, not mere presence
#: of a report, decides whether this hook may overwrite it; see
#: `_agent_already_reported_this_work` below.
_HOOK_SOURCE = "claude-code-stop-hook"


def _agent_already_reported_this_work() -> bool:
    """True when this checkout already holds a report for its CURRENT work
    that the agent wrote itself, which this hook must never replace.

    "For its current work" means the report's ``head=`` matches this
    checkout's HEAD right now. A report from an EARLIER head -- the agent
    finished a prior task, moved on, and has not written one for the new
    HEAD yet -- is stale for this work and this hook must still capture
    something, exactly as if no report existed at all; that is what actually
    happened in the reported incident's mirror image (a session that ends
    with no self-written report must not stay silent forever because an old
    one is lying around). A report this same hook wrote earlier in the
    session (``source`` tagged `_HOOK_SOURCE`) is only ever this hook's own
    prior mirror, never the agent's real report, so it is fine to overwrite
    even when fresh.

    Never raises: this hook must never fail to end over its own check, and an
    unreadable checkout here is exactly the ordinary "no report yet" case --
    fall through to the fallback capture, same as `write_report` failing
    later would.
    """
    try:
        current_head = _report.head_sha()
        existing = _report.latest_report_provenance()
    except _report.ReportError:
        return False
    if existing is None or current_head is None or existing.head is None:
        return False
    return existing.head == current_head and existing.source != _HOOK_SOURCE


def main() -> int:
    if _report is None:
        return 0

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

    if _agent_already_reported_this_work():
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

    session_id = event.get("session_id", "")
    task = f"claude-code-session:{session_id}" if session_id else "unspecified"

    try:
        _report.write_report(text, task=task, source=_HOOK_SOURCE)
    except _report.ReportError:
        return 0

    return 0


if __name__ == "__main__":
    sys.exit(main())
