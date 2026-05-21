"""Tests for tools/cross_region_cluster_apply.py (brief 170).

The tool's job is to enumerate cluster B / D-3 candidates per
region + module from the region's own `symbols.txt` /
`delinks.txt` / `relocs.txt` / extracted binary, and emit the
right claim recipe per sub-pool. These tests pin the
enumeration filtering + recipe-rendering contract against
synthetic fixtures so future refactors don't silently drift the
classification logic.

The real cross-region apply (PR-level integration) is covered by
the 3-region `ninja sha1` check that runs pre-merge.
"""

from __future__ import annotations

import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import Reloc, Symbol  # noqa: E402
from cross_region_cluster_apply import (  # noqa: E402
    ClaimedRange,
    DelinksMap,
    PointerCandidate,
    RegionContext,
    RegionPaths,
    ScalarCandidate,
    enumerate_b_pointers,
    enumerate_b_true_scalars,
    infer_symbol_sizes,
    is_addr_claimed,
    module_id_to_overlay_num,
    overlay_num_to_module_id,
    parse_delinks,
    render_b_pointer,
    render_b_true_scalar,
    src_subdir_for_module,
)


# --------------------------------------------------------------------------- #
# Module id helpers
# --------------------------------------------------------------------------- #


class TestModuleIdHelpers(unittest.TestCase):

    def test_main_maps_to_none(self) -> None:
        self.assertIsNone(module_id_to_overlay_num("main"))
        self.assertEqual(overlay_num_to_module_id(None), "main")
        self.assertEqual(src_subdir_for_module(None), "main")

    def test_ovNNN_form(self) -> None:
        self.assertEqual(module_id_to_overlay_num("ov007"), 7)
        self.assertEqual(module_id_to_overlay_num("ov023"), 23)
        self.assertEqual(module_id_to_overlay_num("overlay007"), 7)
        self.assertEqual(overlay_num_to_module_id(7), "ov007")
        self.assertEqual(src_subdir_for_module(7), "overlay007")

    def test_invalid_id_raises(self) -> None:
        with self.assertRaisesRegex(ValueError, "unrecognised module"):
            module_id_to_overlay_num("foo")


# --------------------------------------------------------------------------- #
# delinks.txt parsing
# --------------------------------------------------------------------------- #


class TestDelinksParser(unittest.TestCase):
    """Pin the section-map + claim-range parser against the
    exact layout `dsd init` produces (indented section stanza
    at file head, then per-TU stanzas)."""

    def _write(self, body: str) -> Path:
        f = tempfile.NamedTemporaryFile(
            mode="w", suffix=".txt", delete=False,
        )
        f.write(body)
        f.close()
        return Path(f.name)

    def test_section_map_parsed(self) -> None:
        body = (
            "    .text       start:0x02000000 end:0x020b422c kind:code align:32\n"
            "    .rodata     start:0x020b422c end:0x020c3ac8 kind:rodata align:4\n"
            "    .data       start:0x020c3ae0 end:0x02102b80 kind:data align:32\n"
            "    .bss        start:0x02102b80 end:0x021aa3c0 kind:bss align:32\n"
            "\n"
            "src/main/func_a.c:\n"
            "    complete\n"
            "    .text start:0x02000400 end:0x02000420\n"
        )
        d = parse_delinks(self._write(body))
        self.assertEqual(d.sections[".text"], (0x02000000, 0x020b422c))
        self.assertEqual(d.sections[".data"], (0x020c3ae0, 0x02102b80))
        self.assertEqual(d.sections[".bss"], (0x02102b80, 0x021aa3c0))

    def test_tu_claims_parsed(self) -> None:
        body = (
            "    .data       start:0x020c3ae0 end:0x02102b80 kind:data align:32\n"
            "\n"
            "src/main/data/data_020c3ae0.c:\n"
            "    complete\n"
            "    .data start:0x020c3ae0 end:0x020c3ae4\n"
            "\n"
            "src/main/data/data_020c3ae4.c:\n"
            "    complete\n"
            "    .data start:0x020c3ae4 end:0x020c3ae8\n"
        )
        d = parse_delinks(self._write(body))
        self.assertEqual(len(d.claims), 2)
        self.assertEqual(d.claims[0], ClaimedRange(
            ".data", 0x020c3ae0, 0x020c3ae4,
        ))
        self.assertEqual(d.claims[1], ClaimedRange(
            ".data", 0x020c3ae4, 0x020c3ae8,
        ))
        self.assertIn("src/main/data/data_020c3ae0.c", d.tu_paths)

    def test_is_addr_claimed(self) -> None:
        d = DelinksMap(claims=[
            ClaimedRange(".data", 0x100, 0x104),
            ClaimedRange(".data", 0x200, 0x208),
        ])
        self.assertTrue(is_addr_claimed(d, ".data", 0x100))
        self.assertTrue(is_addr_claimed(d, ".data", 0x103))
        self.assertFalse(is_addr_claimed(d, ".data", 0x104))
        self.assertTrue(is_addr_claimed(d, ".data", 0x204))
        self.assertFalse(is_addr_claimed(d, ".data", 0x208))
        # Section mismatch — same addr in a different section is
        # NOT claimed.
        self.assertFalse(is_addr_claimed(d, ".text", 0x100))

    def test_missing_file_returns_empty(self) -> None:
        d = parse_delinks(Path("/nonexistent/path.txt"))
        self.assertEqual(d.sections, {})
        self.assertEqual(d.claims, [])


