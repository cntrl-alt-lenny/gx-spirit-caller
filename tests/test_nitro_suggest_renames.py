"""Unit tests for tools/nitro_suggest_renames.py.

The tool's job is to propose — not apply — Nitro names for unmatched
functions. A wrong auto-apply would silently corrupt symbols.txt;
a wrong suggestion in the report just costs the decomper a moment.
These tests pin the "tractable-only", "dedup against matched",
"score-with-subsystem-plausibility" behaviours.
"""

from __future__ import annotations

import sys
import unittest
from collections import defaultdict
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import ModuleData, Symbol  # noqa: E402
from nitro_suggest_renames import (  # noqa: E402
    Candidate,
    _score_nitro_fn,
    callee_subsystems,
    collect_candidates,
    infer_argcount,
    is_tractable,
    rank_nitro_candidates,
    render_report,
)


def _sym(
    name: str, module: str, addr: int, *,
    size: int = 0x10, type: str = "function", mode: str = "arm",
) -> Symbol:
    return Symbol(name=name, module=module, addr=addr, size=size,
                  type=type, mode=mode)


def _module(name: str, syms: list[Symbol]) -> ModuleData:
    return ModuleData(
        name=name, symbols=syms, relocs=[],
        by_addr={s.addr: s for s in syms},
        by_addr_sorted=sorted(syms, key=lambda s: s.addr),
    )


def _nitro(
    name: str, *, return_type: str = "void", args=("void",),
    subsystem: str = "OS",
) -> dict:
    arg_list = list(args)
    arg_count = 0 if arg_list == ["void"] else len(arg_list)
    return {
        "name": name,
        "return_type": return_type,
        "args": arg_list,
        "arg_count": arg_count,
        "subsystem": subsystem,
        "header": f"{subsystem.lower()}/fake.h",
    }


# ------------------------------------------------------------------------- #


def _edges_with_n_callers(target: tuple, n: int):
    """Make a defaultdict(set) graph where `target` has `n` distinct
    caller keys. Keeps test fixtures compact when the min_callers
    filter needs to be exercised."""
    edges = defaultdict(set)
    for i in range(n):
        edges[("caller_mod", 0x1000 + i)].add(target)
    return edges


