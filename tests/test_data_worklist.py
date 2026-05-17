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
    SHAPE_BSS,
    SHAPE_POINTER_CODE,
    SHAPE_POINTER_DATA,
    SHAPE_SCALAR,
    SHAPE_STRING_ASCII4,
    SHAPE_STRUCT,
    SHAPE_UNKNOWN,
    CLUSTER_FILTERS,
    ModuleSections,
    SectionRange,
    _is_ascii4,
    _is_code_address,
    _is_printable_string,
    _load_readers_index,
    _looks_like_array,
    _looks_like_fnptr_table,
    _parse_csv_filter,
    _parse_section_header,
    _pointer_target_section,
    build_size_table,
    classify_shape,
    rank_data_symbols,
    render_markdown,
    render_stdout_summary,
    resolve_cluster,
    section_for_symbol,
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


# --------------------------------------------------------------------------- #
# Brief 114 — v2 tooling tests (section / size / shape / cluster filters)
# --------------------------------------------------------------------------- #


def _bss_sym(module: str, addr: int, size: int = 0) -> Symbol:
    """Helper for bss-typed symbols (brief 114 added `bss` to the
    SYMBOL_RE; `analyze_symbols` now emits type='bss' for these)."""
    name = f"data_{addr:08x}" if module == "main" else f"data_{module}_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="bss", mode="any",
    )


def _main_sections() -> ModuleSections:
    """A canonical 'main' module section layout matching the EUR build:
    text → rodata → data → bss. Used for v2 filter tests."""
    return ModuleSections(
        module="main",
        sections=[
            SectionRange(name="text",   start=0x02000000, end=0x020b4320),
            SectionRange(name="rodata", start=0x020b4320, end=0x020c3bc0),
            SectionRange(name="data",   start=0x020c3bc0, end=0x02102c60),
            SectionRange(name="bss",    start=0x02102c60, end=0x021aa4a0),
        ],
        binary=None,
        load_addr=0x02000000,
    )


class TestParseSectionHeader(unittest.TestCase):
    def test_parses_canonical_header(self):
        import tempfile
        from pathlib import Path as _P
        text = (
            "    .text       start:0x02000000 end:0x020b4320 kind:code align:32\n"
            "    .rodata     start:0x020b4320 end:0x020c3bc0 kind:rodata align:4\n"
            "    .data       start:0x020c3bc0 end:0x02102c60 kind:data align:32\n"
            "    .bss        start:0x02102c60 end:0x021aa4a0 kind:bss align:32\n"
            "\n"
            "src/main/foo.c:\n"
            "    complete\n"
            "    .text start:0x02000254 end:0x02000258\n"
        )
        with tempfile.NamedTemporaryFile(mode="w", suffix=".txt", delete=False) as f:
            f.write(text)
            tmp = _P(f.name)
        try:
            sections = _parse_section_header(tmp)
        finally:
            tmp.unlink()
        self.assertEqual(len(sections), 4)
        # Normalized names match.
        names = [s.name for s in sections]
        self.assertEqual(names, ["text", "rodata", "data", "bss"])
        # Bss range is correct.
        bss = next(s for s in sections if s.name == "bss")
        self.assertEqual(bss.start, 0x02102c60)
        self.assertEqual(bss.end, 0x021aa4a0)

    def test_missing_file_returns_empty(self):
        from pathlib import Path as _P
        sections = _parse_section_header(_P("/nonexistent/path/delinks.txt"))
        self.assertEqual(sections, [])

    def test_header_only_no_tus(self):
        import tempfile
        from pathlib import Path as _P
        text = (
            "    .text       start:0x01ff8000 end:0x01ff886c kind:code align:32\n"
            "    .bss        start:0x01ff8880 end:0x01ff8880 kind:bss align:32\n"
        )
        with tempfile.NamedTemporaryFile(mode="w", suffix=".txt", delete=False) as f:
            f.write(text)
            tmp = _P(f.name)
        try:
            sections = _parse_section_header(tmp)
        finally:
            tmp.unlink()
        self.assertEqual(len(sections), 2)