# --------------------------------------------------------------------------- #
# Symbol-size inference
# --------------------------------------------------------------------------- #


def _sym(name: str, addr: int, size: int = 0, type_: str = "data") -> Symbol:
    return Symbol(
        name=name, module="main", addr=addr, size=size,
        type=type_, mode="any",
    )


class TestInferSymbolSizes(unittest.TestCase):
    """Brief 169's bss-size derivation rule: size = delta to the
    next symbol in the section, capped at section-end."""

    def test_consecutive_symbols(self) -> None:
        syms = [
            _sym("data_100", 0x100),
            _sym("data_104", 0x104),
            _sym("data_120", 0x120),
        ]
        sections = {".data": (0x100, 0x200)}
        sizes = infer_symbol_sizes(syms, sections)
        self.assertEqual(sizes[0x100], 4)
        self.assertEqual(sizes[0x104], 0x1c)
        self.assertEqual(sizes[0x120], 0xe0)  # to section end

    def test_explicit_size_preserved(self) -> None:
        # If a symbol has explicit size=N in symbols.txt
        # (`s.size != 0`), use it verbatim rather than delta.
        syms = [
            _sym("foo", 0x100, size=8),
            _sym("data_108", 0x108),
        ]
        sections = {".data": (0x100, 0x200)}
        sizes = infer_symbol_sizes(syms, sections)
        self.assertEqual(sizes[0x100], 8)  # explicit
        self.assertEqual(sizes[0x108], 0xf8)  # delta-derived

    def test_symbols_outside_sections_skipped(self) -> None:
        syms = [_sym("data_500", 0x500)]
        sections = {".data": (0x100, 0x200)}
        sizes = infer_symbol_sizes(syms, sections)
        self.assertNotIn(0x500, sizes)


# --------------------------------------------------------------------------- #
# Cluster B enumeration — true scalars
# --------------------------------------------------------------------------- #


class _SynthCtx:
    """Lightweight stand-in for RegionContext that supplies just
    the fields enumerate_b_*_*() reads. The real RegionContext
    .load() touches the filesystem; tests construct the inputs
    directly so the enumeration logic is exercised in
    isolation."""

    def __init__(
        self,
        symbols: list[Symbol],
        relocs: list[Reloc],
        delinks: DelinksMap,
        binary: bytes,
        *,
        text_base: int = 0,
        module: str = "main",
    ):
        self.paths = type("FakePaths", (), {
            "overlay_num": (
                None if module == "main"
                else int(module[2:]) if module.startswith("ov")
                else None
            ),
        })()
        self.symbols = sorted(symbols, key=lambda s: s.addr)
        self.relocs = relocs
        self.delinks = delinks
        self.binary = binary
        self._text_base = text_base

    def file_offset_for(self, va: int) -> int | None:
        if va < self._text_base or va >= self._text_base + len(self.binary):
            return None
        return va - self._text_base

    def read_u32_le(self, va: int) -> int | None:
        fo = self.file_offset_for(va)
        if fo is None or fo + 4 > len(self.binary):
            return None
        return int.from_bytes(self.binary[fo:fo + 4], "little")