class TestIsTractable(unittest.TestCase):
    def test_placeholder_small_leaf_is_tractable(self):
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0x8)
        modules = {"ov005": _module("ov005", [sym])}
        # With default min_callers=2, need ≥2 distinct callers.
        edges = _edges_with_n_callers(("ov005", 0x100), 2)
        self.assertTrue(is_tractable(
            sym, modules=modules,
            edges_call=edges, matched={},
        ))

    def test_non_placeholder_rejected(self):
        # A function that's already been named — no value in suggesting
        # a rename (the decomper has already committed to a name).
        sym = _sym("Entry", "main", 0x02000800, size=0x13c)
        self.assertFalse(is_tractable(
            sym, modules={},
            edges_call=defaultdict(set), matched={},
        ))

    def test_too_large_rejected(self):
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0x200)
        self.assertFalse(is_tractable(
            sym, modules={},
            edges_call=defaultdict(set), matched={},
        ))

    def test_zero_size_rejected(self):
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0)
        self.assertFalse(is_tractable(
            sym, modules={},
            edges_call=defaultdict(set), matched={},
        ))

    def test_already_matched_rejected(self):
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0x8)
        matched = {"ov005": [(0x100, 0x108)]}
        self.assertFalse(is_tractable(
            sym, modules={"ov005": _module("ov005", [sym])},
            edges_call=_edges_with_n_callers(("ov005", 0x100), 3),
            matched=matched,
        ))

    def test_high_out_degree_rejected(self):
        # More than 2 outbound calls → too noisy for subsystem inference.
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0x20)
        edges = _edges_with_n_callers(("ov005", 0x100), 3)
        for i in range(5):
            edges[("ov005", 0x100)].add(("ov005", 0x200 + i * 4))
        self.assertFalse(is_tractable(
            sym, modules={"ov005": _module("ov005", [sym])},
            edges_call=edges, matched={},
        ))

    def test_data_symbol_rejected(self):
        # Only function symbols get rename suggestions.
        sym = _sym("data_ov005_100", "ov005", 0x100,
                   size=0x10, type="data", mode="any")
        self.assertFalse(is_tractable(
            sym, modules={"ov005": _module("ov005", [sym])},
            edges_call=defaultdict(set), matched={},
        ))

    def test_tiny_stub_rejected_by_default(self):
        # Brain's usability feedback: size-0x4 `bx lr` shapes are so
        # generic that every 0-arg Nitro function scores identically.
        # Default filter now drops them.
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0x4)
        self.assertFalse(is_tractable(
            sym, modules={"ov005": _module("ov005", [sym])},
            edges_call=_edges_with_n_callers(("ov005", 0x100), 5),
            matched={},
        ))

    def test_tiny_stub_allowed_with_min_size_override(self):
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0x4)
        self.assertTrue(is_tractable(
            sym, modules={"ov005": _module("ov005", [sym])},
            edges_call=_edges_with_n_callers(("ov005", 0x100), 5),
            matched={}, min_size=0x2,
        ))

    def test_single_caller_rejected_by_default(self):
        # min_callers=2 default filters out idiosyncratic 1-caller
        # helpers whose role is rarely a well-known SDK function.
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0x10)
        edges = _edges_with_n_callers(("ov005", 0x100), 1)
        self.assertFalse(is_tractable(
            sym, modules={"ov005": _module("ov005", [sym])},
            edges_call=edges, matched={},
        ))

    def test_single_caller_allowed_with_override(self):
        sym = _sym("func_ov005_100", "ov005", 0x100, size=0x10)
        edges = _edges_with_n_callers(("ov005", 0x100), 1)
        self.assertTrue(is_tractable(
            sym, modules={"ov005": _module("ov005", [sym])},
            edges_call=edges, matched={}, min_callers=1,
        ))

    def test_failing_module_rejected_by_default(self):
        # main / dtcm / ov004 are in FAILING_MODULES per
        # analyze_symbols. Default filter excludes them — renames
        # there don't unblock anything while the module fails
        # module-check for structural reasons.
        sym = _sym("func_main_02000b60", "main", 0x02000b60, size=0x10)
        self.assertFalse(is_tractable(
            sym, modules={"main": _module("main", [sym])},
            edges_call=_edges_with_n_callers(("main", 0x02000b60), 3),
            matched={},
        ))

    def test_failing_module_allowed_with_flag(self):
        sym = _sym("func_main_02000b60", "main", 0x02000b60, size=0x10)
        self.assertTrue(is_tractable(
            sym, modules={"main": _module("main", [sym])},
            edges_call=_edges_with_n_callers(("main", 0x02000b60), 3),
            matched={}, include_failing_modules=True,
        ))


class TestCalleeSubsystems(unittest.TestCase):
    def test_named_callees_contribute(self):
        target = _sym("func_ov005_100", "ov005", 0x100)
        os_callee = _sym("OS_GetTick", "main", 0x200)
        gx_callee = _sym("GX_Init", "main", 0x300)
        modules = {
            "ov005": _module("ov005", [target]),
            "main":  _module("main", [os_callee, gx_callee]),
        }
        edges = defaultdict(set)
        edges[("ov005", 0x100)].add(("main", 0x200))
        edges[("ov005", 0x100)].add(("main", 0x300))
        subs = callee_subsystems(target, modules, edges)
        self.assertEqual(subs, {"OS", "GX"})

    def test_placeholder_callees_ignored(self):
        target = _sym("func_ov005_100", "ov005", 0x100)
        callee = _sym("func_main_200", "main", 0x200)
        modules = {
            "ov005": _module("ov005", [target]),
            "main":  _module("main", [callee]),
        }
        edges = defaultdict(set)
        edges[("ov005", 0x100)].add(("main", 0x200))
        self.assertEqual(callee_subsystems(target, modules, edges), set())

    def test_non_sdk_named_ignored(self):
        # `Entry` has no uppercase subsystem prefix — shouldn't
        # contribute. `__register_global_object` (underscore-prefixed
        # runtime symbol) also shouldn't.
        target = _sym("func_ov005_100", "ov005", 0x100)
        callees = [
            _sym("Entry", "main", 0x200),
            _sym("__register_global_object", "main", 0x300),
        ]
        modules = {
            "ov005": _module("ov005", [target]),
            "main":  _module("main", callees),
        }
        edges = defaultdict(set)
        for c in callees:
            edges[("ov005", 0x100)].add((c.module, c.addr))
        self.assertEqual(callee_subsystems(target, modules, edges), set())


