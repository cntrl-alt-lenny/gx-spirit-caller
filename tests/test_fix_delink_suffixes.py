"""Tests for the routing-suffix delinks preflight."""

import tempfile
import unittest
from pathlib import Path

from tools.fix_delink_suffixes import find_mismatches, fix_text


class TestFixDelinkSuffixes(unittest.TestCase):
    def test_finds_and_repairs_deliberately_mismatched_header(self):
        with tempfile.TemporaryDirectory() as tmp_dir:
            tmp_path = Path(tmp_dir)
            source = tmp_path / "src" / "main" / "func_02000000.legacy.c"
            source.parent.mkdir(parents=True)
            source.write_text("void f(void) {}\n", encoding="utf-8")
            text = "src/main/func_02000000.c:\n    complete\n"

            issues = find_mismatches(text, root=tmp_path)

            assert issues == [{
                "line": "1",
                "declared": "src/main/func_02000000.c",
                "expected": "src/main/func_02000000.legacy.c",
            }]
            assert fix_text(text, issues) == (
                "src/main/func_02000000.legacy.c:\n    complete\n"
            )

    def test_existing_plain_header_is_left_alone(self):
        with tempfile.TemporaryDirectory() as tmp_dir:
            tmp_path = Path(tmp_dir)
            source = tmp_path / "src" / "main" / "func_02000000.c"
            source.parent.mkdir(parents=True)
            source.write_text("void f(void) {}\n", encoding="utf-8")

            assert find_mismatches("src/main/func_02000000.c:\n", root=tmp_path) == []

    def test_ambiguous_replacements_are_not_auto_fixed(self):
        with tempfile.TemporaryDirectory() as tmp_dir:
            tmp_path = Path(tmp_dir)
            source_dir = tmp_path / "src" / "main"
            source_dir.mkdir(parents=True)
            for suffix in (".legacy.c", ".thumb.c"):
                (source_dir / f"func_02000000{suffix}").write_text("", encoding="utf-8")

            assert find_mismatches("src/main/func_02000000.c:\n", root=tmp_path) == []


if __name__ == "__main__":
    unittest.main()