def _build_test_binary(data_va: int, words: dict[int, int]) -> bytes:
    """Build a synthetic binary where `.data` lives at `data_va`
    in the address space (binary file offset 0 = `.text` start
    at 0x02000000). `words` maps VA → uint32 little-endian value.

    Returns a bytes object spanning [0x02000000, data_va + max + 4).
    All non-specified addresses are 0xCC filler (un-realistic but
    distinct from zero so the enumerator's zero-skip is visible)."""
    if not words:
        return b"\xcc" * (data_va - 0x02000000 + 4)
    max_va = max(words.keys()) + 4
    out = bytearray(b"\xcc" * (max_va - 0x02000000))
    for va, val in words.items():
        struct.pack_into("<I", out, va - 0x02000000, val)
    return bytes(out)


class TestEnumerateBTrueScalars(unittest.TestCase):
    """The true-scalar enumerator MUST filter out:
       - symbols outside `.data`
       - size != 4
       - load-reloc target slots (pointers)
       - zero-value slots (need brief 155 bundle)
       - already-claimed slots (idempotent)
    """

    def _ctx(
        self,
        symbols,
        relocs=None,
        claims=None,
        words=None,
        data_va=0x020c3ae0,
        data_end=0x020c3b00,
        text_base=0x02000000,
    ):
        sections = {".data": (data_va, data_end)}
        delinks = DelinksMap(sections=sections, claims=claims or [])
        binary = _build_test_binary(data_va, words or {})
        return _SynthCtx(
            symbols=symbols,
            relocs=relocs or [],
            delinks=delinks,
            binary=binary,
            text_base=text_base,
        )

    def test_single_4byte_non_zero_scalar(self) -> None:
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
        ]
        ctx = self._ctx(syms, words={0x020c3ae0: 0xdeadbeef})
        cands = enumerate_b_true_scalars(ctx)
        self.assertEqual(len(cands), 1)
        self.assertEqual(cands[0].addr, 0x020c3ae0)
        self.assertEqual(cands[0].value, 0xdeadbeef)
        self.assertEqual(cands[0].name, "data_020c3ae0")

    def test_skip_zero_value(self) -> None:
        # value=0 needs the brief 155 bundle recipe — not in
        # this tool's scope.
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
        ]
        ctx = self._ctx(syms, words={0x020c3ae0: 0x00000000})
        cands = enumerate_b_true_scalars(ctx)
        self.assertEqual(cands, [])

    def test_skip_pointer_slot(self) -> None:
        # A 4-byte slot with a `kind:load` reloc at its addr is
        # a pointer, not a scalar — covered by b-pointers.
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
        ]
        relocs = [Reloc(
            src_addr=0x020c3ae0, src_module="main",
            dest_addr=0x020c3000, dest_module="main", kind="load",
        )]
        ctx = self._ctx(syms, relocs=relocs, words={0x020c3ae0: 0x020c3000})
        cands = enumerate_b_true_scalars(ctx)
        self.assertEqual(cands, [])

    def test_skip_wrong_size(self) -> None:
        # Size != 4 isn't a true scalar (size 1/2 needs bundle;
        # size 8+ is array territory).
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),  # size 8 (delta)
            _sym("data_020c3ae8", 0x020c3ae8),
        ]
        ctx = self._ctx(syms, words={0x020c3ae0: 0x12345678})
        cands = enumerate_b_true_scalars(ctx)
        self.assertEqual(cands, [])

    def test_skip_already_claimed(self) -> None:
        # Idempotent: re-running the tool over the same region
        # shouldn't re-emit claims for already-claimed addrs.
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
            _sym("data_020c3ae8", 0x020c3ae8),  # caps size of ae4 at 4
        ]
        ctx = self._ctx(
            syms,
            words={0x020c3ae0: 0xdeadbeef, 0x020c3ae4: 0xbadc0ffe},
            claims=[ClaimedRange(".data", 0x020c3ae0, 0x020c3ae4)],
        )
        cands = enumerate_b_true_scalars(ctx)
        # Only the unclaimed slot at 0x020c3ae4 should appear.
        addrs = [c.addr for c in cands]
        self.assertIn(0x020c3ae4, addrs)
        self.assertNotIn(0x020c3ae0, addrs)

    def test_skip_symbols_outside_data(self) -> None:
        # Symbols in .text / .rodata / .bss are not cluster B.
        syms = [
            _sym("data_in_text", 0x02000400),       # in .text
            _sym("data_020c3ae0", 0x020c3ae0),     # in .data
            _sym("data_020c3ae4", 0x020c3ae4),
        ]
        ctx = self._ctx(syms, words={0x020c3ae0: 0xaabbccdd})
        cands = enumerate_b_true_scalars(ctx)
        self.assertEqual(len(cands), 1)
        self.assertEqual(cands[0].addr, 0x020c3ae0)

    def test_skip_dsd_gap_symbols(self) -> None:
        # `_dsd_gap_*` are synthetic placeholders, not real
        # symbols; never emit claims for them.
        syms = [
            _sym("_dsd_gap@main_42", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
        ]
        ctx = self._ctx(
            syms,
            words={0x020c3ae0: 0xabcd1234, 0x020c3ae4: 0x5678},
        )
        cands = enumerate_b_true_scalars(ctx)
        # Only data_020c3ae4 — the dsd_gap is filtered, and the
        # synthetic last symbol has 0x1c bytes to section end so
        # it's not size==4 anyway. Confirm only the genuine
        # data_ slot at 0x020c3ae4 was considered (it doesn't
        # qualify either because its size is 0x1c here).
        # The point: no claim for the dsd_gap.
        self.assertNotIn(0x020c3ae0, [c.addr for c in cands])


# --------------------------------------------------------------------------- #
# Cluster B enumeration — pointers
# --------------------------------------------------------------------------- #


class TestEnumerateBPointers(unittest.TestCase):

    def _ctx(self, symbols, relocs=None, claims=None, **kwargs):
        sections = {".data": (0x020c3ae0, 0x020c3b00)}
        delinks = DelinksMap(sections=sections, claims=claims or [])
        binary = _build_test_binary(0x020c3ae0, {})
        return _SynthCtx(
            symbols=symbols, relocs=relocs or [],
            delinks=delinks, binary=binary,
            text_base=0x02000000, module="main",
        )

    def test_pointer_to_data_symbol(self) -> None:
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
            _sym("data_020c3000", 0x020c3000),  # pointee
        ]
        relocs = [Reloc(
            src_addr=0x020c3ae0, src_module="main",
            dest_addr=0x020c3000, dest_module="main", kind="load",
        )]
        ctx = self._ctx(syms, relocs=relocs)
        cands = enumerate_b_pointers(ctx)
        self.assertEqual(len(cands), 1)
        self.assertEqual(cands[0].addr, 0x020c3ae0)
        self.assertEqual(cands[0].pointee_name, "data_020c3000")
        self.assertFalse(cands[0].pointee_is_function)
        self.assertFalse(cands[0].pointee_is_thumb)

    def test_pointer_to_thumb_function(self) -> None:
        thumb_func = Symbol(
            name="func_02000400", module="main", addr=0x02000400,
            size=0x40, type="function", mode="thumb",
        )
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
            thumb_func,
        ]
        # Stored target VA = func_addr | 1 for thumb pointers
        # (brief 121 convention).
        relocs = [Reloc(
            src_addr=0x020c3ae0, src_module="main",
            dest_addr=0x02000401, dest_module="main", kind="load",
        )]
        ctx = self._ctx(syms, relocs=relocs)
        cands = enumerate_b_pointers(ctx)
        self.assertEqual(len(cands), 1)
        self.assertEqual(cands[0].pointee_name, "func_02000400")
        self.assertTrue(cands[0].pointee_is_function)
        self.assertTrue(cands[0].pointee_is_thumb)

    def test_pointer_to_arm_function(self) -> None:
        arm_func = Symbol(
            name="func_02000400", module="main", addr=0x02000400,
            size=0x40, type="function", mode="arm",
        )
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
            arm_func,
        ]
        relocs = [Reloc(
            src_addr=0x020c3ae0, src_module="main",
            dest_addr=0x02000400, dest_module="main", kind="load",
        )]
        ctx = self._ctx(syms, relocs=relocs)
        cands = enumerate_b_pointers(ctx)
        self.assertEqual(len(cands), 1)
        self.assertTrue(cands[0].pointee_is_function)
        self.assertFalse(cands[0].pointee_is_thumb)

    def test_skip_cross_module_pointer(self) -> None:
        # MVP only resolves same-module pointees; cross-module
        # pointers stay in the pool for decomper brief 172+
        # manual application.
        syms = [
            _sym("data_020c3ae0", 0x020c3ae0),
            _sym("data_020c3ae4", 0x020c3ae4),
        ]
        relocs = [Reloc(
            src_addr=0x020c3ae0, src_module="main",
            dest_addr=0x027e0000, dest_module="dtcm", kind="load",
        )]
        ctx = self._ctx(syms, relocs=relocs)
        self.assertEqual(enumerate_b_pointers(ctx), [])