class TestInferArgcount(unittest.TestCase):
    def test_small_leaf_is_zero(self):
        sym = _sym("x", "ov005", 0x100, size=0x8)
        self.assertEqual(infer_argcount(sym, out_degree=0), 0)

    def test_with_callees_unknown(self):
        sym = _sym("x", "ov005", 0x100, size=0x8)
        self.assertIsNone(infer_argcount(sym, out_degree=1))

    def test_large_unknown(self):
        sym = _sym("x", "ov005", 0x100, size=0x20)
        self.assertIsNone(infer_argcount(sym, out_degree=0))


class TestScoreNitroFn(unittest.TestCase):
    def test_subsystem_match_rewarded(self):
        cand = Candidate(
            target=_sym("func_ov005_100", "ov005", 0x100, size=0x8),
            out_degree=1,
            named_callee_subsystems={"OS"},
            inferred_argcount=None,
        )
        os_fn = _nitro("OS_Reset", subsystem="OS")
        gx_fn = _nitro("GX_Init", subsystem="GX")
        self.assertGreater(
            _score_nitro_fn(cand, os_fn),
            _score_nitro_fn(cand, gx_fn),
        )

    def test_argcount_mismatch_excluded(self):
        # If we've inferred 0 args and the candidate takes args,
        # the scorer must return -1 (hard-filter).
        cand = Candidate(
            target=_sym("func_ov005_100", "ov005", 0x100, size=0x4),
            out_degree=0,
            named_callee_subsystems=set(),
            inferred_argcount=0,
        )
        fn_3args = _nitro("OS_SetIrqHandler",
                          args=["u32 m", "void *h", "void *u"])
        self.assertLess(_score_nitro_fn(cand, fn_3args), 0)

    def test_argcount_match_rewarded(self):
        cand = Candidate(
            target=_sym("func_x", "ov005", 0x100, size=0x4),
            out_degree=0,
            named_callee_subsystems=set(),
            inferred_argcount=0,
        )
        fn_0args = _nitro("OS_Reset")
        self.assertGreater(_score_nitro_fn(cand, fn_0args), 0)

    def test_void_return_small_leaf_bonus(self):
        cand = Candidate(
            target=_sym("x", "ov005", 0x100, size=0x4),
            out_degree=0,
            named_callee_subsystems=set(),
            inferred_argcount=None,
        )
        void_fn = _nitro("OS_Reset", return_type="void")
        ptr_fn = _nitro("GX_AllocRgb", return_type="GXRgb *",
                        args=["u32 n"])
        self.assertGreater(
            _score_nitro_fn(cand, void_fn),
            _score_nitro_fn(cand, ptr_fn),
        )


class TestRankNitroCandidates(unittest.TestCase):
    def test_top_k_enforced(self):
        cand = Candidate(
            target=_sym("x", "ov005", 0x100, size=0x4),
            out_degree=0,
            named_callee_subsystems=set(),
            inferred_argcount=0,
        )
        pool = [_nitro(f"OS_F{i}") for i in range(10)]
        ranked = rank_nitro_candidates(cand, pool, top_k=3)
        self.assertEqual(len(ranked), 3)

    def test_excluded_candidates_dropped(self):
        # argcount=0 inferred; only 0-arg candidates should survive.
        cand = Candidate(
            target=_sym("x", "ov005", 0x100, size=0x4),
            out_degree=0,
            named_callee_subsystems=set(),
            inferred_argcount=0,
        )
        pool = [
            _nitro("OS_Reset"),
            _nitro("OS_SetIrqHandler",
                   args=["u32 m", "void *h", "void *u"]),
        ]
        ranked = rank_nitro_candidates(cand, pool, top_k=5)
        self.assertEqual([fn["name"] for _, fn in ranked], ["OS_Reset"])


