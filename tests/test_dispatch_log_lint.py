"""Tests for the narrow state-handoff to dispatch-log contract."""

from __future__ import annotations

import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import check_dispatch_log  # noqa: E402


def _state(round_id: str, *, detail: str = "old") -> str:
    return f"**Last updated:** {round_id}\n{detail}\n\nOther state.\n"


def _log(round_ids: list[str]) -> str:
    rows = "\n".join(f"| {round_id} | date | Windows | model | lanes | Windows | notes |" for round_id in round_ids)
    return "| Round | Date | Host | Brain model | Lanes dispatched | Transcripts | Notes |\n" + rows + "\n"


class DispatchLogTextTests(unittest.TestCase):
    def test_round_update_without_new_row_is_red(self):
        result = check_dispatch_log.check_texts(_state("0900"), _state("0901", detail="new"), _log(["0900"]), _log(["0900"]))
        self.assertFalse(result.ok)
        self.assertIn("no newly-added round id", result.detail)

    def test_round_update_with_new_row_is_green(self):
        result = check_dispatch_log.check_texts(_state("0900"), _state("0901", detail="new"), _log(["0900"]), _log(["0900", "0901"]))
        self.assertTrue(result.ok)
        self.assertIn("0901", result.detail)

    def test_incidental_state_edit_does_not_trigger(self):
        before = _state("0900") + "incident before\n"
        after = _state("0900") + "incident after\n"
        result = check_dispatch_log.check_texts(before, after, _log(["0900"]), _log(["0900"]))
        self.assertTrue(result.ok)
        self.assertIn("not required", result.detail)

    def test_duplicate_round_id_is_not_new_evidence(self):
        result = check_dispatch_log.check_texts(_state("0900"), _state("0901", detail="new"), _log(["0900"]), _log(["0900", "0900"]))
        self.assertFalse(result.ok)


class DispatchLogRepositoryTests(unittest.TestCase):
    def test_full_clone_path_checks_refs(self):
        with tempfile.TemporaryDirectory() as directory:
            repo = Path(directory)
            (repo / "docs").mkdir()
            (repo / "docs" / "state.md").write_text(_state("0900"), encoding="utf-8")
            (repo / "docs" / "dispatch-log.md").write_text(_log(["0900"]), encoding="utf-8")
            self._git(repo, "init", "-q")
            self._git(repo, "config", "user.email", "test@example.com")
            self._git(repo, "config", "user.name", "Test")
            self._git(repo, "add", ".")
            self._git(repo, "commit", "-qm", "base")
            (repo / "docs" / "state.md").write_text(_state("0901", detail="new"), encoding="utf-8")
            (repo / "docs" / "dispatch-log.md").write_text(_log(["0900", "0901"]), encoding="utf-8")
            self._git(repo, "commit", "-qam", "round docs")
            result = check_dispatch_log.check_repository(repo, "HEAD^", "HEAD")
            self.assertTrue(result.ok)
            self.assertFalse(result.skipped)

    def test_shallow_clone_skips_with_reason(self):
        with patch.object(check_dispatch_log, "is_shallow_repository", return_value=True):
            result = check_dispatch_log.check_repository(Path("fixture"), "base", "head")
        self.assertTrue(result.ok)
        self.assertTrue(result.skipped)
        self.assertIn("shallow clone", result.detail)

    @staticmethod
    def _git(repo: Path, *args: str) -> None:
        subprocess.run(["git", "-C", str(repo), *args], check=True, capture_output=True)


if __name__ == "__main__":
    unittest.main()
