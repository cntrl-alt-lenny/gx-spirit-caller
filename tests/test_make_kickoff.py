"""Tests for the self-linting kickoff skeleton generator."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

TOOLS = Path(__file__).resolve().parents[1] / "tools"
sys.path.insert(0, str(TOOLS))

import kickoff_lint  # noqa: E402
import make_kickoff  # noqa: E402

# The pool-item path (below) actually shells out to `spec.interpreter` to get
# a live measurement, so it needs a host string whose interpreter really
# exists on whichever machine runs the test -- mirror the tool's own
# host == "windows" branch against the real host instead of hardcoding
# "windows" (which made the test fail with FileNotFoundError on the Mac,
# where plain `python` isn't on PATH; see PR #1608 and q-ci-test-visibility).
CURRENT_HOST = "windows" if sys.platform == "win32" else "mac"


class TestMakeKickoff(unittest.TestCase):
    def test_all_verified_lane_host_emissions_pass_kickoff_lint(self):
        for lane, host in sorted(make_kickoff.VERIFIED_WORKTREES):
            text = make_kickoff.generate(
                lane,
                host,
                item="q-make-kickoff-generator",
                branch=f"codex/{lane}-{host}-kickoff",
            )
            failed = [check.key for check in kickoff_lint.lint(text) if check.required and not check.ok]
            assert failed == [], f"{lane}/{host}: {failed}"

    def test_unverified_worktree_is_refused_not_silently_emitted(self):
        """kb-map/kb-types mac paths were hand-typed guesses pointing at
        directories that do not exist -- nothing stopped the generator from
        sending a worker there. Any (lane, host) absent from
        VERIFIED_WORKTREES must be refused, not just these two by name."""
        unverified = {
            (lane, host)
            for lane in make_kickoff.LANES
            for host in ("windows", "mac")
        } - make_kickoff.VERIFIED_WORKTREES
        assert unverified, "expected at least one unverified pair to exercise the refusal"
        for lane, host in unverified:
            with self.subTest(lane=lane, host=host):
                with self.assertRaises(make_kickoff.GenerationError):
                    make_kickoff.lane_spec(lane, host)
                with self.assertRaises(make_kickoff.GenerationError):
                    make_kickoff.generate(lane, host, item="q-make-kickoff-generator")

    def test_pool_item_stamps_live_figure_and_reproducer(self):
        text = make_kickoff.generate(
            "scaffolder",
            CURRENT_HOST,
            item="q-pool-freshness-tool",
            branch="codex/pool-kickoff",
        )
        assert "LIVE POOL wall-bl4-small:" in text
        expected_interpreter = "python" if CURRENT_HOST == "windows" else "python3.13"
        assert f"REPRODUCER: {expected_interpreter} tools/pool_freshness.py --pool wall-bl4-small" in text

    def test_mac_lane_paths_point_to_real_worktrees(self):
        assert make_kickoff.lane_spec("decomper", "mac").worktree == (
            "~/Dev/spirit-caller/claude-decomper-queue"
        )
        assert make_kickoff.lane_spec("scaffolder", "mac").worktree == (
            "~/Dev/spirit-caller/claude-scaffolder-queue"
        )

    def test_item_without_named_pool_emits_no_number(self):
        text = make_kickoff.generate("scaffolder", "windows", item="q-make-kickoff-generator")
        assert "LIVE POOL" not in text
        assert "REPRODUCER:" not in text

    def test_stripped_establishment_is_refused(self):
        text = make_kickoff.render(
            "scaffolder",
            "windows",
            item="q-make-kickoff-generator",
        )
        sabotaged = "\n".join(
            line for line in text.splitlines() if not line.strip().startswith("Set-Location")
        )
        assert "location-guard" in {check.key for check in make_kickoff.required_failures(sabotaged)}
        try:
            make_kickoff.validate(sabotaged)
        except make_kickoff.GenerationError as exc:
            assert "location-guard" in str(exc)
        else:
            raise AssertionError("sabotaged kickoff was not refused")


if __name__ == "__main__":
    unittest.main()
