from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))

from check_metric_canon import check_paths, check_text  # noqa: E402


class MetricCanonTests(unittest.TestCase):
    def test_unqualified_completion_claim_fails(self):
        text = "A census found 30 unmatched functions. The project is closer to done."
        self.assertEqual(len(check_text(text)), 1)

    def test_axis_qualified_claim_passes(self):
        text = (
            "A census found 30 unmatched functions. This is a delink-gap count, "
            "not natural-C completion."
        )
        self.assertEqual(check_text(text), [])

    def test_three_ordinary_docs_do_not_fire(self):
        paths = [
            ROOT / "docs/research/brief-601-reland.md",
            ROOT / "docs/research/brief-619-cmatch-loop.md",
            ROOT / "docs/research/campaign-analytics/master-ledger-summary.md",
        ]
        self.assertEqual(check_paths(paths), [])


if __name__ == "__main__":
    unittest.main()
