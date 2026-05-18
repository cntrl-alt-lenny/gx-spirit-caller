"""Unit tests for tools/clean_macos_junk.py (brief 138).

The tool's job is to remove OS-generated metadata files
(`.DS_Store`, `._*`, `Thumbs.db`, `desktop.ini`) from a
directory tree before `dsd rom build` scans it. A regression
would re-introduce the 100K-byte ROM diff brief 137 root-caused.

Pinned behaviour:

- File-name match: `.DS_Store`, `Thumbs.db`, `desktop.ini`
- Prefix match:    `._*` (macOS AppleDouble)
- Real files left alone
- Nested directories swept recursively
- `--include-dirs` removes `.AppleDouble` / `.fseventsd` /
  `.Trashes` / `.Spotlight-V*` directories
- Default: directories NOT removed
- Stamp file: created on first run; mtime only updates when
  the run actually removed something (so ninja `restat=1`
  keeps the build cache warm when nothing changed)
- Missing directory: silent success (idempotent for fresh
  checkouts)
"""

from __future__ import annotations

import os
import sys
import tempfile
import time
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from clean_macos_junk import (  # noqa: E402
    JUNK_DIR_NAMES,
    JUNK_DIR_PREFIXES,
    JUNK_FILE_NAMES,
    JUNK_FILE_PREFIXES,
    clean_tree,
    is_junk_dir,
    is_junk_file,
    main,
    update_stamp,
)


class TestIsJunkFile(unittest.TestCase):

    def test_known_filenames(self) -> None:
        for name in (".DS_Store", "Thumbs.db", "desktop.ini"):
            self.assertTrue(is_junk_file(name), f"want junk: {name}")

    def test_appledouble_prefix(self) -> None:
        for name in ("._foo", "._foo.bin", "._.DS_Store"):
            self.assertTrue(is_junk_file(name), f"want junk: {name}")

    def test_real_files_kept(self) -> None:
        for name in (
            "foo.bin", "Academia", "real.dat", ".gitignore",
            "DS_Store.bak", "thumbs.txt",
        ):
            self.assertFalse(is_junk_file(name), f"want kept: {name}")

    def test_constants_are_frozen(self) -> None:
        # Pin the default set so a future reviewer notices if
        # someone widens it.
        self.assertEqual(
            JUNK_FILE_NAMES,
            frozenset({".DS_Store", "Thumbs.db", "desktop.ini"}),
        )
        self.assertEqual(JUNK_FILE_PREFIXES, ("._",))


class TestIsJunkDir(unittest.TestCase):

    def test_known_dirnames(self) -> None:
        for name in (".AppleDouble", ".fseventsd", ".Trashes"):
            self.assertTrue(is_junk_dir(name), f"want junk: {name}")

    def test_spotlight_prefix(self) -> None:
        for name in (".Spotlight-V100", ".Spotlight-V200"):
            self.assertTrue(is_junk_dir(name), f"want junk: {name}")

    def test_real_dirs_kept(self) -> None:
        for name in (
            "Academia", "Common", "MyRoom", "dwc", ".git",
            "Spotlight", "AppleDouble.bak",
        ):
            self.assertFalse(is_junk_dir(name), f"want kept: {name}")

    def test_constants_are_frozen(self) -> None:
        self.assertEqual(
            JUNK_DIR_NAMES,
            frozenset({".AppleDouble", ".fseventsd", ".Trashes"}),
        )
        self.assertEqual(JUNK_DIR_PREFIXES, (".Spotlight-",))


