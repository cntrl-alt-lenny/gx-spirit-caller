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
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import ModuleData, Symbol  # noqa: E402
from cluster_c_pattern3_gen import (  # noqa: E402
    GenContext,
    _collect_external_refs,
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
         sym_by_addr: dict[int, str | tuple[str, str]] | None = None,
         ) -> GenContext:
    """Build a GenContext fixture for the generator tests.

    Brief 166 changed `GenContext.sym_by_addr` from
    `dict[int, str]` to `dict[int, tuple[str, str]]` (the type is
    `(name, kind)` so the directive emitter can branch on
    `kind:label(arm)` vs other kinds). This helper accepts BOTH
    shapes for backwards compat with pre-brief-166 tests:

      - `{addr: "name"}` — bare names get auto-wrapped to
        `(name, "data")` so existing assertions keep their
        existing emission shape.
      - `{addr: ("name", "kind")}` — explicit shape for tests
        that need to pin a non-data kind (e.g. brief 166's
        label-kind regression tests).
    """
    raw = sym_by_addr or {}
    normalised: dict[int, tuple[str, str]] = {}
    for addr, value in raw.items():
        if isinstance(value, tuple):
            normalised[addr] = value
        else:
            normalised[addr] = (value, "data")
    return GenContext(
        version="eur", module="main",
        bytes_source=bytes_source, load_addr=load_addr,
        sym_by_addr=normalised,
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


# ---------------------------------------------------------------------- #
# Brief 144: `.extern` emission for cross-chunk `.word` references.
# ---------------------------------------------------------------------- #


class TestCollectExternalRefs(unittest.TestCase):
    """Unit-level coverage for `_collect_external_refs`.

    The helper walks emitted directive lines, picks out
    `.word <name>` references, and returns the ordered-unique list
    of names NOT defined in the chunk's own `.global` set. This is
    the single source of truth for which `.extern` lines the
    generator emits."""

    def test_extracts_extern_names_in_first_occurrence_order(self):
        directives = [
            "        .word extern_a",
            "        .word extern_b",
            "        .word extern_a",  # dupe — drop
            "        .word extern_c",
        ]
        got = _collect_external_refs(directives, local_names=set())
        self.assertEqual(got, ["extern_a", "extern_b", "extern_c"])

    def test_excludes_locally_defined_names(self):
        # `.word local_x` references the chunk's own symbol →
        # no extern declaration needed.
        directives = [
            "        .word local_x",
            "        .word extern_y",
            "        .word local_z",
            "        .word extern_w",
        ]
        got = _collect_external_refs(
            directives, local_names={"local_x", "local_z"},
        )
        self.assertEqual(got, ["extern_y", "extern_w"])

    def test_ignores_non_word_directives(self):
        # `.ascii`, `.byte`, comments etc. must never produce
        # extern declarations.
        directives = [
            '        .ascii "hello"',
            "        .byte 0x42, 0x99",
            "        .global some_sym",
            "        ; comment line",
            "        .word actual_extern",
            "        .byte 0x00",
        ]
        got = _collect_external_refs(directives, local_names=set())
        self.assertEqual(got, ["actual_extern"])

    def test_empty_input_returns_empty(self):
        self.assertEqual(_collect_external_refs([], set()), [])

    def test_only_locals_returns_empty(self):
        # All `.word` references hit local symbols → no externs.
        directives = [
            "        .word local_a",
            "        .word local_b",
        ]
        got = _collect_external_refs(
            directives, local_names={"local_a", "local_b"},
        )
        self.assertEqual(got, [])

    def test_handles_func_underscore_prefix(self):
        # Real-world: brief 135 chunks reference `func_02033de8`-
        # style symbols. The regex must accept identifier chars
        # (letters, digits, underscores).
        directives = [
            "        .word func_02033de8",
            "        .word func_02034014",
            "        .word data_020c3ca8",
        ]
        got = _collect_external_refs(directives, local_names=set())
        self.assertEqual(
            got,
            ["func_02033de8", "func_02034014", "data_020c3ca8"],
        )

    def test_intra_chunk_reference_is_not_extern(self):
        # The chunk references one of its OWN labels (e.g. a
        # symbol earlier in the chunk pointing to a later symbol).
        # No extern needed; the reference is intra-chunk.
        directives = [
            "        .word data_020b59ec",  # local
            "        .word data_020c5a38",  # extern
        ]
        got = _collect_external_refs(
            directives,
            local_names={"data_020b59e0", "data_020b59ec"},
        )
        self.assertEqual(got, ["data_020c5a38"])


class TestGenerateChunkExternEmission(unittest.TestCase):
    """End-to-end shape: `generate_chunk` must place `.extern`
    declarations in the output `.s` after `.section .rodata` and
    before the first `.global`, matching the brief 135 / 139
    hand-edited convention."""

    def test_single_extern_appears_in_output(self):
        # Chunk with one symbol containing one external `.word`
        # reference. 0x021ab000 LE = 00 b0 1a 02.
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
        self.assertIn(".extern target_ov", result.asm_source)

    def test_multiple_externs_deduplicated_and_ordered(self):
        # Chunk with two symbols: first holds [extern_a, extern_b,
        # extern_a, extern_c], second holds [extern_b again]. The
        # extern block must list each unique name once, in
        # first-occurrence order: extern_a, extern_b, extern_c.
        # All targets are 4-byte aligned.
        bytes_source = (
            # data_100 (16 bytes): a, b, a, c
            b"\x00\x00\x05\x02"  # 0x02050000 → extern_a
            b"\x00\x00\x06\x02"  # 0x02060000 → extern_b
            b"\x00\x00\x05\x02"  # dupe
            b"\x00\x00\x07\x02"  # 0x02070000 → extern_c
            # data_110 (4 bytes): b again
            b"\x00\x00\x06\x02"  # extern_b dupe
        )
        syms_main = [
            _data_sym("data_100", "main", 0x100, size=16),
            _data_sym("data_110", "main", 0x110, size=4),
        ]
        syms_ext = [
            _data_sym("extern_a", "ov000", 0x02050000, size=0),
            _data_sym("extern_b", "ov000", 0x02060000, size=0),
            _data_sym("extern_c", "ov000", 0x02070000, size=0),
        ]
        modules = {
            "main": _module("main", syms_main),
            "ov000": _module("ov000", syms_ext),
        }
        result = generate_chunk(
            "eur", "main", start=0x100, end=0x114,
            modules=modules,
            bytes_source=bytes_source,
            load_addr=0x100,
        )
        # Find the extern lines in the output.
        extern_lines = [
            ln.strip() for ln in result.asm_source.splitlines()
            if ln.strip().startswith(".extern")
        ]
        self.assertEqual(
            extern_lines,
            [".extern extern_a", ".extern extern_b", ".extern extern_c"],
        )

    def test_intra_chunk_word_reference_is_not_extern(self):
        # `data_104` is defined IN the chunk; `data_100`'s pointer
        # at it should NOT produce a .extern declaration.
        bytes_source = (
            b"\x04\x01\x00\x00"  # 0x00000104 → data_104 (intra-chunk)
            b"\x42\x42\x42\x42"  # data_104 (raw bytes)
        )
        syms_main = [
            _data_sym("data_100", "main", 0x100, size=4),
            _data_sym("data_104", "main", 0x104, size=4),
        ]
        modules = {"main": _module("main", syms_main)}
        result = generate_chunk(
            "eur", "main", start=0x100, end=0x108,
            modules=modules,
            bytes_source=bytes_source,
            load_addr=0x100,
        )
        self.assertIn(".word data_104", result.asm_source)
        self.assertNotIn(".extern data_104", result.asm_source)
        # And no other extern was inferred.
        for line in result.asm_source.splitlines():
            self.assertFalse(
                line.strip().startswith(".extern"),
                f"unexpected .extern in output: {line!r}",
            )

    def test_no_externs_produces_no_extern_block(self):
        # Chunk with zero external `.word` references: the output
        # must contain no `.extern` lines AND no blank-line
        # placeholder where the extern block would have been.
        # (Backwards compatibility: matches brief 125 byte-for-
        # byte for chunks that don't need externs.)
        bytes_source = b"NAN(\x00"
        syms = [_data_sym("data_100", "main", 0x100, size=5)]
        result = generate_chunk(
            "eur", "main", start=0x100, end=0x104,
            modules={"main": _module("main", syms)},
            bytes_source=bytes_source + b"\xff\xff\xff",  # pad to 8
            load_addr=0x100,
        )
        self.assertNotIn(".extern", result.asm_source)

    def test_extern_block_placed_after_section_before_global(self):
        # Topological: `.extern X` must appear AFTER `.section
        # .rodata` and BEFORE the first `.global`. Matches the
        # brief 135 / 139 hand-edited convention.
        bytes_source = b"\x00\xb0\x1a\x02"  # → extern_y
        syms_main = [_data_sym("data_100", "main", 0x100, size=4)]
        syms_ext = [_data_sym("extern_y", "ov000", 0x021ab000, size=0)]
        modules = {
            "main": _module("main", syms_main),
            "ov000": _module("ov000", syms_ext),
        }
        result = generate_chunk(
            "eur", "main", start=0x100, end=0x104,
            modules=modules,
            bytes_source=bytes_source,
            load_addr=0x100,
        )
        text = result.asm_source
        section_pos = text.index(".section .rodata")
        extern_pos = text.index(".extern extern_y")
        global_pos = text.index(".global data_100")
        self.assertLess(section_pos, extern_pos)
        self.assertLess(extern_pos, global_pos)


# ---------------------------------------------------------------------- #
# Brief 159 part 1: --section flag (rodata default + data for D-3).
# ---------------------------------------------------------------------- #


class TestGenerateChunkSectionFlag(unittest.TestCase):
    """Brief 159 part 1: `generate_chunk(..., section=...)` controls
    both the `.section .X` directive in the emitted `.s` and the
    `.X start:..` line in the delinks entry. Default `"rodata"` is
    the brief 125 cluster C historical behaviour; `"data"` is the
    brief 157 D-3 path that previously required sed post-processing."""

    def _trivial_chunk(self, *, section: str = "rodata"):
        from cluster_c_pattern3_gen import generate_chunk
        bytes_source = b"NAN(\x00\xff\xff\xff"  # 8 B, ASCII + filler
        syms = [_data_sym("data_100", "main", 0x100, size=8)]
        return generate_chunk(
            "eur", "main", start=0x100, end=0x108,
            section=section,
            modules={"main": _module("main", syms)},
            bytes_source=bytes_source,
            load_addr=0x100,
        )

    def test_default_section_is_rodata(self):
        # Default preserves the brief 125 / 135 / 139 / 144 cluster C
        # behaviour. Existing callers that omit `section` get the
        # same output they always did.
        result = self._trivial_chunk()
        self.assertIn(".section .rodata", result.asm_source)
        self.assertNotIn(".section .data", result.asm_source)
        self.assertIn(".rodata start:0x00000100 end:0x00000108",
                      result.delinks_entry)
        self.assertNotIn(".data start:", result.delinks_entry)

    def test_section_data_emits_data_directive(self):
        # `section="data"` flips both call sites. Brief 157 D-3
        # waves no longer need sed post-processing.
        result = self._trivial_chunk(section="data")
        self.assertIn(".section .data", result.asm_source)
        self.assertNotIn(".section .rodata", result.asm_source)
        self.assertIn(".data start:0x00000100 end:0x00000108",
                      result.delinks_entry)
        self.assertNotIn(".rodata start:", result.delinks_entry)

    def test_unknown_section_raises(self):
        # Only "rodata" and "data" are accepted. Other strings
        # (e.g. ".text", "bss", typos) raise immediately rather
        # than emitting an unsupported section directive that
        # would silently produce a broken `.s`.
        from cluster_c_pattern3_gen import generate_chunk
        with self.assertRaises(ValueError) as ctx:
            generate_chunk(
                "eur", "main", start=0x100, end=0x108,
                section="text",  # not allowed
                modules={
                    "main": _module(
                        "main",
                        [_data_sym("data_100", "main", 0x100, size=8)],
                    ),
                },
                bytes_source=b"\x00" * 8,
                load_addr=0x100,
            )
        self.assertIn("section=", str(ctx.exception))


class TestDetectSection(unittest.TestCase):
    """Brief 159 part 1: `_detect_section` reads delinks.txt's
    section header and picks the section that fully contains the
    requested [start, end) range. Used by the CLI to default
    `--section auto` correctly per chunk."""

    def _write_delinks(self, tmpdir, header_lines, tu_stanza=""):
        """Write a synthetic delinks.txt with the given section
        header lines, then a blank line + optional TU stanza."""
        path = Path(tmpdir) / "delinks.txt"
        path.write_text(
            "\n".join(header_lines) + "\n\n" + tu_stanza,
            encoding="utf-8",
        )
        return path

    def test_parse_section_header_minimal(self):
        from cluster_c_pattern3_gen import _parse_section_header
        with tempfile.TemporaryDirectory() as d:
            p = self._write_delinks(d, [
                "    .text       start:0x02000000 end:0x020b4320 kind:code align:32",
                "    .rodata     start:0x020b4320 end:0x020c3bbc kind:rodata align:4",
                "    .data       start:0x020c3bc0 end:0x02102c60 kind:data align:32",
            ], tu_stanza="src/main/x.c:\n    complete\n")
            sections = _parse_section_header(p)
            self.assertEqual(sections, [
                ("text",   0x02000000, 0x020b4320),
                ("rodata", 0x020b4320, 0x020c3bbc),
                ("data",   0x020c3bc0, 0x02102c60),
            ])

    def test_parse_section_header_missing_file_returns_empty(self):
        from cluster_c_pattern3_gen import _parse_section_header
        sections = _parse_section_header(
            Path("/tmp/does-not-exist-159.txt"),
        )
        self.assertEqual(sections, [])


# ---------------------------------------------------------------------- #
# Brief 166: `kind:label(*)` reference emission — raw hex literal +
# NO `.extern` for local-label symbol cross-TU refs.
# ---------------------------------------------------------------------- #


class TestLabelKindEmission(unittest.TestCase):
    """Brief 166: `.word` directives that resolve to a
    `kind:label(*)` symbol must emit a raw hex literal
    (`.word 0xADDR`) instead of `.word <name>`, AND must NOT
    trigger an `.extern <name>` declaration. mwasmarm rejects
    `.word .L_*` because local labels (`.L_*` per dsd convention)
    are file-scoped in ELF — not exported across TU boundaries.

    Brief 163 surfaced this on `src/main/data/data_020c7b44.s`;
    decomper hand-fixed by substituting `.word .L_<addr>` →
    `.word 0x<addr>` + removing the matching `.extern .L_<addr>`
    lines. Brief 166 makes the generator emit the correct shape
    automatically."""

    def test_single_label_ref_emits_raw_hex(self):
        # Chunk with one `.word` reference to a `kind:label(arm)`
        # symbol. The generator should emit `.word 0x02021008`
        # (raw hex) — NOT `.word .L_02021008` (which mwasmarm
        # rejects).
        bytes_source = b"\x08\x10\x02\x02"  # LE = 0x02021008
        syms_main = [_data_sym("data_100", "main", 0x100, size=4)]
        syms_text = [
            Symbol(
                name=".L_02021008", module="main",
                addr=0x02021008, size=0,
                type="label", mode="arm",
            ),
        ]
        modules = {
            "main": _module("main", syms_main + syms_text),
        }
        result = generate_chunk(
            "eur", "main", start=0x100, end=0x104,
            modules=modules,
            bytes_source=bytes_source,
            load_addr=0x100,
        )
        # Raw hex literal landed in the .s — NOT the symbol name.
        self.assertIn(".word 0x02021008", result.asm_source)
        self.assertNotIn(".word .L_02021008", result.asm_source)
        # And NO .extern was emitted for the label name (would be
        # invalid C / ELF anyway — local-label exports).
        self.assertNotIn(".extern .L_02021008", result.asm_source)

    def test_mixed_label_and_data_refs_each_emitted_correctly(self):
        # Chunk with two `.word` references: one to a `data` symbol
        # (existing `.word <name>` + `.extern <name>` behaviour),
        # one to a `label(arm)` symbol (brief 166's new `.word
        # 0x<addr>` + no `.extern` behaviour).
        bytes_source = (
            b"\x18\x10\x02\x02"  # LE = 0x02021018 → label
            b"\x00\xb0\x1a\x02"  # LE = 0x021ab000 → data
        )
        syms_main = [_data_sym("data_100", "main", 0x100, size=8)]
        syms_other = [
            Symbol(
                name=".L_02021018", module="main",
                addr=0x02021018, size=0,
                type="label", mode="arm",
            ),
            _data_sym("data_target", "ov000", 0x021ab000, size=0),
        ]
        modules = {
            "main": _module("main", syms_main + syms_other[:1]),
            "ov000": _module("ov000", syms_other[1:]),
        }
        result = generate_chunk(
            "eur", "main", start=0x100, end=0x108,
            modules=modules,
            bytes_source=bytes_source,
            load_addr=0x100,
        )
        # Label ref → raw hex; no .extern for it.
        self.assertIn(".word 0x02021018", result.asm_source)
        self.assertNotIn(".extern .L_02021018", result.asm_source)
        # Data ref → named `.word` AND a matching .extern (brief
        # 144 emission carries forward unchanged).
        self.assertIn(".word data_target", result.asm_source)
        self.assertIn(".extern data_target", result.asm_source)


if __name__ == "__main__":
    unittest.main()