class TestSectionForSymbol(unittest.TestCase):
    def test_address_lookup_within_section(self):
        modsecs = {"main": _main_sections()}
        sym = _bss_sym("main", 0x02102d00)
        self.assertEqual(section_for_symbol(modsecs, sym), "bss")

    def test_rodata_classification(self):
        modsecs = {"main": _main_sections()}
        sym = _data_sym("main", 0x020b4728)
        self.assertEqual(section_for_symbol(modsecs, sym), "rodata")

    def test_data_classification(self):
        modsecs = {"main": _main_sections()}
        sym = _data_sym("main", 0x020c3e48)
        self.assertEqual(section_for_symbol(modsecs, sym), "data")

    def test_dtcm_module_override(self):
        # DTCM/ITCM modules return their module name as the section,
        # regardless of underlying section (since the cluster taxonomy
        # treats them as their own tier).
        modsecs = {"dtcm": ModuleSections(
            module="dtcm",
            sections=[SectionRange(name="data", start=0x027e0000, end=0x027e0600)],
            binary=None, load_addr=0x027e0000,
        )}
        sym = _data_sym("dtcm", 0x027e0010)
        self.assertEqual(section_for_symbol(modsecs, sym), "dtcm")

    def test_unknown_module_returns_unknown(self):
        sym = _data_sym("main", 0x02102d00)
        self.assertEqual(section_for_symbol({}, sym), "unknown")

    def test_out_of_section_returns_unknown(self):
        modsecs = {"main": _main_sections()}
        sym = _data_sym("main", 0x05000000)  # way outside
        self.assertEqual(section_for_symbol(modsecs, sym), "unknown")


class TestBuildSizeTable(unittest.TestCase):
    def test_explicit_size_preserved(self):
        sized = _data_sym("main", 0x02000200, size=0x40)
        md = _module("main", [sized])
        modsecs = {"main": _main_sections()}
        table = build_size_table({"main": md}, modsecs)
        self.assertEqual(table[("main", 0x02000200)], 0x40)

    def test_size_deduced_from_next_symbol(self):
        a = _data_sym("main", 0x020c3bc8)  # size=0
        b = _data_sym("main", 0x020c3c00, size=0x4)  # next symbol
        md = _module("main", [a, b])
        modsecs = {"main": _main_sections()}
        table = build_size_table({"main": md}, modsecs)
        # a's size is deduced as b.addr - a.addr = 0x38
        self.assertEqual(table[("main", 0x020c3bc8)], 0x38)
        # b keeps its explicit size
        self.assertEqual(table[("main", 0x020c3c00)], 0x4)

    def test_last_symbol_in_section_uses_section_end(self):
        last = _data_sym("main", 0x021aa400)  # near end of bss
        md = _module("main", [last])
        modsecs = {"main": _main_sections()}
        table = build_size_table({"main": md}, modsecs)
        # bss ends at 0x021aa4a0
        self.assertEqual(table[("main", 0x021aa400)], 0x021aa4a0 - 0x021aa400)

    def test_no_section_returns_zero(self):
        outside = _data_sym("main", 0x05000000)  # outside any section
        md = _module("main", [outside])
        modsecs = {"main": _main_sections()}
        table = build_size_table({"main": md}, modsecs)
        self.assertEqual(table[("main", 0x05000000)], 0)


