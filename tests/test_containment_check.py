"""Unit tests for tools/containment_check.py (brief 534).

Covers the pure logic (`_size_mismatch`, `_find_diff_runs`,
`_normalize_module`, module detection) and, via a synthetic sandbox repo
tree, the actual brief-534 regression: an overlay candidate whose
module-DEFAULT main-binary pair is IDENTICAL (would false-read CONTAINED
under the tool's old hardcoded-to-main defaults) while its real,
module-correct overlay binary pair has a genuine diff. Brief 525 hit this
for real on 3 candidates; the CLI-level tests below reproduce it with a
disposable fixture instead of the real (multi-hundred-MB) build tree.

Sandbox pattern (ROOT monkeypatch + chdir) mirrors tests/test_batch_carve.py
-- including the chdir defense-in-depth, so a stray relative-path bug can
never touch the real repo even though this tool is read-only.
"""
from __future__ import annotations

import io
import os
import sys
import tempfile
import unittest
from contextlib import redirect_stderr, redirect_stdout
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import containment_check as cc  # noqa: E402


# ---------------------------------------------------------------------------
# Pure logic — no filesystem
# ---------------------------------------------------------------------------

class TestNormalizeModule(unittest.TestCase):
    def test_main_forms(self):
        self.assertEqual(cc._normalize_module("main"), "main")
        self.assertEqual(cc._normalize_module("MAIN"), "main")
        self.assertEqual(cc._normalize_module("arm9"), "main")

    def test_overlay_forms(self):
        self.assertEqual(cc._normalize_module("ov002"), "ov002")
        self.assertEqual(cc._normalize_module("overlay002"), "ov002")
        self.assertEqual(cc._normalize_module("002"), "ov002")
        self.assertEqual(cc._normalize_module("2"), "ov002")

    def test_unrecognized(self):
        self.assertIsNone(cc._normalize_module("bogus"))


class TestSizeMismatch(unittest.TestCase):
    """The headline brief-534 fix: a dedicated, independently-testable
    full-length check that the CLI runs BEFORE the truncated byte walk,
    so a size regression can never again hide behind it."""

    def test_equal(self):
        self.assertEqual(cc._size_mismatch(b"abc", b"abc"), 0)

    def test_growth(self):
        self.assertEqual(cc._size_mismatch(b"abcd", b"abc"), 1)

    def test_shrink(self):
        self.assertEqual(cc._size_mismatch(b"ab", b"abc"), -1)


class TestFindDiffRuns(unittest.TestCase):
    def test_no_diff(self):
        self.assertEqual(cc._find_diff_runs(b"abcdef", b"abcdef"), [])

    def test_single_run(self):
        self.assertEqual(cc._find_diff_runs(b"aXcdef", b"abcdef"), [(1, 2)])

    def test_multiple_disjoint_runs(self):
        a = b"aXcdeYghij"
        b = b"abcdefghij"
        self.assertEqual(cc._find_diff_runs(a, b), [(1, 2), (5, 6)])

    def test_run_straddles_block_boundary(self):
        # block_size=4: the diff run spans offsets 2..6, crossing the
        # 4-byte block boundary at offset 4 -- must be reported as ONE
        # run, not artificially split at the block edge.
        a = b"ab" + b"XX" + b"XX" + b"gh"
        b = b"ab" + b"cd" + b"ef" + b"gh"
        self.assertEqual(cc._find_diff_runs(a, b, block_size=4), [(2, 6)])

    def test_truncates_to_common_prefix_when_sizes_differ(self):
        # This truncation is EXPECTED and is why the CLI must never rely
        # on this function alone for the size aspect of the verdict --
        # see TestCliEndToEnd.test_size_growth_is_avalanche_even_with_clean_prefix.
        a = b"abcdefgh"
        b = b"abcd"
        self.assertEqual(cc._find_diff_runs(a, b), [])


# ---------------------------------------------------------------------------
# Sandbox fixture — synthetic repo tree, ROOT redirected
# ---------------------------------------------------------------------------

# Mirrors the REAL eur ov005 layout from brief 525: overlay section base
# 0x021aa4a0, candidate func_ov005_021abcc4 at [0x021abcc4, 0x021abdb8).
_OV_BASE = 0x021aa4a0
_OV_END = 0x021b2280
_TU_START = 0x021abcc4
_TU_END = 0x021abdb8

_MAIN_BASE = 0x02000000
_MAIN_END = 0x020b4320
_MAIN_TU_START = 0x02001e5c
_MAIN_TU_END = 0x02001e84


