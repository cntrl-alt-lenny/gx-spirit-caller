"""Unit tests for tools/bulk_rename_candidates.py.

The tool surfaces bulk-rename candidates from an anchor. Regressions
would either:
  - Miss real siblings (false negative — decomper does N renames as
    N separate PRs)
  - Surface unrelated placeholders (noise in the PR planning step)

Pins:

  - `_jaccard` boundaries (empty sets, identical sets, disjoint)
  - `_size_similarity` ratio math + zero-size guard
  - `score_candidate` weighted sum: caller-jaccard + size + adjacency
  - `find_candidates` filters:
    - skips the anchor itself
    - skips already-named symbols (only placeholders are renamable)
    - skips matched symbols (already-done TU)
    - skips zero-size (_unk placeholders)
    - same-module default / --cross-module override
    - min_score floor
  - Sort: score desc, size asc, addr asc (deterministic)
  - JSON renderer: schema round-trip
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    Symbol,
)
from bulk_rename_candidates import (  # noqa: E402
    ADJACENCY_BONUS_WINDOW,
    _jaccard,
    _size_similarity,
    find_candidates,
    render_json,
    render_text_report,
    score_candidate,
)


def _sym(
    module: str, addr: int, *,
    name: str | None = None, size: int = 0x20,
) -> Symbol:
    if name is None:
        name = f"func_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="function", mode="arm",
    )


def _module(name: str, syms: list[Symbol]) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(syms)
    md.by_addr = {s.addr: s for s in syms}
    md.by_addr_sorted = sorted(syms, key=lambda s: s.addr)
    return md


class TestJaccard(unittest.TestCase):
    def test_identical_sets_is_one(self):
        a = frozenset({("main", 0x1), ("main", 0x2)})
        self.assertEqual(_jaccard(a, a), 1.0)

    def test_disjoint_sets_is_zero(self):
        a = frozenset({("main", 0x1)})
        b = frozenset({("main", 0x2)})
        self.assertEqual(_jaccard(a, b), 0.0)

    def test_partial_overlap(self):
        a = frozenset({("main", 0x1), ("main", 0x2)})
        b = frozenset({("main", 0x2), ("main", 0x3)})
        # |a ∩ b| = 1, |a ∪ b| = 3 → 1/3
        self.assertAlmostEqual(_jaccard(a, b), 1 / 3, places=4)

    def test_empty_and_empty_is_zero(self):
        # Both empty — undefined in pure math, but our contract is
        # 0.0 (no signal).
        self.assertEqual(_jaccard(frozenset(), frozenset()), 0.0)

    def test_empty_with_nonempty_is_zero(self):
        a = frozenset({("main", 0x1)})
        self.assertEqual(_jaccard(a, frozenset()), 0.0)


class TestSizeSimilarity(unittest.TestCase):
    def test_exact_match_is_one(self):
        self.assertEqual(_size_similarity(0x20, 0x20), 1.0)

    def test_double_is_half(self):
        self.assertEqual(_size_similarity(0x20, 0x40), 0.5)

    def test_zero_size_is_zero(self):
        # Size-0 symbols shouldn't reach the scorer, but guard
        # defensively — zero would blow up min/max math.
        self.assertEqual(_size_similarity(0, 0x20), 0.0)
        self.assertEqual(_size_similarity(0x20, 0), 0.0)


class TestScoreCandidate(unittest.TestCase):
    def test_identical_all_signals_maxes_at_one(self):
        # Identical caller-set + size + reloc-sig + adjacent →
        # score = 0.50 + 0.20 + 0.20 + 0.10 = 1.0.
        anchor = _sym("main", 0x1000)
        cand = _sym("main", 0x2000)  # different addr, same size
        callers = frozenset({("main", 0x5000), ("main", 0x6000)})
        sig = ((0x8, "arm_call"), (0x10, "load"))
        score, jac, reloc_jac, sz, adj, shared = score_candidate(
            anchor, callers, cand, callers, sig, sig,
        )
        self.assertAlmostEqual(jac, 1.0)
        self.assertAlmostEqual(reloc_jac, 1.0)
        self.assertAlmostEqual(sz, 1.0)
        self.assertTrue(adj)
        self.assertAlmostEqual(score, 1.0, places=4)
        self.assertEqual(shared, callers)

    def test_identical_callers_and_size_no_reloc_sig(self):
        # Pre-reloc-sig pin: when both sides have no relocs, score
        # caps at caller + size + adjacency = 0.80 (the 0.20 reloc
        # weight contributes 0).
        anchor = _sym("main", 0x1000)
        cand = _sym("main", 0x2000)
        callers = frozenset({("main", 0x5000), ("main", 0x6000)})
        score, jac, reloc_jac, sz, adj, shared = score_candidate(
            anchor, callers, cand, callers,
        )
        self.assertAlmostEqual(jac, 1.0)
        self.assertAlmostEqual(reloc_jac, 0.0)
        self.assertAlmostEqual(sz, 1.0)
        self.assertTrue(adj)
        # 0.50 + 0.0 + 0.20 + 0.10 = 0.80
        self.assertAlmostEqual(score, 0.80, places=4)

    def test_no_caller_overlap_but_similar_size(self):
        anchor = _sym("main", 0x1000, size=0x20)
        cand = _sym("main", 0x2000, size=0x20)
        a_callers = frozenset({("main", 0x5000)})
        c_callers = frozenset({("main", 0x6000)})
        score, jac, reloc_jac, sz, adj, shared = score_candidate(
            anchor, a_callers, cand, c_callers,
        )
        self.assertEqual(jac, 0.0)
        self.assertEqual(reloc_jac, 0.0)
        self.assertEqual(sz, 1.0)
        self.assertTrue(adj)
        # 0 + 0 + 0.20 + 0.10 = 0.30
        self.assertAlmostEqual(score, 0.30, places=4)
        self.assertEqual(shared, frozenset())

    def test_reloc_sig_discriminates_tie(self):
        # Two candidates with matching caller + size + adjacency,
        # differing only in reloc-sig. The reloc-matching candidate
        # scores +0.20 over the one that mismatches.
        anchor = _sym("main", 0x1000)
        cand = _sym("main", 0x2000)
        callers = frozenset({("main", 0x5000)})
        matching_sig = ((0x8, "arm_call"),)
        mismatch_sig = ((0x8, "load"),)

        score_match, *_ = score_candidate(
            anchor, callers, cand, callers,
            matching_sig, matching_sig,
        )
        score_miss, *_ = score_candidate(
            anchor, callers, cand, callers,
            matching_sig, mismatch_sig,
        )
        self.assertGreater(score_match, score_miss)
        # Delta = full reloc weight (0.20).
        self.assertAlmostEqual(score_match - score_miss, 0.20, places=4)

    def test_empty_reloc_sig_no_signal(self):
        # Anchor has relocs; candidate is a leaf (no relocs). The
        # reloc-sig dimension contributes 0 — not -1, not 1 —
        # because leaves don't carry body-shape evidence either way.
        anchor = _sym("main", 0x1000)
        cand = _sym("main", 0x2000)
        callers = frozenset({("main", 0x5000)})
        _score, _jac, reloc_jac, _sz, _adj, _ = score_candidate(
            anchor, callers, cand, callers,
            ((0x8, "arm_call"),), (),
        )
        self.assertEqual(reloc_jac, 0.0)

    def test_adjacency_threshold_inclusive(self):
        # Exactly at the window threshold → still adjacent.
        anchor = _sym("main", 0x1000)
        cand = _sym("main", 0x1000 + ADJACENCY_BONUS_WINDOW)
        _s, _j, _r, _sz, adj, _ = score_candidate(
            anchor, frozenset(), cand, frozenset(),
        )
        self.assertTrue(adj)

    def test_adjacency_crossmodule_never_bonus(self):
        # Adjacency is within-module only; cross-module never
        # qualifies for the bonus (addresses overlap by accident).
        anchor = _sym("main", 0x1000)
        cand = _sym("ov005", 0x1000)
        _s, _j, _r, _sz, adj, _ = score_candidate(
            anchor, frozenset(), cand, frozenset(),
        )
        self.assertFalse(adj)


class TestFindCandidates(unittest.TestCase):
    """End-to-end: build a synthetic graph + modules and exercise
    filtering + scoring behaviour together."""

    def _build(self):
        # Anchor: already-named.
        anchor = _sym(
            "main", 0x02001000, name="GX_LoadBG0Char", size=0x20,
        )
        # Sibling placeholder, same caller structure + same size.
        sib = _sym("main", 0x02001100, size=0x20)
        # Unrelated placeholder, different callers, different size.
        unrelated = _sym("main", 0x02030000, size=0x80)
        # Already-named placeholder — shouldn't appear as candidate.
        already_named = _sym(
            "main", 0x02001200, name="GX_LoadBG1Char", size=0x20,
        )
        # Zero-size placeholder — must be filtered.
        zero = _sym("main", 0x02001300, size=0)
        # Caller A calls both anchor + sibling.
        caller_a = _sym("main", 0x02005000, size=0x40)

        md = _module("main", [
            anchor, sib, unrelated, already_named, zero, caller_a,
        ])
        modules = {"main": md}

        graph = CallGraph()
        graph.edges_call[("main", 0x02005000)].add(("main", 0x02001000))
        graph.edges_call[("main", 0x02005000)].add(("main", 0x02001100))
        # Unrelated has a different caller not shared with the anchor.
        other_caller = _sym("main", 0x02020000, size=0x30)
        md.symbols.append(other_caller)
        md.by_addr[other_caller.addr] = other_caller
        md.by_addr_sorted = sorted(md.symbols, key=lambda s: s.addr)
        graph.edges_call[("main", 0x02020000)].add(("main", 0x02030000))

        return anchor, modules, graph

    def test_finds_sibling(self):
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        names = [c.symbol.name for c in cands]
        self.assertIn("func_02001100", names)

    def test_skips_already_named(self):
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        names = [c.symbol.name for c in cands]
        self.assertNotIn("GX_LoadBG1Char", names)

    def test_skips_zero_size(self):
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        addrs = [c.symbol.addr for c in cands]
        self.assertNotIn(0x02001300, addrs)

    def test_skips_anchor_itself(self):
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        addrs = [c.symbol.addr for c in cands]
        self.assertNotIn(0x02001000, addrs)

    def test_matched_candidate_excluded(self):
        # A tractable placeholder that would otherwise appear,
        # but its enclosing TU is `complete` — drop it.
        anchor, modules, graph = self._build()
        # Mark the sibling range as matched.
        matched = {"main": [(0x02001100, 0x02001120)]}
        cands = find_candidates(anchor, modules, graph, matched)
        addrs = [c.symbol.addr for c in cands]
        self.assertNotIn(0x02001100, addrs)

    def test_default_restricts_to_anchor_module(self):
        # Add a cross-module placeholder and verify the default
        # same-module run doesn't pick it up.
        anchor, modules, graph = self._build()
        ov_sym = _sym("ov005", 0x021b0000, size=0x20)
        ov_caller = _sym("ov005", 0x021b1000, size=0x40)
        modules["ov005"] = _module("ov005", [ov_sym, ov_caller])
        # Cross-module caller shares anchor's caller shape pattern.
        graph.edges_call[("ov005", 0x021b1000)].add(("main", 0x02001000))
        graph.edges_call[("ov005", 0x021b1000)].add(("ov005", 0x021b0000))

        same_mod_cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        cross_mod_cands = find_candidates(
            anchor, modules, graph, matched={}, cross_module=True,
        )
        same_mod_names = [c.symbol.name for c in same_mod_cands]
        cross_mod_names = [c.symbol.name for c in cross_mod_cands]
        self.assertNotIn("func_021b0000", same_mod_names)
        self.assertIn("func_021b0000", cross_mod_names)

    def test_min_score_floor(self):
        anchor, modules, graph = self._build()
        # Under weights 0.50 caller + 0.20 reloc + 0.20 size + 0.10
        # adj, sibling (jac=1, reloc=0 fixture has no relocs, size=1,
        # adj=True) scores 0.50 + 0 + 0.20 + 0.10 = 0.80. Unrelated
        # (jac=0, reloc=0, size=0.25, adj=False) scores 0.05. A floor
        # of 0.5 keeps the sibling and drops the unrelated.
        cands = find_candidates(
            anchor, modules, graph, matched={}, min_score=0.5,
        )
        names = [c.symbol.name for c in cands]
        self.assertIn("func_02001100", names)
        self.assertNotIn("func_02030000", names)

    def test_sort_order_deterministic(self):
        # Two equally-scored candidates — smaller-size first,
        # then addr ascending.
        anchor = _sym("main", 0x1000, name="Named", size=0x20)
        small = _sym("main", 0x2000, size=0x20)
        big = _sym("main", 0x3000, size=0x20)  # tied score
        caller = _sym("main", 0x5000, size=0x40)
        md = _module("main", [anchor, small, big, caller])
        graph = CallGraph()
        graph.edges_call[("main", 0x5000)].add(("main", 0x1000))
        graph.edges_call[("main", 0x5000)].add(("main", 0x2000))
        graph.edges_call[("main", 0x5000)].add(("main", 0x3000))
        cands = find_candidates(
            anchor, {"main": md}, graph, matched={},
        )
        # Smaller size not differentiating here (both 0x20), so
        # tie-break on address asc.
        self.assertEqual(cands[0].symbol.addr, 0x2000)
        self.assertEqual(cands[1].symbol.addr, 0x3000)


class TestRenderTextReport(unittest.TestCase):
    def test_empty_candidates_polite_message(self):
        anchor = _sym("main", 0x1000, name="GX_Init")
        out = render_text_report(anchor, [])
        self.assertIn("No placeholder siblings above threshold", out)
        self.assertIn("--cross-module", out)

    def test_populated_report_has_columns(self):
        anchor = _sym("main", 0x1000, name="GX_Init")
        from bulk_rename_candidates import Candidate
        cands = [Candidate(
            symbol=_sym("main", 0x1100, size=0x20),
            score=0.85,
            caller_jaccard=0.75,
            reloc_jaccard=0.50,
            size_ratio=1.0,
            is_adjacent=True,
            shared_callers=frozenset({("main", 0x5000)}),
        )]
        out = render_text_report(anchor, cands)
        self.assertIn("func_00001100", out)
        # Score column
        self.assertIn("0.85", out)
        # Reloc-Jaccard column
        self.assertIn("0.50", out)
        # Shared-callers digest for top candidate
        self.assertIn("shared callers", out)


class TestRenderJson(unittest.TestCase):
    def test_schema_round_trip(self):
        import json as _json
        anchor = _sym("main", 0x1000, name="GX_Init")
        from bulk_rename_candidates import Candidate
        cands = [Candidate(
            symbol=_sym("main", 0x1100, size=0x20),
            score=0.85,
            caller_jaccard=0.75,
            reloc_jaccard=0.50,
            size_ratio=1.0,
            is_adjacent=True,
            shared_callers=frozenset({("main", 0x5000)}),
        )]
        payload = _json.loads(render_json(anchor, cands))
        self.assertEqual(payload["anchor"]["name"], "GX_Init")
        self.assertEqual(len(payload["candidates"]), 1)
        self.assertEqual(payload["candidates"][0]["score"], 0.85)
        self.assertEqual(
            payload["candidates"][0]["reloc_jaccard"], 0.50,
        )
        self.assertEqual(
            payload["candidates"][0]["shared_callers"],
            [["main", 0x5000]],
        )


if __name__ == "__main__":
    unittest.main()
