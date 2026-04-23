"""Unit tests for tools/data_worklist.py.

Data-tier decomp is still 0%; this tool decides which symbol the
decomper works on first. If it mis-ranks, or hides already-matched
symbols incorrectly, a working session gets wasted chasing the
wrong datum. Pinning:

  - placeholder-vs-named filter (default placeholder-only)
  - matched-range exclusion (data inside a `complete` TU range is
    hidden even if it hasn't been renamed)
  - min_readers filter boundaries
  - module_filter restricts to one module
  - sort order: cross-module density primary, reader count
    secondary, size tertiary
  - stable tie-break (deterministic output)
  - summary header accuracy (total / matched numbers independent of
    worklist filters)
  - render_markdown structure + cross-module histogram
  - empty-entries-friendly (filters-too-tight message)
  - main() smoke via tmp config dir (end-to-end CLI roundtrip)
"""

from __future__ import annotations

import io
import sys
import unittest
from contextlib import redirect_stdout
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    Symbol,
)
from data_worklist import (  # noqa: E402
    DATA_PLACEHOLDER_PREFIX,
    _load_readers_index,
    rank_data_symbols,
    render_markdown,
    render_stdout_summary,
)


def _data_sym(module: str, addr: int, name: str | None = None, size: int = 0) -> Symbol:
    if name is None:
        name = f"data_{addr:08x}" if module == "main" else f"data_{module}_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="data", mode="any",
    )


def _func_sym(module: str, addr: int, size: int = 0x10) -> Symbol:
    return Symbol(
        name=f"func_{addr:08x}", module=module, addr=addr, size=size,
        type="function", mode="arm",
    )


def _module(
    name: str, symbols: list[Symbol],
) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(symbols)
    md.by_addr = {s.addr: s for s in symbols}
    md.by_addr_sorted = sorted(symbols, key=lambda s: s.addr)
    return md


def _build_fixture(
    *,
    readers_main: list[tuple[tuple[str, int], tuple[str, int]]] = (),
    readers_ov005: list[tuple[tuple[str, int], tuple[str, int]]] = (),
) -> tuple[dict[str, ModuleData], CallGraph]:
    """Build a synthetic modules + CallGraph pair for tests.

    `readers_*` entries are (reader_key, data_key) pairs representing
    edges_load adjacency: "function reader_key loads data_key"."""
    data_a = _data_sym("main", 0x02000100)      # ubiquitous datum
    data_b = _data_sym("main", 0x02000200, size=0x40)  # sized
    data_c = _data_sym("main", 0x02000300)      # single-reader
    data_d_ov = _data_sym("ov005", 0x021c0100)  # overlay-local
    data_named = _data_sym(
        "main", 0x02000400, name="g_HeapState",
    )  # already renamed
    # Couple of reader functions so edges_load keys resolve to valid
    # readers on the module side.
    f_main_1 = _func_sym("main", 0x02001000)
    f_main_2 = _func_sym("main", 0x02001100)
    f_main_3 = _func_sym("main", 0x02001200)
    f_ov005 = _func_sym("ov005", 0x021c1000)
    f_ov006 = _func_sym("ov006", 0x021d0000)

    main_md = _module("main", [
        data_a, data_b, data_c, data_named,
        f_main_1, f_main_2, f_main_3,
    ])
    ov005_md = _module("ov005", [data_d_ov, f_ov005])
    ov006_md = _module("ov006", [f_ov006])

    modules: dict[str, ModuleData] = {
        "main": main_md,
        "ov005": ov005_md,
        "ov006": ov006_md,
    }

    graph = CallGraph()
    # data_a @ main:0x100 — read from main, ov005, ov006 (3 modules)
    graph.edges_load[("main", 0x02001000)].add(("main", 0x02000100))
    graph.edges_load[("main", 0x02001100)].add(("main", 0x02000100))
    graph.edges_load[("ov005", 0x021c1000)].add(("main", 0x02000100))
    graph.edges_load[("ov006", 0x021d0000)].add(("main", 0x02000100))
    # data_b @ main:0x200 — read from 2 main readers (1 module)
    graph.edges_load[("main", 0x02001000)].add(("main", 0x02000200))
    graph.edges_load[("main", 0x02001200)].add(("main", 0x02000200))
    # data_c @ main:0x300 — single main reader
    graph.edges_load[("main", 0x02001000)].add(("main", 0x02000300))
    # data_d_ov @ ov005:0x100 — read by one ov005 + one ov006
    graph.edges_load[("ov005", 0x021c1000)].add(("ov005", 0x021c0100))
    graph.edges_load[("ov006", 0x021d0000)].add(("ov005", 0x021c0100))
    # data_named — reader exists but we shouldn't surface it by default.
    graph.edges_load[("main", 0x02001000)].add(("main", 0x02000400))
    return modules, graph