class TestCollectCandidates(unittest.TestCase):
    def test_sorted_easiest_first(self):
        syms = [
            _sym("func_ov005_200", "ov005", 0x200, size=0x20),
            _sym("func_ov005_100", "ov005", 0x100, size=0x8),
            _sym("func_ov005_300", "ov005", 0x300, size=0x10),
        ]
        modules = {"ov005": _module("ov005", syms)}
        # Every fixture symbol needs ≥ min_callers=2 to survive the
        # default filter. Give each one 2 distinct callers.
        edges = defaultdict(set)
        for s in syms:
            for i in range(2):
                edges[("driver", 0x100 + i)].add((s.module, s.addr))
        cands = collect_candidates(modules, edges, {})
        sizes = [c.target.size for c in cands]
        self.assertEqual(sizes, sorted(sizes))

    def test_mixed_in_and_out_of_scope(self):
        syms = [
            _sym("func_ov005_100", "ov005", 0x100, size=0x10),     # ok
            _sym("Entry", "ov005", 0x200, size=0x13c),              # named
            _sym("func_ov005_300", "ov005", 0x300, size=0x400),    # too big
            _sym("func_ov005_400", "ov005", 0x400, size=0x10),      # matched
        ]
        modules = {"ov005": _module("ov005", syms)}
        matched = {"ov005": [(0x400, 0x410)]}
        edges = defaultdict(set)
        # Give every `ov005` symbol 2 callers so min_callers filter
        # passes; the other filters (named / oversized / matched)
        # still knock out everything except 0x100.
        for s in syms:
            for i in range(2):
                edges[("driver", 0x100 + i)].add((s.module, s.addr))
        cands = collect_candidates(modules, edges, matched)
        self.assertEqual([c.target.addr for c in cands], [0x100])

    def test_failing_module_excluded_by_default(self):
        syms = [
            _sym("func_main_02000b60", "main", 0x02000b60, size=0x10),
            _sym("func_ov005_100", "ov005", 0x100, size=0x10),
        ]
        modules = {
            "main":  _module("main", [syms[0]]),
            "ov005": _module("ov005", [syms[1]]),
        }
        edges = defaultdict(set)
        for s in syms:
            for i in range(2):
                edges[("driver", 0x100 + i)].add((s.module, s.addr))
        cands = collect_candidates(modules, edges, {})
        addrs = [(c.target.module, c.target.addr) for c in cands]
        # main is in FAILING_MODULES → excluded by default.
        self.assertEqual(addrs, [("ov005", 0x100)])

    def test_failing_module_included_with_flag(self):
        syms = [_sym("func_main_02000b60", "main", 0x02000b60, size=0x10)]
        modules = {"main": _module("main", syms)}
        edges = defaultdict(set)
        for i in range(2):
            edges[("driver", 0x100 + i)].add(("main", 0x02000b60))
        cands = collect_candidates(
            modules, edges, {}, include_failing_modules=True,
        )
        self.assertEqual(len(cands), 1)


class TestClassifyConfidence(unittest.TestCase):
    def test_no_candidates_is_low(self):
        from nitro_suggest_renames import (
            CONF_LOW, classify_confidence,
        )
        cand = Candidate(
            target=_sym("func_x", "ov005", 0x100, size=0x10),
            out_degree=0,
            named_callee_subsystems=set(),
            inferred_argcount=None,
            caller_count=3,
        )
        self.assertEqual(classify_confidence(cand, []), CONF_LOW)

    def test_strong_subsystem_signal_is_high(self):
        from nitro_suggest_renames import (
            CONF_HIGH, classify_confidence,
        )
        cand = Candidate(
            target=_sym("func_x", "ov005", 0x100, size=0x10),
            out_degree=1,
            named_callee_subsystems={"OS"},  # subsystem signal
            inferred_argcount=0,
            caller_count=4,
        )
        # Fake a ranked list: top 6, second 3 → gap ≥ 2, top ≥ 5.
        ranked = [(6, _nitro("OS_Top")), (3, _nitro("OS_Second"))]
        self.assertEqual(classify_confidence(cand, ranked), CONF_HIGH)

    def test_shallow_score_is_medium(self):
        from nitro_suggest_renames import (
            CONF_MEDIUM, classify_confidence,
        )
        cand = Candidate(
            target=_sym("func_x", "ov005", 0x100, size=0x10),
            out_degree=0,
            named_callee_subsystems={"OS"},
            inferred_argcount=None,
            caller_count=2,
        )
        ranked = [(3, _nitro("OS_A"))]
        self.assertEqual(classify_confidence(cand, ranked), CONF_MEDIUM)

    def test_no_signal_is_low(self):
        from nitro_suggest_renames import (
            CONF_LOW, classify_confidence,
        )
        cand = Candidate(
            target=_sym("func_x", "ov005", 0x100, size=0x4),
            out_degree=0,
            named_callee_subsystems=set(),  # no subsystem hint
            inferred_argcount=0,
            caller_count=1,  # weak caller signal
        )
        ranked = [(3, _nitro("OS_A")), (3, _nitro("OS_B"))]
        self.assertEqual(classify_confidence(cand, ranked), CONF_LOW)