# --------------------------------------------------------------------------- #
# Recipe rendering
# --------------------------------------------------------------------------- #


class TestRecipeRendering(unittest.TestCase):

    def test_true_scalar_recipe(self) -> None:
        c = ScalarCandidate(
            addr=0x020c3ae0, name="data_020c3ae0", value=0xdeadbeef,
        )
        out = render_b_true_scalar(c)
        self.assertIn("int data_020c3ae0 = 0xdeadbeef;", out)
        self.assertIn("Brief 170", out)
        self.assertIn("brief 117", out)

    def test_pointer_to_data_recipe(self) -> None:
        c = PointerCandidate(
            addr=0x020c3ae0, name="data_020c3ae0",
            pointee_va=0x020c3000, pointee_name="data_020c3000",
            pointee_is_function=False, pointee_is_thumb=False,
        )
        out = render_b_pointer(c)
        self.assertIn("extern char data_020c3000;", out)
        self.assertIn("void *data_020c3ae0 = &data_020c3000;", out)
        self.assertNotIn("+ 1", out)  # no thumb offset for data
        self.assertIn("brief 148", out)

    def test_pointer_to_thumb_function_recipe(self) -> None:
        c = PointerCandidate(
            addr=0x020c3ae0, name="data_020c3ae0",
            pointee_va=0x02000401, pointee_name="func_02000400",
            pointee_is_function=True, pointee_is_thumb=True,
        )
        out = render_b_pointer(c)
        self.assertIn("extern char func_02000400;", out)
        self.assertIn("+ 1", out)  # thumb +1 convention
        self.assertIn("(void *) ((char *) &func_02000400 + 1)", out)

    def test_pointer_to_arm_function_recipe(self) -> None:
        c = PointerCandidate(
            addr=0x020c3ae0, name="data_020c3ae0",
            pointee_va=0x02000400, pointee_name="func_02000400",
            pointee_is_function=True, pointee_is_thumb=False,
        )
        out = render_b_pointer(c)
        self.assertIn("void *data_020c3ae0 = &func_02000400;", out)
        self.assertNotIn("+ 1", out)


