"""Tests for tools/wall_aware_headroom.py (CC Decomper's wall-aware fix)."""
from __future__ import annotations
import sys, tempfile, unittest
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))
import wall_aware_headroom as w  # noqa: E402


class WallDetect(unittest.TestCase):
    def _mk(self, body: str) -> Path:
        d = tempfile.mkdtemp(); p = Path(d) / "f.s"; p.write_text(body); return p

    def test_prose_marker_is_wall(self):
        self.assertTrue(w.is_wall(self._mk("; GLOBAL_ASM endgame (brief 302)\n.text\n")))

    def test_taxonomy_citation_without_word_wall_is_wall(self):
        # the CC Decomper's case: cites C-34 but never says "wall"/"endgame"
        self.assertTrue(w.is_wall(self._mk("; func: C-34 candidate, pool-literal CSE\n.text\n")))

    def test_p_series_citation_is_wall(self):
        self.assertTrue(w.is_wall(self._mk("; P-16 dispatcher residue\n.text\n")))

    def test_plain_convertible_is_not_wall(self):
        self.assertFalse(w.is_wall(self._mk("; ordinary leaf accessor\n.text\nfunc:\n bx lr\n")))

    def test_coprocessor_reg_not_mistaken_for_citation(self):
        # c0/p15 (no dash) are registers, not taxonomy cites -> not a wall
        self.assertFalse(w.is_wall(self._mk("; reads cp15\n.text\n mrc p15, 0, r0, c0, c0\n")))


if __name__ == "__main__":
    unittest.main()
