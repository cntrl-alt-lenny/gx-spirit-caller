"""Unit tests for tools/configure.py's asm-rule helpers, macOS
wine-runner resolution, and dual-compiler routing.

Scoped to the pure source-discovery / classifier helpers and the
constants that drive the build.ninja generator. End-to-end
ninja-generation testing requires the actual toolchain (mwccarm,
dsd, wibo, a baserom), which the scaffolder environment doesn't have —
brain/decomper verifies the full pipeline on merge. These tests
pin the parts we CAN exercise in isolation:

  - is_asm() / is_c() / is_legacy_c() file-extension classifiers
  - get_asm_files()  .s/.S walker
  - get_source_files() union generator (C/C++ + asm)
  - the LEGACY_C_SUFFIX / MWCC_VERSION / LEGACY_MWCC_VERSION
    constants + their derived paths
  - macOS wine-runner candidate selection

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


class TestIsLegacyC(unittest.TestCase):
    """Pin the dual-compiler routing predicate. A regression that
    silently mis-classifies a `.legacy.c` as default-mwcc would
    silently break Style A epilogue matching across every routed TU
    in brief 038 and beyond."""

    def test_legacy_suffix_matches(self):
        self.assertTrue(configure.is_legacy_c("foo.legacy.c"))
        self.assertTrue(configure.is_legacy_c("src/main/func_0207cbbc.legacy.c"))
        self.assertTrue(configure.is_legacy_c(Path("foo.legacy.c")))

    def test_plain_c_does_not_match(self):
        self.assertFalse(configure.is_legacy_c("foo.c"))
        self.assertFalse(configure.is_legacy_c("src/main/CpuSet.c"))
        self.assertFalse(configure.is_legacy_c(Path("src/main/Task_InvokeLocked.c")))

    def test_cpp_does_not_match(self):
        # No C++ legacy support today — `*.legacy.cpp` should NOT
        # route. If/when a Style A C++ TU surfaces, decide explicitly.
        self.assertFalse(configure.is_legacy_c("foo.legacy.cpp"))

    def test_legacy_substring_in_middle_does_not_match(self):
        # Defensive: `legacy_helpers.c` contains the word "legacy"
        # but doesn't end in the suffix; must not route.
        self.assertFalse(configure.is_legacy_c("legacy_helpers.c"))
        self.assertFalse(configure.is_legacy_c("foo.legacy.c.bak"))

    def test_path_suffix_only_returns_c(self):
        # Double-check the precondition that motivated the
        # endswith()-based predicate: Path.suffix on a multi-dot
        # filename returns only the last segment, so we cannot rely
        # on it to detect `.legacy.c`.
        self.assertEqual(Path("foo.legacy.c").suffix, ".c")
        self.assertTrue(configure.is_c("foo.legacy.c"))  # is_c() also matches!
        # is_legacy_c() is what disambiguates the routing.
        self.assertTrue(configure.is_legacy_c("foo.legacy.c"))

    def test_legacy_sp3_does_not_match_legacy_c(self):
        # The two suffixes are mutually exclusive: a `.legacy_sp3.c`
        # file must NOT also classify as `.legacy.c` (and therefore
        # accidentally route through both rules — which would
        # produce two ninja build entries with the same output and
        # an "multiple rules generate ..." error). The literal
        # endswith() check makes them disjoint because
        # `.legacy_sp3.c` doesn't end with `.legacy.c`.
        self.assertFalse(configure.is_legacy_c("foo.legacy_sp3.c"))
        self.assertFalse(configure.is_legacy_c("src/main/func_X.legacy_sp3.c"))


class TestIsLegacySp3C(unittest.TestCase):
    """Pin the third-tier routing predicate (mwcc 1.2/sp3). Mirrors
    TestIsLegacyC. A regression that silently mis-classifies a
    `.legacy_sp3.c` would silently break the sp3-unique-prologue
    target matches the routing exists to enable (brief 044
    sp3-routing-decision)."""

    def test_legacy_sp3_suffix_matches(self):
        self.assertTrue(configure.is_legacy_sp3_c("foo.legacy_sp3.c"))
        self.assertTrue(configure.is_legacy_sp3_c("src/main/func_020467f4.legacy_sp3.c"))
        self.assertTrue(configure.is_legacy_sp3_c(Path("foo.legacy_sp3.c")))

    def test_plain_c_does_not_match(self):
        self.assertFalse(configure.is_legacy_sp3_c("foo.c"))
        self.assertFalse(configure.is_legacy_sp3_c("src/main/CpuSet.c"))

    def test_cpp_does_not_match(self):
        # No C++ legacy_sp3 support — same policy as `.legacy.cpp`.
        self.assertFalse(configure.is_legacy_sp3_c("foo.legacy_sp3.cpp"))

    def test_legacy_c_does_not_match_legacy_sp3(self):
        # Mutually exclusive in the other direction: a `.legacy.c`
        # must NOT classify as `.legacy_sp3.c`.
        self.assertFalse(configure.is_legacy_sp3_c("foo.legacy.c"))
        self.assertFalse(configure.is_legacy_sp3_c("src/main/func_X.legacy.c"))

    def test_substring_in_middle_does_not_match(self):
        self.assertFalse(configure.is_legacy_sp3_c("legacy_sp3_helpers.c"))
        self.assertFalse(configure.is_legacy_sp3_c("foo.legacy_sp3.c.bak"))

    def test_path_suffix_only_returns_c(self):
        # Same multi-dot caveat as is_legacy_c().
        self.assertEqual(Path("foo.legacy_sp3.c").suffix, ".c")
        self.assertTrue(configure.is_c("foo.legacy_sp3.c"))
        self.assertTrue(configure.is_legacy_sp3_c("foo.legacy_sp3.c"))


class TestLegacyCompilerConstants(unittest.TestCase):
    """Pin the version + path constants that drive the dual-compiler
    rule. A typo in the version string would silently route through
    a non-existent compiler binary at build time."""

    def test_legacy_version_pinned(self):
        # docs/research/style-a-epilogue.md established 1.2/sp2p3
        # as the Style A boundary version. Pin it.
        self.assertEqual(configure.LEGACY_MWCC_VERSION, "1.2/sp2p3")

    def test_default_version_pinned(self):
        # 2.0/sp1p5 is the project's documented default per CLAUDE.md.
        self.assertEqual(configure.MWCC_VERSION, "2.0/sp1p5")

    def test_legacy_suffix_constant(self):
        self.assertEqual(configure.LEGACY_C_SUFFIX, ".legacy.c")

    def test_legacy_cc_path_points_at_sp2p3_mwccarm(self):
        # The path constant should resolve to mwcc 1.2/sp2p3's
        # mwccarm.exe, not mwldarm or mwasmarm. Compare on a POSIX-
        # normalized copy so the assertion works on Windows hosts
        # too (configure.LEGACY_CC is built via os.path.join, so
        # the native separator leaks through).
        self.assertIn(
            "mwccarm/1.2/sp2p3", configure.LEGACY_CC.replace("\\", "/"),
        )
        self.assertTrue(configure.LEGACY_CC.endswith("mwccarm.exe"))

    def test_default_cc_unchanged(self):
        # Regression guard: dual-compiler addition must not alter
        # the default compiler's path.
        self.assertIn(
            "mwccarm/2.0/sp1p5", configure.CC.replace("\\", "/"),
        )
        self.assertTrue(configure.CC.endswith("mwccarm.exe"))

    def test_legacy_and_default_paths_differ(self):
        self.assertNotEqual(configure.LEGACY_CC, configure.CC)

    def test_compiler_suffix_table_keeps_binary_and_flag_together(self):
        self.assertEqual(
            configure.MWCC_BY_SUFFIX[configure.LEGACY_C_SUFFIX],
            (configure.LEGACY_CC, "-lang=c99"),
        )
        self.assertEqual(
            configure.MWCC_BY_SUFFIX[".c"],
            (configure.CC, "-lang=c99"),
        )

    def test_source_glob_table_selects_c99_and_cxx(self):
        self.assertEqual(
            configure._source_language_flags("src/main/func_02000000.c"),
            "-lang=c99",
        )
        self.assertEqual(
            configure._source_language_flags("libs/nitro/helper.cpp"),
            "-lang=c++",
        )
        self.assertEqual(
            configure._source_language_flags("src/main/func_02000000.s"),
            "",
        )


class TestLegacySp3CompilerConstants(unittest.TestCase):
    """Pin the third-tier (sp3) version + path constants. Same
    rationale as TestLegacyCompilerConstants — a typo would silently
    route TUs through a non-existent compiler binary."""

    def test_legacy_sp3_version_pinned(self):
        # docs/research/sp3-routing-decision.md (brief 044) pins
        # 1.2/sp3 as the third-tier discriminator.
        self.assertEqual(configure.LEGACY_SP3_MWCC_VERSION, "1.2/sp3")

    def test_legacy_sp3_suffix_constant(self):
        self.assertEqual(configure.LEGACY_SP3_C_SUFFIX, ".legacy_sp3.c")

    def test_legacy_sp3_cc_path_points_at_sp3_mwccarm(self):
        # POSIX-normalize for Windows-host runs; see
        # test_default_cc_unchanged for the rationale.
        self.assertIn(
            "mwccarm/1.2/sp3", configure.LEGACY_SP3_CC.replace("\\", "/"),
        )
        self.assertTrue(configure.LEGACY_SP3_CC.endswith("mwccarm.exe"))

    def test_three_compiler_paths_all_differ(self):
        # Defense against a copy-paste regression that left two
        # constants pointing at the same binary.
        self.assertNotEqual(configure.LEGACY_SP3_CC, configure.CC)
        self.assertNotEqual(configure.LEGACY_SP3_CC, configure.LEGACY_CC)
        self.assertNotEqual(configure.LEGACY_CC, configure.CC)

    def test_three_suffix_constants_distinct(self):
        # The three routing tiers must use distinct suffix conventions
        # for the routing predicates to make a clean choice.
        self.assertNotEqual(configure.LEGACY_C_SUFFIX, configure.LEGACY_SP3_C_SUFFIX)


class TestWrapChainForWindows(unittest.TestCase):
    """Pin the Windows-only shell-chain wrap added in brief 058.

    Ninja on Windows calls `CreateProcess` directly (no `/bin/sh -c`),
    so the `delink` / `lcf` / `mwasm` rule bodies — which chain a tool
    with a Python post-processing step via `&&` — used to die on step
    3 of the build with `dsd.exe error: unexpected argument '&&'
    found`. The fix wraps the chain in `cmd /c "..."` on Windows so
    cmd processes the operator. Linux / macOS rule bodies must stay
    byte-identical to today's (Ninja's POSIX `/bin/sh -c` handles
    `&&` natively).
    """

    def test_windows_wraps_in_cmd_c(self):
        out = configure._wrap_chain_for_windows(
            "a && b", system="windows",
        )
        self.assertEqual(out, 'cmd /c "a && b"')

    def test_linux_passthrough(self):
        # POSIX path must be byte-identical — anything else would
        # change build.ninja for every Linux/macOS contributor.
        out = configure._wrap_chain_for_windows(
            "a && b", system="linux",
        )
        self.assertEqual(out, "a && b")

    def test_macos_passthrough(self):
        out = configure._wrap_chain_for_windows(
            "a && b", system="macos",
        )
        self.assertEqual(out, "a && b")

    def test_inner_double_quotes_preserved(self):
        # mwasm's chain has an inner-quoted ASM path (e.g.
        # `"C:\...\mwasmarm.exe"`). cmd /c's quote-handling rule with
        # >2 quote chars + special chars between them is "strip first
        # and last", which preserves the inner quotes. Pin the
        # generated form so a careless refactor doesn't break that.
        chain = '"C:\\path\\mwasmarm.exe" -o $out $in && python tail.py'
        out = configure._wrap_chain_for_windows(chain, system="windows")
        self.assertEqual(
            out,
            'cmd /c ""C:\\path\\mwasmarm.exe" -o $out $in && python tail.py"',
        )

    def test_ninja_variables_passthrough(self):
        # `$config_path` etc. must reach Ninja literally so it can
        # expand them at build time. The wrap doesn't touch them.
        chain = "dsd delink --config-path $config_path && python tail.py --dir $delinks_dir"
        out = configure._wrap_chain_for_windows(chain, system="windows")
        self.assertIn("$config_path", out)
        self.assertIn("$delinks_dir", out)
        self.assertTrue(out.startswith('cmd /c "'))
        self.assertTrue(out.endswith('"'))

    def test_empty_chain_still_wrapped_on_windows(self):
        # Degenerate but defined: an empty chain still gets cmd /c
        # so the rule shape is uniform. Doesn't matter functionally.
        out = configure._wrap_chain_for_windows("", system="windows")
        self.assertEqual(out, 'cmd /c ""')

    def test_default_system_uses_module_platform(self):
        # When `system` is omitted, the helper falls back to the
        # module-level `platform.system` set at import time. This
        # is the path taken by main(); the test just confirms the
        # default doesn't raise.
        out = configure._wrap_chain_for_windows("a && b")
        self.assertIsInstance(out, str)
        # On the CI runner (Linux) the call must be a passthrough.
        # If a future CI matrix adds Windows, that runner will see
        # the wrapped form — both branches are explicitly covered
        # by the system-injected tests above.


class TestResolveMacosWine(unittest.TestCase):
    """Pin the wine-runner candidate-selection so a wine-stable user's
    setup keeps resolving to `wine` after the GPTK migration brief
    landed, while a fresh GPTK install resolves to `wine64`."""

    def test_wine_stable_only_picks_wine(self):
        # `which` mock: only `wine` resolves on PATH.
        which = lambda name: "/opt/homebrew/bin/wine" if name == "wine" else None
        self.assertEqual(
            configure._resolve_macos_wine(("wine", "wine64"), which=which),
            "wine",
        )

    def test_gptk_only_picks_wine64(self):
        # Fresh-install machine: only `wine64` resolves.
        which = lambda name: (
            "/opt/homebrew/bin/wine64" if name == "wine64" else None
        )
        self.assertEqual(
            configure._resolve_macos_wine(("wine", "wine64"), which=which),
            "wine64",
        )

    def test_both_present_prefers_first_candidate(self):
        # Coexistence (rare, but harmless): both casks installed.
        # First-candidate-wins keeps wine-stable behaviour stable for
        # contributors who haven't yet uninstalled the legacy cask.
        which = lambda name: f"/opt/homebrew/bin/{name}"
        self.assertEqual(
            configure._resolve_macos_wine(("wine", "wine64"), which=which),
            "wine",
        )

    def test_neither_present_falls_back_to_first(self):
        # No wine on PATH at all: emit the first candidate so the
        # build.ninja command surfaces a clear "wine: command not
        # found" at build time instead of a silent empty WINE.
        which = lambda name: None
        self.assertEqual(
            configure._resolve_macos_wine(("wine", "wine64"), which=which),
            "wine",
        )


if __name__ == "__main__":
    unittest.main()