# --------------------------------------------------------------------------- #
# RegionPaths construction
# --------------------------------------------------------------------------- #


class TestRegionPaths(unittest.TestCase):

    def test_main_paths(self) -> None:
        p = RegionPaths.make("usa", "main")
        self.assertEqual(p.region, "usa")
        self.assertIsNone(p.overlay_num)
        self.assertTrue(str(p.config_dir).endswith("config/usa/arm9"))
        self.assertTrue(str(p.binary_bin).endswith(
            "extract/usa/arm9/arm9.bin",
        ))
        self.assertTrue(str(p.src_data_dir).endswith("src/usa/main/data"))

    def test_overlay_paths(self) -> None:
        p = RegionPaths.make("jpn", "ov007")
        self.assertEqual(p.overlay_num, 7)
        self.assertTrue(str(p.config_dir).endswith(
            "config/jpn/arm9/overlays/ov007",
        ))
        self.assertTrue(str(p.binary_bin).endswith(
            "extract/jpn/arm9_overlays/ov007.bin",
        ))
        self.assertTrue(str(p.src_data_dir).endswith(
            "src/jpn/overlay007/data",
        ))

    def test_invalid_region_raises(self) -> None:
        with self.assertRaisesRegex(ValueError, "region"):
            RegionPaths.make("xxx", "main")


if __name__ == "__main__":
    unittest.main()
