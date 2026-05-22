"""Unit tests for tools/data_symbol_sizes.py.

Covers the pure inference helpers (infer_per_module, size_bucket,
BUCKET_ORDER) and the two writers (write_json, write_md).
skips the CLI entry / dsd integration path.

The inferred-size numbers here feed a decomper who wants to know
"is this a 4-byte int or a 0x400-byte table before I start naming
it." Regressions in the gap math would make that guess wildly
wrong.
"""

from __future__ import annotations

import contextlib
import io
import json
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import Symbol  # noqa: E402
from data_symbol_sizes import (  # noqa: E402
    BUCKET_ORDER,
    infer_per_module,
    module_symbols_path,
    print_summary,
    size_bucket,
    write_json,
    write_md,
)


def _data(name: str, addr: int, size: int = 0) -> Symbol:
    return Symbol(
        name=name, module="ov005", addr=addr, size=size,
        type="data", mode="any",
    )


def _fn(name: str, addr: int, size: int = 0x10) -> Symbol:
    return Symbol(
        name=name, module="ov005", addr=addr, size=size,
        type="function", mode="arm",
    )


# ------------------------------------------------------------------------- #


class TestInferPerModule(unittest.TestCase):
    def test_empty(self):
        self.assertEqual(infer_per_module([]), {})

    def test_two_data_adjacent(self):
        # Data at 0x100 and 0x104 → first infers 4, second is last (None).
        syms = [_data("a", 0x100), _data("b", 0x104)]
        self.assertEqual(infer_per_module(syms), {0x100: 4, 0x104: None})

    def test_gap_is_next_addr_minus_self(self):
        syms = [_data("a", 0x100), _data("b", 0x140), _data("c", 0x148)]
        sizes = infer_per_module(syms)
        self.assertEqual(sizes[0x100], 0x40)
        self.assertEqual(sizes[0x140], 0x8)
        self.assertIsNone(sizes[0x148])

    def test_function_is_upper_anchor_for_data(self):
        # data_a at 0x100, a function at 0x120 → data_a size = 0x20.
        # The function itself must not show up in the output (not data).
        syms = [_data("data_a", 0x100), _fn("Do_Thing", 0x120)]
        sizes = infer_per_module(syms)
        self.assertEqual(sizes, {0x100: 0x20})

    def test_function_only_produces_no_entries(self):
        syms = [_fn("a", 0x100), _fn("b", 0x140)]
        self.assertEqual(infer_per_module(syms), {})

    def test_interleaved_code_and_data(self):
        syms = [
            _data("rom_header", 0x2000000),
            _fn("Entry",        0x2000100),
            _data("jmp_table",  0x2001000),
            _data("pal_0",      0x2001400),
            _fn("After",        0x2001800),
        ]
        sizes = infer_per_module(syms)
        self.assertEqual(sizes, {
            0x2000000: 0x000100,  # gap to Entry
            0x2001000: 0x000400,  # gap to pal_0
            0x2001400: 0x000400,  # gap to After
        })

    def test_unsorted_input_sorts_by_addr(self):
        syms = [_data("b", 0x140), _data("c", 0x148), _data("a", 0x100)]
        sizes = infer_per_module(syms)
        self.assertEqual(sizes, {0x100: 0x40, 0x140: 0x8, 0x148: None})

    def test_duplicate_addr_not_counted_as_gap(self):
        # Two symbols at the same addr (aliases) — the gap is zero so
        # the inference must skip past aliases when picking a next
        # anchor, otherwise both would infer size 0.
        syms = [_data("a", 0x100), _data("a_alias", 0x100), _data("b", 0x104)]
        sizes = infer_per_module(syms)
        # Both aliases take the same next-strictly-greater anchor (0x104).
        self.assertEqual(sizes[0x100], 4)
        self.assertIsNone(sizes[0x104])


class TestSizeBucket(unittest.TestCase):
    def test_tiny(self):
        self.assertEqual(size_bucket(1), "<=4 B")
        self.assertEqual(size_bucket(4), "<=4 B")

    def test_small(self):
        self.assertEqual(size_bucket(5), "5–8 B")
        self.assertEqual(size_bucket(8), "5–8 B")

    def test_medium(self):
        self.assertEqual(size_bucket(9), "9–32 B")
        self.assertEqual(size_bucket(0x20), "9–32 B")
        self.assertEqual(size_bucket(0x21), "33–128 B")

    def test_large(self):
        self.assertEqual(size_bucket(0x80), "33–128 B")
        self.assertEqual(size_bucket(0x81), "129–1024 B")
        self.assertEqual(size_bucket(0x400), "129–1024 B")

    def test_xl(self):
        self.assertEqual(size_bucket(0x401), "1–16 KB")
        self.assertEqual(size_bucket(0x4000), "1–16 KB")
        self.assertEqual(size_bucket(0x4001), ">16 KB")

    def test_bucket_order_matches_size_bucket_output(self):
        # Every string returned by size_bucket must appear in
        # BUCKET_ORDER — otherwise the histogram printer drops entries.
        generated = {size_bucket(n) for n in
                     (0, 1, 4, 5, 8, 9, 32, 33, 128, 129, 1024,
                      1025, 0x4000, 0x4001, 1_000_000)}
        for bucket in generated:
            self.assertIn(bucket, BUCKET_ORDER)


