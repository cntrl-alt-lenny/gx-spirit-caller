"""Tests for tools/lane_report.py.

These build synthetic provider stores in temp directories. They must NOT read
the developer's real `~/.codex` or `~/.claude`, because CI has neither — the
tool's value is that it degrades to a clean UNKNOWN when a store is absent, and
that property has to be tested on a machine where the stores really are absent.
"""

from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from datetime import datetime, UTC
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from lane_report import (  # noqa: E402
    _role_markers,
    read_inbox,
    recover,
    repo_scope,
    scan_claude,
    scan_codex,
)


def _git(repo: Path, *args: str) -> None:
    subprocess.run(["git", "-C", str(repo), *args], check=True, capture_output=True)


def _make_repo(base: Path) -> Path:
    repo = base / "repo"
    repo.mkdir()
    _git(repo, "init", "-q")
    _git(repo, "config", "user.email", "t@example.com")
    _git(repo, "config", "user.name", "T")
    (repo / "f").write_text("x\n", encoding="utf-8")
    _git(repo, "add", "f")
    _git(repo, "commit", "-qm", "base")
    return repo


def _codex_session(root: Path, name: str, cwd: str, turns: list[tuple[str, str]],
                   final: str, ended: str = "2026-09-01T09:52:48.962Z") -> Path:
    """Write a rollout file shaped like Codex's real on-disk format."""
    root.mkdir(parents=True, exist_ok=True)
    path = root / f"rollout-{name}.jsonl"
    records = [{
        "timestamp": "2026-09-01T09:17:42.867Z",
        "type": "session_meta",
        "payload": {"session_id": name, "cwd": cwd,
                    "timestamp": "2026-09-01T09:17:42.867Z"},
    }]
    for role, text in turns:
        records.append({
            "timestamp": "2026-09-01T09:20:00.000Z",
            "type": "response_item",
            "payload": {"type": "message", "role": role,
                        "content": [{"type": "text", "text": text}]},
        })
    records.append({
        "timestamp": ended,
        "type": "event_msg",
        "payload": {"type": "task_complete", "last_agent_message": final},
    })
    path.write_text("\n".join(json.dumps(r) for r in records), encoding="utf-8")
    return path


def _claude_session(root: Path, cwd: str, session_id: str,
                    turns: list[tuple[str, str]]) -> Path:
    slug = str(cwd).replace("/", "-")
    project = root / slug
    project.mkdir(parents=True, exist_ok=True)
    path = project / f"{session_id}.jsonl"
    records = []
    for kind, text in turns:
        records.append({
            "type": kind, "sessionId": session_id, "cwd": cwd,
            "timestamp": "2026-09-01T09:30:00.000Z",
            "message": {"content": [{"type": "text", "text": text}]},
        })
    path.write_text("\n".join(json.dumps(r) for r in records), encoding="utf-8")
    return path


class RoleMarkerTests(unittest.TestCase):
    """The matcher must not confuse TALKING ABOUT a lane with BEING it."""

    def test_kickoff_header_in_user_turn_qualifies(self):
        markers = _role_markers(
            "scaffolder",
            "SCAFFOLDER — round 0906. Item: cm-257-320-drain-5.",
            "SCAFFOLDER — round 0906. Item: cm-257-320-drain-5.",
            "/repo",
        )
        self.assertIn("kickoff header (user turn)", markers)

    def test_mentioning_another_lane_does_not_qualify(self):
        """The brain's own session names every lane; it is not a lane."""
        chatter = (
            "I sent SCAFFOLDER — round 0906 to the lane and it used "
            "scaffolder/cm-257-320-drain-5 in claude-scaffolder-queue."
        )
        self.assertEqual(_role_markers("scaffolder", "", chatter, "/repo"), [])

    def test_sibling_lane_kickoff_does_not_qualify(self):
        """The decomper kickoff mentions the other lane; that must not match."""
        decomper_prompt = (
            "DECOMPER — round 0906. You are the Decomper. The other lane owns "
            "the compiler, so the scaffolder/... branch is not yours."
        )
        self.assertEqual(
            _role_markers("scaffolder", decomper_prompt, decomper_prompt, "/repo"),
            [],
        )
        self.assertIn(
            "kickoff header (user turn)",
            _role_markers("decomper", decomper_prompt, decomper_prompt, "/repo"),
        )

    def test_role_named_cwd_qualifies(self):
        markers = _role_markers("scaffolder", "", "", "/x/claude-scaffolder-queue")
        self.assertIn("session cwd", markers)


