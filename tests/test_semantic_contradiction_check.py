"""Pinned regression fixtures for semantic enum contradiction detection."""

from __future__ import annotations

import re
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from semantic_contradiction_check import (  # noqa: E402
    EnumCandidate,
    discover_candidates,
    scan_texts,
)


NUMBER = r"(?P<value>-?(?:0[xX][0-9a-fA-F]+|\d+))"


def candidate(name: str, anchor: str, evidence: str) -> EnumCandidate:
    return EnumCandidate(name, f"{name}.md", re.compile(anchor), re.compile(evidence + NUMBER))


class ContradictionTests(unittest.TestCase):
    def test_current_duel_observed_value_set_is_first_class(self):
        # Pinned from the current observed-value-set form. Keep this fixture
        # independent of concurrent edits to the canonical document.
        docs = {
            "DuelStateEnums.md": """
## Duel phase (data_ov002_022d016c.f_cf8)

This is an **open observed-value set**; closure is unproven.

```
confirmed values include 0, 1, 2, 3, 4, 5 and 7;
```
""",
        }
        candidates = discover_candidates(docs)
        self.assertEqual(len(candidates), 1)
        self.assertTrue(candidates[0].open_set)
        result = scan_texts(
            candidates,
            docs,
            {"func.c": "if (f_cf8 == 99) return 1;"},
        )[0]
        self.assertEqual(result.status, "OBSERVED")
        self.assertEqual(result.documented, frozenset({0, 1, 2, 3, 4, 5, 7}))
        self.assertEqual(result.outside, ())

    def test_unparseable_candidate_does_not_stop_other_candidates(self):
        docs = {
            "broken.md": """
## Broken state

This is an open observed-value set.
confirmed values include no values;
""",
            "valid.md": """
## Valid state

```c
typedef enum ValidState { A = 0, B = 1 };
```
""",
        }
        results = scan_texts(
            discover_candidates(docs),
            docs,
            {"valid.c": "state == 2;"},
        )
        self.assertEqual(
            {result.status for result in results},
            {"UNPARSEABLE", "CHECKED"},
        )
        self.assertEqual(
            next(result for result in results if result.status == "UNPARSEABLE").error,
            "observed-value-set has no explicit values",
        )

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
