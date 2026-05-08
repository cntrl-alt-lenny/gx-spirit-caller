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

    def test_sp3_matches_configure_constant(self):
        # Brief 045: third routing tier (mwcc 1.2/sp3). Pin the
        # patcher's duplicate against configure.py's source-of-truth
        # so they don't drift.
        self.assertEqual(
            patch_objects_legacy.LEGACY_SP3_C_SUFFIX,
            configure.LEGACY_SP3_C_SUFFIX,
        )

    def test_legacy_suffixes_tuple_contains_both(self):
        # Pin the membership of LEGACY_SUFFIXES so a future tier
        # addition can't quietly drop one of the existing entries.
        self.assertIn(
            patch_objects_legacy.LEGACY_C_SUFFIX,
            patch_objects_legacy.LEGACY_SUFFIXES,
        )
        self.assertIn(
            patch_objects_legacy.LEGACY_SP3_C_SUFFIX,
            patch_objects_legacy.LEGACY_SUFFIXES,
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

    def test_legacy_sp3_main_path(self):
        # Brief 045 third tier — sp3 routing. Same dsd lcf bug
        # applies; the qualifier in the fixed suffix is
        # `.legacy_sp3` instead of `.legacy`.
        buggy, fixed = patch_objects_legacy.buggy_and_fixed_suffixes(
            Path("src/main/func_020467f4.legacy_sp3.c"),
        )
        self.assertEqual(buggy, "src/main/func_020467f4.o")
        self.assertEqual(fixed, "src/main/func_020467f4.legacy_sp3.o")

    def test_legacy_sp3_overlay_path(self):
        buggy, fixed = patch_objects_legacy.buggy_and_fixed_suffixes(
            Path("src/overlay005/ov005_X.legacy_sp3.c"),
        )
        self.assertEqual(buggy, "src/overlay005/ov005_X.o")
        self.assertEqual(fixed, "src/overlay005/ov005_X.legacy_sp3.o")

    def test_legacy_sp3_dotted_stem_preserved(self):
        buggy, fixed = patch_objects_legacy.buggy_and_fixed_suffixes(
            Path("src/main/foo.bar.legacy_sp3.c"),
        )
        self.assertEqual(buggy, "src/main/foo.bar.o")
        self.assertEqual(fixed, "src/main/foo.bar.legacy_sp3.o")


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

    def test_rewrites_legacy_sp3_only(self):
        # Sp3-only mix: a single .legacy_sp3.c source rewrites the
        # corresponding .o entry. Plain `.c` siblings pass through.
        text = (
            "build/eur/src/main/CpuSet.o\n"
            "build/eur/src/main/func_020467f4.o\n"
            "build/eur/src/main/Task_InvokeLocked.o\n"
        )
        new, n = patch_objects_legacy.patch_objects_text(
            text, [Path("src/main/func_020467f4.legacy_sp3.c")],
        )
        self.assertEqual(n, 1)
        self.assertIn(
            "build/eur/src/main/func_020467f4.legacy_sp3.o",
            new,
        )
        self.assertIn("build/eur/src/main/CpuSet.o\n", new)
        self.assertIn("build/eur/src/main/Task_InvokeLocked.o\n", new)
        self.assertNotIn("build/eur/src/main/func_020467f4.o\n", new)

    def test_mixed_legacy_and_legacy_sp3(self):
        # Both routing tiers in use simultaneously — every TU's
        # entry is rewritten to its correct fixed form. This is the
        # expected steady-state once decomper starts using sp3 for
        # specific targets while keeping existing .legacy.c targets.
        text = (
            "build/eur/src/main/CpuSet.o\n"                 # plain
            "build/eur/src/main/func_0207cbbc.o\n"          # legacy
            "build/eur/src/main/func_020467f4.o\n"          # legacy_sp3
            "build/eur/src/overlay005/ov005_X.o\n"          # legacy
            "build/eur/src/main/Task_InvokeLocked.o\n"      # plain
        )
        sources = [
            Path("src/main/func_0207cbbc.legacy.c"),
            Path("src/main/func_020467f4.legacy_sp3.c"),
            Path("src/overlay005/ov005_X.legacy.c"),
        ]
        new, n = patch_objects_legacy.patch_objects_text(text, sources)
        self.assertEqual(n, 3)
        self.assertIn("func_0207cbbc.legacy.o", new)
        self.assertIn("func_020467f4.legacy_sp3.o", new)
        self.assertIn("ov005_X.legacy.o", new)
        # Plain entries unchanged.
        self.assertIn("build/eur/src/main/CpuSet.o\n", new)
        self.assertIn("build/eur/src/main/Task_InvokeLocked.o\n", new)
        # Buggy entries gone.
        self.assertNotIn("build/eur/src/main/func_0207cbbc.o\n", new)
        self.assertNotIn("build/eur/src/main/func_020467f4.o\n", new)

    def test_legacy_sp3_idempotent(self):
        # Running the patcher again on already-fixed sp3 entries
        # must not double-patch into `func_X.legacy_sp3.legacy_sp3.o`.
        text = "build/eur/src/main/func_020467f4.legacy_sp3.o\n"
        new, n = patch_objects_legacy.patch_objects_text(
            text, [Path("src/main/func_020467f4.legacy_sp3.c")],
        )
        self.assertEqual(n, 0)
        self.assertEqual(new, text)


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

    def test_legacy_sp3_source_collected(self):
        # Brief 045: third routing tier. A `.legacy_sp3.c` source
        # alone must be picked up by the walker.
        self._write("arm9/delinks.txt", (
            "src/main/func_020467f4.legacy_sp3.c:\n"
            "    complete\n"
            "    .text start:0x020467f4 end:0x02046828\n"
        ))
        sources = patch_objects_legacy.collect_legacy_sources(self.tmp)
        self.assertEqual(
            sources,
            [Path("src/main/func_020467f4.legacy_sp3.c")],
        )

    def test_mixed_legacy_and_legacy_sp3_sources_collected(self):
        # Mixed steady-state — both suffixes coexist in the same
        # delinks.txt and must both surface in the walker output.
        self._write("arm9/delinks.txt", (
            "src/main/CpuSet.c:\n"
            "    complete\n"
            "    .text start:0x02000254 end:0x02000258\n"
            "src/main/func_0207cbbc.legacy.c:\n"
            "    complete\n"
            "    .text start:0x0207cbbc end:0x0207cbe0\n"
            "src/main/func_020467f4.legacy_sp3.c:\n"
            "    complete\n"
            "    .text start:0x020467f4 end:0x02046828\n"
        ))
        sources = patch_objects_legacy.collect_legacy_sources(self.tmp)
        # Both legacy variants returned (order is delinks-file order).
        self.assertIn(
            Path("src/main/func_0207cbbc.legacy.c"), sources,
        )
        self.assertIn(
            Path("src/main/func_020467f4.legacy_sp3.c"), sources,
        )
        # Plain `.c` source is NOT collected.
        self.assertNotIn(Path("src/main/CpuSet.c"), sources)


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

    def test_end_to_end_rewrite_legacy_sp3(self):
        # Brief 045: third routing tier — end-to-end. Synthetic
        # delinks.txt with one .legacy_sp3.c source + objects.txt
        # with the buggy entry. After patch, the fixed entry has
        # the `.legacy_sp3` qualifier.
        delinks = self.tmp / "arm9" / "delinks.txt"
        delinks.parent.mkdir(parents=True)
        delinks.write_text(
            "src/main/func_020467f4.legacy_sp3.c:\n"
            "    complete\n"
            "    .text start:0x020467f4 end:0x02046828\n"
        )
        objects = self.tmp / "objects.txt"
        objects.write_text(
            "build/eur/src/main/CpuSet.o\n"
            "build/eur/src/main/func_020467f4.o\n"
        )
        rc = patch_objects_legacy.patch_file(
            config_dir=self.tmp,
            objects_path=objects,
        )
        self.assertEqual(rc, 0)
        out = objects.read_text()
        self.assertIn("build/eur/src/main/func_020467f4.legacy_sp3.o\n", out)
        self.assertIn("build/eur/src/main/CpuSet.o\n", out)
        self.assertNotIn("build/eur/src/main/func_020467f4.o\n", out)

    def test_end_to_end_mixed_tiers(self):
        # Both .legacy.c and .legacy_sp3.c in the same delinks.txt
        # — the patcher rewrites each line to its correct fixed
        # form. Mirrors how the project will look once decomper
        # starts using sp3 routing for some targets while keeping
        # existing sp2p3 targets.
        delinks = self.tmp / "arm9" / "delinks.txt"
        delinks.parent.mkdir(parents=True)
        delinks.write_text(
            "src/main/func_0207cbbc.legacy.c:\n"
            "    complete\n"
            "    .text start:0x0207cbbc end:0x0207cbe0\n"
            "src/main/func_020467f4.legacy_sp3.c:\n"
            "    complete\n"
            "    .text start:0x020467f4 end:0x02046828\n"
        )
        objects = self.tmp / "objects.txt"
        objects.write_text(
            "build/eur/src/main/func_0207cbbc.o\n"
            "build/eur/src/main/func_020467f4.o\n"
        )
        rc = patch_objects_legacy.patch_file(
            config_dir=self.tmp,
            objects_path=objects,
        )
        self.assertEqual(rc, 0)
        out = objects.read_text()
        self.assertIn("func_0207cbbc.legacy.o", out)
        self.assertIn("func_020467f4.legacy_sp3.o", out)


if __name__ == "__main__":
    unittest.main()
