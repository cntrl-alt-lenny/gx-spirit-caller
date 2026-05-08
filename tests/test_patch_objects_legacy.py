"""Unit tests for tools/patch_objects_legacy.py.

The patcher rewrites `func_X.o` -> `func_X.legacy.o` in the
dsd-generated objects.txt for any source ending in `.legacy.c`.
A regression here would silently break mwldarm's link step for
every `.legacy.c`-routed TU (brief 037 → brief 038 → brief 039).
Pinning:

  - LEGACY_C_SUFFIX matches configure.py's constant
  - collect_legacy_sources() walks delinks.txt files recursively
    and returns only `.legacy.c` source paths
  - buggy_and_fixed_suffixes() derives the buggy/fixed pair
    correctly (and rejects non-legacy inputs)
  - patch_objects_text() rewrites only matching lines, preserves
    line order, is idempotent, and is a no-op when there are no
    legacy sources
  - patch_file() handles the fresh-checkout / no-objects.txt /
    no-legacy-sources cases without erroring
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import patch_objects_legacy  # noqa: E402

# Pin the suffix in sync with configure.py's LEGACY_C_SUFFIX. The
# patcher duplicates the constant rather than importing configure
# (which runs argparse at module load); this test guarantees the
# duplication doesn't drift.
_OLD_ARGV = sys.argv
sys.argv = ["configure.py", "eur", "--skip-sha1"]
try:
    import configure  # noqa: E402
finally:
    sys.argv = _OLD_ARGV


class TestSuffixConstantInSync(unittest.TestCase):
    def test_matches_configure_constant(self):
        self.assertEqual(
            patch_objects_legacy.LEGACY_C_SUFFIX,
            configure.LEGACY_C_SUFFIX,
        )


class TestBuggyAndFixedSuffixes(unittest.TestCase):
    def test_simple_main_path(self):
        buggy, fixed = patch_objects_legacy.buggy_and_fixed_suffixes(
            Path("src/main/func_0207cbbc.legacy.c"),
        )
        self.assertEqual(buggy, "src/main/func_0207cbbc.o")
        self.assertEqual(fixed, "src/main/func_0207cbbc.legacy.o")

    def test_overlay_path(self):
        buggy, fixed = patch_objects_legacy.buggy_and_fixed_suffixes(
            Path("src/overlay005/ov005_021ab384.legacy.c"),
        )
        self.assertEqual(buggy, "src/overlay005/ov005_021ab384.o")
        self.assertEqual(fixed, "src/overlay005/ov005_021ab384.legacy.o")

    def test_dotted_stem_preserved(self):
        # A stem with extra dots (theoretical; project doesn't use it
        # but the helper shouldn't accidentally collapse them).
        buggy, fixed = patch_objects_legacy.buggy_and_fixed_suffixes(
            Path("src/main/foo.bar.legacy.c"),
        )
        self.assertEqual(buggy, "src/main/foo.bar.o")
        self.assertEqual(fixed, "src/main/foo.bar.legacy.o")

    def test_non_legacy_input_rejected(self):
        with self.assertRaises(ValueError):
            patch_objects_legacy.buggy_and_fixed_suffixes(
                Path("src/main/CpuSet.c"),
            )


class TestPatchObjectsText(unittest.TestCase):
    """Pin the rewrite logic with synthetic objects.txt content.
    Doesn't touch the filesystem — fast unit-level coverage."""

    def test_rewrites_only_legacy_match(self):
        text = (
            "build/eur/src/main/CpuSet.o\n"
            "build/eur/src/main/func_0207cbbc.o\n"
            "build/eur/src/main/Task_InvokeLocked.o\n"
        )
        new, n = patch_objects_legacy.patch_objects_text(
            text, [Path("src/main/func_0207cbbc.legacy.c")],
        )
        self.assertEqual(n, 1)
        self.assertIn(
            "build/eur/src/main/func_0207cbbc.legacy.o",
            new,
        )
        # Untouched neighbours.
        self.assertIn("build/eur/src/main/CpuSet.o\n", new)
        self.assertIn("build/eur/src/main/Task_InvokeLocked.o\n", new)

    def test_no_legacy_sources_is_noop(self):
        text = (
            "build/eur/src/main/CpuSet.o\n"
            "build/eur/src/main/Task_InvokeLocked.o\n"
        )
        new, n = patch_objects_legacy.patch_objects_text(text, [])
        self.assertEqual(n, 0)
        self.assertEqual(new, text)

    def test_idempotent_already_patched(self):
        # objects.txt already contains the fixed form (e.g. a re-run
        # of the lcf rule). The patcher must not double-patch into
        # `func_X.legacy.legacy.o` or similar.
        text = "build/eur/src/main/func_0207cbbc.legacy.o\n"
        new, n = patch_objects_legacy.patch_objects_text(
            text, [Path("src/main/func_0207cbbc.legacy.c")],
        )
        self.assertEqual(n, 0)
        self.assertEqual(new, text)

    def test_mixed_default_and_legacy(self):
        text = (
            "build/eur/src/main/CpuSet.o\n"
            "build/eur/src/main/func_0207cbbc.o\n"
            "build/eur/src/overlay005/ov005_021ab384.o\n"
            "build/eur/src/main/Task_InvokeLocked.o\n"
        )
        sources = [
            Path("src/main/func_0207cbbc.legacy.c"),
            Path("src/overlay005/ov005_021ab384.legacy.c"),
        ]
        new, n = patch_objects_legacy.patch_objects_text(text, sources)
        self.assertEqual(n, 2)
        self.assertIn("func_0207cbbc.legacy.o", new)
        self.assertIn("ov005_021ab384.legacy.o", new)
        # CpuSet / Task_InvokeLocked unchanged.
        self.assertIn("build/eur/src/main/CpuSet.o\n", new)
        self.assertIn("build/eur/src/main/Task_InvokeLocked.o\n", new)

    def test_anchored_suffix_match_avoids_false_positive(self):
        # Defensive: a path that has the buggy suffix as a substring
        # mid-path (e.g. a hypothetical sibling artifact) must NOT be
        # rewritten. Only end-of-line matches count.
        text = "build/eur/src/main/func_0207cbbc.o.bak\n"
        new, n = patch_objects_legacy.patch_objects_text(
            text, [Path("src/main/func_0207cbbc.legacy.c")],
        )
        self.assertEqual(n, 0)
        self.assertEqual(new, text)

    def test_preserves_order_and_trailing_newline(self):
        text = (
            "alpha.o\n"
            "build/eur/src/main/func_X.o\n"
            "beta.o\n"
        )
        new, n = patch_objects_legacy.patch_objects_text(
            text, [Path("src/main/func_X.legacy.c")],
        )
        self.assertEqual(n, 1)
        lines = new.splitlines()
        self.assertEqual(len(lines), 3)
        self.assertEqual(lines[0], "alpha.o")
        self.assertEqual(lines[1], "build/eur/src/main/func_X.legacy.o")
        self.assertEqual(lines[2], "beta.o")
        self.assertTrue(new.endswith("\n"))

    def test_module_disambiguation_via_directory(self):
        # Two sources in different modules with the same stem. Only
        # the matching legacy source's line is rewritten.
        text = (
            "build/eur/src/main/foo.o\n"
            "build/eur/src/overlay005/foo.o\n"
        )
        sources = [Path("src/main/foo.legacy.c")]  # only main is legacy
        new, n = patch_objects_legacy.patch_objects_text(text, sources)
        self.assertEqual(n, 1)
        self.assertIn("build/eur/src/main/foo.legacy.o\n", new)
        self.assertIn("build/eur/src/overlay005/foo.o\n", new)


