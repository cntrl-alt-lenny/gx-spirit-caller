"""Unit tests for tools/cluster_c_pattern3_gen.py.

The generator emits Pattern 3 chunk .s files per brief 119 / brief 125.
If it mis-emits a directive — wrong .ascii string, mis-resolved
pointer, missing pad byte — the resulting .o won't byte-match extract,
and the chunk's TU silently breaks `dsd check modules`. Pin:

  - byte-pattern → directive selection (ASCII / pointer / raw)
  - ASCII escape correctness
  - chunk-alignment validation (W6 mitigation)
  - symbol range filter + deduced-size correctness
  - cross-module pointer resolution
  - end-to-end generated-string roundtrip
  - delinks entry format
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import ModuleData, Symbol  # noqa: E402
from cluster_c_pattern3_gen import (  # noqa: E402
    GenContext,
    GeneratedChunk,
    _deduce_sizes,
    _emit_directives_for_bytes,
    _escape_ascii_for_asm,
    _extract_bin_path,
    _is_pointer_target_known,
    _looks_like_ascii_string,
    _render_byte_directive,
    _symbols_in_range,
    _validate_chunk_alignment,
    generate_chunk,
)


def _data_sym(name: str, module: str, addr: int, size: int = 0) -> Symbol:
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="data", mode="any",
    )


def _module(name: str, symbols: list[Symbol]) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(symbols)
    md.by_addr = {s.addr: s for s in symbols}
    md.by_addr_sorted = sorted(symbols, key=lambda s: s.addr)
    return md


def _ctx(*, bytes_source: bytes = b"", load_addr: int = 0x02000000,
         sym_by_addr: dict[int, str] | None = None) -> GenContext:
    return GenContext(
        version="eur", module="main",
        bytes_source=bytes_source, load_addr=load_addr,
        sym_by_addr=sym_by_addr or {},
    )


class TestLooksLikeAsciiString(unittest.TestCase):
    def test_null_terminated_printable(self):
        self.assertTrue(_looks_like_ascii_string(b"NAN(\x00"))
        self.assertTrue(_looks_like_ascii_string(b"INFINITY\x00"))

    def test_short_with_null(self):
        # 2 bytes — "a\0"
        self.assertTrue(_looks_like_ascii_string(b"a\x00"))

    def test_rejects_no_null(self):
        self.assertFalse(_looks_like_ascii_string(b"NAN("))

    def test_rejects_single_null(self):
        # Just a null — no printable body.
        self.assertFalse(_looks_like_ascii_string(b"\x00"))

    def test_rejects_non_printable(self):
        self.assertFalse(_looks_like_ascii_string(b"\xff\x80\x00"))

    def test_accepts_tab_and_newline(self):
        # \t and \n are whitelisted as printable for log-line strings.
        self.assertTrue(_looks_like_ascii_string(b"line\n\x00"))


class TestEscapeAsciiForAsm(unittest.TestCase):
    def test_plain_chars_passthrough(self):
        self.assertEqual(_escape_ascii_for_asm(b"hello"), "hello")

    def test_double_quote_escaped(self):
        self.assertEqual(_escape_ascii_for_asm(b'a"b'), 'a\\"b')

    def test_backslash_escaped(self):
        self.assertEqual(_escape_ascii_for_asm(b"a\\b"), "a\\\\b")

    def test_tab_newline_escaped(self):
        self.assertEqual(_escape_ascii_for_asm(b"a\tb\n"), "a\\tb\\n")


class TestPointerTargetKnown(unittest.TestCase):
    def test_known_returns_name(self):
        lookup = {0x02050000: "target_fn"}
        self.assertEqual(_is_pointer_target_known(0x02050000, lookup), "target_fn")

    def test_unknown_returns_none(self):
        lookup = {0x02050000: "target_fn"}
        self.assertIsNone(_is_pointer_target_known(0x02060000, lookup))


class TestValidateChunkAlignment(unittest.TestCase):
    def test_4_aligned_passes(self):
        # No exception.
        _validate_chunk_alignment(0x02000000, 0x02000004)
        _validate_chunk_alignment(0x020c387c, 0x020c398c)

    def test_unaligned_start_raises(self):
        with self.assertRaises(ValueError) as ctx:
            _validate_chunk_alignment(0x02000001, 0x02000008)
        self.assertIn("not 4-aligned", str(ctx.exception))

    def test_unaligned_end_raises(self):
        with self.assertRaises(ValueError):
            _validate_chunk_alignment(0x02000000, 0x02000003)

    def test_end_le_start_raises(self):
        with self.assertRaises(ValueError):
            _validate_chunk_alignment(0x02000004, 0x02000004)


class TestSymbolsInRange(unittest.TestCase):
    def test_filter_by_range_and_type(self):
        syms = [
            _data_sym("data_a", "main", 0x100, size=4),
            _data_sym("data_b", "main", 0x200, size=4),
            _data_sym("data_c", "main", 0x300, size=4),
            Symbol(name="func_x", module="main", addr=0x150,
                   size=0x10, type="function", mode="arm"),
        ]
        md = _module("main", syms)
        modules = {"main": md}
        # Range [0x150, 0x300) should include data_b only.
        result = _symbols_in_range(modules, "main", 0x150, 0x300)
        names = [s.name for s in result]
        self.assertEqual(names, ["data_b"])  # data_c at 0x300 excluded

    def test_unknown_module_returns_empty(self):
        self.assertEqual(_symbols_in_range({}, "missing", 0x100, 0x200), [])


class TestDeduceSizes(unittest.TestCase):
    def test_intermediate_uses_next_addr(self):
        syms = [
            _data_sym("a", "main", 0x100),
            _data_sym("b", "main", 0x104),
            _data_sym("c", "main", 0x110),
        ]
        sizes = _deduce_sizes(syms, end=0x120)
        self.assertEqual(sizes, [4, 12, 16])  # a→b=4; b→c=12; c→end=16

    def test_single_symbol_fills_to_end(self):
        syms = [_data_sym("solo", "main", 0x100)]
        sizes = _deduce_sizes(syms, end=0x110)
        self.assertEqual(sizes, [16])


class TestEmitDirectives(unittest.TestCase):
    def test_ascii_block_becomes_ascii_directive(self):
        ctx = _ctx()
        out = _emit_directives_for_bytes(b"NAN(\x00", 0x02000000, ctx)
        self.assertEqual(len(out), 2)
        self.assertIn('.ascii "NAN("', out[0])
        self.assertIn(".byte 0x00", out[1])

    def test_4byte_known_pointer_becomes_word_directive(self):
        ctx = _ctx(sym_by_addr={0x02050000: "target_fn"})
        # 0x02050000 little-endian
        out = _emit_directives_for_bytes(b"\x00\x00\x05\x02", 0x02000000, ctx)
        self.assertEqual(len(out), 1)
        self.assertIn(".word target_fn", out[0])

    def test_4byte_unknown_pointer_becomes_byte_directive(self):
        ctx = _ctx(sym_by_addr={})
        out = _emit_directives_for_bytes(b"\x00\x00\x05\x02", 0x02000000, ctx)
        self.assertEqual(len(out), 1)
        self.assertIn(".byte", out[0])

    def test_multi_word_with_embedded_pointer_splits(self):
        # 12 bytes: 4 raw + 4 pointer + 4 raw
        ctx = _ctx(sym_by_addr={0x02050000: "target_fn"})
        b = b"\x42\x42\x42\x42" + b"\x00\x00\x05\x02" + b"\x11\x11\x11\x11"
        out = _emit_directives_for_bytes(b, 0x02000000, ctx)
        # Expect: .byte 0x42*4, .word target_fn, .byte 0x11*4
        joined = "\n".join(out)
        self.assertIn(".byte 0x42", joined)
        self.assertIn(".word target_fn", joined)
        self.assertIn(".byte 0x11", joined)

    def test_unaligned_address_skips_pointer_check(self):
        # addr % 4 != 0 → no pointer detection even for 4-byte block.
        ctx = _ctx(sym_by_addr={0x02050000: "target_fn"})
        out = _emit_directives_for_bytes(
            b"\x00\x00\x05\x02", 0x02000002, ctx,  # addr unaligned
        )
        # Should fall through to .byte directive.
        self.assertIn(".byte", out[0])


class TestRenderByteDirective(unittest.TestCase):
    def test_short_inline(self):
        # ≤8 bytes → single line.
        ctx = _ctx()
        d = _render_byte_directive([0x00, 0x01, 0x02], ctx)
        self.assertIn("0x00, 0x01, 0x02", d)
        self.assertEqual(d.count("\n"), 0)

    def test_long_wraps_at_8_per_line(self):
        ctx = _ctx()
        d = _render_byte_directive(list(range(20)), ctx)
        # 3 lines (8 + 8 + 4 bytes)
        self.assertEqual(d.count(".byte"), 3)


class TestExtractBinPath(unittest.TestCase):
    def test_main_path(self):
        path = _extract_bin_path("eur", "main")
        self.assertTrue(str(path).endswith("extract/eur/arm9/arm9.bin"))

    def test_overlay_path(self):
        path = _extract_bin_path("eur", "ov005")
        self.assertTrue(str(path).endswith("extract/eur/arm9/arm9_ov005.bin"))

    def test_tcm_path(self):
        self.assertTrue(str(_extract_bin_path("eur", "dtcm")).endswith("dtcm.bin"))
        self.assertTrue(str(_extract_bin_path("eur", "itcm")).endswith("itcm.bin"))


class TestGenerateChunkSmoke(unittest.TestCase):
    """End-to-end smoke for generate_chunk() using injected fixtures."""

    def test_two_symbol_ascii_chunk(self):
        # Two adjacent ASCII strings: "AB\0" (3 bytes) + "XY\0Z\0"
        # (5 bytes) — 8 bytes total at 0x100-0x108.
        # Use only single trailing null per symbol so ASCII heuristic fires.
        bytes_source = b"AB\x00XY\x00Z\x00"   # 8 bytes starting at 0x100
        syms = [
            _data_sym("data_100", "main", 0x100, size=0),
            _data_sym("data_103", "main", 0x103, size=0),
            _data_sym("data_106", "main", 0x106, size=0),
        ]
        md = _module("main", syms)
        result = generate_chunk(
            "eur", "main", start=0x100, end=0x108,
            modules={"main": md},
            bytes_source=bytes_source,
            load_addr=0x100,
        )
        self.assertEqual(result.symbol_count, 3)
        self.assertIn(".global data_100", result.asm_source)
        self.assertIn(".global data_103", result.asm_source)
        self.assertIn(".global data_106", result.asm_source)
        self.assertIn('.ascii "AB"', result.asm_source)
        self.assertIn('.ascii "XY"', result.asm_source)
        self.assertIn('.ascii "Z"', result.asm_source)
        # delinks entry includes the .rodata range line.
        self.assertIn(".rodata start:0x00000100 end:0x00000108",
                      result.delinks_entry)

    def test_alignment_violation_raises(self):
        with self.assertRaises(ValueError):
            generate_chunk(
                "eur", "main", start=0x101, end=0x104,
                modules={"main": _module("main", [])},
                bytes_source=b"",
                load_addr=0x100,
            )

    def test_empty_range_raises(self):
        # 4-aligned range with no symbols inside → ValueError.
        with self.assertRaises(ValueError):
            generate_chunk(
                "eur", "main", start=0x100, end=0x108,
                modules={"main": _module("main", [])},
                bytes_source=b"\x00" * 8,
                load_addr=0x100,
            )

    def test_cross_module_pointer_resolution(self):
        # Pointer in chunk resolves to a symbol from a DIFFERENT module
        # (e.g., chunk in main pointing to an overlay symbol).
        # Value 0x021ab000 LE = bytes 00 b0 1a 02.
        bytes_source = b"\x00\xb0\x1a\x02"
        syms_main = [_data_sym("data_100", "main", 0x100, size=4)]
        syms_ov = [_data_sym("target_ov", "ov000", 0x021ab000, size=0)]
        modules = {
            "main": _module("main", syms_main),
            "ov000": _module("ov000", syms_ov),
        }
        result = generate_chunk(
            "eur", "main", start=0x100, end=0x104,
            modules=modules,
            bytes_source=bytes_source,
            load_addr=0x100,
        )
        self.assertIn(".word target_ov", result.asm_source)


if __name__ == "__main__":
    unittest.main()