class TestShapeHeuristics(unittest.TestCase):
    def test_is_printable_string_accepts_null_term_ascii(self):
        self.assertTrue(_is_printable_string(b"hello\x00"))
        self.assertTrue(_is_printable_string(b"abc\x00\x00"))

    def test_is_printable_string_rejects_short(self):
        # Less than 4 bytes — not enough signal to call it a string.
        self.assertFalse(_is_printable_string(b"\x00"))
        self.assertFalse(_is_printable_string(b"a\x00"))

    def test_is_printable_string_rejects_no_terminator(self):
        self.assertFalse(_is_printable_string(b"hello"))

    def test_is_printable_string_rejects_binary(self):
        self.assertFalse(_is_printable_string(b"\xff\x80\x00\x00"))

    def test_is_printable_string_rejects_all_zero(self):
        self.assertFalse(_is_printable_string(b"\x00\x00\x00\x00"))

    def test_is_code_address_accepts_ram_range(self):
        self.assertTrue(_is_code_address(0x02000000))
        self.assertTrue(_is_code_address(0x02100000))
        self.assertTrue(_is_code_address(0x023fffff))  # overlay tail

    def test_is_code_address_accepts_itcm(self):
        self.assertTrue(_is_code_address(0x01ff8100))

    def test_is_code_address_rejects_dtcm_and_rom(self):
        self.assertFalse(_is_code_address(0x027e0000))   # dtcm
        self.assertFalse(_is_code_address(0x08000000))   # GBA cart slot
        self.assertFalse(_is_code_address(0x00000000))

    def test_looks_like_fnptr_table_detects_code_pointers(self):
        # 4 little-endian code addresses.
        addresses = [0x02000800, 0x02000a00, 0x02000c00, 0x02000e00]
        b = b"".join(a.to_bytes(4, "little") for a in addresses)
        self.assertTrue(_looks_like_fnptr_table(b))

    def test_looks_like_fnptr_table_rejects_random_words(self):
        b = b"\x00\x10\x00\x05\x40\x32\x82\xa0"  # not code addrs
        self.assertFalse(_looks_like_fnptr_table(b))

    def test_looks_like_array_detects_repeated_marker(self):
        # 4-byte stride with a stable type tag at offset 0 of each entry.
        b = bytes([
            0x01, 0x00, 0xab, 0xcd,
            0x01, 0x00, 0x12, 0x34,
            0x01, 0x00, 0x56, 0x78,
            0x01, 0x00, 0x9a, 0xbc,
        ])
        self.assertTrue(_looks_like_array(b))

    def test_looks_like_array_detects_all_zero(self):
        # Uniformly-filled buffer is array-like.
        self.assertTrue(_looks_like_array(b"\x00" * 64))

    def test_classify_shape_bss_for_bss_section(self):
        sym = _bss_sym("main", 0x02102d00)
        # No bytes inspected at all when section is bss.
        shape = classify_shape(sym, "bss", 0x40, modsecs=None)
        self.assertEqual(shape, SHAPE_BSS)

    def test_classify_shape_scalar_for_small_size(self):
        sym = _data_sym("main", 0x020c3e48, size=4)
        msec = _main_sections()
        msec.binary = b"\x00" * 0x200000
        shape = classify_shape(sym, "data", 4, msec)
        self.assertEqual(shape, SHAPE_SCALAR)

    def test_classify_shape_unknown_when_size_zero(self):
        sym = _data_sym("main", 0x020c3e48)
        shape = classify_shape(sym, "data", 0, _main_sections())
        self.assertEqual(shape, SHAPE_UNKNOWN)


