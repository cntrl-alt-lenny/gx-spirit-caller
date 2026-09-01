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

    def test_narrative_edit_outside_last_updated_still_triggers(self):
        before = _state("0900") + "incident before\n"
        after = _state("0900") + "incident after\n"
        result = check_dispatch_log.check_texts(before, after, _log(["0900"]), _log(["0900"]))
        self.assertFalse(result.ok)
        self.assertIn("docs/state.md narrative changed", result.detail)

    def test_unchanged_state_does_not_trigger(self):
        state = _state("0900")
        result = check_dispatch_log.check_texts(state, state, _log(["0900"]), _log(["0900"]))
        self.assertTrue(result.ok)
        self.assertIn("not required", result.detail)

    def test_duplicate_round_id_is_not_new_evidence(self):
        result = check_dispatch_log.check_texts(_state("0900"), _state("0901", detail="new"), _log(["0900"]), _log(["0900", "0900"]))
        self.assertFalse(result.ok)

    def test_not_a_round_trailer_opts_out_of_the_row_requirement(self):
        result = check_dispatch_log.check_texts(
            _state("0900"), _state("0900", detail="housekeeping"),
            _log(["0900"]), _log(["0900"]),
            "housekeeping: archive old sections (#1610)\n\nNot-A-Round: true\n",
        )
        self.assertTrue(result.ok)
        self.assertIn("Not-A-Round: true", result.detail)

    def test_trailer_must_match_exactly_not_settable_by_accident(self):
        result = check_dispatch_log.check_texts(
            _state("0900"), _state("0900", detail="housekeeping"),
            _log(["0900"]), _log(["0900"]),
            "this round is not a round, true story\n",
        )
        self.assertFalse(result.ok)

    def test_trailer_is_honoured_regardless_of_content_shape(self):
        """The guard trusts the declaration wherever it appears -- it does not
        try to tell round narrative from housekeeping prose itself (that was
        tried and failed, see queue_state_drift's heading-only variant).
        A falsely-declared round is a review-time problem, not this guard's;
        see test_round_0903_stays_blocked_without_a_declared_trailer below
        for the real case this guard exists to catch."""
        result = check_dispatch_log.check_texts(
            _state("0900"), _state("0901", detail="new"),
            _log(["0900"]), _log(["0900"]),
            "round 0901\n\nNot-A-Round: true\n",
        )
        self.assertTrue(result.ok)
        self.assertIn("Not-A-Round: true", result.detail)


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


_REPO_ROOT = _TOOLS.parent
_HOUSEKEEPING_SHAS = ("19296d3fa", "41930febd", "55cada2d2")


def _show_at(ref: str, path: str) -> str | None:
    result = subprocess.run(
        ["git", "-C", str(_REPO_ROOT), "show", f"{ref}:{path}"],
        capture_output=True, text=True, check=False,
    )
    return result.stdout if result.returncode == 0 else None


def _commit_message(sha: str) -> str:
    result = subprocess.run(
        ["git", "-C", str(_REPO_ROOT), "log", "-1", "--format=%B", sha],
        capture_output=True, text=True, check=False,
    )
    return result.stdout if result.returncode == 0 else ""


class AcceptanceTableTests(unittest.TestCase):
    """Pinned to the five real commits round 0907 named. Each housekeeping
    commit must pass WITH a declared opt-out and FAIL without one; round
    0903 (PR #1614, the defect this guard exists to catch) must fail no
    matter what -- no trailer is applied to it, real or synthetic; round
    0905 (PR #1619) must pass without needing the opt-out at all."""

    def test_housekeeping_commits_pass_with_declared_opt_out_fail_without(self):
        for sha in _HOUSEKEEPING_SHAS:
            with self.subTest(sha=sha):
                state_base = _show_at(f"{sha}^", "docs/state.md")
                state_head = _show_at(sha, "docs/state.md")
                log_base = _show_at(f"{sha}^", "docs/dispatch-log.md")
                log_head = _show_at(sha, "docs/dispatch-log.md")
                real_message = _commit_message(sha)
                self.assertTrue(real_message, f"could not read commit message for {sha}")

                without = check_dispatch_log.check_texts(
                    state_base, state_head, log_base, log_head, real_message,
                )
                self.assertFalse(without.ok, f"{sha} unexpectedly passed without opt-out")

                withit = check_dispatch_log.check_texts(
                    state_base, state_head, log_base, log_head,
                    real_message + "\n\nNot-A-Round: true\n",
                )
                self.assertTrue(withit.ok, f"{sha} unexpectedly failed with opt-out")

    def test_round_0903_stays_blocked_without_a_declared_trailer(self):
        """Before/after canary: this is the exact tool behaviour from before
        this round (guard fires) re-run against the unmodified real commit
        after the opt-out feature was added -- still fires, because #1614's
        real commit message carries no `Not-A-Round: true` trailer."""
        result = check_dispatch_log.check_repository(_REPO_ROOT, "050f06c0f^", "050f06c0f")
        self.assertFalse(result.ok)
        self.assertIn("no newly-added round id", result.detail)

    def test_round_0905_passes_without_needing_the_opt_out(self):
        result = check_dispatch_log.check_repository(_REPO_ROOT, "6ab979c3c^", "6ab979c3c")
        self.assertTrue(result.ok)
        self.assertIn("0905", result.detail)


if __name__ == "__main__":
    unittest.main()
