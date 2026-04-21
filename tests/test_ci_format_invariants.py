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
        # missing_tu_source is the only error-severity check and
        # should lead — most urgent to fix.
        self.assertEqual(CHECK_ORDER[0], "missing_tu_source")


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
            "count": 5, "errors": 1, "warnings": 4,
            "issues": [
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
        # missing_tu_source, orphan_extern, complete_tu_rename.
        ms_pos = md.find("### `missing_tu_source`")
        oe_pos = md.find("### `orphan_extern`")
        ct_pos = md.find("### `complete_tu_rename`")
        self.assertGreater(ms_pos, 0)
        self.assertGreater(oe_pos, ms_pos)
        self.assertGreater(ct_pos, oe_pos)


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