class _SandboxTestCase(unittest.TestCase):
    def setUp(self):
        self._tmpdir = tempfile.TemporaryDirectory()
        self.tmp = Path(self._tmpdir.name)
        self._orig_root = cc.ROOT
        cc.ROOT = self.tmp
        self._orig_cwd = os.getcwd()
        os.chdir(self.tmp)

    def tearDown(self):
        os.chdir(self._orig_cwd)
        cc.ROOT = self._orig_root
        self._tmpdir.cleanup()

    def _write_main_delinks(self, region, tu_path, tu_start, tu_end):
        d = self.tmp / "config" / region / "arm9"
        d.mkdir(parents=True, exist_ok=True)
        (d / "delinks.txt").write_text(
            f"    .text       start:0x{_MAIN_BASE:08x} end:0x{_MAIN_END:08x} kind:code align:32\n"
            "\n"
            f"{tu_path}:\n"
            "    complete\n"
            f"    .text start:0x{tu_start:08x} end:0x{tu_end:08x}\n"
        )

    def _write_overlay_delinks(self, region, module, tu_path, tu_start, tu_end):
        d = self.tmp / "config" / region / "arm9" / "overlays" / module
        d.mkdir(parents=True, exist_ok=True)
        (d / "delinks.txt").write_text(
            f"    .text       start:0x{_OV_BASE:08x} end:0x{_OV_END:08x} kind:code align:32\n"
            "\n"
            f"{tu_path}:\n"
            "    complete\n"
            f"    .text start:0x{tu_start:08x} end:0x{tu_end:08x}\n"
        )

    def _write_main_bins(self, region, built: bytes, extract: bytes):
        b = self.tmp / "build" / region / "build"
        b.mkdir(parents=True, exist_ok=True)
        (b / "arm9.bin").write_bytes(built)
        e = self.tmp / "extract" / region / "arm9"
        e.mkdir(parents=True, exist_ok=True)
        (e / "arm9.bin").write_bytes(extract)

    def _write_overlay_bins(self, region, module, built: bytes, extract: bytes):
        b = self.tmp / "build" / region / "build"
        b.mkdir(parents=True, exist_ok=True)
        (b / f"arm9_{module}.bin").write_bytes(built)
        e = self.tmp / "extract" / region / "arm9_overlays"
        e.mkdir(parents=True, exist_ok=True)
        (e / f"{module}.bin").write_bytes(extract)

    def _run_cli(self, argv):
        out, err = io.StringIO(), io.StringIO()
        with redirect_stdout(out), redirect_stderr(err):
            code = cc.main(argv)
        return code, out.getvalue(), err.getvalue()


# ---------------------------------------------------------------------------
# Module detection
# ---------------------------------------------------------------------------

class TestModuleDetection(_SandboxTestCase):
    def test_main_from_candidate_path(self):
        self._write_main_delinks("eur", "src/main/func_02001e5c.c",
                                  _MAIN_TU_START, _MAIN_TU_END)
        result = cc._lookup_candidate_range("src/main/func_02001e5c.c", "eur")
        self.assertEqual(result, (_MAIN_TU_START, _MAIN_TU_END, "main"))

    def test_overlay_from_candidate_path(self):
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        result = cc._lookup_candidate_range("src/overlay005/func_ov005_021abcc4.c", "eur")
        self.assertEqual(result, (_TU_START, _TU_END, "ov005"))

    def test_module_va_base_main_matches_arm9_base(self):
        self._write_main_delinks("eur", "src/main/func_02001e5c.c",
                                  _MAIN_TU_START, _MAIN_TU_END)
        self.assertEqual(cc._module_va_base("eur", "main"), cc.ARM9_BASE_VA)
        self.assertEqual(cc._module_va_base("eur", "main"), _MAIN_BASE)

    def test_module_va_base_overlay_is_the_overlays_own_section_start(self):
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        # Must be the OVERLAY's own section base, NOT the TU's start and
        # NOT main's ARM9_BASE_VA -- this is exactly the distinction the
        # old hardcoded ARM9_BASE_VA erased.
        self.assertEqual(cc._module_va_base("eur", "ov005"), _OV_BASE)
        self.assertNotEqual(cc._module_va_base("eur", "ov005"), cc.ARM9_BASE_VA)

    def test_module_default_paths_main(self):
        built, extract = cc._module_default_paths("eur", "main")
        self.assertEqual(built, self.tmp / "build/eur/build/arm9.bin")
        self.assertEqual(extract, self.tmp / "extract/eur/arm9/arm9.bin")

    def test_module_default_paths_overlay(self):
        built, extract = cc._module_default_paths("eur", "ov005")
        self.assertEqual(built, self.tmp / "build/eur/build/arm9_ov005.bin")
        self.assertEqual(extract, self.tmp / "extract/eur/arm9_overlays/ov005.bin")

    def test_lookup_by_addr_returns_module(self):
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        hits = cc._lookup_ranges_by_addr(_TU_START, "eur")
        self.assertEqual(len(hits), 1)
        start, end, path, module = hits[0]
        self.assertEqual((start, end, module), (_TU_START, _TU_END, "ov005"))


