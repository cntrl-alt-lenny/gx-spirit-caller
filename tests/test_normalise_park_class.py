import sys
import unittest
from pathlib import Path


_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from normalise_park_class import census, load_ledger, load_map, normalize  # noqa: E402


class TestNormaliseParkClass(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.mapping = load_map()

    def test_register_numbering_spellings_share_p30_and_keep_qualifier(self):
        values = (
            "register-numbering-permutation-cascade",
            "register-numbering-permutation-cascade-P36-adjacent",
            "P-30-adjacent-register-choice",
        )
        normalized = [normalize(value, self.mapping) for value in values]
        self.assertEqual({item.family for item in normalized}, {"P-30"})
        self.assertEqual({item.qualifier for item in normalized}, set(values))

    def test_c32_anchor_preserves_cross_overlay_qualifier(self):
        plain = normalize("C-32", self.mapping)
        qualified = normalize("C-32-cross-overlay-bl", self.mapping)
        self.assertEqual(plain.family, qualified.family)
        self.assertEqual(qualified.qualifier, "cross-overlay-bl")

    def test_scheduling_and_register_choice_do_not_merge(self):
        scheduling = normalize("P-36-instruction-scheduling", self.mapping)
        register_choice = normalize("P-30-adjacent-register-choice", self.mapping)
        self.assertEqual(scheduling.family, "P-36")
        self.assertEqual(register_choice.family, "P-30")
        self.assertNotEqual(scheduling.family, register_choice.family)

    def test_every_ledger_value_has_a_reviewed_mapping(self):
        mapping = self.mapping
        rows = load_ledger()
        report = census(rows, mapping)
        self.assertEqual(report["rows"], 1164)
        self.assertEqual(report["raw_distinct"], 283)
        self.assertEqual(report["family_distinct"], 91)
        self.assertEqual(report["parked_rows"], 744)
        self.assertTrue(all(row["park_class"] in mapping for row in rows))


if __name__ == "__main__":
    unittest.main()