class CodexScanTests(unittest.TestCase):
    def test_recovers_final_message_for_the_right_lane(self):
        with tempfile.TemporaryDirectory() as tmp:
            base = Path(tmp)
            cwd = str(base / "wt")
            root = base / "sessions"
            _codex_session(
                root, "scaf", cwd,
                [("user", "SCAFFOLDER — round 0906. Item: cm-257-320-drain-5.")],
                "Paused as instructed.",
            )
            _codex_session(
                root, "deco", cwd,
                [("user", "DECOMPER — round 0906. Item: q-handoff-guard-repair.")],
                "PR #1620 opened.",
            )
            scope = [base / "wt"]
            scaf = scan_codex([root], "scaffolder", scope, None)
            deco = scan_codex([root], "decomper", scope, None)
            self.assertEqual(len(scaf), 1)
            self.assertEqual(scaf[0].text, "Paused as instructed.")
            self.assertEqual(len(deco), 1)
            self.assertEqual(deco[0].text, "PR #1620 opened.")

    def test_session_outside_repo_scope_is_ignored(self):
        with tempfile.TemporaryDirectory() as tmp:
            base = Path(tmp)
            root = base / "sessions"
            _codex_session(
                root, "elsewhere", "/somewhere/else",
                [("user", "SCAFFOLDER — round 0906.")], "unrelated",
            )
            self.assertEqual(
                scan_codex([root], "scaffolder", [base / "wt"], None), [],
            )

    def test_missing_store_yields_no_candidates(self):
        with tempfile.TemporaryDirectory() as tmp:
            absent = Path(tmp) / "nope"
            self.assertEqual(
                scan_codex([absent], "scaffolder", [Path(tmp)], None), [],
            )


class ClaudeScanTests(unittest.TestCase):
    def test_recovers_last_assistant_turn(self):
        with tempfile.TemporaryDirectory() as tmp:
            base = Path(tmp)
            wt = base / "wt"
            root = base / "projects"
            _claude_session(root, str(wt), "sess-1", [
                ("user", "DECOMPER — round 0906. Item: q-handoff-guard-repair."),
                ("assistant", "first"),
                ("assistant", "final answer"),
            ])
            hits = scan_claude([root], "decomper", [wt], None)
            self.assertEqual(len(hits), 1)
            self.assertEqual(hits[0].text, "final answer")


class InboxLayerTests(unittest.TestCase):
    def test_absent_inbox_reports_absence(self):
        with tempfile.TemporaryDirectory() as tmp:
            report, why = read_inbox(
                Path(tmp), "scaffolder", None, datetime.now(UTC),
            )
            self.assertIsNone(report)
            self.assertIn("no inbox artifact", why)

    def test_fresh_inbox_wins_before_any_transcript_scan(self):
        with tempfile.TemporaryDirectory() as tmp:
            common = Path(tmp)
            inbox = common / "agent-inbox"
            inbox.mkdir()
            (inbox / "scaffolder-latest.md").write_text(
                "<!-- captured 2026-09-01T10:00:00 role=scaffolder -->\n\nthe report\n",
                encoding="utf-8",
            )
            report, why = read_inbox(
                common, "scaffolder", None,
                datetime(2026, 9, 1, 11, tzinfo=UTC),
            )
            self.assertIsNotNone(report)
            self.assertEqual(report.text, "the report")
            self.assertEqual(report.layer, "inbox")
            self.assertEqual(why, "ok")


class UnknownContractTests(unittest.TestCase):
    def test_absence_of_everything_is_unknown_not_empty_success(self):
        """A missing report is UNKNOWN. It is never 'the lane did nothing'."""
        with tempfile.TemporaryDirectory() as tmp:
            repo = _make_repo(Path(tmp))
            report, rivals, notes = recover(repo, "scaffolder", provider="codex")
            self.assertIsNone(report)
            self.assertEqual(rivals, [])
            self.assertTrue(any("inbox" in n for n in notes))

    def test_repo_scope_comes_from_git_not_hardcoded_paths(self):
        with tempfile.TemporaryDirectory() as tmp:
            repo = _make_repo(Path(tmp))
            scope = repo_scope(repo)
            self.assertIn(repo.resolve(), scope)


if __name__ == "__main__":
    unittest.main()
