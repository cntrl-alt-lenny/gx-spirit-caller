"""Unit tests for tools/ci_format_invariants.py.

The CI workflow pipes `render()` output straight into
`gh pr comment`, so regressions here spam every PR after they land.
Pins:

  - Empty (clean) report renders the happy-path header + no section
  - Warn-only report renders warning banner, no error banner
  - Error present renders error banner + blocks-merge note
  - Issues grouped by check in a stable order
  - Per-check limit applies; truncation note appears past it
  - Footer marker (used for upsert detection in the workflow)
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from ci_format_invariants import (  # noqa: E402
    CHECK_ORDER,
    _fmt_issue,
    render,
)


FOOTER_MARKER = "<sub>🤖 Posted by `.github/workflows/match-invariants.yml`"


def _issue(check: str, severity: str = "warn", **kwargs) -> dict:
    out = {
        "check": check,
        "severity": severity,
        "module": None,
        "addr": None,
        "path": None,
        "message": "msg",
        "suggestion": "fix",
    }
    out.update(kwargs)
    return out


# ------------------------------------------------------------------------- #


class TestCheckOrder(unittest.TestCase):
    def test_error_severity_checks_come_first(self):
        # cross_file_name_drift (PR #185) leads — it's the most
        # severe class of drift (rebase footgun that silently
        # passes build but corrupts subsequent renames). Second
        # is missing_tu_source.
        self.assertEqual(CHECK_ORDER[0], "cross_file_name_drift")
        self.assertEqual(CHECK_ORDER[1], "missing_tu_source")

    def test_all_four_checks_are_ordered(self):
        # Regression pin: adding a new check without also wiring it
        # into CHECK_ORDER means its issues get silently dropped
        # from the PR comment.
        expected = {
            "cross_file_name_drift",
            "missing_tu_source",
            "orphan_extern",
            "complete_tu_rename",
        }
        self.assertEqual(set(CHECK_ORDER), expected)

    def test_every_check_has_a_description(self):
        # A check without a CHECK_DESC entry renders the section
        # header but no _italic explanation_ — brain / agents
        # lose the "what does this mean?" context. Pin all four
        # have descriptions.
        from ci_format_invariants import CHECK_DESC
        for check in CHECK_ORDER:
            self.assertIn(
                check, CHECK_DESC,
                f"{check} is in CHECK_ORDER but missing CHECK_DESC",
            )


class TestFmtIssue(unittest.TestCase):
    def test_error_uses_red_emoji(self):
        s = _fmt_issue(_issue("x", severity="error", module="ov005"))
        self.assertIn("🛑", s)
        self.assertNotIn("⚠️", s)

    def test_warn_uses_yellow_emoji(self):
        s = _fmt_issue(_issue("x", severity="warn", module="ov005"))
        self.assertIn("⚠️", s)
        self.assertNotIn("🛑", s)

    def test_location_includes_module_addr_path(self):
        s = _fmt_issue(_issue(
            "x", module="ov005", addr=0x021aa4a0, path="src/foo.c:12",
        ))
        self.assertIn("`ov005`", s)
        self.assertIn("`0x021aa4a0`", s)
        self.assertIn("`src/foo.c:12`", s)

    def test_no_location_has_placeholder(self):
        s = _fmt_issue(_issue("x"))
        self.assertIn("no location", s)


class TestRenderClean(unittest.TestCase):
    def test_zero_issues_renders_success(self):
        md = render({"count": 0, "errors": 0, "warnings": 0, "issues": []})
        self.assertIn("🧹 Match-invariant check", md)
        self.assertIn("✅", md)
        self.assertIn("Clean", md)
        self.assertIn(FOOTER_MARKER, md)
        # No per-check sections on a clean run.
        self.assertNotIn("###", md)


class TestRenderWarnOnly(unittest.TestCase):
    def test_warn_banner_present(self):
        md = render({
            "count": 1, "errors": 0, "warnings": 1,
            "issues": [_issue("complete_tu_rename", module="ov005", addr=0x100)],
        })
        self.assertIn("⚠️", md)
        self.assertIn("0 error(s), 1 warning(s)", md)
        # Warnings-only: show the "informational" note, NOT the
        # errors-block-merge note.
        self.assertIn("informational", md)
        self.assertNotIn("block merge", md)

    def test_warn_only_exit_friendly(self):
        # The render must still produce usable output even if everything
        # is warn-severity (normal steady state on main with brief 003).
        md = render({
            "count": 3, "errors": 0, "warnings": 3,
            "issues": [
                _issue("complete_tu_rename", module="ov005", addr=0x100),
                _issue("complete_tu_rename", module="ov005", addr=0x104),
                _issue("orphan_extern", path="src/foo.c:12"),
            ],
        })
        self.assertIn("### `complete_tu_rename`", md)
        self.assertIn("### `orphan_extern`", md)
        self.assertIn("2 warning(s)", md)  # complete_tu_rename has 2
        self.assertIn("1 warning(s)", md)  # orphan_extern has 1


class TestRenderWithErrors(unittest.TestCase):
    def test_error_banner_and_block_merge_note(self):
        md = render({
            "count": 1, "errors": 1, "warnings": 0,
            "issues": [_issue(
                "missing_tu_source", severity="error",
                module="ov005", path="src/ov005_missing.c",
            )],
        })
        self.assertIn("🛑", md)
        self.assertIn("1 error(s)", md)
        self.assertIn("block merge", md)
        self.assertIn("### `missing_tu_source`", md)
        self.assertIn("(1 error(s))", md)

    def test_mixed_errors_and_warnings(self):
        md = render({
            "count": 6, "errors": 2, "warnings": 4,
            "issues": [
                _issue("cross_file_name_drift", severity="error",
                       path="src/main/foo.c:42"),
                _issue("missing_tu_source", severity="error",
                       path="src/missing.c"),
                _issue("complete_tu_rename", module="ov005", addr=0x100),
                _issue("complete_tu_rename", module="ov005", addr=0x104),
                _issue("complete_tu_rename", module="ov005", addr=0x108),
                _issue("orphan_extern", path="src/foo.c:12"),
            ],
        })
        # Mixed → error banner wins (block merge note is shown).
        self.assertIn("block merge", md)
        # Section order follows CHECK_ORDER:
        # cross_file_name_drift, missing_tu_source, orphan_extern,
        # complete_tu_rename.
        drift_pos = md.find("### `cross_file_name_drift`")
        ms_pos = md.find("### `missing_tu_source`")
        oe_pos = md.find("### `orphan_extern`")
        ct_pos = md.find("### `complete_tu_rename`")
        self.assertGreater(drift_pos, 0)
        self.assertGreater(ms_pos, drift_pos)
        self.assertGreater(oe_pos, ms_pos)
        self.assertGreater(ct_pos, oe_pos)

    def test_drift_issue_renders_with_full_context(self):
        # Regression pin for PR #185: drift issues MUST appear in
        # the PR comment body. Previously, adding a new check to
        # check_match_invariants.py without updating this
        # formatter's CHECK_ORDER silently dropped them from the
        # comment — the workflow exit-code would still fail, but
        # the user saw "1 error" with no detail about which file.
        md = render({
            "count": 1, "errors": 1, "warnings": 0,
            "issues": [_issue(
                "cross_file_name_drift",
                severity="error",
                path="src/main/taskfoo.c:15",
                message=(
                    "`extern ... Task_Drift` references a symbol not "
                    "in any symbols.txt and not declared in "
                    "libs/**/*.h. Likely a rebase drift (see #171)."
                ),
                suggestion=(
                    "Verify symbols.txt has a `Task_Drift` entry at "
                    "the expected address."
                ),
            )],
        })
        # Section header + count present.
        self.assertIn("### `cross_file_name_drift`", md)
        self.assertIn("(1 error(s))", md)
        # File location surfaces.
        self.assertIn("src/main/taskfoo.c:15", md)
        # Message + suggestion survive rendering.
        self.assertIn("rebase drift", md)
        self.assertIn("Task_Drift", md)
        # Check-description text is included.
        self.assertIn("rebase drift", md.lower())
        # Error emoji fires on the issue itself.
        self.assertIn("🛑", md)


class TestPerCheckLimit(unittest.TestCase):
    def test_limit_truncates_with_note(self):
        many = [
            _issue("complete_tu_rename", module="ov005", addr=0x100 + i)
            for i in range(25)
        ]
        md = render(
            {"count": 25, "errors": 0, "warnings": 25, "issues": many},
            limit_per_check=10,
        )
        # Only 10 rendered.
        self.assertIn("`0x00000100`", md)
        self.assertIn("`0x00000109`", md)
        self.assertNotIn("`0x0000010a`", md)  # 11th entry
        # Truncation note.
        self.assertIn("_…and 15 more", md)


class TestFooterMarker(unittest.TestCase):
    def test_marker_always_present(self):
        # The workflow uses this marker to find-and-update the existing
        # comment on each push. If it ever drifts, CI will spam new
        # comments on every push.
        for report in [
            {"count": 0, "errors": 0, "warnings": 0, "issues": []},
            {"count": 1, "errors": 0, "warnings": 1,
             "issues": [_issue("complete_tu_rename")]},
            {"count": 1, "errors": 1, "warnings": 0,
             "issues": [_issue("missing_tu_source", severity="error")]},
        ]:
            md = render(report)
            self.assertIn(FOOTER_MARKER, md,
                          "footer marker missing — CI would spam PRs")


if __name__ == "__main__":
    unittest.main()
