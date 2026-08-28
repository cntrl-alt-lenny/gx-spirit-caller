"""Regression tests for tools/fingerprint_signal_evidence.py
(q-fingerprint-promotion-evidence)."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from fingerprint_signal_evidence import (  # noqa: E402
    call_graph_signal,
    cross_region_agreement_signal,
    dedupe_known_correct,
    exact_name_signal,
    function_targets,
    verified_neighbor_signal,
)


class _FakeFunc:
    __slots__ = ("addr", "size", "name", "module", "rank")

    def __init__(self, addr, name="", module="main", size=0x20, rank=0):
        self.addr = addr
        self.size = size
        self.name = name
        self.module = module
        self.rank = rank


class TestFunctionTargets(unittest.TestCase):
    def test_collects_only_requested_kinds_within_range(self):
        full_relocs = {"main": {
            0x1000: [("arm_call", 0x2000, "main")],
            0x1004: [("load", 0x3000, "main")],
            0x1010: [("arm_call", 0x4000, "main")],  # outside [0x1000,0x1008)
        }}
        out = function_targets("main", 0x1000, 0x8, full_relocs, ("arm_call",))
        self.assertEqual(out, {("main", 0x2000)})

    def test_both_kinds_combined(self):
        full_relocs = {"main": {
            0x1000: [("arm_call", 0x2000, "main")],
            0x1004: [("load", 0x3000, "main")],
        }}
        out = function_targets("main", 0x1000, 0x8, full_relocs,
                                ("arm_call", "load"))
        self.assertEqual(out, {("main", 0x2000), ("main", 0x3000)})

    def test_kind_not_requested_is_excluded(self):
        full_relocs = {"main": {0x1000: [("load", 0x3000, "main")]}}
        out = function_targets("main", 0x1000, 0x8, full_relocs, ("arm_call",))
        self.assertEqual(out, set())

    def test_empty_module_returns_empty_set(self):
        out = function_targets("ov099", 0x1000, 0x8, {}, ("arm_call",))
        self.assertEqual(out, set())


class TestDedupeKnownCorrect(unittest.TestCase):
    def _row(self, region, mod, eur_addr, tgt_addr):
        return {"region": region, "eur_module": mod, "eur_addr": eur_addr,
                "tgt_addr": tgt_addr}

    def test_exact_duplicate_rows_collapse_to_one(self):
        rows = [self._row("usa", "main", 0x1000, 0x2000),
                self._row("usa", "main", 0x1000, 0x2000)]
        clean, dropped = dedupe_known_correct(rows)
        self.assertEqual(len(clean), 1)
        self.assertEqual(dropped, [])

    def test_two_eur_addrs_claiming_same_target_are_both_dropped(self):
        rows = [self._row("usa", "main", 0x1000, 0x2000),
                self._row("usa", "main", 0x1010, 0x2000)]
        clean, dropped = dedupe_known_correct(rows)
        self.assertEqual(clean, [])
        self.assertEqual(len(dropped), 2)

    def test_distinct_targets_are_not_collisions(self):
        rows = [self._row("usa", "main", 0x1000, 0x2000),
                self._row("usa", "main", 0x1010, 0x2010)]
        clean, dropped = dedupe_known_correct(rows)
        self.assertEqual(len(clean), 2)
        self.assertEqual(dropped, [])

    def test_collision_is_scoped_per_region(self):
        # Same target address in DIFFERENT regions is not a collision --
        # each region's mapping is independent.
        rows = [self._row("usa", "main", 0x1000, 0x2000),
                self._row("jpn", "main", 0x1010, 0x2000)]
        clean, dropped = dedupe_known_correct(rows)
        self.assertEqual(len(clean), 2)
        self.assertEqual(dropped, [])

    def test_empty_input(self):
        self.assertEqual(dedupe_known_correct([]), ([], []))


class TestCallGraphSignal(unittest.TestCase):
    def test_abstains_with_no_verified_targets(self):
        result = call_graph_signal(
            eur_targets={("main", 0x9000)},
            candidates=[("main", 0x100), ("main", 0x200)],
            verified_region_target_index={},  # nothing verified
            candidate_target_fn=lambda mod, addr: set(),
        )
        self.assertIsNone(result["predicted"])
        self.assertEqual(result["evidence_count"], 0)

    def test_unique_candidate_matching_verified_callee_wins(self):
        # EUR calls 0x9000, which we independently know ports to 0x5000.
        # Only candidate B's own call set includes 0x5000.
        verified_index = {("main", 0x9000): 0x5000}

        def cand_targets(mod, addr):
            if addr == 0x200:
                return {("main", 0x5000)}
            return {("main", 0x6000)}

        result = call_graph_signal(
            eur_targets={("main", 0x9000)},
            candidates=[("main", 0x100), ("main", 0x200)],
            verified_region_target_index=verified_index,
            candidate_target_fn=cand_targets,
        )
        self.assertEqual(result["predicted"], ("main", 0x200))
        self.assertEqual(result["evidence_count"], 1)

    def test_tied_candidates_abstain(self):
        verified_index = {("main", 0x9000): 0x5000}

        def cand_targets(mod, addr):
            return {("main", 0x5000)}  # both candidates match equally

        result = call_graph_signal(
            eur_targets={("main", 0x9000)},
            candidates=[("main", 0x100), ("main", 0x200)],
            verified_region_target_index=verified_index,
            candidate_target_fn=cand_targets,
        )
        self.assertIsNone(result["predicted"])
        self.assertTrue(result["tied"])

    def test_unverified_eur_target_never_counted_as_evidence(self):
        # The EUR target has no verified mapping -- must not silently
        # compare the raw EUR address against candidate targets.
        def cand_targets(mod, addr):
            return {("main", 0x9000)}  # coincidentally equals the EUR addr

        result = call_graph_signal(
            eur_targets={("main", 0x9000)},
            candidates=[("main", 0x100)],
            verified_region_target_index={},
            candidate_target_fn=cand_targets,
        )
        self.assertIsNone(result["predicted"])
        self.assertEqual(result["verified_eur_targets"], 0)


class TestVerifiedNeighborSignal(unittest.TestCase):
    def _eur_sorted(self):
        addrs = [0x1000, 0x1040, 0x1080, 0x10c0, 0x1100, 0x1140, 0x1154, 0x1180]
        return [_FakeFunc(addr=a, rank=i) for i, a in enumerate(addrs)]

    def test_consensus_shift_predicts_target(self):
        eur_sorted = self._eur_sorted()
        # 3 verified neighbors all shift by +8, nothing for the pivot itself.
        verified = {
            ("main", 0x1000): 0x1008,
            ("main", 0x1040): 0x1048,
            ("main", 0x1080): 0x1088,
        }
        pred, shifts = verified_neighbor_signal(
            "main", 0x10c0, eur_sorted, verified,
            n_neighbors=3, min_agreement=3,
        )
        self.assertEqual(pred, 0x10c8)
        self.assertEqual(len(shifts), 3)

    def test_no_consensus_below_min_agreement_abstains(self):
        eur_sorted = self._eur_sorted()
        verified = {("main", 0x1000): 0x1008}  # only 1 sample
        pred, shifts = verified_neighbor_signal(
            "main", 0x10c0, eur_sorted, verified,
            n_neighbors=5, min_agreement=3,
        )
        self.assertIsNone(pred)

    def test_disagreeing_shifts_abstain(self):
        eur_sorted = self._eur_sorted()
        verified = {
            ("main", 0x1000): 0x1008,
            ("main", 0x1040): 0x1050,   # different shift
            ("main", 0x1080): 0x10a0,   # different shift again
        }
        pred, shifts = verified_neighbor_signal(
            "main", 0x10c0, eur_sorted, verified,
            n_neighbors=3, min_agreement=3,
        )
        self.assertIsNone(pred)

    def test_pivot_not_found_abstains(self):
        eur_sorted = self._eur_sorted()
        pred, shifts = verified_neighbor_signal(
            "main", 0xdeadbeef, eur_sorted, {},
        )
        self.assertIsNone(pred)
        self.assertEqual(shifts, [])

    def test_only_same_module_neighbors_considered(self):
        # verified_region_index keys are (module, addr) -- a same-address
        # entry under a DIFFERENT module must not be picked up.
        eur_sorted = self._eur_sorted()
        verified = {("ov002", 0x1000): 0x9999}
        pred, shifts = verified_neighbor_signal(
            "main", 0x10c0, eur_sorted, verified, min_agreement=1,
        )
        self.assertIsNone(pred)
        self.assertEqual(shifts, [])


class TestExactNameSignal(unittest.TestCase):
    def test_placeholder_name_abstains(self):
        self.assertIsNone(exact_name_signal("func_02001000", {"func_02001000": 0x1}))

    def test_named_symbol_found(self):
        self.assertEqual(exact_name_signal("OS_DisableIrq", {"OS_DisableIrq": 0x020936bc}),
                          0x020936bc)

    def test_named_symbol_not_found_abstains(self):
        self.assertIsNone(exact_name_signal("SomeNewName", {"OtherName": 0x1}))

    def test_overlay_placeholder_form_abstains(self):
        self.assertIsNone(exact_name_signal("func_ov002_021b3c10", {}))


class TestCrossRegionAgreementSignal(unittest.TestCase):
    def test_same_shift_agrees(self):
        # Both subtract the SAME eur_addr, so "same shift" requires the
        # two target addresses to be numerically equal (USA/JPN commonly
        # do share addresses for shared main-module code in this project).
        self.assertEqual(
            cross_region_agreement_signal(0x2008, 0x2008, 0x1000), "agree")

    def test_different_shift_disagrees(self):
        self.assertEqual(
            cross_region_agreement_signal(0x2008, 0x3010, 0x1000), "disagree")

    def test_missing_usa_is_unavailable(self):
        self.assertEqual(
            cross_region_agreement_signal(None, 0x3008, 0x1000), "unavailable")

    def test_missing_jpn_is_unavailable(self):
        self.assertEqual(
            cross_region_agreement_signal(0x2008, None, 0x1000), "unavailable")


if __name__ == "__main__":
    unittest.main()
