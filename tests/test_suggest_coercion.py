"""Unit tests for tools/suggest_coercion.py.

Brief 062. Pins:
  - objdiff JSON parser invariants (Insn / Argument shapes)
  - Each v0 rule's primary signature + confidence model
  - Sort stability (HIGH before MEDIUM before LOW; wall_id
    tiebreak)
  - Anchor-link drift protection (every shipped rule has a
    matching entry in _WALL_ANCHORS)

Synthetic objdiff JSONs are minimal — just enough to trigger the
rule's primary signature and exercise the confidence calculation.
End-to-end integration against historical decomper PRs is run by
the cloud author pre-push and recorded in the PR description; CI
keeps the unit-level pins.

Run locally:
    python -m unittest tests.test_suggest_coercion
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from suggest_coercion import (  # noqa: E402
    Argument,
    Insn,
    RULES,
    _CONFIDENCE_RANK,
    _WALL_ANCHORS,
    _detect_c1_pred_vs_branch,
    _detect_c15_mvn_vs_sub,
    _detect_c20_halfword_pack,
    _detect_p1_shift_pair_vs_mask,
    _detect_s1_uniform_offset_shift,
    _pair_by_address,
    parse_objdiff_json,
    suggest,
)


# --------------------------------------------------------------------------- #
# Helpers — build synthetic Insn objects
# --------------------------------------------------------------------------- #


def _reg(name: str) -> Argument:
    return Argument(register=name)


def _imm(v: int, signed: bool = False) -> Argument:
    return Argument(signed=v) if signed else Argument(unsigned=v)


def _insn(addr: int, mnemonic: str, formatted: str,
          *args: Argument) -> Insn:
    return Insn(
        address=addr, mnemonic=mnemonic, formatted=formatted,
        arguments=tuple(args),
    )


# --------------------------------------------------------------------------- #
# Parser tests
# --------------------------------------------------------------------------- #


class TestParseObjdiffJson(unittest.TestCase):
    def test_minimal_matched_function(self):
        # One section, one symbol, one trivial bx-lr instruction.
        doc = {
            "left": {"sections": [{
                "name": ".text", "kind": "SECTION_TEXT", "size": "4",
                "match_percent": 100.0,
                "symbols": [{
                    "symbol": {"name": "f", "size": "4", "flags": 0},
                    "instructions": [{
                        "instruction": {
                            "size": 4, "opcode": 0, "mnemonic": "bx",
                            "formatted": "bx lr",
                            "arguments": [
                                {"argument": {"opaque": "lr"}},
                            ],
                        },
                    }],
                }],
            }]},
            "right": {"sections": [{
                "name": ".text", "kind": "SECTION_TEXT", "size": "4",
                "match_percent": 100.0,
                "symbols": [{
                    "symbol": {"name": "f", "size": "4", "flags": 0},
                    "instructions": [{
                        "instruction": {
                            "size": 4, "opcode": 0, "mnemonic": "bx",
                            "formatted": "bx lr",
                            "arguments": [
                                {"argument": {"opaque": "lr"}},
                            ],
                        },
                    }],
                }],
            }]},
        }
        left, right, pct = parse_objdiff_json(doc)
        self.assertEqual(len(left), 1)
        self.assertEqual(len(right), 1)
        self.assertEqual(left[0].mnemonic, "bx")
        self.assertEqual(left[0].arguments[0].register, "lr")
        self.assertEqual(pct, 100.0)

    def test_immediate_and_signed_parsing(self):
        # An ldr with [r0, #signed] arg list.
        doc = {
            "left": {"sections": [{
                "name": ".text", "size": "4", "match_percent": 50.0,
                "symbols": [{
                    "symbol": {"name": "f", "size": "4", "flags": 0},
                    "instructions": [{
                        "instruction": {
                            "mnemonic": "ldr",
                            "formatted": "ldr r0, [r0, #0x28]",
                            "arguments": [
                                {"argument": {"opaque": "r0"}},
                                {"plain_text": ", "},
                                {"plain_text": "["},
                                {"argument": {"opaque": "r0"}},
                                {"plain_text": ", "},
                                {"plain_text": "#"},
                                {"argument": {"signed": "40"}},
                                {"plain_text": "]"},
                            ],
                        },
                    }],
                }],
            }]},
            "right": {"sections": []},
        }
        left, _, pct = parse_objdiff_json(doc)
        self.assertEqual(left[0].mnemonic, "ldr")
        self.assertEqual(left[0].regs(), ["r0", "r0"])
        self.assertEqual(left[0].imms(), [40])
        self.assertEqual(pct, 50.0)

    def test_address_parsing(self):
        # Address field is a string in objdiff JSON.
        doc = {
            "left": {"sections": [{
                "name": ".text", "size": "8",
                "symbols": [{
                    "symbol": {"name": "f", "size": "8", "flags": 0},
                    "instructions": [
                        {"instruction": {
                            "size": 4, "mnemonic": "mov",
                            "formatted": "mov r0, #1",
                            "arguments": [
                                {"argument": {"opaque": "r0"}},
                                {"plain_text": ", #"},
                                {"argument": {"unsigned": "1"}},
                            ],
                        }},
                        {"instruction": {
                            "address": "4", "size": 4, "mnemonic": "bx",
                            "formatted": "bx lr",
                            "arguments": [
                                {"argument": {"opaque": "lr"}},
                            ],
                        }},
                    ],
                }],
            }]},
            "right": {"sections": []},
        }
        left, _, _ = parse_objdiff_json(doc)
        self.assertEqual(left[0].address, 0)
        self.assertEqual(left[1].address, 4)

    def test_empty_diff(self):
        # No sections at all — parser shouldn't crash.
        left, right, pct = parse_objdiff_json({"left": {}, "right": {}})
        self.assertEqual(left, [])
        self.assertEqual(right, [])
        self.assertEqual(pct, 0.0)


class TestPairByAddress(unittest.TestCase):
    def test_aligned_streams(self):
        left = [_insn(0, "mov", "mov r0, #0"),
                _insn(4, "bx", "bx lr")]
        right = [_insn(0, "mov", "mov r0, #1"),
                 _insn(4, "bx", "bx lr")]
        pairs = _pair_by_address(left, right)
        self.assertEqual(len(pairs), 2)
        self.assertEqual(pairs[0][0].formatted, "mov r0, #0")
        self.assertEqual(pairs[0][1].formatted, "mov r0, #1")

    def test_misaligned_inserts_none(self):
        # Right has an extra insn at addr 8 (a branch back).
        left = [_insn(0, "mov", "mov r0, #0"),
                _insn(4, "bx", "bx lr")]
        right = [_insn(0, "mov", "mov r0, #0"),
                 _insn(4, "b", "b .L"),
                 _insn(8, "bx", "bx lr")]
        pairs = _pair_by_address(left, right)
        self.assertEqual(len(pairs), 3)
        # addr 8: left=None, right=bx
        self.assertIsNone(pairs[2][0])
        self.assertEqual(pairs[2][1].mnemonic, "bx")


# --------------------------------------------------------------------------- #
# Rule tests — C-15 (mvn vs sub)
# --------------------------------------------------------------------------- #


class TestRuleC15(unittest.TestCase):
    def _build_c15_diff(self) -> tuple[list[Insn], list[Insn]]:
        """Classic C-15 setup: 4-insn flat thunk.
        target:  ldr ip; mov r0, #0; mvn r1, #0; bx ip
        mwcc 2: ldr ip; mov r0, #0; sub r1, r0, #1; bx ip
        """
        left = [
            _insn(0, "ldr", "ldr ip, [pc, #4]",
                  _reg("ip"), _reg("pc"), _imm(4)),
            _insn(4, "mov", "mov r0, #0",
                  _reg("r0"), _imm(0)),
            _insn(8, "mvn", "mvn r1, #0",
                  _reg("r1"), _imm(0)),
            _insn(12, "bx", "bx ip", _reg("ip")),
        ]
        right = [
            _insn(0, "ldr", "ldr ip, [pc, #4]",
                  _reg("ip"), _reg("pc"), _imm(4)),
            _insn(4, "mov", "mov r0, #0",
                  _reg("r0"), _imm(0)),
            _insn(8, "sub", "sub r1, r0, #1",
                  _reg("r1"), _reg("r0"), _imm(1)),
            _insn(12, "bx", "bx ip", _reg("ip")),
        ]
        return left, right

    def test_primary_signature_fires(self):
        left, right = self._build_c15_diff()
        hit = _detect_c15_mvn_vs_sub(left, right)
        self.assertIsNotNone(hit)
        self.assertEqual(hit.wall_id, "C-15")

    def test_high_confidence_with_both_signals(self):
        # Setup-step (mov #0) + flat-thunk shape (≤8 insns ending bx).
        left, right = self._build_c15_diff()
        hit = _detect_c15_mvn_vs_sub(left, right)
        self.assertEqual(hit.confidence, "HIGH")

    def test_recipe_mentions_legacy_routing(self):
        left, right = self._build_c15_diff()
        hit = _detect_c15_mvn_vs_sub(left, right)
        self.assertIn("legacy", hit.recipe.lower())

    def test_no_fire_without_mvn_sub_pair(self):
        # Two mov ops at the same place — no mvn-vs-sub signal.
        left = [_insn(0, "mov", "mov r0, #1", _reg("r0"), _imm(1))]
        right = [_insn(0, "mov", "mov r0, #2", _reg("r0"), _imm(2))]
        self.assertIsNone(_detect_c15_mvn_vs_sub(left, right))


# --------------------------------------------------------------------------- #
# Rule tests — P-1 (lsl/lsr → and)
# --------------------------------------------------------------------------- #


class TestRuleP1(unittest.TestCase):
    def _build_p1_diff(self) -> tuple[list[Insn], list[Insn]]:
        """target: lsl r0, r0, #24; lsr r0, r0, #24; bx lr
        mwcc:   and r0, r0, #0xff; bx lr
        """
        left = [
            _insn(0, "mov", "mov r0, r0, lsl #0x18",
                  _reg("r0"), _reg("r0"), _reg("lsl"), _imm(24)),
            _insn(4, "mov", "mov r0, r0, lsr #0x18",
                  _reg("r0"), _reg("r0"), _reg("lsr"), _imm(24)),
            _insn(8, "bx", "bx lr", _reg("lr")),
        ]
        right = [
            _insn(0, "and", "and r0, r0, #0xff",
                  _reg("r0"), _reg("r0"), _imm(0xff)),
            _insn(4, "bx", "bx lr", _reg("lr")),
        ]
        return left, right

    def test_primary_signature_fires(self):
        left, right = self._build_p1_diff()
        hit = _detect_p1_shift_pair_vs_mask(left, right)
        self.assertIsNotNone(hit)
        self.assertEqual(hit.wall_id, "P-1")

    def test_high_confidence_with_matching_mask(self):
        left, right = self._build_p1_diff()
        hit = _detect_p1_shift_pair_vs_mask(left, right)
        # mask 0xff matches lsl 24 → 0xff expected mask AND
        # insn delta is 1 (3 vs 2).
        self.assertEqual(hit.confidence, "HIGH")

    def test_recipe_says_permanent(self):
        left, right = self._build_p1_diff()
        hit = _detect_p1_shift_pair_vs_mask(left, right)
        self.assertIn("PERMANENT", hit.recipe)

    def test_no_fire_on_mismatched_k(self):
        # lsl 24 / lsr 16 — different K, not the P-1 pattern.
        left = [
            _insn(0, "mov", "mov r0, r0, lsl #0x18",
                  _reg("r0"), _reg("r0"), _reg("lsl"), _imm(24)),
            _insn(4, "mov", "mov r0, r0, lsr #0x10",
                  _reg("r0"), _reg("r0"), _reg("lsr"), _imm(16)),
        ]
        right = [
            _insn(0, "and", "and r0, r0, #0xff",
                  _reg("r0"), _reg("r0"), _imm(0xff)),
        ]
        self.assertIsNone(_detect_p1_shift_pair_vs_mask(left, right))


# --------------------------------------------------------------------------- #
# Rule tests — S-1 (uniform offset shift)
# --------------------------------------------------------------------------- #


class TestRuleS1(unittest.TestCase):
    def _build_s1_diff(self, n_pairs: int, delta: int = 4):
        """n_pairs of ldr/str where right's offset is left's + delta."""
        left, right = [], []
        for i in range(n_pairs):
            addr = i * 4
            l_off = 0x10 + i * 4
            r_off = l_off + delta
            left.append(_insn(addr, "ldr",
                              f"ldr r{i}, [r0, #{l_off:#x}]",
                              _reg(f"r{i}"), _reg("r0"), _imm(l_off)))
            right.append(_insn(addr, "ldr",
                               f"ldr r{i}, [r0, #{r_off:#x}]",
                               _reg(f"r{i}"), _reg("r0"), _imm(r_off)))
        return left, right

    def test_three_pairs_minimum(self):
        # 2 pairs is below threshold → no fire.
        left, right = self._build_s1_diff(2)
        self.assertIsNone(_detect_s1_uniform_offset_shift(left, right))
        # 3 pairs fires.
        left, right = self._build_s1_diff(3)
        hit = _detect_s1_uniform_offset_shift(left, right)
        self.assertIsNotNone(hit)
        self.assertEqual(hit.wall_id, "S-1")

    def test_high_confidence_with_five_pairs_and_plus4(self):
        # ≥5 pairs + delta = 4 → both corroborating signals → HIGH.
        left, right = self._build_s1_diff(5, delta=4)
        hit = _detect_s1_uniform_offset_shift(left, right)
        self.assertEqual(hit.confidence, "HIGH")

    def test_medium_with_plus8_delta(self):
        # ≥5 pairs (corroborating #1) but delta != 4 (no #2).
        left, right = self._build_s1_diff(5, delta=8)
        hit = _detect_s1_uniform_offset_shift(left, right)
        self.assertEqual(hit.confidence, "MEDIUM")

    def test_no_fire_when_offsets_match(self):
        # delta=0 — no shift, no fire.
        left, right = self._build_s1_diff(5, delta=0)
        self.assertIsNone(_detect_s1_uniform_offset_shift(left, right))


# --------------------------------------------------------------------------- #
# Rule tests — C-20 (halfword pack)
# --------------------------------------------------------------------------- #


class TestRuleC20(unittest.TestCase):
    def test_primary_triplet_fires(self):
        left = [
            _insn(0, "mov", "mov r0, r1, lsl #0x10",
                  _reg("r0"), _reg("r1"), _reg("lsl"), _imm(16)),
            _insn(4, "orr", "orr r0, r0, r2",
                  _reg("r0"), _reg("r0"), _reg("r2")),
            _insn(8, "b", "b helper", Argument(label="helper")),
        ]
        right = [
            _insn(0, "mov", "mov r0, r1", _reg("r0"), _reg("r1")),
            _insn(4, "mov", "mov r3, r2", _reg("r3"), _reg("r2")),
            _insn(8, "bl", "bl helper", Argument(label="helper")),
            _insn(12, "bx", "bx lr", _reg("lr")),
        ]
        hit = _detect_c20_halfword_pack(left, right)
        self.assertIsNotNone(hit)
        self.assertEqual(hit.wall_id, "C-20")

    def test_no_fire_without_lsl_16(self):
        # lsl 8 — wrong shift count for halfword-pack.
        left = [
            _insn(0, "mov", "mov r0, r1, lsl #0x8",
                  _reg("r0"), _reg("r1"), _reg("lsl"), _imm(8)),
            _insn(4, "orr", "orr r0, r0, r2",
                  _reg("r0"), _reg("r0"), _reg("r2")),
            _insn(8, "b", "b helper"),
        ]
        right = [_insn(0, "mov", "mov r0, r1", _reg("r0"), _reg("r1"))]
        self.assertIsNone(_detect_c20_halfword_pack(left, right))


# --------------------------------------------------------------------------- #
# Rule tests — C-1 (pred-exec vs branch)
# --------------------------------------------------------------------------- #


class TestRuleC1(unittest.TestCase):
    def test_pred_left_vs_branchy_right_fires(self):
        # Target: predicated movs + predicated bx
        left = [
            _insn(0, "cmp", "cmp r0, #1",
                  _reg("r0"), _imm(1)),
            _insn(4, "moveq", "moveq r0, #2",
                  _reg("r0"), _imm(2)),
            _insn(8, "bxeq", "bxeq lr", _reg("lr")),
            _insn(12, "bx", "bx lr", _reg("lr")),
        ]
        # mwcc: cmp + bne + body + b .end + .L + body + .end + bx lr
        right = [
            _insn(0, "cmp", "cmp r0, #1",
                  _reg("r0"), _imm(1)),
            _insn(4, "bne", "bne .L", Argument(label=".L")),
            _insn(8, "mov", "mov r0, #2",
                  _reg("r0"), _imm(2)),
            _insn(12, "bx", "bx lr", _reg("lr")),
        ]
        hit = _detect_c1_pred_vs_branch(left, right)
        self.assertIsNotNone(hit)
        self.assertEqual(hit.wall_id, "C-1")
        # 2 pred ops + right longer + ≤3 pred ops → HIGH
        self.assertIn(hit.confidence, ("HIGH", "MEDIUM"))

    def test_no_fire_without_predicated_left(self):
        # Both sides are branchy — no C-1 signal.
        left = [_insn(0, "b", "b .L", Argument(label=".L"))]
        right = [_insn(0, "b", "b .L", Argument(label=".L"))]
        self.assertIsNone(_detect_c1_pred_vs_branch(left, right))


# --------------------------------------------------------------------------- #
# Engine tests — suggest() ordering, dedup, sort stability
# --------------------------------------------------------------------------- #


class TestSuggest(unittest.TestCase):
    def test_no_hits_empty_diff(self):
        self.assertEqual(suggest([], []), [])

    def test_high_before_medium(self):
        # Build a diff that fires both C-15 (HIGH) and S-1 (MEDIUM)
        # — by stacking the C-15 mvn/sub pair AND a +4 offset shift.
        left = [
            _insn(0, "ldr", "ldr ip, [pc, #4]",
                  _reg("ip"), _reg("pc"), _imm(4)),
            _insn(4, "mov", "mov r0, #0",
                  _reg("r0"), _imm(0)),
            _insn(8, "mvn", "mvn r1, #0", _reg("r1"), _imm(0)),
            _insn(12, "ldr", "ldr r2, [r0, #0x10]",
                  _reg("r2"), _reg("r0"), _imm(0x10)),
            _insn(16, "ldr", "ldr r3, [r0, #0x14]",
                  _reg("r3"), _reg("r0"), _imm(0x14)),
            _insn(20, "ldr", "ldr r4, [r0, #0x18]",
                  _reg("r4"), _reg("r0"), _imm(0x18)),
            _insn(24, "bx", "bx ip", _reg("ip")),
        ]
        right = [
            _insn(0, "ldr", "ldr ip, [pc, #4]",
                  _reg("ip"), _reg("pc"), _imm(4)),
            _insn(4, "mov", "mov r0, #0", _reg("r0"), _imm(0)),
            _insn(8, "sub", "sub r1, r0, #1",
                  _reg("r1"), _reg("r0"), _imm(1)),
            _insn(12, "ldr", "ldr r2, [r0, #0x18]",
                   _reg("r2"), _reg("r0"), _imm(0x18)),
            _insn(16, "ldr", "ldr r3, [r0, #0x1c]",
                   _reg("r3"), _reg("r0"), _imm(0x1c)),
            _insn(20, "ldr", "ldr r4, [r0, #0x20]",
                   _reg("r4"), _reg("r0"), _imm(0x20)),
            _insn(24, "bx", "bx ip", _reg("ip")),
        ]
        hits = suggest(left, right)
        self.assertGreaterEqual(len(hits), 2)
        # HIGH first, MEDIUM (or LOW) after.
        self.assertEqual(hits[0].confidence, "HIGH")
        for h_a, h_b in zip(hits, hits[1:], strict=False):
            self.assertGreaterEqual(
                _CONFIDENCE_RANK[h_a.confidence],
                _CONFIDENCE_RANK[h_b.confidence],
            )


# --------------------------------------------------------------------------- #
# Drift protection — every shipped rule has an anchor entry
# --------------------------------------------------------------------------- #


class TestAnchorsPresent(unittest.TestCase):
    def test_every_rule_has_anchor(self):
        for r in RULES:
            self.assertIn(r.wall_id, _WALL_ANCHORS,
                          f"Rule {r.wall_id} missing from _WALL_ANCHORS")
            self.assertEqual(r.anchor, _WALL_ANCHORS[r.wall_id])
            self.assertTrue(r.anchor.startswith(
                "docs/research/codegen-walls.md#"))

    def test_anchor_set_covers_walls_referenced_in_recipes(self):
        # P-6 is referenced in C-1's recipe as a related wall.
        # Make sure P-6's anchor is in the table even if no rule
        # targets it directly.
        self.assertIn("P-6", _WALL_ANCHORS)


class TestRulesContractPresent(unittest.TestCase):
    """All Rule entries are well-formed. Catches typos like a
    rule whose detect_fn returns the wrong wall_id."""

    def test_each_rule_wallid_matches_detect_fn_output(self):
        # Run each rule against an empty diff. None should fire,
        # but if any *does* fire, its wall_id must match the Rule's
        # wall_id.
        for r in RULES:
            hit = r.detect_fn([], [])
            if hit is not None:
                self.assertEqual(hit.wall_id, r.wall_id)


# --------------------------------------------------------------------------- #
# CLI smoke test — JSON parse path end-to-end
# --------------------------------------------------------------------------- #


class TestCLIStdinFlow(unittest.TestCase):
    def test_parse_real_objdiff_json_format(self):
        # Mimics the real objdiff output schema exactly. The
        # left and right sections are identical (matched function),
        # so no walls should fire.
        doc = {
            "left": {"sections": [{
                "name": ".text", "kind": "SECTION_TEXT",
                "size": "16", "match_percent": 100.0,
                "symbols": [{
                    "symbol": {"name": "f", "size": "16", "flags": 1},
                    "instructions": [
                        {"instruction": {
                            "size": 4, "mnemonic": "mov",
                            "formatted": "mov r0, #1",
                            "arguments": [
                                {"argument": {"opaque": "r0"}},
                                {"plain_text": ", #"},
                                {"argument": {"unsigned": "1"}},
                            ],
                        }},
                        {"instruction": {
                            "address": "4", "size": 4,
                            "mnemonic": "bx",
                            "formatted": "bx lr",
                            "arguments": [
                                {"argument": {"opaque": "lr"}},
                            ],
                        }},
                    ],
                }],
            }]},
            "right": {"sections": [{
                "name": ".text", "kind": "SECTION_TEXT",
                "size": "16", "match_percent": 100.0,
                "symbols": [{
                    "symbol": {"name": "f", "size": "16", "flags": 1},
                    "instructions": [
                        {"instruction": {
                            "size": 4, "mnemonic": "mov",
                            "formatted": "mov r0, #1",
                            "arguments": [
                                {"argument": {"opaque": "r0"}},
                                {"plain_text": ", #"},
                                {"argument": {"unsigned": "1"}},
                            ],
                        }},
                        {"instruction": {
                            "address": "4", "size": 4,
                            "mnemonic": "bx",
                            "formatted": "bx lr",
                            "arguments": [
                                {"argument": {"opaque": "lr"}},
                            ],
                        }},
                    ],
                }],
            }]},
        }
        left, right, pct = parse_objdiff_json(doc)
        self.assertEqual(pct, 100.0)
        self.assertEqual(suggest(left, right), [])


if __name__ == "__main__":
    unittest.main()