class TestModuleSymbolsPath(unittest.TestCase):
    def test_main(self):
        p = module_symbols_path(Path("/x/config/eur"), "main")
        self.assertEqual(p, Path("/x/config/eur/arm9/symbols.txt"))

    def test_itcm(self):
        p = module_symbols_path(Path("/x/config/eur"), "itcm")
        self.assertEqual(p, Path("/x/config/eur/arm9/itcm/symbols.txt"))

    def test_dtcm(self):
        p = module_symbols_path(Path("/x/config/eur"), "dtcm")
        self.assertEqual(p, Path("/x/config/eur/arm9/dtcm/symbols.txt"))

    def test_overlay(self):
        p = module_symbols_path(Path("/x/config/eur"), "ov005")
        self.assertEqual(
            p,
            Path("/x/config/eur/arm9/overlays/ov005/symbols.txt"),
        )


class TestPrintSummary(unittest.TestCase):
    def test_smoke(self):
        per_module = {
            "ov005": {0x100: 0x40, 0x140: 0x8, 0x148: None},
            "main": {0x2000000: 0x100},
        }
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            print_summary(per_module)
        out = buf.getvalue()
        self.assertIn("Data symbols", out)
        self.assertIn("ov005", out)
        self.assertIn("main", out)
        # Brief 189 Part 3: FAILING_MODULES is now empty (3-region
        # SHA1 PASS holds since brief 140). The `[FAIL]` tag no
        # longer appears for any module under normal operation.
        self.assertNotIn("[FAIL]", out)

    def test_fails_gracefully_on_empty_input(self):
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            print_summary({})
        self.assertIn("Data symbols        : 0", buf.getvalue())


class TestWriteJson(unittest.TestCase):
    def test_json_lookup_keyed_by_module_and_addr(self):
        per_module = {
            "ov005": {0x100: 0x40, 0x140: None},
            "main":  {0x2000000: 0x100},
        }
        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "nested" / "data_sizes.json"
            write_json(out, per_module)
            self.assertTrue(out.is_file())
            payload = json.loads(out.read_text())
        # Key format: "<module>|0x<8-hex addr>".
        self.assertEqual(payload["ov005|0x00000100"], 0x40)
        self.assertIsNone(payload["ov005|0x00000140"])
        self.assertEqual(payload["main|0x02000000"], 0x100)
        self.assertEqual(len(payload), 3)


class TestWriteMd(unittest.TestCase):
    def test_md_smoke_has_headers_and_rows(self):
        syms_ov005 = [
            _data("rom_header", 0x100),
            _data("pal_tbl",    0x140),
        ]
        per_module = {"ov005": infer_per_module(syms_ov005)}
        symbols_by_module = {"ov005": syms_ov005}
        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "data_sizes.md"
            write_md(out, per_module, symbols_by_module, top_per_module=5)
            text = out.read_text()
        self.assertIn("# Data symbol sizes (inferred)", text)
        self.assertIn("## ov005", text)
        self.assertIn("`rom_header`", text)
        self.assertIn("`pal_tbl`", text)
        # Last-symbol size renders as a literal `?` marker.
        self.assertIn("`?`", text)

    def test_md_no_longer_marks_modules_failing_post_brief_140(self):
        # Brief 189 Part 3: with `FAILING_MODULES` empty, no module
        # gets the `**FAIL**` annotation (the 24/27 baseline that
        # motivated the tag is closed; 27/27 modules OK across all
        # regions since brief 140).
        sym = Symbol(name="x", module="main", addr=0x2000000, size=0,
                     type="data", mode="any")
        per_module = {"main": {0x2000000: None}}
        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "data_sizes.md"
            write_md(out, per_module, {"main": [sym]}, top_per_module=5)
            text = out.read_text()
        self.assertNotIn("**FAIL**", text)

    def test_md_top_per_module_limit_respected(self):
        # 10 data symbols, top_per_module=3 → only 3 should appear.
        syms = [_data(f"d_{i}", 0x100 + i * 0x40) for i in range(10)]
        per_module = {"ov005": infer_per_module(syms)}
        with tempfile.TemporaryDirectory() as td:
            out = Path(td) / "data_sizes.md"
            write_md(out, per_module, {"ov005": syms}, top_per_module=3)
            text = out.read_text()
        names_in_md = sum(1 for i in range(10) if f"`d_{i}`" in text)
        self.assertEqual(names_in_md, 3)


if __name__ == "__main__":
    unittest.main()
