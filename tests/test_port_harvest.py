"""Tests for the fail-closed standing port harvest entry point."""
from __future__ import annotations

import io
import sys
import unittest
from contextlib import redirect_stdout
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import port_harvest  # noqa: E402


class TestPortHarvest(unittest.TestCase):
    def test_zero_work_path_is_clean_and_does_not_claim_a_harvest(self):
        output = io.StringIO()
        with (
            mock.patch.object(port_harvest, "_check_safe_start", return_value=None),
            mock.patch.object(port_harvest, "recensus", return_value={"usa": [], "jpn": []}),
            redirect_stdout(output),
        ):
            rc = port_harvest.main([])

        text = output.getvalue()
        self.assertEqual(rc, 0)
        self.assertIn("nothing to harvest", text)
        self.assertIn('"ported": 0', text)
        self.assertNotIn("harvest complete", text.lower())

    def test_retryable_errors_are_not_reported_as_success(self):
        reports = {
            "usa": {
                "prefilter_tool_errors": 1,
                "tool_errors": 0,
                "deferred": 0,
            },
            "jpn": {
                "prefilter_tool_errors": 0,
                "tool_errors": 0,
                "deferred": 0,
            },
        }
        self.assertTrue(port_harvest._has_retryable_error(reports))


if __name__ == "__main__":
    unittest.main()