class TestCollectLegacySources(unittest.TestCase):
    """End-to-end test of the delinks.txt walker with a synthetic
    config tree. parse_delinks_file is reused from progress.py so
    the test exercises the cross-module integration."""

    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())

    def tearDown(self):
        import shutil
        shutil.rmtree(self.tmp)

    def _write(self, rel: str, text: str) -> Path:
        p = self.tmp / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(text)
        return p

    def test_arm9_main_legacy_source_collected(self):
        self._write("arm9/delinks.txt", (
            "    .text       start:0x02000000 end:0x02100000 kind:code align:32\n"
            "\n"
            "src/main/CpuSet.c:\n"
            "    complete\n"
            "    .text start:0x02000254 end:0x02000258\n"
            "src/main/func_0207cbbc.legacy.c:\n"
            "    complete\n"
            "    .text start:0x0207cbbc end:0x0207cbe0\n"
        ))
        sources = patch_objects_legacy.collect_legacy_sources(self.tmp)
        self.assertEqual(
            sources,
            [Path("src/main/func_0207cbbc.legacy.c")],
        )

    def test_overlay_legacy_source_also_collected(self):
        self._write("arm9/delinks.txt", (
            "src/main/CpuSet.c:\n"
            "    complete\n"
            "    .text start:0x02000254 end:0x02000258\n"
        ))
        self._write("arm9/overlays/ov005/delinks.txt", (
            "src/overlay005/ov005_X.legacy.c:\n"
            "    complete\n"
            "    .text start:0x021ab384 end:0x021ab3a0\n"
        ))
        sources = patch_objects_legacy.collect_legacy_sources(self.tmp)
        # Both files walked; only the .legacy.c entry collected.
        self.assertEqual(
            sources,
            [Path("src/overlay005/ov005_X.legacy.c")],
        )

    def test_no_delinks_returns_empty(self):
        sources = patch_objects_legacy.collect_legacy_sources(self.tmp)
        self.assertEqual(sources, [])

    def test_no_legacy_returns_empty(self):
        self._write("arm9/delinks.txt", (
            "src/main/CpuSet.c:\n"
            "    complete\n"
            "    .text start:0x02000254 end:0x02000258\n"
        ))
        sources = patch_objects_legacy.collect_legacy_sources(self.tmp)
        self.assertEqual(sources, [])