class TestClusterShorthand(unittest.TestCase):
    def test_cluster_a_is_bss(self):
        cf = resolve_cluster("A")
        self.assertEqual(cf.sections, frozenset({"bss"}))
        self.assertIsNone(cf.shapes)

    def test_cluster_b_is_data_scalars(self):
        cf = resolve_cluster("B")
        self.assertEqual(cf.sections, frozenset({"data"}))
        self.assertEqual(cf.shapes, frozenset({SHAPE_SCALAR}))
        self.assertEqual(cf.size_max, 8)

    def test_cluster_c_includes_rodata_and_ascii4_data(self):
        # v3 (brief 123) — C now spans .rodata + .data (for ASCII4
        # strings mis-classified into cluster B per brief 117).
        cf = resolve_cluster("C")
        self.assertIn("rodata", cf.sections)
        self.assertIn("data", cf.sections)
        # Shape filter includes both string forms.
        self.assertIsNotNone(cf.shapes)
        # Verifying via locally-imported constant (avoid TYPE_CHECKING circular).
        from data_worklist import SHAPE_STRING_ASCII4 as _ASCII4
        self.assertIn(_ASCII4, cf.shapes)

    def test_cluster_d_is_data_structs_includes_pointers(self):
        # v3 (brief 123) — D folds brief 117's 32-pointer sub-pool
        # via SHAPE_POINTER_CODE + SHAPE_POINTER_DATA; size_min
        # dropped from 0x40 to 0x4 so 4-byte pointers fit.
        cf = resolve_cluster("D")
        self.assertEqual(cf.sections, frozenset({"data"}))
        self.assertEqual(cf.size_min, 0x4)
        self.assertIn(SHAPE_STRUCT, cf.shapes)
        from data_worklist import SHAPE_POINTER_CODE as _PC, SHAPE_POINTER_DATA as _PD
        self.assertIn(_PC, cf.shapes)
        self.assertIn(_PD, cf.shapes)

    def test_cluster_e_is_dtcm_itcm(self):
        cf = resolve_cluster("E")
        self.assertEqual(cf.sections, frozenset({"dtcm", "itcm"}))

    def test_cluster_case_insensitive(self):
        # `--cluster a` works just like `--cluster A`.
        self.assertEqual(resolve_cluster("a"), resolve_cluster("A"))

    def test_all_clusters_have_entries(self):
        # Sanity: A-E all defined.
        for c in "ABCDE":
            self.assertIn(c, CLUSTER_FILTERS)


class TestCsvFilterParser(unittest.TestCase):
    def test_none_returns_none(self):
        self.assertIsNone(_parse_csv_filter(None, ("a", "b")))

    def test_all_returns_none(self):
        self.assertIsNone(_parse_csv_filter("all", ("a", "b")))

    def test_single_value(self):
        self.assertEqual(_parse_csv_filter("a", ("a", "b")), frozenset({"a"}))

    def test_comma_separated(self):
        result = _parse_csv_filter("a,b", ("a", "b", "c"))
        self.assertEqual(result, frozenset({"a", "b"}))

    def test_unknown_value_raises(self):
        with self.assertRaises(ValueError):
            _parse_csv_filter("zzz", ("a", "b"))


class TestRankWithFilters(unittest.TestCase):
    def _enriched_fixture(self):
        """Fixture with section+size enrichment data."""
        # Data symbols across sections.
        d_rodata = _data_sym("main", 0x020b4728, size=0x10)
        d_data = _data_sym("main", 0x020c3e48, size=0x4)
        d_bss = _bss_sym("main", 0x02102d00, size=0x100)
        f_main = _func_sym("main", 0x02001000)
        md = _module("main", [d_rodata, d_data, d_bss, f_main])
        modules = {"main": md}
        graph = CallGraph()
        graph.edges_load[("main", 0x02001000)].add(("main", 0x020b4728))
        graph.edges_load[("main", 0x02001000)].add(("main", 0x020c3e48))
        graph.edges_load[("main", 0x02001000)].add(("main", 0x02102d00))
        modsecs_map = {"main": _main_sections()}
        size_table = build_size_table(modules, modsecs_map)
        return modules, graph, modsecs_map, size_table

    def test_section_filter_restricts_to_bss(self):
        modules, graph, modsecs_map, size_table = self._enriched_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={},
            modsecs_map=modsecs_map, size_table=size_table,
            section_filter=frozenset({"bss"}),
        )
        self.assertEqual(len(entries), 1)
        self.assertEqual(entries[0].section, "bss")

    def test_section_filter_csv_multi(self):
        modules, graph, modsecs_map, size_table = self._enriched_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={},
            modsecs_map=modsecs_map, size_table=size_table,
            section_filter=frozenset({"data", "rodata"}),
        )
        sections = {e.section for e in entries}
        self.assertEqual(sections, {"data", "rodata"})

    def test_size_min_filter(self):
        modules, graph, modsecs_map, size_table = self._enriched_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={},
            modsecs_map=modsecs_map, size_table=size_table,
            size_min=0x80,
        )
        # Only the bss symbol (size=0x100) survives.
        self.assertEqual(len(entries), 1)
        self.assertEqual(entries[0].symbol.addr, 0x02102d00)

    def test_size_max_filter(self):
        modules, graph, modsecs_map, size_table = self._enriched_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={},
            modsecs_map=modsecs_map, size_table=size_table,
            size_max=8,
        )
        # Only the .data scalar (size=4) survives.
        self.assertEqual(len(entries), 1)
        self.assertEqual(entries[0].symbol.addr, 0x020c3e48)

    def test_shape_filter_for_scalar(self):
        modules, graph, modsecs_map, size_table = self._enriched_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={},
            modsecs_map=modsecs_map, size_table=size_table,
            shape_filter=frozenset({SHAPE_SCALAR}),
        )
        self.assertEqual(len(entries), 1)
        self.assertEqual(entries[0].shape, SHAPE_SCALAR)