class TestRenderReport(unittest.TestCase):
    def test_empty_candidates_says_so(self):
        md = render_report(
            [], [], max_candidates=3, limit=10,
            dict_source="/fake",
        )
        self.assertIn("No tractable candidates", md)
        self.assertIn("NitroSDK rename suggestions", md)

    def test_full_mixed_output(self):
        cand = Candidate(
            target=_sym("func_ov005_100", "ov005", 0x100, size=0x4),
            out_degree=0,
            named_callee_subsystems={"OS"},
            inferred_argcount=0,
        )
        nitro = [
            _nitro("OS_Reset"),
            _nitro("OS_WaitVBlankIntr"),
            _nitro("GX_Init", subsystem="GX"),
        ]
        md = render_report(
            [cand], nitro, max_candidates=5, limit=10,
            dict_source="/real",
        )
        # Headline + target heading + a rename-hint footer.
        self.assertIn("Scanned **1**", md)
        self.assertIn("`func_ov005_100`", md)
        self.assertIn(
            "`python tools/rename_symbol.py ov005 0x00000100", md,
        )
        # At least one candidate row rendered.
        self.assertIn("`OS_Reset`", md)

    def test_limit_truncates_within_confidence_tier(self):
        # 3 HIGH-confidence candidates but effective per-tier limit=1
        # → one rendered, the other two get the "and N more" note.
        cs = [
            Candidate(
                target=_sym(f"func_ov005_{i}",
                            "ov005", 0x100 + i * 4, size=0x10),
                out_degree=0,
                named_callee_subsystems={"OS"},
                inferred_argcount=0,
                caller_count=5,
            ) for i in range(3)
        ]
        # Pool has a clearly-winning top + low-scoring decoys to give
        # each target a score ≥ 5 with a ≥ 2 gap → HIGH confidence.
        nitro = [
            _nitro("OS_Top"),         # 0 args, void, OS → high
            _nitro("GX_Low", subsystem="GX"),  # cross-subsystem → -1
        ]
        md = render_report(
            cs, nitro,
            max_candidates=3, limit=1,
            dict_source="/fake",
        )
        # Only one HIGH target actually rendered; truncation note.
        self.assertIn("…and 2 more", md)
        self.assertIn("HIGH-confidence", md)

    def test_low_confidence_hidden_by_default(self):
        # Generic-shape candidate with no signal → LOW → hidden
        # unless --show-low-confidence.
        cand = Candidate(
            target=_sym("func_ov005_100", "ov005", 0x100, size=0x10),
            out_degree=0,
            named_callee_subsystems=set(),
            inferred_argcount=0,
            caller_count=1,
        )
        nitro = [_nitro("OS_Reset")]
        md_default = render_report(
            [cand], nitro, max_candidates=3, limit=10,
            dict_source="/fake",
        )
        md_shown = render_report(
            [cand], nitro, max_candidates=3, limit=10,
            dict_source="/fake", show_low_confidence=True,
        )
        self.assertNotIn("`func_ov005_100`", md_default)
        self.assertIn("Everything classified LOW", md_default)
        self.assertIn("`func_ov005_100`", md_shown)
        self.assertIn("LOW-confidence", md_shown)

    def test_confidence_breakdown_line_always_emitted(self):
        cand = Candidate(
            target=_sym("func_ov005_100", "ov005", 0x100, size=0x10),
            out_degree=0,
            named_callee_subsystems={"OS"},
            inferred_argcount=0,
            caller_count=4,
        )
        nitro = [_nitro("OS_Reset"), _nitro("GX_Init", subsystem="GX")]
        md = render_report(
            [cand], nitro, max_candidates=2, limit=5,
            dict_source="/fake",
        )
        # Breakdown surfaces counts even when some tiers are empty.
        self.assertIn("Confidence breakdown", md)
        self.assertIn("HIGH", md)
        self.assertIn("MEDIUM", md)
        self.assertIn("LOW", md)


if __name__ == "__main__":
    unittest.main()
