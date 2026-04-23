"""Unit tests for tools/configure.py's asm-rule helpers.

Scoped to the pure source-discovery helpers added alongside the
`mwasm` build rule. End-to-end ninja-generation testing requires the
actual toolchain (mwccarm, dsd, wibo, a baserom), which the cloud
environment doesn't have — brain/decomper verifies the full pipeline
on merge. These tests pin the parts we CAN exercise in isolation:

  - is_asm()         file-extension classifier
  - get_asm_files()  .s/.S walker
  - get_source_files() union generator (C/C++ + asm)

configure.py runs argparse at module load, so the test module
installs a synthetic sys.argv before importing. Tests must therefore
be imported only once per process — which unittest already does.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

# configure.py parses argv at import. Pin a benign one before import
# so this suite can run regardless of how pytest/unittest invokes it.
_OLD_ARGV = sys.argv
sys.argv = ["configure.py", "eur", "--skip-sha1"]
try:
    import configure  # noqa: E402
finally:
    sys.argv = _OLD_ARGV


class TestIsAsm(unittest.TestCase):
    def test_lowercase_s(self):
        self.assertTrue(configure.is_asm("foo.s"))
        self.assertTrue(configure.is_asm(Path("src/foo.s")))

    def test_uppercase_s(self):
        # mwasmarm accepts .S too; pokediamond uses both.
        self.assertTrue(configure.is_asm("foo.S"))

    def test_c_files_rejected(self):
        self.assertFalse(configure.is_asm("foo.c"))
        self.assertFalse(configure.is_asm("foo.cpp"))

    def test_no_extension(self):
        self.assertFalse(configure.is_asm("Makefile"))

    def test_similar_suffixes_rejected(self):
        # Defensive: .sa, .asm, .inc are not our pattern.
        self.assertFalse(configure.is_asm("foo.asm"))
        self.assertFalse(configure.is_asm("foo.inc"))
        self.assertFalse(configure.is_asm("foo.sa"))


class TestGetAsmFiles(unittest.TestCase):
    def test_empty_dir_yields_nothing(self):
        with tempfile.TemporaryDirectory() as td:
            out = list(configure.get_asm_files([Path(td)]))
            self.assertEqual(out, [])

    def test_missing_dir_skipped(self):
        # Non-existent dir must not raise.
        out = list(configure.get_asm_files([Path("/definitely/not/here")]))
        self.assertEqual(out, [])

    def test_walks_nested_subdirs(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "a").mkdir()
            (root / "a" / "b").mkdir()
            (root / "top.s").write_text("")
            (root / "a" / "mid.s").write_text("")
            (root / "a" / "b" / "deep.S").write_text("")
            (root / "unrelated.c").write_text("")
            (root / "readme.md").write_text("")

            names = sorted(p.name for p in configure.get_asm_files([root]))
            self.assertEqual(names, ["deep.S", "mid.s", "top.s"])

    def test_multiple_roots_merged(self):
        with tempfile.TemporaryDirectory() as td:
            a = Path(td) / "a"
            b = Path(td) / "b"
            a.mkdir()
            b.mkdir()
            (a / "one.s").write_text("")
            (b / "two.s").write_text("")

            names = sorted(p.name for p in configure.get_asm_files([a, b]))
            self.assertEqual(names, ["one.s", "two.s"])


class TestGetSourceFiles(unittest.TestCase):
    """get_source_files is the union of get_c_cpp_files + get_asm_files
    in that order — deterministic for reproducible ninja output."""

    def test_includes_both_c_and_asm(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "a.c").write_text("")
            (root / "b.s").write_text("")
            out = list(configure.get_source_files([root]))
            names = [p.name for p in out]
            self.assertIn("a.c", names)
            self.assertIn("b.s", names)

    def test_c_before_asm_for_determinism(self):
        # Explicit invariant: C/C++ files precede asm files in output.
        # Two rationales:
        #   1. Ninja output stability across runs.
        #   2. A future sha1/hash of the object list should be stable
        #      as long as source membership doesn't change.
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "code.c").write_text("")
            (root / "thunks.s").write_text("")
            out = list(configure.get_source_files([root]))
            names = [p.name for p in out]
            self.assertLess(names.index("code.c"), names.index("thunks.s"))

    def test_cpp_also_included(self):
        # Regression check: asm addition must not break the existing
        # C++ discovery path.
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "x.cpp").write_text("")
            (root / "y.s").write_text("")
            names = {p.name
                     for p in configure.get_source_files([root])}
            self.assertEqual(names, {"x.cpp", "y.s"})

    def test_empty_yields_empty(self):
        with tempfile.TemporaryDirectory() as td:
            self.assertEqual(
                list(configure.get_source_files([Path(td)])), [],
            )


class TestMwasmRuleDefinitions(unittest.TestCase):
    """Constants used to build the mwasm rule command. Pinning so
    that accidental flag-removals get caught before brief 013
    regresses.

    Flag values verified empirically against mwasmarm 2.0/sp1p5 by
    the decomper (PR #110 feedback):
      - `-proc arm5TE` accepted; `v5te`, `arm5te`, `ARM5TE` rejected
        (case-sensitive valid-list)
      - `-sym on` rejected as unknown option; `-g` is the mwasmarm
        equivalent for debug info
    """

    def test_asm_flags_has_expected_tokens(self):
        self.assertIn("-proc arm5TE", configure.ASM_FLAGS)
        self.assertIn("-msgstyle gcc", configure.ASM_FLAGS)
        self.assertIn("-g", configure.ASM_FLAGS)

    def test_asm_flags_no_longer_has_rejected_tokens(self):
        # Regression guard: the decomper-rejected v1 tokens must
        # stay out. `-sym on` is specifically rejected by mwasmarm;
        # `v5te` is a mwccarm flag that mwasmarm's valid-list
        # doesn't accept.
        self.assertNotIn("-proc v5te", configure.ASM_FLAGS)
        self.assertNotIn("-sym on", configure.ASM_FLAGS)

    def test_asm_points_at_mwasmarm_exe(self):
        # The tool constant must resolve to mwasmarm.exe inside the
        # downloaded mwccarm bundle — nothing else in that bundle is
        # a valid assembler target.
        self.assertTrue(configure.ASM.endswith("mwasmarm.exe"))


if __name__ == "__main__":
    unittest.main()