class TestCleanTree(unittest.TestCase):

    def _make_fixture(self) -> Path:
        """Build a tree mirroring the real
        extract/<region>/files/ layout, with junk injected at
        multiple depths."""
        root = Path(tempfile.mkdtemp(prefix="junktest_"))
        # Top-level real files + junk
        (root / "real_top.bin").write_text("real")
        (root / ".DS_Store").write_text("")
        (root / "._real_top.bin").write_text("")
        (root / "Thumbs.db").write_text("")
        (root / "desktop.ini").write_text("")
        # Nested directory with junk
        sub = root / "Academia"
        sub.mkdir()
        (sub / "AcademiaA.LZ5bg").write_text("real")
        (sub / ".DS_Store").write_text("")
        (sub / "._AcademiaA.LZ5bg").write_text("")
        # Deeper nesting
        deeper = sub / "Sub"
        deeper.mkdir()
        (deeper / "deep.dat").write_text("real")
        (deeper / ".DS_Store").write_text("")
        # Optional dirs we DON'T remove by default
        (root / ".AppleDouble").mkdir()
        (root / ".AppleDouble" / "phantom").write_text("")
        (root / ".Spotlight-V100").mkdir()
        return root

    def test_removes_all_default_junk(self) -> None:
        root = self._make_fixture()
        try:
            n_files, n_dirs = clean_tree(root)
            self.assertEqual(n_dirs, 0, "no dirs without --include-dirs")
            # 4 top-level junk + 2 in Academia + 1 in Sub = 7
            # (.DS_Store, ._real_top.bin, Thumbs.db, desktop.ini
            #  in root; .DS_Store + ._AcademiaA.LZ5bg in Academia;
            #  .DS_Store in Sub)
            self.assertEqual(n_files, 7)
            # Real files preserved
            self.assertTrue((root / "real_top.bin").exists())
            self.assertTrue(
                (root / "Academia" / "AcademiaA.LZ5bg").exists()
            )
            self.assertTrue(
                (root / "Academia" / "Sub" / "deep.dat").exists()
            )
            # Junk gone
            self.assertFalse((root / ".DS_Store").exists())
            self.assertFalse((root / "._real_top.bin").exists())
            self.assertFalse((root / "Thumbs.db").exists())
            self.assertFalse((root / "desktop.ini").exists())
            self.assertFalse(
                (root / "Academia" / ".DS_Store").exists()
            )
            self.assertFalse(
                (root / "Academia" / "._AcademiaA.LZ5bg").exists()
            )
            self.assertFalse(
                (root / "Academia" / "Sub" / ".DS_Store").exists()
            )
            # Optional dirs LEFT in place (no --include-dirs)
            self.assertTrue((root / ".AppleDouble").exists())
            self.assertTrue((root / ".Spotlight-V100").exists())
        finally:
            import shutil
            shutil.rmtree(root)

    def test_include_dirs_removes_optional_directories(self) -> None:
        root = self._make_fixture()
        try:
            n_files, n_dirs = clean_tree(root, include_dirs=True)
            self.assertEqual(n_dirs, 2, "AppleDouble + Spotlight")
            # `.AppleDouble` had a file inside (phantom) — but
            # rmtree handles the recursive removal; only the dir
            # itself counts as 1 in n_dirs.
            self.assertFalse((root / ".AppleDouble").exists())
            self.assertFalse((root / ".Spotlight-V100").exists())
        finally:
            import shutil
            shutil.rmtree(root)

    def test_idempotent(self) -> None:
        root = self._make_fixture()
        try:
            clean_tree(root)
            # Second pass: nothing to do
            n_files, n_dirs = clean_tree(root)
            self.assertEqual((n_files, n_dirs), (0, 0))
        finally:
            import shutil
            shutil.rmtree(root)

    def test_missing_root_silent(self) -> None:
        root = Path("/tmp/this/does/not/exist/zzz")
        n_files, n_dirs = clean_tree(root)
        self.assertEqual((n_files, n_dirs), (0, 0))

    def test_file_root_silent(self) -> None:
        # Single-file path: tool should skip silently (only
        # sweeps trees).
        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b"x")
            p = Path(f.name)
        try:
            n_files, n_dirs = clean_tree(p)
            self.assertEqual((n_files, n_dirs), (0, 0))
            self.assertTrue(p.exists())
        finally:
            p.unlink()


class TestUpdateStamp(unittest.TestCase):

    def test_creates_on_first_run(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            stamp = Path(d) / "sub" / "cleanup.stamp"
            self.assertFalse(stamp.exists())
            updated = update_stamp(stamp, force=False)
            self.assertTrue(updated)
            self.assertTrue(stamp.exists())

    def test_skips_when_not_forced(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            stamp = Path(d) / "cleanup.stamp"
            stamp.touch()
            mtime_before = stamp.stat().st_mtime
            time.sleep(0.01)
            updated = update_stamp(stamp, force=False)
            self.assertFalse(updated)
            self.assertEqual(
                stamp.stat().st_mtime, mtime_before,
                "stamp mtime must NOT change when force=False "
                "and stamp already exists",
            )

    def test_touches_when_forced(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            stamp = Path(d) / "cleanup.stamp"
            stamp.touch()
            mtime_before = stamp.stat().st_mtime
            time.sleep(0.01)
            updated = update_stamp(stamp, force=True)
            self.assertTrue(updated)
            self.assertGreater(
                stamp.stat().st_mtime, mtime_before,
                "stamp mtime must update when force=True",
            )


class TestMainCLI(unittest.TestCase):

    def test_single_dir_end_to_end(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            root = Path(d) / "files"
            root.mkdir()
            (root / "real.bin").write_text("real")
            (root / ".DS_Store").write_text("")
            stamp = Path(d) / "cleanup.stamp"
            rc = main([
                "--dir", str(root),
                "--stamp", str(stamp),
            ])
            self.assertEqual(rc, 0)
            self.assertFalse((root / ".DS_Store").exists())
            self.assertTrue((root / "real.bin").exists())
            self.assertTrue(stamp.exists())

    def test_multiple_dirs(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            a = Path(d) / "A"
            b = Path(d) / "B"
            a.mkdir(); b.mkdir()
            (a / ".DS_Store").write_text("")
            (b / ".DS_Store").write_text("")
            rc = main([
                "--dir", str(a),
                "--dir", str(b),
            ])
            self.assertEqual(rc, 0)
            self.assertFalse((a / ".DS_Store").exists())
            self.assertFalse((b / ".DS_Store").exists())

    def test_stamp_persists_across_runs(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            root = Path(d) / "files"
            root.mkdir()
            (root / ".DS_Store").write_text("")
            stamp = Path(d) / "cleanup.stamp"

            # First run: removes junk, touches stamp.
            main(["--dir", str(root), "--stamp", str(stamp)])
            mtime1 = stamp.stat().st_mtime

            time.sleep(0.01)
            # Second run: no junk, no removal → stamp NOT touched.
            main(["--dir", str(root), "--stamp", str(stamp)])
            mtime2 = stamp.stat().st_mtime
            self.assertEqual(
                mtime1, mtime2,
                "stamp must not move when nothing was removed",
            )

            time.sleep(0.01)
            # Re-inject junk → next run touches the stamp.
            (root / ".DS_Store").write_text("")
            main(["--dir", str(root), "--stamp", str(stamp)])
            mtime3 = stamp.stat().st_mtime
            self.assertGreater(
                mtime3, mtime2,
                "stamp must move when junk re-appears + is cleaned",
            )


if __name__ == "__main__":
    unittest.main()
