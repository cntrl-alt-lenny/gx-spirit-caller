"""Regression tests for tools/port_refusal_taxonomy.py (q-port-refusal-taxonomy)."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from port_refusal_taxonomy import (  # noqa: E402
    aggregate_blockers,
    classify_candidate,
    reason_class,
    sole_cause_rollup,
)


def _blocker(text="func_02006e54", kind="func", module="main",
             addr="0x02006e54", confidence="MEDIUM", notes=""):
    return {"text": text, "kind": kind, "module": module, "addr": addr,
            "confidence": confidence, "notes": notes}


class TestReasonClass(unittest.TestCase):
    def test_placeholder_twin(self):
        b = _blocker(confidence="NONE", notes=(
            "EUR-only named function Copy32 has placeholder target twin "
            "func_020943f8; propagate the rename before porting"))
        self.assertEqual(reason_class(b), "placeholder-twin")

    def test_cross_region_alias(self):
        b = _blocker(kind="data", confidence="NONE",
                      notes="refused: cross-region alias at 0x0219a8e4")
        self.assertEqual(reason_class(b), "cross-region-alias-refused")

    def test_data_kind_always_data_unresolved(self):
        b = _blocker(kind="data", confidence="NONE",
                      notes="no usa/main data symbol at 0x0219a924 "
                            "(parallel-reloc map didn't cover this address)")
        self.assertEqual(reason_class(b), "data-unresolved-other")

    def test_medium_promoted_still_below_high(self):
        b = _blocker(confidence="MEDIUM", notes=(
            "size+ish match, no relocs to compare | D2 v2 auto-promoted "
            "LOW→MEDIUM (neighbor consensus shift=-0xf4 from 5 HIGH "
            "neighbors)"))
        self.assertEqual(reason_class(b), "func-medium-promoted-still-below-high")

    def test_low_anti_matched(self):
        b = _blocker(confidence="LOW", notes=(
            "size+ish match, no relocs to compare | D2 v2 anti-match: "
            "candidate shift -0xf4 ≠ consensus -0x1c from 5 HIGH "
            "neighbors (kept LOW)"))
        self.assertEqual(reason_class(b), "func-low-anti-matched")

    def test_low_no_consensus(self):
        b = _blocker(confidence="LOW", notes=(
            "size+ish match, no relocs to compare | D2 v2: no neighbor "
            "consensus (sampled 2 HIGH neighbors, need ≥3 agreement)"))
        self.assertEqual(reason_class(b), "func-low-no-consensus")

    def test_no_candidate_at_all(self):
        b = _blocker(confidence="NONE", notes="no candidate in usa/ov006")
        self.assertEqual(reason_class(b), "func-no-candidate-at-all")

    def test_no_eur_symbol(self):
        b = _blocker(confidence="NONE", notes=(
            "no EUR symbol at main/0x0202a1ec — may be a renamed symbol "
            "(not yet supported by v1)"))
        self.assertEqual(reason_class(b), "func-no-eur-symbol")

    def test_unrecognized_notes_fall_back_to_confidence_bucket(self):
        b = _blocker(confidence="MEDIUM", notes="reloc bag Jaccard 1.00 | byte-sim=0.998")
        self.assertEqual(reason_class(b), "other/MEDIUM")


class TestAggregateBlockers(unittest.TestCase):
    def test_sole_blocker_counts_separately_from_total(self):
        refused = [
            {"tgt": "func_a", "size": 100,
             "blockers": [_blocker(text="X", addr="0x1000")]},
            {"tgt": "func_b", "size": 50,
             "blockers": [_blocker(text="X", addr="0x1000"),
                          _blocker(text="Y", addr="0x2000")]},
        ]
        ranked = aggregate_blockers(refused)
        by_text = {r["text"]: r for r in ranked}
        # X is the sole blocker for func_a (100B) and a co-blocker for
        # func_b -- sole should count only func_a, total should count both.
        self.assertEqual(by_text["X"]["sole_candidates"], 1)
        self.assertEqual(by_text["X"]["sole_bytes"], 100)
        self.assertEqual(by_text["X"]["total_candidates"], 2)
        self.assertEqual(by_text["X"]["total_bytes"], 150)
        # Y never appears alone.
        self.assertEqual(by_text["Y"]["sole_candidates"], 0)
        self.assertEqual(by_text["Y"]["sole_bytes"], 0)
        self.assertEqual(by_text["Y"]["total_candidates"], 1)

    def test_ranked_by_sole_bytes_then_total_bytes(self):
        refused = [
            {"tgt": "a", "size": 500, "blockers": [_blocker(text="BIG", addr="0x1")]},
            {"tgt": "b", "size": 10, "blockers": [_blocker(text="small", addr="0x2")]},
        ]
        ranked = aggregate_blockers(refused)
        self.assertEqual([r["text"] for r in ranked], ["BIG", "small"])

    def test_duplicate_key_within_one_candidate_not_double_counted(self):
        # Same (kind, module, addr) appearing twice for one candidate
        # (shouldn't happen given port_to_region's ref dedup, but the
        # aggregator must not double-count bytes/candidates if it does).
        refused = [{"tgt": "a", "size": 40, "blockers": [
            _blocker(text="X", addr="0x1000"),
            _blocker(text="X", addr="0x1000"),
        ]}]
        ranked = aggregate_blockers(refused)
        self.assertEqual(len(ranked), 1)
        self.assertEqual(ranked[0]["total_candidates"], 1)
        self.assertEqual(ranked[0]["total_bytes"], 40)

    def test_empty_input(self):
        self.assertEqual(aggregate_blockers([]), [])


class TestSoleCauseRollup(unittest.TestCase):
    def test_only_single_blocker_candidates_counted(self):
        refused = [
            {"tgt": "a", "size": 100, "blockers": [
                _blocker(confidence="MEDIUM", notes="D2 v2 auto-promoted LOW→MEDIUM")]},
            {"tgt": "b", "size": 30, "blockers": [
                _blocker(addr="0x1"), _blocker(addr="0x2")]},
        ]
        rollup = sole_cause_rollup(refused)
        self.assertEqual(
            rollup["func-medium-promoted-still-below-high"],
            {"candidates": 1, "bytes": 100},
        )
        # candidate "b" has 2 blockers -- excluded from every bucket.
        self.assertEqual(sum(v["candidates"] for v in rollup.values()), 1)


# --------------------------------------------------------------------------- #
# classify_candidate: light integration test with fake regions               #
# --------------------------------------------------------------------------- #

class _FakeFunc:
    __slots__ = ("addr", "size", "name", "module", "rank")

    def __init__(self, addr, name="", module="main", size=0x20, rank=0):
        self.addr = addr
        self.size = size
        self.name = name
        self.module = module
        self.rank = rank


class _FakeMatch:
    __slots__ = ("func", "confidence", "score", "rationale")

    def __init__(self, func, confidence, score=0.5, rationale=""):
        self.func = func
        self.confidence = confidence
        self.score = score
        self.rationale = rationale


def _make_find_siblings_fn(matches):
    def _fn(eur_func, target_regions, *, max_results=1, source_region="eur",
            target_region_name=None, byte_disambiguate=True):
        m = matches.get(eur_func.addr)
        return [m] if m is not None else []
    return _fn


class TestClassifyCandidate(unittest.TestCase):
    def _entry(self, eur_addr=0x02001000, tgt="func_02001000", size=40):
        return {
            "eur": "src/main/func_02001000.c", "module": "main",
            "eur_addr": f"0x{eur_addr:08x}", "tgt": tgt,
            "tgt_addr": f"0x{eur_addr:08x}", "byte_sim": 1.0, "size": size,
        }

    def test_all_high_resolves_clear(self):
        eur = {"main": [_FakeFunc(addr=0x02001000)]}
        target = {"main": [_FakeFunc(addr=0x02001000, name="func_02001000")]}
        matches = {0x02001000: _FakeMatch(
            _FakeFunc(addr=0x02001000, name="func_02001000"), "HIGH")}
        fn = _make_find_siblings_fn(matches)
        result = classify_candidate(
            self._entry(), "int func_02001000(void) { return 1; }\n",
            "usa", eur, target, {}, {}, {}, {}, {}, fn,
        )
        self.assertEqual(result["status"], "clear")
        self.assertEqual(result["blockers"], [])

    def test_medium_confidence_callee_refuses_floor(self):
        eur = {"main": [
            _FakeFunc(addr=0x02001000),
            _FakeFunc(addr=0x02006e54),
        ]}
        target = {"main": [
            _FakeFunc(addr=0x02001000, name="func_02001000"),
            _FakeFunc(addr=0x02006e5c, name="func_02006e5c"),
        ]}
        matches = {
            0x02001000: _FakeMatch(
                _FakeFunc(addr=0x02001000, name="func_02001000"), "HIGH"),
            0x02006e54: _FakeMatch(
                _FakeFunc(addr=0x02006e5c, name="func_02006e5c"), "MEDIUM",
                rationale="size+ish match, no relocs to compare"),
        }
        fn = _make_find_siblings_fn(matches)
        source = "int func_02001000(void) { return func_02006e54(); }\n"
        result = classify_candidate(
            self._entry(), source, "usa", eur, target, {}, {}, {}, {}, {}, fn,
        )
        self.assertEqual(result["status"], "refused-floor")
        self.assertEqual(len(result["blockers"]), 1)
        self.assertEqual(result["blockers"][0]["text"], "func_02006e54")
        self.assertEqual(result["blockers"][0]["confidence"], "MEDIUM")

    def test_placeholder_twin_named_extern_refuses_floor(self):
        eur = {"main": [
            _FakeFunc(addr=0x02001000),
            _FakeFunc(addr=0x02006e54, name="Copy32"),
        ]}
        target = {"main": [
            _FakeFunc(addr=0x02001000, name="func_02001000"),
            _FakeFunc(addr=0x02006e5c, name="func_02006e5c"),
        ]}
        matches = {
            0x02001000: _FakeMatch(
                _FakeFunc(addr=0x02001000, name="func_02001000"), "HIGH"),
            0x02006e54: _FakeMatch(
                _FakeFunc(addr=0x02006e5c, name="func_02006e5c"), "HIGH"),
        }
        fn = _make_find_siblings_fn(matches)
        named_functions = {"Copy32": ("main", 0x02006e54)}
        source = (
            "extern void Copy32(void *dst, void *src, int n);\n"
            "int func_02001000(void) { Copy32(0, 0, 0); return 1; }\n"
        )
        result = classify_candidate(
            self._entry(), source, "usa", eur, target, {}, {}, {}, {},
            named_functions, fn,
        )
        self.assertEqual(result["status"], "refused-floor")
        blocker = next(b for b in result["blockers"] if b["text"] == "Copy32")
        self.assertEqual(blocker["confidence"], "NONE")
        self.assertIn("placeholder target twin", blocker["notes"])


if __name__ == "__main__":
    unittest.main()