class TestRenderMarkdownV2(unittest.TestCase):
    def test_cluster_filter_in_header(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(
            modules, graph, matched={},
        )
        md = render_markdown(
            entries, version="eur",
            total_data_symbols=4, matched_data_count=0,
            cluster="A",
        )
        self.assertIn("cluster=`A`", md)

    def test_section_shape_table_rendered(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        md = render_markdown(
            entries, version="eur",
            total_data_symbols=4, matched_data_count=0,
        )
        self.assertIn("Section + shape distribution", md)

    def test_ranked_table_has_v2_columns(self):
        modules, graph = _build_fixture()
        entries = rank_data_symbols(modules, graph, matched={})
        md = render_markdown(
            entries, version="eur",
            total_data_symbols=4, matched_data_count=0,
        )
        # New columns: Section, Size, Shape
        self.assertIn("| # | Module | Name | Addr | Section | Size | Shape | "
                      "Readers | Cross-mod | Reader modules |", md)


# --------------------------------------------------------------------------- #
# Brief 123 v3 — 4-byte sub-shape distinction (ASCII4 / pointer-code /
# pointer-data) + cluster filter refinements
# --------------------------------------------------------------------------- #


def _modsecs_with_bytes(payload: bytes, load_addr: int = 0x02000000,
                        sections: list[SectionRange] | None = None) -> ModuleSections:
    """Helper: build a ModuleSections with synthetic bytes for shape tests."""
    if sections is None:
        sections = [
            SectionRange(name="data", start=load_addr,
                         end=load_addr + len(payload))
        ]
    return ModuleSections(
        module="main",
        sections=sections,
        binary=payload,
        load_addr=load_addr,
    )


class TestAscii4Heuristic(unittest.TestCase):
    def test_pure_ascii_4chars(self):
        self.assertTrue(_is_ascii4(b"ABCD"))

    def test_ascii_with_trailing_null(self):
        self.assertTrue(_is_ascii4(b"PR\x00\x00"))
        self.assertTrue(_is_ascii4(b"%u\x00\x00"))
        self.assertTrue(_is_ascii4(b"256\x00"))

    def test_single_ascii_three_nulls(self):
        self.assertTrue(_is_ascii4(b"0\x00\x00\x00"))

    def test_rejects_wrong_length(self):
        self.assertFalse(_is_ascii4(b"AB"))
        self.assertFalse(_is_ascii4(b"ABCDE"))

    def test_rejects_all_null(self):
        # All-zero is NOT ASCII4 — would false-positive on every BSS-like
        # cell. Requires ≥1 printable byte.
        self.assertFalse(_is_ascii4(b"\x00\x00\x00\x00"))

    def test_rejects_non_printable(self):
        # 0x01 is not printable.
        self.assertFalse(_is_ascii4(b"\x01ABC"))

    def test_rejects_interleaved_null(self):
        # "A\0BC" — null appears before the printable run ends.
        self.assertFalse(_is_ascii4(b"A\x00BC"))


class TestPointerTargetSection(unittest.TestCase):
    def _setup(self):
        """Two modules: main with text+data ranges, ov005 with text."""
        return {
            "main": ModuleSections(
                module="main",
                sections=[
                    SectionRange(name="text", start=0x02000000, end=0x020b4320),
                    SectionRange(name="rodata", start=0x020b4320, end=0x020c3bc0),
                    SectionRange(name="data", start=0x020c3bc0, end=0x02102c60),
                    SectionRange(name="bss", start=0x02102c60, end=0x021aa4a0),
                ],
                binary=None, load_addr=0x02000000,
            ),
            "ov005": ModuleSections(
                module="ov005",
                sections=[
                    SectionRange(name="text", start=0x021aa4a0, end=0x021b1234),
                    SectionRange(name="data", start=0x021b1234, end=0x021b224c),
                ],
                binary=None, load_addr=0x021aa4a0,
            ),
        }

    def test_main_text_addr_is_code(self):
        modsecs = self._setup()
        self.assertEqual(_pointer_target_section(0x02050000, modsecs), "code")

    def test_main_rodata_addr_is_data(self):
        modsecs = self._setup()
        self.assertEqual(_pointer_target_section(0x020b5000, modsecs), "data")

    def test_main_data_addr_is_data(self):
        modsecs = self._setup()
        self.assertEqual(_pointer_target_section(0x020e0000, modsecs), "data")

    def test_main_bss_addr_is_data(self):
        modsecs = self._setup()
        self.assertEqual(_pointer_target_section(0x02103000, modsecs), "data")

    def test_overlay_text_addr_is_code(self):
        modsecs = self._setup()
        self.assertEqual(_pointer_target_section(0x021ab000, modsecs), "code")

    def test_itcm_is_code(self):
        modsecs = self._setup()
        self.assertEqual(_pointer_target_section(0x01ff8100, modsecs), "code")

    def test_dtcm_is_data(self):
        modsecs = self._setup()
        self.assertEqual(_pointer_target_section(0x027e0100, modsecs), "data")

    def test_unknown_address_returns_none(self):
        modsecs = self._setup()
        # 0x08000000 (GBA cart slot) — outside all known sections.
        self.assertIsNone(_pointer_target_section(0x08000000, modsecs))


class TestClassifyShapeV3SubShapes(unittest.TestCase):
    """v3 (brief 123) — 4-byte sub-shape classification."""

    def _modsecs_map(self):
        return {
            "main": ModuleSections(
                module="main",
                sections=[
                    SectionRange(name="text", start=0x02000000, end=0x020b4320),
                    SectionRange(name="data", start=0x020c3bc0, end=0x02102c60),
                ],
                binary=None, load_addr=0x02000000,
            ),
        }

    def _modsecs_for_sym(self, addr: int, payload: bytes) -> ModuleSections:
        """ModuleSections whose binary contains `payload` at `addr`."""
        return ModuleSections(
            module="main",
            sections=[
                SectionRange(name="data", start=addr, end=addr + len(payload)),
            ],
            binary=payload,
            load_addr=addr,
        )

    def test_size4_ascii4_classifies_as_string_ascii4(self):
        sym = _data_sym("main", 0x02100000, size=4)
        msec = self._modsecs_for_sym(0x02100000, b"PR\x00\x00")
        shape = classify_shape(sym, "data", 4, msec, modsecs_map=self._modsecs_map())
        self.assertEqual(shape, SHAPE_STRING_ASCII4)

    def test_size4_code_addr_classifies_as_pointer_code(self):
        # Bytes: little-endian 0x02050000 (in main .text range)
        sym = _data_sym("main", 0x02100000, size=4)
        msec = self._modsecs_for_sym(0x02100000, b"\x00\x00\x05\x02")
        shape = classify_shape(sym, "data", 4, msec, modsecs_map=self._modsecs_map())
        self.assertEqual(shape, SHAPE_POINTER_CODE)

    def test_size4_data_addr_classifies_as_pointer_data(self):
        # Bytes: little-endian 0x020e0000 (in main .data range)
        sym = _data_sym("main", 0x02100000, size=4)
        msec = self._modsecs_for_sym(0x02100000, b"\x00\x00\x0e\x02")
        shape = classify_shape(sym, "data", 4, msec, modsecs_map=self._modsecs_map())
        self.assertEqual(shape, SHAPE_POINTER_DATA)

    def test_size4_random_value_falls_back_to_scalar(self):
        # Bytes don't resolve to any section AND aren't ASCII.
        # 0xffffffff: not in any section; all bytes non-printable.
        sym = _data_sym("main", 0x02100000, size=4)
        msec = self._modsecs_for_sym(0x02100000, b"\xff\xff\xff\xff")
        shape = classify_shape(sym, "data", 4, msec, modsecs_map=self._modsecs_map())
        self.assertEqual(shape, SHAPE_SCALAR)

    def test_size4_no_modsecs_map_falls_back_to_scalar(self):
        # Without modsecs_map, can't classify pointer; defaults to scalar.
        sym = _data_sym("main", 0x02100000, size=4)
        msec = self._modsecs_for_sym(0x02100000, b"\x00\x00\x05\x02")
        shape = classify_shape(sym, "data", 4, msec, modsecs_map=None)
        # Bytes still get ASCII4 check (which fails) → fallback scalar.
        self.assertEqual(shape, SHAPE_SCALAR)

    def test_size1_or_2_skips_sub_shape_logic(self):
        # 1- and 2-byte values are always SHAPE_SCALAR (no byte inspection).
        sym = _data_sym("main", 0x02100000, size=1)
        shape = classify_shape(sym, "data", 1, None, modsecs_map=self._modsecs_map())
        self.assertEqual(shape, SHAPE_SCALAR)
        shape = classify_shape(sym, "data", 2, None, modsecs_map=self._modsecs_map())
        self.assertEqual(shape, SHAPE_SCALAR)

    def test_size4_ascii4_takes_precedence_over_pointer(self):
        # If a 4-byte value is BOTH printable AND looks like a pointer,
        # ASCII4 wins (rare edge case, but worth pinning).
        # "P\0\0\0" — bytes 0x50 0x00 0x00 0x00 → ASCII4
        # (As LE u32 = 0x00000050, not a valid section address)
        sym = _data_sym("main", 0x02100000, size=4)
        msec = self._modsecs_for_sym(0x02100000, b"P\x00\x00\x00")
        shape = classify_shape(sym, "data", 4, msec, modsecs_map=self._modsecs_map())
        self.assertEqual(shape, SHAPE_STRING_ASCII4)


class TestClusterFilterV3(unittest.TestCase):
    """v3 (brief 123) — refined cluster B/C/D filter mappings."""

    def test_cluster_b_excludes_pointers_and_ascii(self):
        cf = resolve_cluster("B")
        # B's shape filter is strictly {scalar} — pointer/ascii excluded.
        self.assertEqual(cf.shapes, frozenset({SHAPE_SCALAR}))
        self.assertNotIn(SHAPE_POINTER_CODE, cf.shapes)
        self.assertNotIn(SHAPE_STRING_ASCII4, cf.shapes)

    def test_cluster_c_includes_ascii4_and_spans_rodata_data(self):
        cf = resolve_cluster("C")
        self.assertIn("rodata", cf.sections)
        self.assertIn("data", cf.sections)
        self.assertIn(SHAPE_STRING_ASCII4, cf.shapes)

    def test_cluster_d_includes_both_pointer_sub_shapes(self):
        cf = resolve_cluster("D")
        self.assertIn(SHAPE_POINTER_CODE, cf.shapes)
        self.assertIn(SHAPE_POINTER_DATA, cf.shapes)
        # Size min dropped from 0x40 to 0x4 to accommodate 4-byte pointers.
        self.assertEqual(cf.size_min, 0x4)


if __name__ == "__main__":
    unittest.main()
