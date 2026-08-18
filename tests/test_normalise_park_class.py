import sys
import unittest
from pathlib import Path


_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from normalise_park_class import (  # noqa: E402
    assert_all_parked_values_mapped,
    census,
    load_ledger,
    load_map,
    normalize,
    print_census,
    unmapped_values,
)


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

    def test_bare_anchor_values_use_identity_rule(self):
        for value in ("C-32", "P-4", "P-17", "P-20", "P-36", "P-42", "OQ-1"):
            normalized = normalize(value, self.mapping)
            self.assertEqual(normalized.family, value)
            self.assertEqual(normalized.qualifier, "formal anchor")

    def test_new_taxonomy_values_have_reviewed_families(self):
        self.assertEqual(normalize("strength-reduction", self.mapping).family, "C-65")
        self.assertEqual(
            normalize("tool-anomaly", self.mapping).family,
            "UNCLASSIFIED:tool-anomaly",
        )

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
        print_census(report)
        assert_all_parked_values_mapped(rows, mapping)

    def test_appended_rows_do_not_break_mapping_invariant(self):
        rows = load_ledger()
        appended = [
            dict(rows[0], result="parked", park_class="P-999"),
            dict(rows[0], result="shipped", park_class=""),
            dict(rows[0], result="shipped", park_class="n/a"),
        ]
        expanded = rows + appended
        report = census(expanded, self.mapping)
        self.assertEqual(report["rows"], len(rows) + len(appended))
        self.assertEqual(report["unmapped_values"], [])
        assert_all_parked_values_mapped(expanded, self.mapping)

    def test_unmapped_free_text_fails_loudly(self):
        rows = load_ledger()
        bad = dict(rows[0], result="parked", park_class="new-free-text-wall")
        expanded = rows + [bad]
        self.assertEqual(unmapped_values(expanded, self.mapping), ["new-free-text-wall"])
        with self.assertRaisesRegex(AssertionError, "new-free-text-wall"):
            assert_all_parked_values_mapped(expanded, self.mapping)


if __name__ == "__main__":
    unittest.main()
