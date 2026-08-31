#!/usr/bin/env python3
"""
work_queue.py — the autonomous self-chaining work queue (2026-07-20).

Named `work_queue.py`, not `queue.py`: running any `python3.13 tools/X.py`
script puts `tools/` first on `sys.path`, so a file literally named
`queue.py` there shadows the stdlib `queue` module for every script in
this directory -- including transitively, for anything that imports
`requests` (which needs `queue.LifoQueue` via `urllib3`). Confirmed
live: `tools/download_tool.py` crashed with `AttributeError: module
'queue' has no attribute 'LifoQueue'` on a completely fresh worktree
the moment this file existed as `queue.py`, blocking `ninja`'s own
tool-download step for every lane, not just this one. Renamed before
this was in wide use; if you're tempted to rename it back, don't.

The recurring pain this tool solves: Codex/Luna agents finish fast because
the work is genuinely bounded, so the human has to re-dispatch every
~20 min. The fix is NOT longer tasks (padding) — it's decoupling
throughput from dispatch: a committed backlog per lane, and an agent
that pulls the next item, does it, and pulls the next, until the queue
is empty or it's blocked. The human sends ONE message; the agent stays
busy across many briefs for as long as there's tractable work.

Each lane has a markdown file `docs/queue/<lane>.md` whose items are sections:

    ### <id> — <title> [TODO]
    <self-contained task description>
    **Gate:** <the exact command that proves it done>

Status flows TODO -> CLAIMED -> DONE (or PARKED). The status lives in the header
so the file is human-readable and git-diffable. `next` is read-only by default;
pass `--claim` to flip the first TODO to CLAIMED and write the queue file.
Committing the queue file after each explicit transition makes the whole thing
crash-resumable — the agent's own progress log IS the state.

Usage:
    python3.13 tools/work_queue.py next   <lane>                 # print next TODO (read-only)
    python3.13 tools/work_queue.py next   <lane> --claim        # claim + print next TODO
    python3.13 tools/work_queue.py done   <lane> <id>            # mark DONE
    python3.13 tools/work_queue.py park   <lane> <id> "<reason>" # mark PARKED (+ reason)
    python3.13 tools/work_queue.py status <lane>                 # counts by status
    python3.13 tools/work_queue.py list   <lane>                 # ids + status + titles

Exit codes: 0 ok · 3 queue EMPTY (no TODO) on `next` · 2 usage/IO error.
Lanes are free-form, but the STANDING lanes are the roles `decomper` and
`scaffolder` -- never a provider name. File must exist.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
QDIR = ROOT / "docs" / "queue"
STATUSES = ("TODO", "CLAIMED", "DONE", "PARKED")
# The trailing lookahead anchors to end-of-line WITHOUT consuming the line
# terminator or the following blank line — a bare `\s*$` used to eat the CRLF +
# the blank line after the heading on every status transition, manufacturing an
# MD022 markdownlint failure (a required check). Lookahead => byte-perfect tail.
_HDR = re.compile(r"^###\s+(?P<id>\S+)\s+—\s+(?P<title>.*?)\s+\[(?P<status>\w+)\](?=[ \t]*(?:\r?\n|$))",
                  re.M)


# THE canonical worker roles. This tuple is the single source of truth for
# lane identity: a lane IS a role. The tool occupying a role is chosen
# externally and never appears in a lane name, a queue name or a branch name
# -- see AGENTS.md "Slugs are roles, not LLM providers". Adding a provider
# does NOT add a lane; only a project-motivated concurrency lane does, and
# that lane is still named for what it does, never for who runs it.
# tests/test_role_lane_neutrality.py enforces this against docs/queue/.
ROLES: tuple[str, ...] = ("decomper", "scaffolder")


def _qfile(lane: str) -> Path:
    return QDIR / f"{lane}.md"


def _read(lane: str) -> str:
    p = _qfile(lane)
    if not p.exists():
        try:
            shown = p.relative_to(ROOT)
        except ValueError:
            shown = p
        print(f"queue: no queue file {shown} — create it first", file=sys.stderr)
        raise SystemExit(2)
    return p.read_text(encoding="utf-8")


def _items(text: str) -> list[re.Match]:
    return list(_HDR.finditer(text))


# Any `### `-level heading is meant to be a queue item — this file's own
# convention has no other use for that heading level (verified: every
# `###` line in every docs/queue/*.md file already follows the `id —
# title [STATUS]` shape). Deliberately broader than `_HDR` itself: a
# heading missing its `[STATUS]` bracket entirely (or missing the em-dash
# separator, or using the wrong bracket placement) still starts with
# `### `, so it's still a "candidate" this catches -- it just won't also
# match `_HDR`, which is exactly the silent-invisibility bug this exists
# to catch. Third confirmed real occurrence of this bug in this lane
# (q-metric-extern-guard, brief 682's flagged-but-unqueued follow-ups,
# and once before that) -- `_items()`/`cmd_next` skip anything that
# doesn't match `_HDR` with NO error or warning, so a malformed heading
# is not merely mis-parsed, it's completely invisible to `next`/`status`/
# `list`, permanently, until someone happens to read the raw file.
_CANDIDATE_HDR = re.compile(r"^###[ \t]+\S.*$", re.M)


def find_malformed_headers(text: str) -> list[str]:
    """Return every `###`-level heading line in `text` that does NOT
    parse as a valid queue item -- either because it doesn't match
    `_HDR` at all (no `[STATUS]` bracket found in the required position,
    e.g. missing entirely or misplaced), or because the bracket it does
    have isn't one of the recognized `STATUSES`. Empty list = clean.

    Matches are correlated by START POSITION, not by matched text --
    `_HDR`'s match ends right after the closing `]` (its trailing-
    whitespace lookahead is zero-width, not consumed), while
    `_CANDIDATE_HDR`'s `.*$` swallows any trailing whitespace on the
    line, so comparing matched strings directly would false-positive on
    a well-formed heading that merely has trailing spaces. Both regexes
    anchor with `^` in MULTILINE mode, so two matches on the same
    logical line always share the same start position regardless of
    what either one consumes after that.
    """
    status_by_start: dict[int, str] = {
        m.start(): m.group("status") for m in _HDR.finditer(text)
    }

    bad: list[str] = []
    for cm in _CANDIDATE_HDR.finditer(text):
        status = status_by_start.get(cm.start())
        if status is None or status not in STATUSES:
            bad.append(cm.group(0))
    return bad


def _section(text: str, m: re.Match) -> str:
    """The full section body from this header to the next '### ' (or EOF)."""
    start = m.start()
    nxt = _HDR.search(text, m.end())
    return text[start:(nxt.start() if nxt else len(text))].rstrip()


def _set_status(text: str, m: re.Match, new: str) -> str:
    new_header = f"### {m.group('id')} — {m.group('title')} [{new}]"
    return text[:m.start()] + new_header + text[m.end():]


def cmd_next(lane: str, *, claim: bool = False) -> int:
    text = _read(lane)
    for m in _items(text):
        if m.group("status") == "TODO":
            body = _section(text, m)
            if claim:
                _qfile(lane).write_text(
                    _set_status(text, m, "CLAIMED"), encoding="utf-8"
                )
            print(body)
            return 0
    print("QUEUE-EMPTY: no TODO items left — ping the brain (queue exhausted).")
    return 3


def _transition(lane: str, item_id: str, new: str, note: str = "") -> int:
    text = _read(lane)
    for m in _items(text):
        if m.group("id") == item_id:
            out = _set_status(text, m, new)
            if note:
                # append the note under the (now-updated) header line
                m2 = next(x for x in _items(out) if x.group("id") == item_id)
                insert_at = out.find("\n", m2.end())
                insert_at = insert_at if insert_at != -1 else len(out)
                out = out[:insert_at] + f"\n> {new}: {note}" + out[insert_at:]
            _qfile(lane).write_text(out, encoding="utf-8")
            print(f"queue: {item_id} -> {new}")
            return 0
    print(f"queue: id {item_id!r} not found in {lane}", file=sys.stderr)
    return 2


def cmd_status(lane: str) -> int:
    from collections import Counter
    c = Counter(m.group("status") for m in _items(_read(lane)))
    print(f"{lane}: " + " · ".join(f"{s}={c.get(s, 0)}" for s in STATUSES))
    return 0


def cmd_list(lane: str) -> int:
    for m in _items(_read(lane)):
        print(f"  [{m.group('status'):7}] {m.group('id'):10} {m.group('title')}")
    return 0


def main(argv: list[str]) -> int:
    args = argv[1:]
    if len(args) < 2:
        # Find the "Usage:" paragraph by content, not position -- a
        # hardcoded index here silently breaks (prints the wrong
        # paragraph, not an error) the next time this docstring grows.
        usage = next(p for p in __doc__.strip().split("\n\n") if p.startswith("Usage:"))
        print(usage, file=sys.stderr)
        return 2
    cmd, lane, *rest = args
    try:
        if cmd == "next":
            claim = False
            if lane == "--claim" and rest:
                lane, *rest = rest
                claim = True
            elif rest == ["--claim"]:
                claim = True
            elif rest:
                print(f"queue: bad usage ({cmd!r})", file=sys.stderr)
                return 2
            return cmd_next(lane, claim=claim)
        if cmd == "status":
            return cmd_status(lane)
        if cmd == "list":
            return cmd_list(lane)
        if cmd == "done" and rest:
            return _transition(lane, rest[0], "DONE")
        if cmd == "park" and rest:
            return _transition(lane, rest[0], "PARKED", " ".join(rest[1:]))
    except SystemExit as e:
        return int(e.code or 0)
    print(f"queue: bad usage ({cmd!r})", file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv))
