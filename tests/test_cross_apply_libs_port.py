"""Unit tests for tools/cross_apply_libs_port.py.

Brief 073 deliverable. Pins:
  - Port filename parsing (extracts EUR addr + routing suffix)
  - Data-ref extraction from port .c source
  - Plan dataclass invariants
  - Module → delinks.txt path mapping

End-to-end cross-apply + region build is exercised by the worked
example in `docs/research/libs-region-naming.md` (manual smoke-
test pre-push). The wine + mwccarm + region-bin chain isn't
suitable for CI in this repo; these tests pin the pure-function
pieces that are CI-safe.

Run locally:
    python -m unittest tests.test_cross_apply_libs_port
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from cross_apply_libs_port import (  # noqa: E402
    CrossApplyPlan,
    _DATA_REF_RE,
    _delinks_path_for,
    _find_data_refs_in_port,
    _reloc_parity,
    parse_port_filename,
)


# --------------------------------------------------------------------------- #
# Filename parsing
# --------------------------------------------------------------------------- #


class TestParsePortFilename(unittest.TestCase):
    def test_legacy_c(self):
        result = parse_port_filename(Path("func_02007218.legacy.c"))
        self.assertEqual(result, (0x02007218, ".legacy"))

    def test_legacy_sp3_c(self):
        result = parse_port_filename(Path("func_02007218.legacy_sp3.c"))
        self.assertEqual(result, (0x02007218, ".legacy_sp3"))

    def test_overlay_legacy_c(self):
        # Brief 076 D1: overlay-qualified port filename
        # (`func_ov<NNN>_<addr>.legacy.c`). 29 of brief 075
        # wave-1's pool used this shape and were refused
        # pre-D1.
        result = parse_port_filename(
            Path("func_ov002_021b3c10.legacy.c"))
        self.assertEqual(result, (0x021b3c10, ".legacy"))

    def test_overlay_legacy_sp3_c(self):
        result = parse_port_filename(
            Path("func_ov002_021b3c10.legacy_sp3.c"))
        self.assertEqual(result, (0x021b3c10, ".legacy_sp3"))

    def test_overlay_with_three_digit(self):
        # Triple-digit overlay (ov023 = the highest overlay in
        # this game).
        result = parse_port_filename(
            Path("func_ov023_022bbcde.legacy.c"))
        self.assertEqual(result, (0x022bbcde, ".legacy"))

    def test_rejects_no_address(self):
        # `Fill32.legacy.c` is a renamed file — no EUR address to
        # cross-apply against. Tool refuses.
        self.assertIsNone(parse_port_filename(Path("Fill32.legacy.c")))

    def test_rejects_partial_addr(self):
        # 7-hex isn't a valid address.
        self.assertIsNone(parse_port_filename(Path("func_0200721.legacy.c")))

    def test_rejects_plain_c(self):
        # Brief 073 only applies to `.legacy.c` ports (the
        # cross-project pokediamond ports). EUR-baseline `.c`
        # files are out of scope.
        self.assertIsNone(parse_port_filename(Path("func_02007218.c")))

    def test_rejects_partial_overlay_form(self):
        # Brief 076 D1: must be `func_ov<digits>_<addr>` — not
        # `func_ov_<addr>` (missing overlay number).
        self.assertIsNone(parse_port_filename(
            Path("func_ov_021b3c10.legacy.c")))


# --------------------------------------------------------------------------- #
# Data ref extraction
# --------------------------------------------------------------------------- #


class TestFindDataRefsInPort(unittest.TestCase):
    def _make_port(self, content: str) -> Path:
        f = tempfile.NamedTemporaryFile(
            mode="w", suffix=".legacy.c", delete=False,
        )
        f.write(content)
        f.close()
        return Path(f.name)

    def test_single_data_ref(self):
        p = self._make_port(
            "extern int data_020c3f48;\n"
            "void func_02007218(void) { data_020c3f48++; }\n"
        )
        try:
            self.assertEqual(_find_data_refs_in_port(p), [0x020c3f48])
        finally:
            p.unlink()

    def test_multiple_unique_data_refs(self):
        p = self._make_port(
            "extern int data_020c3f48;\n"
            "extern int data_020c4000;\n"
            "void f(void) {\n"
            "    data_020c3f48 = data_020c4000 + data_020c3f48;\n"
            "}\n"
        )
        try:
            self.assertEqual(_find_data_refs_in_port(p),
                             [0x020c3f48, 0x020c4000])
        finally:
            p.unlink()

    def test_no_data_refs(self):
        p = self._make_port(
            "u32 func_02007218(void) { return 1; }\n"
        )
        try:
            self.assertEqual(_find_data_refs_in_port(p), [])
        finally:
            p.unlink()

    def test_partial_match_rejected(self):
        # `data_0200721` (7-hex) is not a valid data ref — the
        # word-boundary `\b` regex rejects it.
        p = self._make_port(
            "// some text data_0200721 not a ref\n"
            "extern int data_020c3f48;\n"
        )
        try:
            self.assertEqual(_find_data_refs_in_port(p),
                             [0x020c3f48])
        finally:
            p.unlink()


class TestDataRefRE(unittest.TestCase):
    """Direct regex pinning — the patten must stay strict."""

    def test_word_boundary_strict(self):
        # `\b` requires non-word→word transition. Inside an
        # identifier like `xdata_02007218`, the `x` is already a
        # word-char, so `\bdata_<addr>` doesn't fire mid-token.
        # Only the second (whitespace-separated) ref matches.
        matches = [m.group("addr") for m in
                   _DATA_REF_RE.finditer(
                       "xdata_02007218 data_020c3f48")]
        self.assertEqual(matches, ["020c3f48"])

    def test_address_format(self):
        # 8 hex digits required — case-insensitive.
        for ok in ("data_02007218", "data_DEADBEEF", "data_0203abcd"):
            m = _DATA_REF_RE.search(ok)
            self.assertIsNotNone(m, f"expected match: {ok}")

    def test_rejects_short_addr(self):
        # 7-hex doesn't match.
        self.assertIsNone(_DATA_REF_RE.search("data_0200721"))


# --------------------------------------------------------------------------- #
# Module → delinks.txt path
# --------------------------------------------------------------------------- #


class TestDelinksPathFor(unittest.TestCase):
    def test_main(self):
        p = _delinks_path_for("usa", "main")
        self.assertTrue(str(p).endswith("config/usa/arm9/delinks.txt"))

    def test_itcm(self):
        p = _delinks_path_for("usa", "itcm")
        self.assertTrue(str(p).endswith(
            "config/usa/arm9/itcm/delinks.txt"))

    def test_dtcm(self):
        p = _delinks_path_for("jpn", "dtcm")
        self.assertTrue(str(p).endswith(
            "config/jpn/arm9/dtcm/delinks.txt"))

    def test_overlay(self):
        p = _delinks_path_for("usa", "ov002")
        self.assertTrue(str(p).endswith(
            "config/usa/arm9/overlays/ov002/delinks.txt"))

    def test_high_overlay_padded(self):
        p = _delinks_path_for("usa", "ov12")
        # Per port_to_region's convention, single-digit overlays
        # pad to 3 digits in the path.
        self.assertTrue(str(p).endswith(
            "config/usa/arm9/overlays/ov012/delinks.txt"))

    def test_unknown_module_raises(self):
        with self.assertRaises(ValueError):
            _delinks_path_for("usa", "garbage")


# --------------------------------------------------------------------------- #
# CrossApplyPlan dataclass
# --------------------------------------------------------------------------- #


class TestCrossApplyPlanShape(unittest.TestCase):
    def test_minimal_plan_no_data_renames(self):
        plan = CrossApplyPlan(
            port_file=Path("/x/libs/nitro/func_02007218.legacy.c"),
            eur_addr=0x02007218,
            eur_size=0x18,
            target_region="usa",
            target_addr=0x020071fc,
            target_old_name="func_020071fc",
            target_new_name="func_02007218",
            target_module="main",
            delinks_path=Path("/x/config/usa/arm9/delinks.txt"),
        )
        self.assertEqual(plan.data_renames, ())

    def test_plan_with_data_renames(self):
        plan = CrossApplyPlan(
            port_file=Path("/x/libs/nitro/func_02007218.legacy.c"),
            eur_addr=0x02007218,
            eur_size=0x18,
            target_region="usa",
            target_addr=0x020071fc,
            target_old_name="func_020071fc",
            target_new_name="func_02007218",
            target_module="main",
            delinks_path=Path("/x/config/usa/arm9/delinks.txt"),
            data_renames=(
                ("data_020c3e68", "data_020c3f48"),
            ),
        )
        self.assertEqual(len(plan.data_renames), 1)
        old, new = plan.data_renames[0]
        self.assertEqual(old, "data_020c3e68")
        self.assertEqual(new, "data_020c3f48")


# --------------------------------------------------------------------------- #
# Brief 076 D2 — strict raw-bytes + reloc-parity fallback
# --------------------------------------------------------------------------- #


class _MockFunc:
    """Stand-in for `find_region_siblings.Function` for the
    pure-function reloc-parity tests. Mirrors the dataclass
    fields we read."""

    def __init__(self, addr: int, size: int, module: str,
                 reloc_sig: tuple):
        self.addr = addr
        self.size = size
        self.module = module
        self.reloc_sig = reloc_sig


class TestRelocParity(unittest.TestCase):
    """Brief 076 D2: strict reloc-sig tuple equality. EUR + cand
    must agree on (offset, kind, to_module) for every reloc entry.
    Catches the BL-offset-divergence trap that pure byte-similarity
    misses."""

    def test_identical_relocs_pass(self):
        eur = _MockFunc(0x02000000, 0x20, "main",
                        ((4, "call", "main"),
                         (8, "data", "main")))
        cand = _MockFunc(0x02100000, 0x20, "main",
                         ((4, "call", "main"),
                          (8, "data", "main")))
        self.assertTrue(_reloc_parity(eur, cand))

    def test_different_offset_fails(self):
        eur = _MockFunc(0x02000000, 0x20, "main",
                        ((4, "call", "main"),))
        cand = _MockFunc(0x02100000, 0x20, "main",
                         ((8, "call", "main"),))  # different offset
        self.assertFalse(_reloc_parity(eur, cand))

    def test_different_kind_fails(self):
        eur = _MockFunc(0x02000000, 0x20, "main",
                        ((4, "call", "main"),))
        cand = _MockFunc(0x02100000, 0x20, "main",
                         ((4, "data", "main"),))  # different kind
        self.assertFalse(_reloc_parity(eur, cand))

    def test_different_to_module_fails(self):
        # Different downstream call target module — catches the
        # BL-offset-divergence trap.
        eur = _MockFunc(0x02000000, 0x20, "main",
                        ((4, "call", "main"),))
        cand = _MockFunc(0x02100000, 0x20, "main",
                         ((4, "call", "ov002"),))  # different target
        self.assertFalse(_reloc_parity(eur, cand))

    def test_different_count_fails(self):
        eur = _MockFunc(0x02000000, 0x20, "main",
                        ((4, "call", "main"),))
        cand = _MockFunc(0x02100000, 0x20, "main",
                         ((4, "call", "main"),
                          (8, "data", "main")))  # extra reloc
        self.assertFalse(_reloc_parity(eur, cand))

    def test_both_empty_pass(self):
        # No relocs on either side — trivially parity. The
        # downstream caller (strict raw-bytes) catches the
        # genuine-byte-divergence case, so reloc parity is fine
        # here.
        eur = _MockFunc(0x02000000, 0x10, "main", ())
        cand = _MockFunc(0x02100000, 0x10, "main", ())
        self.assertTrue(_reloc_parity(eur, cand))


if __name__ == "__main__":
    unittest.main()
