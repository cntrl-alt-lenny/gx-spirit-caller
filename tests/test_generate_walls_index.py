from __future__ import annotations

import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TOOL = ROOT / "tools" / "generate_walls_index.py"
OUT = ROOT / "docs" / "research" / "codegen-walls-index.md"

sys.path.insert(0, str(ROOT / "tools"))
from generate_walls_index import parse_catalog  # noqa: E402

# Reproduces the exact heading-arrangement that bled an unrelated section's
# own "Affected picks" bracket into the prior wall's count: a formal wall
# heading, an intervening level-3 heading that is NOT of the `### P-N.`/
# `### C-N.` shape (mirrors real catalog headings like `### BR-1.` or
# `### P-20-mode-switch-selector.` -- neither matches `[PC]-\d+` followed
# immediately by a literal `.`), and a second formal heading closing it off.
# The intervening heading carries its own bracket so a bleed is directly
# observable as an inflated member count on the FIRST wall.
_BLEED_FIXTURE = """\
### P-90. Synthetic wall for the boundary-bleed regression

**Affected picks (2):** `func_11111111`, `func_22222222`

### BR-90. An unrelated appendix section, not a formal P-N/C-N heading

**Affected picks (5):** `func_33333333`, `func_44444444`, `func_55555555`, \
`func_66666666`, `func_77777777`

### P-91. The next formal wall, closing P-90's section

**Affected picks (1):** `func_88888888`
"""


def _run(*args: str) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        [sys.executable, str(TOOL), *args],
        cwd=ROOT, capture_output=True, text=True,
    )


class TestWallsIndex(unittest.TestCase):
    def test_committed_index_is_current(self) -> None:
        result = _run("--check")
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_check_rejects_deliberately_stale_index(self) -> None:
        original = OUT.read_text(encoding="utf-8")
        try:
            OUT.write_text(original + "\nstale line\n", encoding="utf-8")
            result = _run("--check")
            self.assertEqual(result.returncode, 1)
            self.assertIn("out of date", result.stderr)
        finally:
            OUT.write_text(original, encoding="utf-8")

    def test_index_has_shape_without_pinning_catalog_cardinality(self) -> None:
        lines = OUT.read_text(encoding="utf-8").splitlines()
        rows = [line for line in lines if line.startswith("| [")]
        self.assertTrue(rows)
        self.assertTrue(all("codegen-walls.md#" in row for row in rows))
        self.assertTrue(all(row.count("|") >= 6 for row in rows))

    def test_non_formal_heading_does_not_bleed_into_prior_wall_count(self) -> None:
        """Regression for the heading-boundary bug (q-wall-overblock-audit,
        PR #1605): a wall's section must end at the NEXT level-3 heading of
        any shape, not just the next `### P-N.`/`### C-N.` one. Before the
        fix, `### BR-90.` (not `[PC]-\\d+`-shaped) was invisible to the
        boundary scan, so P-90's section ran all the way to P-91, folding
        BR-90's own 5-member bracket into P-90's count (2 -> 7, wrong) while
        also swallowing BR-90 into P-90's own catalog-line span. Confirmed
        real in the committed catalog: P-49's true section (26 lines) versus
        the ~1,800 lines swept in before the next formal heading (`P-51`).
        """
        entries = {entry.key: entry for entry in parse_catalog(_BLEED_FIXTURE)}
        self.assertEqual(entries["P-90"].member_count, "2")
        self.assertEqual(entries["P-91"].member_count, "1")
        # BR-90 is not a formal wall heading and must never become its own
        # index entry, bled-in or otherwise.
        self.assertNotIn("BR-90", entries)


if __name__ == "__main__":
    unittest.main()
