"""Unit tests for tools/find_ov004_rodata_pointer_targets.py
(brief 159 part 2).

The tool reverse-walks ov002's relocs table to identify ov004
`.rodata` slots that are statically referenced from ov002 code.
A bug in any layer of the parsing / lookup chain would silently
produce wrong reclassification candidates and break the brief
160+ wave that consumes the output. Pin:

  - relocs.txt parser handles the canonical line shape.
  - symbols.txt function parser captures size-bearing entries.
  - symbols.txt data parser respects the address-range filter.
  - find_enclosing_function returns the smallest containing
    function (not just any preceding one).
  - find_containing_data_symbol returns the symbol whose
    deduced range covers the VA + the correct offset.
  - enumerate_pointer_targets end-to-end with synthetic fixtures.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from find_ov004_rodata_pointer_targets import (  # noqa: E402
    DataSymbol,
    FunctionSymbol,
    Reloc,
    _parse_data_symbols,
    _parse_functions,
    _parse_relocs,
    enumerate_pointer_targets,
    find_containing_data_symbol,
    find_enclosing_function,
)


def _write_tmp(text: str, suffix: str = ".txt") -> Path:
    """Write `text` to a temp file + return its Path."""
    with tempfile.NamedTemporaryFile(
        mode="w", suffix=suffix, delete=False,
    ) as f:
        f.write(text)
        return Path(f.name)


# ---------------------------------------------------------------------- #
# Parsers
# ---------------------------------------------------------------------- #

class TestParseRelocs(unittest.TestCase):
    def test_canonical_line(self):
        body = (
            "from:0x021aa514 kind:arm_call to:0x021baca8 module:overlay(2)\n"
            "from:0x021aa550 kind:load to:0x022cf1a6 module:overlay(2)\n"
        )
        path = _write_tmp(body)
        try:
            relocs = _parse_relocs(path)
            self.assertEqual(len(relocs), 2)
            self.assertEqual(relocs[0], Reloc(
                from_va=0x021aa514, kind="arm_call",
                to_va=0x021baca8, target_module="overlay(2)",
            ))
            self.assertEqual(relocs[1].kind, "load")
        finally:
            path.unlink()

    def test_blank_and_garbage_lines_skipped(self):
        body = (
            "\n"
            "# a comment\n"
            "from:0x021aa514 kind:load to:0x021df000 module:overlay(2)\n"
            "not a reloc line at all\n"
        )
        path = _write_tmp(body)
        try:
            relocs = _parse_relocs(path)
            self.assertEqual(len(relocs), 1)
            self.assertEqual(relocs[0].to_va, 0x021df000)
        finally:
            path.unlink()


class TestParseFunctions(unittest.TestCase):
    def test_sized_functions_captured_sorted(self):
        body = (
            "func_ov002_021aa558 kind:function(arm,size=0x130c) addr:0x021aa558\n"
            "func_ov002_021aa4a0 kind:function(arm,size=0xb8) addr:0x021aa4a0\n"
        )
        path = _write_tmp(body)
        try:
            funcs = _parse_functions(path)
            # Sorted by addr ascending.
            self.assertEqual(len(funcs), 2)
            self.assertEqual(funcs[0].addr, 0x021aa4a0)
            self.assertEqual(funcs[0].size, 0xb8)
            self.assertEqual(funcs[1].addr, 0x021aa558)
            self.assertEqual(funcs[1].size, 0x130c)
        finally:
            path.unlink()

    def test_unsized_function_skipped(self):
        # `function(arm)` with no size= token is unknown-size — we
        # can't containment-check, so it's skipped from the parsed
        # list. The reloc lookup still proceeds; enclosing_function
        # returns None for VAs that would have hit the skipped fn.
        body = (
            "func_ov002_unknown kind:function(arm) addr:0x021aa400\n"
            "func_ov002_021aa4a0 kind:function(arm,size=0xb8) addr:0x021aa4a0\n"
        )
        path = _write_tmp(body)
        try:
            funcs = _parse_functions(path)
            self.assertEqual(len(funcs), 1)
            self.assertEqual(funcs[0].name, "func_ov002_021aa4a0")
        finally:
            path.unlink()


class TestParseDataSymbols(unittest.TestCase):
    def test_address_range_filter(self):
        body = (
            "data_ov004_021de850 kind:data(any) addr:0x021de850\n"
            "data_ov004_021de851 kind:data(any) addr:0x021de851\n"
            "data_ov004_02000000 kind:data(any) addr:0x02000000\n"  # out of range
            "data_ov004_02500000 kind:data(any) addr:0x02500000\n"  # out of range
        )
        path = _write_tmp(body)
        try:
            syms = _parse_data_symbols(
                path, addr_lo=0x021de000, addr_hi=0x021df000,
            )
            self.assertEqual(len(syms), 2)
            self.assertEqual(syms[0].addr, 0x021de850)
            self.assertEqual(syms[1].addr, 0x021de851)
        finally:
            path.unlink()

    def test_bss_kind_also_captured(self):
        body = (
            "data_ov004_021de100 kind:bss addr:0x021de100\n"
            "data_ov004_021de200 kind:data(any) addr:0x021de200\n"
        )
        path = _write_tmp(body)
        try:
            syms = _parse_data_symbols(
                path, addr_lo=0x021de000, addr_hi=0x021df000,
            )
            self.assertEqual(len(syms), 2)
            self.assertEqual({s.addr for s in syms}, {0x021de100, 0x021de200})
        finally:
            path.unlink()


# ---------------------------------------------------------------------- #
# Lookups
# ---------------------------------------------------------------------- #

class TestFindEnclosingFunction(unittest.TestCase):
    def _funcs(self):
        return [
            FunctionSymbol("f_100", 0x100, 0x40),  # 0x100..0x140
            FunctionSymbol("f_200", 0x200, 0x20),  # 0x200..0x220
            FunctionSymbol("f_300", 0x300, 0x10),  # 0x300..0x310
        ]

    def test_inside_function_returns_it(self):
        self.assertEqual(
            find_enclosing_function(0x110, self._funcs()).name, "f_100",
        )
        self.assertEqual(
            find_enclosing_function(0x13f, self._funcs()).name, "f_100",
        )

    def test_exact_start_addr_returns_function(self):
        self.assertEqual(
            find_enclosing_function(0x200, self._funcs()).name, "f_200",
        )

    def test_exact_end_addr_returns_none(self):
        # The end address is exclusive (function is [addr, addr+size)).
        self.assertIsNone(find_enclosing_function(0x140, self._funcs()))

    def test_gap_returns_none(self):
        # Between f_100 (ends 0x140) and f_200 (starts 0x200).
        self.assertIsNone(find_enclosing_function(0x180, self._funcs()))

    def test_before_first_function_returns_none(self):
        self.assertIsNone(find_enclosing_function(0x10, self._funcs()))


class TestFindContainingDataSymbol(unittest.TestCase):
    def _syms(self):
        return [
            DataSymbol("d_100", 0x100),
            DataSymbol("d_120", 0x120),
            DataSymbol("d_140", 0x140),
        ]

    def test_exact_start_addr(self):
        sym, off = find_containing_data_symbol(0x100, self._syms(), 0x200)
        self.assertEqual(sym.name, "d_100")
        self.assertEqual(off, 0)

    def test_mid_symbol_returns_offset(self):
        # 0x110 is within d_100's deduced range [0x100, 0x120).
        sym, off = find_containing_data_symbol(0x110, self._syms(), 0x200)
        self.assertEqual(sym.name, "d_100")
        self.assertEqual(off, 0x10)

    def test_last_symbol_extends_to_range_end(self):
        # d_140 has no next-symbol; range extends to range_end.
        sym, off = find_containing_data_symbol(0x1f0, self._syms(), 0x200)
        self.assertEqual(sym.name, "d_140")
        self.assertEqual(off, 0xb0)

    def test_before_first_symbol_returns_none(self):
        # Addresses below the first symbol have no containing slot.
        self.assertIsNone(
            find_containing_data_symbol(0x80, self._syms(), 0x200),
        )

    def test_at_range_end_returns_none(self):
        # range_end is exclusive — VA == range_end falls outside.
        self.assertIsNone(
            find_containing_data_symbol(0x200, self._syms(), 0x200),
        )


# ---------------------------------------------------------------------- #
# End-to-end
# ---------------------------------------------------------------------- #

class TestEnumeratePointerTargets(unittest.TestCase):
    """End-to-end test using synthetic fixture files."""

    def setUp(self):
        # Mini synthetic config:
        # - ov002 has 2 functions covering 0x021aa4a0..0x021aa600.
        # - ov002 relocs:
        #     1 load with to in ov004 .rodata
        #     1 arm_call with to in ov004 .rodata
        #     1 load with to OUTSIDE the range (should be skipped)
        # - ov004 .rodata has 2 data symbols.
        self.relocs = _write_tmp(
            "from:0x021aa500 kind:load to:0x021de900 module:overlay(2)\n"
            "from:0x021aa520 kind:arm_call to:0x021df000 module:overlay(2)\n"
            "from:0x021aa540 kind:load to:0x023ff000 module:overlay(2)\n"
        )
        self.ov002_syms = _write_tmp(
            "func_ov002_021aa4a0 kind:function(arm,size=0x100) addr:0x021aa4a0\n"
            "func_ov002_021aa520 kind:function(arm,size=0x100) addr:0x021aa520\n"
        )
        self.ov004_syms = _write_tmp(
            "data_ov004_021de851 kind:data(any) addr:0x021de851\n"
            "data_ov004_021df000 kind:data(any) addr:0x021df000\n"
        )

    def tearDown(self):
        for p in (self.relocs, self.ov002_syms, self.ov004_syms):
            p.unlink()

    def test_basic_enumeration(self):
        rows = enumerate_pointer_targets(
            relocs_path=self.relocs,
            ov002_symbols_path=self.ov002_syms,
            ov004_symbols_path=self.ov004_syms,
            rodata_start=0x021de638,
            rodata_end=0x02209a5c,
        )
        # The out-of-range reloc is excluded; 2 in-range survive.
        self.assertEqual(len(rows), 2)
        # Sorted by (ov004_sym_addr, to_va, from_va) →
        # 0x021de900 → data_ov004_021de851 comes first.
        r0, r1 = rows
        self.assertEqual(r0.to_va, 0x021de900)
        self.assertEqual(r0.ov004_sym_name, "data_ov004_021de851")
        self.assertEqual(r0.offset_into_sym, 0xaf)  # 0x900 - 0x851
        self.assertEqual(r0.from_func, "func_ov002_021aa4a0")
        self.assertEqual(r0.kind, "load")

        self.assertEqual(r1.to_va, 0x021df000)
        self.assertEqual(r1.ov004_sym_name, "data_ov004_021df000")
        self.assertEqual(r1.offset_into_sym, 0)
        self.assertEqual(r1.from_func, "func_ov002_021aa520")
        self.assertEqual(r1.kind, "arm_call")

    def test_kind_filter(self):
        # Restrict to load — drops the arm_call entry.
        rows = enumerate_pointer_targets(
            kind_filter={"load"},
            relocs_path=self.relocs,
            ov002_symbols_path=self.ov002_syms,
            ov004_symbols_path=self.ov004_syms,
        )
        self.assertEqual(len(rows), 1)
        self.assertEqual(rows[0].kind, "load")

    def test_unmapped_target_uses_none_marker(self):
        # ov004 symbols don't cover 0x021de700 → should report
        # "(none)" rather than crash. Confirms the gap-handling
        # path used for ~15 real-world entries that don't map to
        # a named ov004 symbol.
        relocs = _write_tmp(
            "from:0x021aa500 kind:load to:0x021de700 module:overlay(2)\n"
        )
        try:
            rows = enumerate_pointer_targets(
                relocs_path=relocs,
                ov002_symbols_path=self.ov002_syms,
                ov004_symbols_path=self.ov004_syms,
            )
            self.assertEqual(len(rows), 1)
            self.assertEqual(rows[0].ov004_sym_name, "(none)")
            self.assertEqual(rows[0].ov004_sym_addr, 0)
        finally:
            relocs.unlink()


if __name__ == "__main__":
    unittest.main()
