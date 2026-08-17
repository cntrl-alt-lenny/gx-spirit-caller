import sys
import unittest
from pathlib import Path


_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from main_shape_reclassify import (  # noqa: E402
    branch_kind,
    classify,
    read_rows,
)


class TestMainShapeReclassify(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.rows = {row.address[2:].lower(): row for row in read_rows()}

    def test_five_hand_classified_canaries(self):
        for address in ("02003a4c", "02004ef4", "02006264", "020091f4", "02009a68"):
            self.assertEqual(classify(self.rows[address])[0], "guard chain")

    def test_known_crossovers_and_missing_body(self):
        self.assertEqual(classify(self.rows["0201d47c"])[0], "other")
        self.assertEqual(classify(self.rows["020b007c"])[0], "guard chain")
        self.assertEqual(classify(self.rows["02081498"])[0], "softfloat/CLZ")
        self.assertEqual(classify(self.rows["02000e70"])[0], "unclassified")

    def test_worklist_row_count(self):
        self.assertEqual(len(self.rows), 1640)

    def test_predicated_data_processing_is_not_a_branch(self):
        for mnemonic in ("bic", "bics", "bicne", "biceq", "bicsne"):
            with self.subTest(mnemonic=mnemonic):
                self.assertEqual(branch_kind(mnemonic), "")

    def test_predicated_real_branches_are_branches(self):
        for mnemonic in ("bne", "blne", "blxeq", "bxne"):
            with self.subTest(mnemonic=mnemonic):
                self.assertEqual(branch_kind(mnemonic), "conditional")


if __name__ == "__main__":
    unittest.main()
