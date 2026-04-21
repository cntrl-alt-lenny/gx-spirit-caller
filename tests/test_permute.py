"""Unit tests for tools/permute.py.

Coverage for the pure path-mapping / delinks-parsing functions.
find_function / stage_work_dir pull from filesystem; they're smoke-
tested via temp trees.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from permute import (  # noqa: E402
    expected_disasm_path,
    expected_object_path,
    module_delinks_path,
    module_symbols_path,
    parse_tu_ranges,
    tu_containing,
)


class TestModulePathMapping(unittest.TestCase):
    def test_symbols_main(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_symbols_path(root, "main"),
            root / "arm9" / "symbols.txt",
        )

    def test_symbols_itcm(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_symbols_path(root, "itcm"),
            root / "arm9" / "itcm" / "symbols.txt",
        )

    def test_symbols_overlay(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_symbols_path(root, "ov023"),
            root / "arm9" / "overlays" / "ov023" / "symbols.txt",
        )

    def test_delinks_main(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_delinks_path(root, "main"),
            root / "arm9" / "delinks.txt",
        )

    def test_delinks_overlay(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_delinks_path(root, "ov005"),
            root / "arm9" / "overlays" / "ov005" / "delinks.txt",
        )


class TestParseTuRanges(unittest.TestCase):
    """delinks.txt's TU entries carry .text start/end ranges — the
    permuter wrapper uses those to locate which .c file a target
    function is inside."""

    def _write(self, content: str) -> Path:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(content)
            return Path(f.name)

    def test_missing_file_empty(self):
        self.assertEqual(parse_tu_ranges(Path("/nonexistent")), [])

    def test_single_tu(self):
        p = self._write(
            "src/overlay005/foo.c:\n"
            "    complete\n"
            "    .text start:0x021aa4a0 end:0x021aa4ac kind:code align:4\n"
        )
        try:
            out = parse_tu_ranges(p)
            self.assertEqual(out, [
                ("src/overlay005/foo.c", 0x021aa4a0, 0x021aa4ac),
            ])
        finally:
            p.unlink(missing_ok=True)

    def test_multiple_tus(self):
        p = self._write(
            "src/overlay005/a.c:\n"
            "    complete\n"
            "    .text start:0x021aa4a0 end:0x021aa4ac\n"
            "\n"
            "src/overlay005/b.c:\n"
            "    complete\n"
            "    .text start:0x021aa4ac end:0x021aa4b0\n"
        )
        try:
            out = parse_tu_ranges(p)
            self.assertEqual(len(out), 2)
            self.assertEqual(out[0][0], "src/overlay005/a.c")
            self.assertEqual(out[1][0], "src/overlay005/b.c")
        finally:
            p.unlink(missing_ok=True)

    def test_only_text_sections_collected(self):
        # .rodata / .data / .ctor should be ignored — parse_tu_ranges
        # exists to answer "which .c covers this code address?"
        p = self._write(
            "src/overlay005/foo.c:\n"
            "    complete\n"
            "    .text start:0x021aa4a0 end:0x021aa4ac\n"
            "    .rodata start:0x021b1568 end:0x021b16e4\n"
            "    .data start:0x021b17e0 end:0x021b1d40\n"
        )
        try:
            out = parse_tu_ranges(p)
            self.assertEqual(len(out), 1)
            _src, start, end = out[0]
            self.assertEqual((start, end), (0x021aa4a0, 0x021aa4ac))
        finally:
            p.unlink(missing_ok=True)

    def test_comments_and_blanks_ignored(self):
        p = self._write(
            "# leading comment\n"
            "\n"
            "src/x.c:\n"
            "    complete\n"
            "    .text start:0x100 end:0x200\n"
        )
        try:
            self.assertEqual(parse_tu_ranges(p), [("src/x.c", 0x100, 0x200)])
        finally:
            p.unlink(missing_ok=True)


class TestTuContaining(unittest.TestCase):
    def _write_two_tus(self) -> Path:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(
                "src/overlay005/a.c:\n"
                "    complete\n"
                "    .text start:0x021aa4a0 end:0x021aa4c0\n"
                "\n"
                "src/overlay005/b.c:\n"
                "    complete\n"
                "    .text start:0x021aa4c0 end:0x021aa500\n"
            )
            return Path(f.name)

    def test_exact_start(self):
        p = self._write_two_tus()
        try:
            self.assertEqual(tu_containing(p, 0x021aa4a0), "src/overlay005/a.c")
        finally:
            p.unlink(missing_ok=True)

    def test_middle_of_range(self):
        p = self._write_two_tus()
        try:
            self.assertEqual(tu_containing(p, 0x021aa4b0), "src/overlay005/a.c")
        finally:
            p.unlink(missing_ok=True)

    def test_end_is_exclusive(self):
        # 0x021aa4c0 is the *end* of a.c and *start* of b.c — end is
        # exclusive (matches how dsd .text ranges work).
        p = self._write_two_tus()
        try:
            self.assertEqual(tu_containing(p, 0x021aa4c0), "src/overlay005/b.c")
        finally:
            p.unlink(missing_ok=True)

    def test_address_not_in_any_tu(self):
        p = self._write_two_tus()
        try:
            self.assertIsNone(tu_containing(p, 0x021aa600))
            self.assertIsNone(tu_containing(p, 0x02000000))
        finally:
            p.unlink(missing_ok=True)


class TestExpectedPaths(unittest.TestCase):
    def test_object_from_c_source(self):
        build = Path("/fake/build/eur")
        self.assertEqual(
            expected_object_path(build, "ov005", "src/overlay005/foo.c"),
            build / "src" / "overlay005" / "foo.o",
        )

    def test_object_from_cpp_source(self):
        build = Path("/fake/build/eur")
        self.assertEqual(
            expected_object_path(build, "main", "src/main/bar.cpp"),
            build / "src" / "main" / "bar.o",
        )

    def test_object_none_when_source_missing(self):
        build = Path("/fake/build/eur")
        self.assertIsNone(expected_object_path(build, "main", None))

    def test_disasm_main(self):
        build = Path("/fake/build/eur")
        self.assertEqual(
            expected_disasm_path(build, "main", 0x02000800),
            build / "disasm" / "main_02000800.s",
        )

    def test_disasm_overlay(self):
        build = Path("/fake/build/eur")
        self.assertEqual(
            expected_disasm_path(build, "ov005", 0x021aa4a0),
            build / "disasm" / "ov005_021aa4a0.s",
        )


if __name__ == "__main__":
    unittest.main()
