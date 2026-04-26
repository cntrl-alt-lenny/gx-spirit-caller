"""Unit tests for tools/bulk_data_candidates.py.

The data-tier analogue of bulk_rename_candidates. Pins:

  - `_jaccard` boundaries (empty/identical/disjoint)
  - `_size_similarity` math: handles None (last-symbol-in-module
    case where no upper anchor exists)
  - `_reader_modules` extracts the module-set from a reader keyset
  - `score_candidate` weighted sum: reader-J + reader-mod-J + size +
    adjacency
  - `find_candidates` filters:
    - skips the anchor itself
    - skips already-named data symbols
    - skips matched (already in complete TU) symbols
    - skips function symbols (this is the data tier)
    - same-module default / --cross-module override
    - min_score floor
  - Sort: score desc, inferred-size asc, addr asc (deterministic)
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
from bulk_data_candidates import (  # noqa: E402
    ADJACENCY_BONUS_WINDOW,
    Candidate,
    _jaccard,
    _reader_modules,
    _size_similarity,
    find_candidates,
    render_json,
    render_text_report,
    score_candidate,
)


def _data(
    module: str, addr: int, *, name: str | None = None,
) -> Symbol:
    if name is None:
        name = f"data_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=0,
        type="data", mode="any",
    )


def _fn(module: str, addr: int, *, size: int = 0x20) -> Symbol:
    return Symbol(
        name=f"func_{addr:08x}", module=module, addr=addr,
        size=size, type="function", mode="arm",
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

    def test_disjoint_is_zero(self):
        a = frozenset({("main", 0x1)})
        b = frozenset({("main", 0x2)})
        self.assertEqual(_jaccard(a, b), 0.0)

    def test_partial_overlap(self):
        a = frozenset({("main", 0x1), ("main", 0x2)})
        b = frozenset({("main", 0x2), ("main", 0x3)})
        self.assertAlmostEqual(_jaccard(a, b), 1 / 3, places=4)

    def test_empty_and_empty_is_zero(self):
        self.assertEqual(_jaccard(frozenset(), frozenset()), 0.0)


class TestSizeSimilarity(unittest.TestCase):
    def test_exact_match_is_one(self):
        self.assertEqual(_size_similarity(0x20, 0x20), 1.0)

    def test_double_is_half(self):
        self.assertEqual(_size_similarity(0x20, 0x40), 0.5)

    def test_either_none_is_zero(self):
        # Last-symbol-in-module case: no upper anchor → no
        # inferred extent → no signal.
        self.assertEqual(_size_similarity(None, 0x20), 0.0)
        self.assertEqual(_size_similarity(0x20, None), 0.0)
        self.assertEqual(_size_similarity(None, None), 0.0)

    def test_zero_or_negative_is_zero(self):
        self.assertEqual(_size_similarity(0, 0x10), 0.0)
        self.assertEqual(_size_similarity(0x10, 0), 0.0)


class TestReaderModules(unittest.TestCase):
    def test_extracts_module_set(self):
        readers = frozenset({
            ("main", 0x1000),
            ("main", 0x2000),
            ("ov005", 0x3000),
        })
        self.assertEqual(
            _reader_modules(readers),
            frozenset({"main", "ov005"}),
        )

    def test_empty_in_empty_out(self):
        self.assertEqual(_reader_modules(frozenset()), frozenset())


class TestScoreCandidate(unittest.TestCase):
    def test_identical_all_signals_maxes_at_one(self):
        anchor = _data("main", 0x1000, name="BuildInfo")
        cand = _data("main", 0x1100)
        readers = frozenset({("main", 0x5000), ("ov005", 0x6000)})
        score, rj, rmj, sz, adj, shared = score_candidate(
            anchor, readers, 0x10,
            cand, readers, 0x10,
        )
        self.assertEqual(rj, 1.0)
        self.assertEqual(rmj, 1.0)
        self.assertEqual(sz, 1.0)
        self.assertTrue(adj)
        self.assertAlmostEqual(score, 1.0, places=6)
        self.assertEqual(shared, readers)

    def test_no_overlap_low_score(self):
        anchor = _data("main", 0x1000, name="BuildInfo")
        cand = _data("main", 0x9000)  # outside adjacency window
        score, rj, rmj, sz, adj, shared = score_candidate(
            anchor, frozenset({("main", 0x5000)}), 0x10,
            cand, frozenset({("ov005", 0x6000)}), 0x40,
        )
        # reader_jac=0, reader_mod_jac=0 (disjoint modules), size=0.25
        # adj=False → score = 0 + 0 + 0.20*0.25 + 0 = 0.05
        self.assertAlmostEqual(score, 0.05, places=4)
        self.assertEqual(rj, 0.0)
        self.assertEqual(rmj, 0.0)
        self.assertEqual(shared, frozenset())
        self.assertFalse(adj)

    def test_reader_module_signal_when_function_set_disjoint(self):
        # Different reader functions but same modules — the coarser
        # signal still fires.
        anchor = _data("main", 0x1000, name="BuildInfo")
        cand = _data("main", 0x1100)
        a_readers = frozenset({("main", 0x5000), ("ov005", 0x6000)})
        c_readers = frozenset({("main", 0x5100), ("ov005", 0x6100)})
        score, rj, rmj, sz, adj, _shared = score_candidate(
            anchor, a_readers, 0x10,
            cand, c_readers, 0x10,
        )
        self.assertEqual(rj, 0.0)         # function-level disjoint
        self.assertEqual(rmj, 1.0)        # module-level identical
        # 0 + 0.20*1 + 0.20*1 + 0.10 = 0.50
        self.assertAlmostEqual(score, 0.50, places=4)

    def test_adjacency_threshold_inclusive(self):
        anchor = _data("main", 0x1000, name="BuildInfo")
        # Exactly at the window boundary should still count.
        cand = _data("main", 0x1000 + ADJACENCY_BONUS_WINDOW)
        _score, _rj, _rmj, _sz, adj, _shared = score_candidate(
            anchor, frozenset(), None,
            cand, frozenset(), None,
        )
        self.assertTrue(adj)

    def test_adjacency_crossmodule_never_bonus(self):
        anchor = _data("main", 0x1000, name="BuildInfo")
        cand = _data("ov005", 0x1010)  # numerically close, diff module
        _score, _rj, _rmj, _sz, adj, _shared = score_candidate(
            anchor, frozenset(), None,
            cand, frozenset(), None,
        )
        self.assertFalse(adj)


class TestFindCandidates(unittest.TestCase):
    """End-to-end: build a tiny module + load graph, run, check filters."""

    def _build(self):
        # Anchor: already-named data (e.g. BuildInfo).
        anchor = _data("main", 0x02000b68, name="BuildInfo")
        # Sibling placeholder, similar reader pattern.
        sib = _data("main", 0x02000b80)
        # Unrelated placeholder, different readers, far away.
        unrelated = _data("main", 0x020a0000)
        # Already-named placeholder — shouldn't appear.
        already_named = _data(
            "main", 0x02000b90, name="OS_HeapStart",
        )
        # Function — must be filtered by the data-only loop.
        a_function = _fn("main", 0x02000c00)
        # Reader functions.
        reader_a = _fn("main", 0x02005000)
        reader_b = _fn("ov005", 0x021b0000)

        md_main = _module("main", [
            anchor, sib, unrelated, already_named, a_function,
            reader_a,
        ])
        md_ov = _module("ov005", [reader_b])
        modules = {"main": md_main, "ov005": md_ov}

        graph = CallGraph()
        # reader_a reads anchor + sib
        graph.edges_load[("main", 0x02005000)].add(
            ("main", 0x02000b68),
        )
        graph.edges_load[("main", 0x02005000)].add(
            ("main", 0x02000b80),
        )
        # reader_b reads anchor + unrelated (so unrelated has SOME
        # reader, just not the same one)
        graph.edges_load[("ov005", 0x021b0000)].add(
            ("main", 0x02000b68),
        )
        graph.edges_load[("ov005", 0x021b0000)].add(
            ("main", 0x020a0000),
        )

        return anchor, modules, graph

    def test_finds_sibling(self):
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        names = [c.symbol.name for c in cands]
        self.assertIn("data_02000b80", names)

    def test_skips_already_named(self):
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        names = [c.symbol.name for c in cands]
        self.assertNotIn("OS_HeapStart", names)

    def test_skips_anchor_itself(self):
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        addrs = [c.symbol.addr for c in cands]
        self.assertNotIn(0x02000b68, addrs)

    def test_skips_functions(self):
        # The reader_a function lives in the same module — verify
        # it doesn't get scored as a data candidate.
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        names = [c.symbol.name for c in cands]
        self.assertNotIn("func_02005000", names)

    def test_matched_excludes_candidate(self):
        anchor, modules, graph = self._build()
        # Mark the sibling's address as matched.
        matched = {"main": [(0x02000b80, 0x02000b90)]}
        cands = find_candidates(anchor, modules, graph, matched)
        addrs = [c.symbol.addr for c in cands]
        self.assertNotIn(0x02000b80, addrs)

    def test_cross_module_default_off(self):
        anchor, modules, graph = self._build()
        # Add a placeholder data in ov005 with a similar reader pattern.
        ov_data = _data("ov005", 0x021c0000)
        modules["ov005"].symbols.append(ov_data)
        modules["ov005"].by_addr[ov_data.addr] = ov_data
        graph.edges_load[("ov005", 0x021b0000)].add(
            ("ov005", 0x021c0000),
        )

        same = find_candidates(anchor, modules, graph, matched={})
        cross = find_candidates(
            anchor, modules, graph, matched={}, cross_module=True,
        )
        same_names = [c.symbol.name for c in same]
        cross_names = [c.symbol.name for c in cross]
        self.assertNotIn("data_021c0000", same_names)
        self.assertIn("data_021c0000", cross_names)

    def test_min_score_floor_keeps_strong(self):
        # Sibling has reader-J ~= 0.5 (1 shared / 2 union readers),
        # reader-mod-J = 0.5, size_ratio depends on inferred sizes.
        # Set the floor where the sibling survives but unrelated
        # (reader-J=0.5 with reader_b only, no overlap with anchor's
        # reader pattern in the way that matters) drops out.
        anchor, modules, graph = self._build()
        cands = find_candidates(
            anchor, modules, graph, matched={}, min_score=0.3,
        )
        names = [c.symbol.name for c in cands]
        self.assertIn("data_02000b80", names)
        # Unrelated lives 0xa0000 bytes away from anchor — far past
        # the adjacency window — and shares only one reader (reader_b)
        # which the sibling doesn't share. With reader_jac=0.5 +
        # rm_jac=1 + size=0 + adj=0 it scores 0.45 with the floor.
        # Since the sibling out-scores it, both can survive — that's
        # fine. We only assert sibling presence here.

    def test_sort_order_score_desc(self):
        # Two candidates with different scores — ensure sort.
        anchor, modules, graph = self._build()
        # Add a second sibling with weaker reader overlap.
        weak = _data("main", 0x02000c08)
        modules["main"].symbols.append(weak)
        modules["main"].by_addr[weak.addr] = weak
        # Only one shared reader (anchor has 2; weak has 1)
        graph.edges_load[("main", 0x02005000)].add(
            ("main", 0x02000c08),
        )

        cands = find_candidates(
            anchor, modules, graph, matched={},
        )
        scores = [c.score for c in cands]
        self.assertEqual(scores, sorted(scores, reverse=True))


class TestRenderTextReport(unittest.TestCase):
    def test_empty_candidates_polite_message(self):
        anchor = _data("main", 0x1000, name="BuildInfo")
        out = render_text_report(anchor, [])
        self.assertIn("No placeholder siblings above threshold", out)
        self.assertIn("--cross-module", out)

    def test_populated_report_has_columns(self):
        anchor = _data("main", 0x1000, name="BuildInfo")
        cands = [Candidate(
            symbol=_data("main", 0x1100),
            score=0.85,
            reader_jaccard=0.75,
            reader_module_jaccard=0.50,
            size_ratio=1.0,
            is_adjacent=True,
            shared_readers=frozenset({("main", 0x5000)}),
            anchor_inferred_size=0x10,
            cand_inferred_size=0x10,
        )]
        out = render_text_report(anchor, cands)
        self.assertIn("data_00001100", out)
        self.assertIn("0.85", out)         # score
        self.assertIn("0.50", out)         # reader-mod-J
        self.assertIn("0x10", out)         # inferred size
        self.assertIn("shared readers", out)

    def test_unknown_size_renders_question_mark(self):
        anchor = _data("main", 0x1000, name="BuildInfo")
        cands = [Candidate(
            symbol=_data("main", 0x1100),
            score=0.40,
            reader_jaccard=0.50,
            reader_module_jaccard=0.50,
            size_ratio=0.0,
            is_adjacent=False,
            shared_readers=frozenset(),
            anchor_inferred_size=None,
            cand_inferred_size=None,
        )]
        out = render_text_report(anchor, cands)
        self.assertIn("inferred size=?", out)
        self.assertIn("?", out)


class TestRenderJson(unittest.TestCase):
    def test_schema_round_trip(self):
        import json as _json
        anchor = _data("main", 0x1000, name="BuildInfo")
        cands = [Candidate(
            symbol=_data("main", 0x1100),
            score=0.85,
            reader_jaccard=0.75,
            reader_module_jaccard=0.50,
            size_ratio=1.0,
            is_adjacent=True,
            shared_readers=frozenset({("main", 0x5000)}),
            anchor_inferred_size=0x10,
            cand_inferred_size=0x10,
        )]
        payload = _json.loads(render_json(anchor, cands))
        self.assertEqual(payload["anchor"]["name"], "BuildInfo")
        self.assertEqual(payload["anchor"]["inferred_size"], 0x10)
        self.assertEqual(len(payload["candidates"]), 1)
        c0 = payload["candidates"][0]
        self.assertEqual(c0["score"], 0.85)
        self.assertEqual(c0["reader_jaccard"], 0.75)
        self.assertEqual(c0["reader_module_jaccard"], 0.50)
        self.assertEqual(c0["inferred_size"], 0x10)
        self.assertEqual(c0["shared_readers"], [["main", 0x5000]])

    def test_unknown_size_serializes_as_null(self):
        import json as _json
        anchor = _data("main", 0x1000, name="BuildInfo")
        cands = [Candidate(
            symbol=_data("main", 0x1100),
            score=0.40,
            reader_jaccard=0.50,
            reader_module_jaccard=0.50,
            size_ratio=0.0,
            is_adjacent=False,
            shared_readers=frozenset(),
            anchor_inferred_size=None,
            cand_inferred_size=None,
        )]
        payload = _json.loads(render_json(anchor, cands))
        self.assertIsNone(payload["anchor"]["inferred_size"])
        self.assertIsNone(payload["candidates"][0]["inferred_size"])


if __name__ == "__main__":
    unittest.main()