# ---------------------------------------------------------------------------
# CLI end-to-end — the actual brief-534 regression
# ---------------------------------------------------------------------------

class TestCliEndToEnd(_SandboxTestCase):
    def test_contained_main_case(self):
        self._write_main_delinks("eur", "src/main/func_02001e5c.c",
                                  _MAIN_TU_START, _MAIN_TU_END)
        built = bytearray(b"\x00" * 0x2000)
        built[0x1e60] = 0xFF  # inside [0x02001e5c, 0x02001e84) -> offset 0x1e60
        extract = bytes(0x2000)
        self._write_main_bins("eur", bytes(built), extract)
        code, stdout, _ = self._run_cli([
            "eur", "--range", hex(_MAIN_TU_START), hex(_MAIN_TU_END),
        ])
        self.assertEqual(code, 0)
        self.assertIn("CONTAINED", stdout)

    def test_avalanche_by_spill_main_case(self):
        self._write_main_delinks("eur", "src/main/func_02001e5c.c",
                                  _MAIN_TU_START, _MAIN_TU_END)
        built = bytearray(b"\x00" * 0x2000)
        built[0x8f8] = 0xFF  # outside the candidate range entirely
        extract = bytes(0x2000)
        self._write_main_bins("eur", bytes(built), extract)
        code, stdout, _ = self._run_cli([
            "eur", "--range", hex(_MAIN_TU_START), hex(_MAIN_TU_END),
        ])
        self.assertEqual(code, 1)
        self.assertIn("AVALANCHE", stdout)

    def test_size_growth_is_avalanche_even_with_clean_prefix(self):
        """The direct brief-534 fix target: built grew relative to orig,
        but every byte in their common prefix is identical -- the OLD
        per-byte walk alone would find zero runs and (without the
        independent full-length check) could read as CONTAINED. The
        full-length `_size_mismatch` check must force AVALANCHE regardless."""
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        extract = bytes(_OV_END - _OV_BASE)
        built = extract + b"\x00" * 32  # grew by 32 bytes, common prefix identical
        self._write_overlay_bins("eur", "ov005", built, extract)
        code, stdout, _ = self._run_cli([
            "eur", "--range", hex(_TU_START), hex(_TU_END), "--module", "ov005",
        ])
        self.assertEqual(code, 1)
        self.assertIn("AVALANCHE", stdout)
        self.assertIn("SIZE MISMATCH", stdout)

    def test_size_shrink_is_avalanche(self):
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        extract = bytes(_OV_END - _OV_BASE)
        built = extract[:-4]  # shrank by 4 bytes
        self._write_overlay_bins("eur", "ov005", built, extract)
        code, stdout, _ = self._run_cli([
            "eur", "--range", hex(_TU_START), hex(_TU_END), "--module", "ov005",
        ])
        self.assertEqual(code, 1)
        self.assertIn("AVALANCHE", stdout)
        report_line = [l for l in stdout.splitlines() if "SIZE MISMATCH" in l][0]
        self.assertIn("-4", report_line)

    def test_same_size_wrong_content_inside_range_is_contained(self):
        """Same total size, but the candidate's own bytes are genuinely
        wrong -- still legitimately CONTAINED (worth continued C-shape
        iteration), NOT a tool bug. Distinguishes "still needs work" from
        "verified byte-identical", which is the confusion that led past
        sessions to over-trust a bare CONTAINED verdict."""
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        size = _OV_END - _OV_BASE
        extract = bytearray(b"\x00" * size)
        built = bytearray(extract)
        wrong_off = (_TU_START - _OV_BASE) + 4  # inside the candidate's own range
        built[wrong_off] = 0xAB
        self._write_overlay_bins("eur", "ov005", bytes(built), bytes(extract))
        code, stdout, _ = self._run_cli([
            "eur", "--range", hex(_TU_START), hex(_TU_END), "--module", "ov005",
        ])
        self.assertEqual(code, 0)
        self.assertIn("CONTAINED", stdout)
        self.assertIn("diff: 1 byte(s)", stdout)

    def test_same_size_wrong_content_outside_range_is_avalanche(self):
        """Same total size, but the wrong byte falls OUTSIDE the
        candidate's own range (a spillover with no net size change) --
        must still be AVALANCHE."""
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        size = _OV_END - _OV_BASE
        extract = bytearray(b"\x00" * size)
        built = bytearray(extract)
        wrong_off = (_TU_END - _OV_BASE) + 16  # past the candidate's own end
        built[wrong_off] = 0xAB
        self._write_overlay_bins("eur", "ov005", bytes(built), bytes(extract))
        code, stdout, _ = self._run_cli([
            "eur", "--range", hex(_TU_START), hex(_TU_END), "--module", "ov005",
        ])
        self.assertEqual(code, 1)
        self.assertIn("AVALANCHE", stdout)

    def test_brief_525_regression_overlay_default_paths_not_main(self):
        """THE regression test: an overlay candidate whose auto-selected
        default binaries must be its OWN overlay's, not main's. Main's
        pair here is deliberately IDENTICAL (would read CONTAINED, 0
        diff, if the tool fell back to checking it) while ov005's real
        pair has a genuine 32-byte AVALANCHE-by-growth. Resolving the
        candidate via --addr (no --built/--extract override at all) must
        pick up ov005's binaries automatically and report AVALANCHE --
        reproducing, and closing, the exact brief-525 failure mode."""
        self._write_main_delinks("eur", "src/main/func_02001e5c.c",
                                  _MAIN_TU_START, _MAIN_TU_END)
        clean_main = bytes(0x1000)
        self._write_main_bins("eur", clean_main, clean_main)  # byte-identical

        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        extract = bytes(_OV_END - _OV_BASE)
        built = extract + b"\x00" * 32  # ov005's REAL state: grew by 32 bytes
        self._write_overlay_bins("eur", "ov005", built, extract)

        # No --built/--extract override anywhere -- must auto-detect ov005
        # and check ITS binaries, not silently fall back to main's.
        code, stdout, _ = self._run_cli(["eur", "--addr", hex(_TU_START)])
        self.assertEqual(code, 1, msg=(
            "false-CONTAINED regression: tool checked the wrong (main) "
            "binary pair instead of ov005's own"
        ))
        self.assertIn("AVALANCHE", stdout)
        self.assertIn("module=ov005", stdout)
        self.assertIn("arm9_ov005.bin", stdout)

    def test_ambiguous_addr_lists_module_hints(self):
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        self._write_overlay_delinks("eur", "ov008", "src/overlay008/func_ov008_021abcc4.c",
                                     _TU_START, _TU_END)
        code, _, stderr = self._run_cli(["eur", "--addr", hex(_TU_START)])
        self.assertEqual(code, 2)
        self.assertIn("AMBIGUOUS", stderr)
        self.assertIn("--module ov005", stderr)
        self.assertIn("--module ov008", stderr)

    def test_range_without_module_auto_detects_overlay(self):
        """--range used to default straight to main with no way to
        express "this is an overlay range" short of a manual --built/
        --extract override. It must now auto-detect the module the same
        way --addr does."""
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        extract = bytes(_OV_END - _OV_BASE)
        built = extract + b"\x00" * 8
        self._write_overlay_bins("eur", "ov005", built, extract)
        code, stdout, _ = self._run_cli([
            "eur", "--range", hex(_TU_START), hex(_TU_END),
        ])
        self.assertEqual(code, 1)
        self.assertIn("module=ov005", stdout)

    def test_missing_built_binary_is_infra_error(self):
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        code, _, stderr = self._run_cli([
            "eur", "--range", hex(_TU_START), hex(_TU_END), "--module", "ov005",
        ])
        self.assertEqual(code, 2)
        self.assertIn("ERROR", stderr)

    def test_explicit_built_extract_still_overrides_default(self):
        """Backward compatibility: an explicit --built/--extract must
        still win over the module-aware default."""
        self._write_overlay_delinks("eur", "ov005", "src/overlay005/func_ov005_021abcc4.c",
                                     _TU_START, _TU_END)
        # Deliberately do NOT create the default ov005 binaries at all --
        # only the override paths exist, so success proves the override
        # was actually used.
        alt_dir = self.tmp / "alt"
        alt_dir.mkdir()
        data = bytes(_OV_END - _OV_BASE)
        (alt_dir / "built.bin").write_bytes(data)
        (alt_dir / "extract.bin").write_bytes(data)
        code, stdout, _ = self._run_cli([
            "eur", "--range", hex(_TU_START), hex(_TU_END), "--module", "ov005",
            "--built", str(alt_dir / "built.bin"),
            "--extract", str(alt_dir / "extract.bin"),
        ])
        self.assertEqual(code, 0)
        self.assertIn("CONTAINED", stdout)


if __name__ == "__main__":
    unittest.main()