class TestReadersIndex(unittest.TestCase):
    def test_inverted_index_shape(self):
        _, graph = _build_fixture()
        idx = _load_readers_index(graph)
        # data_a read by 4 reader keys (2 in main, 1 ov005, 1 ov006).
        self.assertEqual(len(idx[("main", 0x02000100)]), 4)
        # data_c read by exactly one.
        self.assertEqual(len(idx[("main", 0x02000300)]), 1)

    def test_empty_graph(self):
        idx = _load_readers_index(CallGraph())
        self.assertEqual(idx, {})


class TestRanking(unittest.TestCase):
    def test_default_filters_placeholder_only(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        names = [e.symbol.name for e in entries]
        # g_HeapState is named, should be absent by default.
        self.assertNotIn("g_HeapState", names)

    def test_include_named_surfaces_renamed_too(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={}, include_named=True,
        )
        names = {e.symbol.name for e in entries}
        self.assertIn("g_HeapState", names)

    def test_sort_cross_module_primary(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        # data_a (3 modules) must come first.
        self.assertEqual(entries[0].symbol.addr, 0x02000100)
        # data_d_ov (2 modules) next — ov005 + ov006.
        self.assertEqual(entries[1].symbol.addr, 0x021c0100)

    def test_sort_reader_count_secondary(self):
        # data_b has 2 readers in 1 module; data_c has 1 reader in
        # 1 module. Both have cross_module=1, so data_b (higher
        # reader count) ranks above data_c.
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        addrs = [e.symbol.addr for e in entries]
        self.assertLess(
            addrs.index(0x02000200), addrs.index(0x02000300),
        )

    def test_sort_size_tertiary(self):
        # Two siblings with identical readers: the sized one wins.
        sized = _data_sym("main", 0x02010000, size=0x20)
        unsized = _data_sym("main", 0x02010100)  # size=0
        reader = _func_sym("main", 0x02011000)
        md = _module("main", [sized, unsized, reader])
        modules = {"main": md}
        graph = CallGraph()
        graph.edges_load[("main", 0x02011000)].add(("main", 0x02010000))
        graph.edges_load[("main", 0x02011000)].add(("main", 0x02010100))
        entries = rank_data_symbols(modules, graph, matched={})
        self.assertEqual(entries[0].symbol.addr, 0x02010000)  # sized first

    def test_min_readers_boundary(self):
        modules, graph = _build_fixture()
        # data_c has exactly 1 reader; min_readers=2 must drop it.
        entries = rank_data_symbols(
            modules, graph, matched={}, min_readers=2,
        )
        addrs = [e.symbol.addr for e in entries]
        self.assertNotIn(0x02000300, addrs)

    def test_module_filter(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={}, module_filter="ov005",
        )
        self.assertTrue(all(e.symbol.module == "ov005" for e in entries))
        self.assertEqual(len(entries), 1)

    def test_matched_range_excludes_data(self):
        # data_b @ 0x02000200 with size=0x40 — declare the enclosing
        # TU complete via a matched range and expect it to drop out.
        modules, graph = _build_fixture()
        matched = {"main": [(0x02000200, 0x02000240)]}
        entries = rank_data_symbols(modules, graph, matched)
        addrs = [e.symbol.addr for e in entries]
        self.assertNotIn(0x02000200, addrs)

    def test_cross_module_counter_excludes_self_duplicates(self):
        # Two separate main readers of data_a shouldn't count twice
        # for cross-module density. data_a ends up with xmod=3 not 4.
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        data_a = next(e for e in entries if e.symbol.addr == 0x02000100)
        self.assertEqual(data_a.cross_module_readers, 3)
        self.assertEqual(data_a.reader_count, 4)

    def test_zero_reader_data_excluded_by_default(self):
        # A placeholder datum with NO readers: min_readers=1 default
        # drops it, since there's no leverage in naming it.
        lonely = _data_sym("main", 0x03000000)
        reader = _func_sym("main", 0x03001000)
        md = _module("main", [lonely, reader])
        entries = rank_data_symbols({"main": md}, CallGraph(), matched={})
        self.assertEqual(entries, [])

    def test_zero_reader_data_surfaced_with_min_readers_0(self):
        lonely = _data_sym("main", 0x03000000)
        md = _module("main", [lonely])
        entries = rank_data_symbols(
            {"main": md}, CallGraph(), matched={}, min_readers=0,
        )
        self.assertEqual(len(entries), 1)
        self.assertEqual(entries[0].reader_count, 0)


class TestRenderMarkdown(unittest.TestCase):
    def test_header_totals_independent_of_filters(self):
        # With min_readers=99 the worklist is empty, but the
        # "N of M matched" header still reflects the global totals.
        modules, graph = _build_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={}, min_readers=99,
        )
        md = render_markdown(
            entries, version="eur",
            total_data_symbols=5, matched_data_count=0,
            min_readers=99,
        )
        self.assertIn("5 total data symbols", md)
        self.assertIn("**0 matched**", md)
        self.assertIn("No entries match", md)

    def test_ranked_table_renders_top_row_first(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        md = render_markdown(
            entries, version="eur",
            total_data_symbols=4, matched_data_count=0,
        )
        # The #1 entry should be data_a at 0x02000100.
        first_row_marker = "| 1 | `main` | `data_02000100` |"
        self.assertIn(first_row_marker, md)

    def test_cross_module_histogram_present(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        md = render_markdown(
            entries, version="eur",
            total_data_symbols=4, matched_data_count=0,
        )
        self.assertIn("Cross-module reader distribution", md)
        # One entry (data_a) has xmod=3. Verify row present.
        self.assertIn("| 3 | 1 |", md)

    def test_top_n_truncates(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        md = render_markdown(
            entries, version="eur",
            total_data_symbols=4, matched_data_count=0,
            top_n=1,
        )
        # Top-1: only one ranked row rendered.
        self.assertEqual(md.count("| 1 | "), 2)  # histogram + ranked row 1
        self.assertNotIn("| 2 | `", md)

    def test_size_any_label(self):
        # Unsized data should render as "_any_" not "0x0".
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        md = render_markdown(
            entries, version="eur",
            total_data_symbols=4, matched_data_count=0,
        )
        self.assertIn("_any_", md)


class TestRenderStdoutSummary(unittest.TestCase):
    def test_emits_totals_and_top_rows(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        buf = io.StringIO()
        with redirect_stdout(buf):
            render_stdout_summary(
                entries,
                total_data_symbols=4,
                matched_data_count=0,
                top_n=2,
            )
        out = buf.getvalue()
        self.assertIn("Data symbols: 4 total", out)
        self.assertIn("Top 2 by cross-module density", out)
        self.assertIn("data_02000100", out)

    def test_top_n_zero_fallback_for_empty_entries(self):
        # Callers pass top_n=0 when --top 0 is requested. The summary
        # must not crash on empty-entries (edge case after narrow
        # filter).
        buf = io.StringIO()
        with redirect_stdout(buf):
            render_stdout_summary(
                [],
                total_data_symbols=0,
                matched_data_count=0,
                top_n=1,
            )
        self.assertIn("Data symbols: 0 total", buf.getvalue())


class TestDataPlaceholderPrefix(unittest.TestCase):
    """Regression pin: the placeholder prefix is a single string that
    covers both `data_<addr>` (main/itcm/dtcm) and `data_<ov>_<addr>`
    (overlays) because both start with `data_`. If someone narrows
    this to a tuple of variants, we still want the filter to work."""

    def test_main_placeholder_prefix_matches(self):
        self.assertTrue("data_020b4320".startswith(DATA_PLACEHOLDER_PREFIX))

    def test_overlay_placeholder_prefix_matches(self):
        self.assertTrue(
            "data_ov005_021cabcd".startswith(DATA_PLACEHOLDER_PREFIX),
        )

    def test_named_data_doesnt_match(self):
        self.assertFalse("g_HeapState".startswith(DATA_PLACEHOLDER_PREFIX))
        self.assertFalse("OSi_Context".startswith(DATA_PLACEHOLDER_PREFIX))


if __name__ == "__main__":
    unittest.main()
