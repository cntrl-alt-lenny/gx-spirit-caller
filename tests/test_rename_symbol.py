"""Unit tests for tools/rename_symbol.py.

Covers the two pure functions (IDENT_RE validation, rewrite_first_token)
and the find_symbol search against a synthetic config tree. Does not
invoke main() — argparse + sys.exit paths are exercised by the smoke
tests baked into the tool's PR description.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import rename_symbol  # noqa: E402
from rename_symbol import (  # noqa: E402
    IDENT_RE,
    cascade_rename,
    find_symbol,
    rewrite_first_token,
)


def _write_symbols(path: Path, lines: list[str]) -> Path:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n")
    return path


class TestIdentValidation(unittest.TestCase):
    def test_valid_names(self):
        for name in ("Entry", "main", "_underscore", "Duel_DrawCard",
                     "FX_MulFx", "__register_global_object", "a0"):
            self.assertIsNotNone(IDENT_RE.match(name), f"should accept {name!r}")

    def test_rejects_leading_digit(self):
        self.assertIsNone(IDENT_RE.match("0foo"))

    def test_rejects_dots(self):
        self.assertIsNone(IDENT_RE.match(".L_02021008"))

    def test_rejects_dashes(self):
        self.assertIsNone(IDENT_RE.match("bad-name"))

    def test_rejects_spaces(self):
        self.assertIsNone(IDENT_RE.match("has space"))

    def test_rejects_empty(self):
        self.assertIsNone(IDENT_RE.match(""))


class TestRewriteFirstToken(unittest.TestCase):
    """The rewrite_first_token function is the one place we actually
    mutate a symbols.txt — if it miscounts columns, every downstream
    line in the file shifts by N bytes and the whole config corrupts."""

    def _run(self, content: str, line_no: int, old: str, new: str) -> str:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(content)
            path = Path(f.name)
        try:
            rewrite_first_token(path, line_no, old, new)
            return path.read_text()
        finally:
            path.unlink(missing_ok=True)

    def test_simple_first_token_replacement(self):
        out = self._run(
            "Entry kind:function(arm,size=0x4) addr:0x02000800\n",
            line_no=1, old="Entry", new="CRT_Entry",
        )
        self.assertEqual(
            out,
            "CRT_Entry kind:function(arm,size=0x4) addr:0x02000800\n",
        )

    def test_leading_whitespace_preserved(self):
        # dsd sometimes indents continuation lines; the leading
        # whitespace must survive the rewrite exactly.
        out = self._run(
            "    Entry kind:function(arm,size=0x4) addr:0x02000800\n",
            line_no=1, old="Entry", new="Foo",
        )
        self.assertEqual(
            out,
            "    Foo kind:function(arm,size=0x4) addr:0x02000800\n",
        )

    def test_trailing_content_preserved(self):
        # After the first token, everything else is byte-for-byte
        # identical — including any inline comments or spacing quirks.
        out = self._run(
            "Entry  kind:function(arm,size=0x4)  addr:0x02000800  # noqa\n",
            line_no=1, old="Entry", new="F",
        )
        self.assertEqual(
            out,
            "F  kind:function(arm,size=0x4)  addr:0x02000800  # noqa\n",
        )

    def test_other_lines_untouched(self):
        out = self._run(
            "Halt kind:function(thumb,size=0x4) addr:0x02000584\n"
            "Entry kind:function(arm,size=0x4) addr:0x02000800\n"
            "main kind:function(arm,size=0x10) addr:0x02000c34\n",
            line_no=2, old="Entry", new="CRT_Entry",
        )
        self.assertEqual(
            out,
            "Halt kind:function(thumb,size=0x4) addr:0x02000584\n"
            "CRT_Entry kind:function(arm,size=0x4) addr:0x02000800\n"
            "main kind:function(arm,size=0x10) addr:0x02000c34\n",
        )

    def test_assertion_fires_on_mismatch(self):
        # Wrong `old` argument should trip the assertion, not silently
        # corrupt the file.
        with self.assertRaises(AssertionError):
            self._run(
                "Entry kind:function(arm,size=0x4) addr:0x02000800\n",
                line_no=1, old="NotEntry", new="Foo",
            )


class TestFindSymbol(unittest.TestCase):
    def _make_tree(self, tmp: Path, files: dict[str, str]) -> Path:
        """Build a synthetic config/ tree. Keys are paths relative to the
        fake config root (e.g. 'eur/arm9/symbols.txt')."""
        root = tmp / "config-fake"
        for rel, content in files.items():
            p = root / rel
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(content)
        return root

    def _patch_config_root(self, fake_root: Path):
        # find_symbol walks `rename_symbol.CONFIG`, which is set from
        # a module-level constant. Temporarily redirect it.
        self._orig = rename_symbol.CONFIG
        rename_symbol.CONFIG = fake_root

    def _restore(self):
        rename_symbol.CONFIG = self._orig

    def test_single_match(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(Path(tmp), {
                "eur/arm9/symbols.txt":
                    "Entry kind:function(arm,size=0x4) addr:0x02000800\n"
                    "main kind:function(arm,size=0x10) addr:0x02000c34\n",
            })
            self._patch_config_root(root)
            try:
                hits = find_symbol("Entry", version_filter=None)
                self.assertEqual(len(hits), 1)
                path, line = hits[0]
                self.assertEqual(line, 1)
                self.assertEqual(path.name, "symbols.txt")
            finally:
                self._restore()


class TestCascadeRename(unittest.TestCase):
    def _make_tree(self, tmp: Path, files: dict[str, str]) -> Path:
        root = tmp / "config-fake"
        for rel, content in files.items():
            path = root / rel
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
        return root

    def _patch_config_root(self, fake_root: Path):
        self._orig = rename_symbol.CONFIG
        rename_symbol.CONFIG = fake_root

    def _setup(self, root: Path) -> None:
        self._old_root = rename_symbol.ROOT
        self._old_config = rename_symbol.CONFIG
        rename_symbol.ROOT = root
        rename_symbol.CONFIG = root / "config"
        self.addCleanup(self._restore)

    def _restore(self) -> None:
        if hasattr(self, "_old_root"):
            rename_symbol.ROOT = self._old_root
            rename_symbol.CONFIG = self._old_config
        else:
            rename_symbol.CONFIG = self._orig

    def test_all_regions_update_symbols_content_and_filenames(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._setup(root)
            for region, source_dir in (
                ("eur", root / "src" / "main"),
                ("usa", root / "src" / "usa" / "main"),
                ("jpn", root / "src" / "jpn" / "main"),
            ):
                _write_symbols(
                    root / "config" / region / "arm9" / "symbols.txt",
                    ["func_0200634c kind:function(arm,size=0x2c) addr:0x0200634c"],
                )
                delink_path = root / "config" / region / "arm9" / "delinks.txt"
                source_name = "src/main/func_0200634c.c" if region == "eur" else f"src/{region}/main/func_0200634c.c"
                _write_symbols(delink_path, [source_name + ":"])
                source_dir.mkdir(parents=True, exist_ok=True)
                (source_dir / "func_0200634c.c").write_text(
                    "void func_0200634c(void) { func_0200634c(); }\n",
                )
                if region == "usa":
                    (source_dir / "func_0200634c.s").write_text(".word 0\n")

            messages = cascade_rename(
                "func_0200634c", "Task_InvokeLockedIrq",
            )

            self.assertIn("3 symbol table(s)", messages[0])
            for region, source_dir in (
                ("eur", root / "src" / "main"),
                ("usa", root / "src" / "usa" / "main"),
                ("jpn", root / "src" / "jpn" / "main"),
            ):
                symbols = (root / "config" / region / "arm9" / "symbols.txt").read_text()
                self.assertIn("Task_InvokeLockedIrq kind:function", symbols)
                renamed = source_dir / "Task_InvokeLockedIrq.c"
                self.assertTrue(renamed.exists())
                self.assertNotIn("func_0200634c", renamed.read_text())
                delinks = (root / "config" / region / "arm9" / "delinks.txt").read_text()
                self.assertIn("Task_InvokeLockedIrq.c:", delinks)
                self.assertNotIn("func_0200634c.c:", delinks)
            self.assertTrue((root / "src" / "usa" / "main" / "Task_InvokeLockedIrq.s").exists())

    def test_cascade_is_atomic_on_region_collision(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._setup(root)
            _write_symbols(
                root / "config" / "eur" / "arm9" / "symbols.txt",
                ["func_0200634c kind:function(arm,size=0x2c) addr:0x0200634c"],
            )
            _write_symbols(
                root / "config" / "usa" / "arm9" / "symbols.txt",
                ["func_0200634c kind:function(arm,size=0x2c) addr:0x0200634c",
                 "Taken kind:function(arm,size=0x4) addr:0x02001000"],
            )
            _write_symbols(
                root / "config" / "jpn" / "arm9" / "symbols.txt",
                ["func_0200634c kind:function(arm,size=0x2c) addr:0x0200634c"],
            )
            with self.assertRaises(ValueError):
                cascade_rename("func_0200634c", "Taken")
            self.assertIn("func_0200634c", (root / "config" / "eur" / "arm9" / "symbols.txt").read_text())

    def test_region_cascade_does_not_touch_shared_source_tree(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._setup(root)
            for region in ("eur", "usa", "jpn"):
                _write_symbols(
                    root / "config" / region / "arm9" / "symbols.txt",
                    ["func_02018b70 kind:function(arm,size=0x20) addr:0x02018b70"],
                )
            _write_symbols(
                root / "config" / "eur" / "arm9" / "delinks.txt",
                ["src/main/func_02018b70.c:"],
            )
            _write_symbols(
                root / "config" / "usa" / "arm9" / "delinks.txt",
                ["src/usa/main/func_02018b70.c:"],
            )
            _write_symbols(
                root / "config" / "jpn" / "arm9" / "delinks.txt",
                ["src/jpn/main/func_02018b70.c:"],
            )
            for _region, directory in (
                ("eur", root / "src" / "main"),
                ("usa", root / "src" / "usa" / "main"),
                ("jpn", root / "src" / "jpn" / "main"),
            ):
                directory.mkdir(parents=True, exist_ok=True)
                (directory / "func_02018b70.c").write_text(
                    "void func_02018b70(void) { func_02018b70(); }\n",
                )
            (root / "src" / "main" / "SysWork_ClearField0x810.c").write_text(
                "void SysWork_ClearField0x810(void) {}\n",
            )

            cascade_rename(
                "func_02018b70", "SysWork_ClearField0x810", "usa",
            )

            self.assertTrue(
                (root / "src" / "usa" / "main" / "SysWork_ClearField0x810.c").exists()
            )
            self.assertTrue(
                (root / "src" / "main" / "func_02018b70.c").exists()
            )
            self.assertIn(
                "func_02018b70",
                (root / "src" / "main" / "func_02018b70.c").read_text(),
            )

    def test_not_found(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(Path(tmp), {
                "eur/arm9/symbols.txt":
                    "Entry kind:function(arm,size=0x4) addr:0x02000800\n",
            })
            self._patch_config_root(root)
            try:
                self.assertEqual(find_symbol("NotHere", None), [])
            finally:
                self._restore()

    def test_ambiguous_across_versions(self):
        # A symbol appearing in both eur/ and usa/ — the tool refuses
        # to edit in that case.
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(Path(tmp), {
                "eur/arm9/symbols.txt":
                    "Entry kind:function(arm,size=0x4) addr:0x02000800\n",
                "usa/arm9/symbols.txt":
                    "Entry kind:function(arm,size=0x4) addr:0x02000800\n",
            })
            self._patch_config_root(root)
            try:
                hits = find_symbol("Entry", version_filter=None)
                self.assertEqual(len(hits), 2)
            finally:
                self._restore()

    def test_version_filter_narrows(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(Path(tmp), {
                "eur/arm9/symbols.txt":
                    "Entry kind:function(arm,size=0x4) addr:0x02000800\n",
                "usa/arm9/symbols.txt":
                    "Entry kind:function(arm,size=0x4) addr:0x02000800\n",
            })
            self._patch_config_root(root)
            try:
                hits = find_symbol("Entry", version_filter="eur")
                self.assertEqual(len(hits), 1)
                self.assertIn("eur", str(hits[0][0]))
            finally:
                self._restore()

    def test_comments_and_blanks_skipped(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(Path(tmp), {
                "eur/arm9/symbols.txt":
                    "# leading comment\n"
                    "\n"
                    "Entry kind:function(arm,size=0x4) addr:0x02000800\n",
            })
            self._patch_config_root(root)
            try:
                hits = find_symbol("Entry", None)
                self.assertEqual(len(hits), 1)
                self.assertEqual(hits[0][1], 3)  # line 3 (1-indexed)
            finally:
                self._restore()

    def test_only_matches_first_token(self):
        # 'main' must not match inside 'module:main' on a reloc line
        # (though relocs.txt isn't scanned — but belt-and-braces).
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(Path(tmp), {
                "eur/arm9/symbols.txt":
                    "NotMain kind:function(arm,size=0x4) addr:0x02000800\n",
            })
            self._patch_config_root(root)
            try:
                # The literal first token is 'NotMain' — searching for
                # 'Main' (a substring) must miss.
                self.assertEqual(find_symbol("Main", None), [])
            finally:
                self._restore()


if __name__ == "__main__":
    unittest.main()
