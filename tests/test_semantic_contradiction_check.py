"""Pinned regression fixtures for semantic enum contradiction detection."""

from __future__ import annotations

import re
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from semantic_contradiction_check import EnumCandidate, scan_texts  # noqa: E402


NUMBER = r"(?P<value>-?(?:0[xX][0-9a-fA-F]+|\d+))"


def candidate(name: str, anchor: str, evidence: str) -> EnumCandidate:
    return EnumCandidate(name, f"{name}.md", re.compile(anchor), re.compile(evidence + NUMBER))


class ContradictionTests(unittest.TestCase):
    def test_pinned_three_of_six_survey(self):
        # These strings intentionally preserve the pre-correction claims. Do
        # not read live canonical docs: Claude's correction PRs are concurrent.
        candidates = (
            candidate("DuelPhase", r"f_cf8", r"f_cf8\s*==\s*"),
            candidate("Ov006SubState", r"state_word", r"state_word\s*=\s*"),
            candidate("Ov004Phase", r"phase54", r"phase54\s*!=\s*"),
            candidate("Ov000Facing", r"facing", r"facing\s*==\s*"),
            candidate("Ov011SlotState", r"slot_state", r"slot_state\s*==\s*"),
            candidate("Ov011ViewMode", r"view_mode", r"view_mode\s*==\s*"),
        )
        docs = {
            f"{name}.md": f"typedef enum {name} {{ A = 0, B = 1, C = 2, D = 3 }};"
            for name in (item.name for item in candidates)
        }
        evidence = {
            "f_cf8.c": "f_cf8 == 4;",
            "substate.c": "state_word = 11;",
            "phase.c": "phase54 != 5;",
            "safe.c": "facing == 2; slot_state == 1; view_mode == 3;",
        }
        results = scan_texts(candidates, docs, evidence)
        self.assertEqual(sum(bool(result.outside) for result in results), 3)
        self.assertEqual(
            {result.candidate.name for result in results if result.outside},
            {"DuelPhase", "Ov006SubState", "Ov004Phase"},
        )

    def test_corrected_fcf8_range_no_longer_flags_value_four(self):
        spec = candidate("DuelPhase", r"f_cf8", r"f_cf8\s*==\s*")
        result = scan_texts(
            (spec,),
            {"DuelPhase.md": "typedef enum DuelPhase { A = 0, B = 1, C = 2, D = 3, E = 4 };"},
            {"f_cf8.c": "f_cf8 == 4;"},
        )[0]
        self.assertEqual(result.outside, ())


if __name__ == "__main__":
    unittest.main()
