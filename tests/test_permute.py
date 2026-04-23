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
    render_readme,
    render_run_sh,
    stage_work_dir,
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


class TestRenderRunSh(unittest.TestCase):
    """PR #161: run.sh auto-generated alongside the copy staging."""

    def test_contains_import_and_permuter_commands(self):
        out = render_run_sh(
            function_name="func_02000800",
            permuter_path=Path("/home/user/decomp-permuter"),
            source_c=Path("/home/user/gx-spirit-caller/src/main/entry.c"),
            target_s=Path("/home/user/gx-spirit-caller/build/eur/disasm/main_02000800.s"),
        )
        # Shebang is bash for portability (works on macOS/Linux).
        self.assertIn("#!/usr/bin/env bash", out)
        # Both key commands are referenced.
        self.assertIn("./import.py", out)
        self.assertIn("./permuter.py", out)
        # Function name appears so grep-forward is easy.
        self.assertIn("func_02000800", out)

    def test_idempotent_import_guard(self):
        # Re-running run.sh should be safe: it checks for the
        # nonmatchings/<fn>/ dir before re-importing.
        out = render_run_sh(
            function_name="sinit_ov005_021b16e4",
            permuter_path=Path("/p"),
            source_c=Path("/s.c"),
            target_s=Path("/s.s"),
        )
        self.assertIn(
            "if [ ! -d", out,
            "should guard import.py against re-running",
        )
        self.assertIn("nonmatchings/sinit_ov005_021b16e4", out)

    def test_uses_set_euo_pipefail(self):
        # Catch upstream config errors early rather than let the
        # permuter swallow them.
        out = render_run_sh(
            function_name="x",
            permuter_path=Path("/p"),
            source_c=Path("/s.c"),
            target_s=Path("/s.s"),
        )
        self.assertIn("set -euo pipefail", out)


class TestRenderReadme(unittest.TestCase):
    def test_mentions_target_and_paths(self):
        md = render_readme(
            function_name="func_02000800",
            module="main",
            addr=0x02000800,
            source_c=Path("src/main/entry.c"),
            target_s=Path("build/eur/disasm/main_02000800.s"),
        )
        self.assertIn("func_02000800", md)
        self.assertIn("main", md)
        self.assertIn("0x02000800", md)
        self.assertIn("src/main/entry.c", md)
        self.assertIn("build/eur/disasm/main_02000800.s", md)

    def test_includes_followup_steps(self):
        md = render_readme(
            function_name="x", module="main", addr=0x1000,
            source_c=Path("s.c"), target_s=Path("s.s"),
        )
        # Referenced workflow should cover ninja + delinks update.
        self.assertIn("ninja rom", md)
        self.assertIn("delinks.txt", md)

    def test_run_command_is_prominent(self):
        md = render_readme(
            function_name="x", module="main", addr=0x1000,
            source_c=Path("s.c"), target_s=Path("s.s"),
        )
        self.assertIn("./run.sh", md)


class TestStageWorkDir(unittest.TestCase):
    """End-to-end: stage_work_dir produces the expected files."""

    def test_staging_creates_all_files(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            src = tmp / "entry.c"
            src.write_text("/* source */", encoding="utf-8")
            obj = tmp / "entry.o"
            obj.write_bytes(b"\x7fELF")
            s_file = tmp / "entry.s"
            s_file.write_text("# disasm", encoding="utf-8")

            work_dir = stage_work_dir(
                function_name="test_fn",
                module="main",
                addr=0x02000800,
                source_c=src,
                target_o=obj,
                target_s=s_file,
                permuter_path=Path("/fake/permuter"),
            )
            try:
                self.assertTrue(
                    (work_dir / "base.c").is_file(),
                    "base.c should be copied",
                )
                self.assertTrue(
                    (work_dir / "base.o").is_file(),
                    "base.o should be copied",
                )
                self.assertTrue(
                    (work_dir / "run.sh").is_file(),
                    "run.sh should be generated",
                )
                self.assertTrue(
                    (work_dir / "README.md").is_file(),
                    "README.md should be generated",
                )
                # run.sh must be executable.
                import stat as _stat
                mode = (work_dir / "run.sh").stat().st_mode
                self.assertTrue(
                    mode & _stat.S_IXUSR,
                    "run.sh must have S_IXUSR set",
                )
            finally:
                # Clean up the artifact — stage_work_dir writes to
                # the repo root, not the tmp dir.
                import shutil as _shutil
                _shutil.rmtree(work_dir, ignore_errors=True)

    def test_legacy_call_skips_run_sh_and_readme(self):
        # Pre-#161 callers pass only source_c + target_o (no
        # target_s, no permuter_path). stage_work_dir must still
        # work (no crashes) but won't generate run.sh / README.
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            src = tmp / "entry.c"
            src.write_text("/* source */", encoding="utf-8")
            obj = tmp / "entry.o"
            obj.write_bytes(b"")

            work_dir = stage_work_dir(
                function_name="legacy_fn",
                module="main",
                addr=0x02001000,
                source_c=src,
                target_o=obj,
            )
            try:
                self.assertTrue((work_dir / "base.c").is_file())
                self.assertFalse((work_dir / "run.sh").exists())
                self.assertFalse((work_dir / "README.md").exists())
            finally:
                import shutil as _shutil
                _shutil.rmtree(work_dir, ignore_errors=True)


if __name__ == "__main__":
    unittest.main()