class TestPatchFile(unittest.TestCase):
    """End-to-end of the file-level patcher. Mirrors how the lcf
    ninja rule invokes the script."""

    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())

    def tearDown(self):
        import shutil
        shutil.rmtree(self.tmp)

    def test_missing_objects_file_is_silent_success(self):
        # Fresh-checkout case — objects.txt doesn't exist yet.
        # Script must return 0 without erroring.
        rc = patch_objects_legacy.patch_file(
            config_dir=self.tmp,
            objects_path=self.tmp / "does-not-exist.txt",
        )
        self.assertEqual(rc, 0)

    def test_no_legacy_sources_no_op(self):
        objects = self.tmp / "objects.txt"
        objects.write_text("alpha.o\nbeta.o\n")
        before = objects.read_text()
        rc = patch_objects_legacy.patch_file(
            config_dir=self.tmp,
            objects_path=objects,
        )
        self.assertEqual(rc, 0)
        self.assertEqual(objects.read_text(), before)

    def test_end_to_end_rewrite(self):
        # Synthetic delinks.txt with one legacy source + objects.txt
        # with the buggy entry. After patch, objects.txt has the
        # fixed entry.
        delinks = self.tmp / "arm9" / "delinks.txt"
        delinks.parent.mkdir(parents=True)
        delinks.write_text(
            "src/main/func_0207cbbc.legacy.c:\n"
            "    complete\n"
            "    .text start:0x0207cbbc end:0x0207cbe0\n"
        )
        objects = self.tmp / "objects.txt"
        objects.write_text(
            "build/eur/src/main/CpuSet.o\n"
            "build/eur/src/main/func_0207cbbc.o\n"
        )
        rc = patch_objects_legacy.patch_file(
            config_dir=self.tmp,
            objects_path=objects,
        )
        self.assertEqual(rc, 0)
        out = objects.read_text()
        self.assertIn("build/eur/src/main/func_0207cbbc.legacy.o\n", out)
        self.assertIn("build/eur/src/main/CpuSet.o\n", out)
        self.assertNotIn("build/eur/src/main/func_0207cbbc.o\n", out)

    def test_idempotent_second_run(self):
        delinks = self.tmp / "arm9" / "delinks.txt"
        delinks.parent.mkdir(parents=True)
        delinks.write_text(
            "src/main/foo.legacy.c:\n"
            "    complete\n"
            "    .text start:0x02000000 end:0x02000020\n"
        )
        objects = self.tmp / "objects.txt"
        objects.write_text("build/eur/src/main/foo.o\n")
        # First run rewrites.
        patch_objects_legacy.patch_file(self.tmp, objects)
        first = objects.read_text()
        self.assertIn("foo.legacy.o", first)
        # Second run is a no-op.
        patch_objects_legacy.patch_file(self.tmp, objects)
        self.assertEqual(objects.read_text(), first)


if __name__ == "__main__":
    unittest.main()
