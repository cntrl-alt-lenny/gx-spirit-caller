"""Tests for tools/check_baseline_growth.py: a baseline may only shrink.

Each test builds a throwaway git repository, commits a base baseline, changes
the working-tree file, and runs the check the way CI does."""

from __future__ import annotations

import contextlib
import io
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import check_baseline_growth as cbg  # noqa: E402

NAME = "tools/reference_baseline.txt"
V2 = "# format: 2\n"


def entry(unit: str, offset: int, region: str = "eur") -> str:
    return f"{region}\t{unit}\tmissing-reloc\t.data+0x{offset:x} original ABS32 sym built none\n"


class TestGrowth(unittest.TestCase):
    def _repo(self, base_text: str) -> Path:
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        root = Path(tmp.name)
        (root / "tools").mkdir()
        (root / NAME).write_text(base_text, encoding="utf-8", newline="\n")
        for cmd in (["init", "-q"], ["add", "."],
                    ["-c", "user.name=t", "-c", "user.email=t@example.invalid",
                     "commit", "-q", "-m", "base"]):
            subprocess.run(["git", *cmd], cwd=root, check=True, capture_output=True)
        return root

    def _run(self, root: Path, new_text: str, base: str = "HEAD") -> tuple[int, str]:
        (root / NAME).write_text(new_text, encoding="utf-8", newline="\n")
        out = io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(out):
            code = cbg.main(["--base", base, "--root", str(root), "--file", NAME])
        return code, out.getvalue()

    def test_unchanged_passes(self):
        base = V2 + entry("src/a.c", 4) + entry("src/a.c", 8)
        root = self._repo(base)
        self.assertEqual(self._run(root, base)[0], 0)

    def test_an_added_entry_fails(self):
        base = V2 + entry("src/a.c", 4)
        root = self._repo(base)
        code, out = self._run(root, base + entry("src/b.c", 4))
        self.assertEqual(code, 1)
        self.assertIn("ADDED: eur\tsrc/b.c", out)

    def test_a_swapped_entry_in_one_unit_fails(self):
        root = self._repo(V2 + entry("src/a.c", 4) + entry("src/a.c", 8))
        code, out = self._run(root, V2 + entry("src/a.c", 4) + entry("src/a.c", 12))
        self.assertEqual(code, 1)
        self.assertIn("ADDED: eur\tsrc/a.c\tmissing-reloc\t.data+0xc", out)

    def test_removing_an_entry_passes_and_records_nothing(self):
        root = self._repo(V2 + entry("src/a.c", 4) + entry("src/a.c", 8))
        code, out = self._run(root, V2 + entry("src/a.c", 4))
        self.assertEqual(code, 0, out)
        self.assertIn("0 added", out)

    def test_emptying_the_baseline_passes(self):
        root = self._repo(V2 + entry("src/a.c", 4))
        self.assertEqual(self._run(root, V2)[0], 0)

    def test_format_one_base_allows_the_same_counts_and_no_more(self):
        legacy = "eur\tsrc/a.c\tmissing-reloc\t2\nvolatile-local\tsrc/b.c\t1\n"
        root = self._repo(legacy)
        migrated = V2 + entry("src/a.c", 4) + entry("src/a.c", 8) \
            + "volatile-local\tsrc/b.c\t1\tvolatile int x;\n"
        self.assertEqual(self._run(root, migrated)[0], 0)
        code, out = self._run(root, migrated + entry("src/a.c", 12))
        self.assertEqual(code, 1)
        self.assertIn("ADDED", out)
        code, _ = self._run(root, migrated + entry("src/c.c", 4))
        self.assertEqual(code, 1)

    def test_a_format_one_new_file_is_refused(self):
        root = self._repo(V2)
        code, out = self._run(root, "eur\tsrc/a.c\tmissing-reloc\t1\n")
        self.assertEqual(code, 1)
        self.assertIn("not a format-2 baseline", out)

    def test_comparison_is_against_the_merge_base_not_the_tip(self):
        base = V2 + entry("src/a.c", 4)
        root = self._repo(base)
        git = ["git", "-c", "user.name=t", "-c", "user.email=t@example.invalid"]
        subprocess.run([*git, "checkout", "-q", "-b", "feature"], cwd=root, check=True)
        subprocess.run([*git, "checkout", "-q", "-b", "main2", "HEAD~0"], cwd=root, check=True)
        # main moves on and gains an entry; the feature branch, cut earlier, does not.
        (root / NAME).write_text(base + entry("src/m.c", 4), encoding="utf-8", newline="\n")
        subprocess.run([*git, "commit", "-qam", "main adds"], cwd=root, check=True)
        subprocess.run([*git, "checkout", "-q", "feature"], cwd=root, check=True)
        self.assertEqual(self._run(root, base, base="main2")[0], 0)
        code, _ = self._run(root, base + entry("src/f.c", 4), base="main2")
        self.assertEqual(code, 1)

    def test_a_file_absent_at_the_base_is_introduced_not_compared(self):
        root = self._repo(V2)
        subprocess.run(["git", "rm", "-q", "-f", NAME], cwd=root, check=True)
        subprocess.run(["git", "-c", "user.name=t", "-c", "user.email=t@example.invalid",
                        "commit", "-qm", "drop"], cwd=root, check=True)
        subprocess.run(["git", "checkout", "-q", "-b", "later"], cwd=root, check=True)
        # HEAD no longer has the file: the introduction case.
        (root / "tools").mkdir(exist_ok=True)
        (root / NAME).write_text(V2 + entry("src/a.c", 4), encoding="utf-8", newline="\n")
        code, out = self._run(root, V2 + entry("src/a.c", 4), base="HEAD")
        self.assertEqual(code, 0, out)
        self.assertIn("introduced by this change", out)

    def test_a_missing_base_is_an_input_error(self):
        root = self._repo(V2)
        code, _ = self._run(root, V2, base="no-such-ref")
        self.assertEqual(code, 2)


class TestRealBaselines(unittest.TestCase):
    def test_the_committed_baselines_are_format_two(self):
        root = Path(__file__).resolve().parent.parent
        for name in cbg.DEFAULT_FILES:
            text = (root / name).read_text(encoding="utf-8")
            self.assertIn("# format: 2", text.splitlines(), name)


if __name__ == "__main__":
    unittest.main()
