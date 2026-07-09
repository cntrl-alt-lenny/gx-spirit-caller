"""Tests for tools/m2c_feed.py — the m2c cold-RE feeder (brief 274).

Three parts:
  - `render()` is the pure objdump→GAS parser; unit-tested on fixtures
    (no objdump binary needed), incl. the failure modes the brief
    requires (empty input fails LOUDLY, not silently).
  - `resolve_symbol()` runs against the committed `config/eur` so the
    name / ambiguous-address / unknown paths are covered end-to-end.
  - `find_core_header()` / `build_context()` / `run_m2c()` (brief 555,
    `--context`) — header lookup is pure and always tested; the m2ctx.py
    (gcc) and vendored-m2c integration tests are real (not mocked) but
    guarded to skip where their external dependency is unavailable, so
    the suite stays green on a host without `tools/m2c_bootstrap.py` run.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from m2c_feed import (  # noqa: E402
    FeedError,
    FeedResult,
    M2CMissing,
    build_context,
    find_core_header,
    main,
    render,
    resolve_symbol,
    run_m2c,
)

# A realistic `objdump -d -r` slice (tabs matter — match objdump's layout).
ARM_LINES = [
    "00000000 <func_test>:",
    "   0:\te92d4008 \tpush\t{r3, lr}",
    "   4:\teb000000 \tbl\t0 <helper>",
    "\t\t\t4: R_ARM_PC24\thelper-0x8",
    "   8:\te59f0010 \tldr\tr0, [pc, #16]\t@ 20 <.L_data>",
    "   c:\te5900000 \tldr\tr0, [r0]",
    "  10:\te3500000 \tcmp\tr0, #0",
    "  14:\t0a000000 \tbeq\t1c <.L_after>",
    "  18:\te8bd8008 \tpop\t{r3, pc}",
    "0000001c <.L_after>:",
    "  1c:\te1a00000 \tnop",
    "00000020 <.L_data>:",
    "  20:\t00000000                                ....",
    "\t\t\t20: R_ARM_ABS32\tg_global",
]

THUMB_LINES = [
    "00000002 <func_t>:",
    "   2:\tb510      \tpush\t{r4, lr}",
    "   4:\t2000      \tmovs\tr0, #0",
    "   6:\tbd10      \tpop\t{r4, pc}",
]


class TestRenderArm(unittest.TestCase):
    def setUp(self):
        self.s = render(ARM_LINES, "func_test", thumb=False)

    def test_arm_header(self):
        self.assertIn(".text", self.s)
        self.assertIn("\t.align 2", self.s)
        self.assertIn("\t.globl func_test", self.s)
        self.assertIn("func_test:", self.s)
        self.assertNotIn(".syntax unified", self.s)

    def test_strips_address_hex_and_comments(self):
        self.assertIn("\tpush\t{r3, lr}", self.s)
        self.assertNotIn("e92d4008", self.s)       # hex column stripped
        self.assertNotIn("@", self.s)               # @ comments stripped
        self.assertNotIn("R_ARM", self.s)           # reloc lines stripped

    def test_bl_target_rewritten_to_label(self):
        self.assertIn("\tbl\thelper", self.s)       # `bl 0 <helper>` → `bl helper`

    def test_pc_load_resolved_to_equals_symbol(self):
        # `ldr r0, [pc, #16] @ 1c <.L_data>` → `ldr r0, =g_global`
        self.assertIn("ldr r0, =g_global", self.s)
        self.assertNotIn("[pc", self.s)

    def test_code_label_kept_data_label_folded(self):
        self.assertIn(".L_after:", self.s)          # code label survives
        self.assertNotIn(".L_data:", self.s)        # data pool label folded into =sym

    def test_size_directive(self):
        self.assertIn("\t.size func_test, .-func_test", self.s)


class TestRenderThumb(unittest.TestCase):
    def test_thumb_markers(self):
        s = render(THUMB_LINES, "func_t", thumb=True)
        self.assertIn("\t.syntax unified", s)
        self.assertIn("\t.code 16", s)
        self.assertIn("\t.thumb_func", s)
        self.assertIn("\tpush\t{r4, lr}", s)


class TestRenderFailsLoudly(unittest.TestCase):
    def test_func_absent_raises(self):
        # the requested func is not a header in the dump → loud, not silent
        with self.assertRaises(FeedError):
            render(ARM_LINES, "func_missing", thumb=False)

    def test_empty_function_raises(self):
        # header present but zero instructions (data-only) → loud
        lines = ["00000000 <func_empty>:", "00000004 <func_next>:", "   4:\te1a00000 \tnop"]
        with self.assertRaises(FeedError):
            render(lines, "func_empty", thumb=False)

    def test_truly_empty_input_raises(self):
        with self.assertRaises(FeedError):
            render([], "func_test", thumb=False)


class TestResolveSymbol(unittest.TestCase):
    """Against the committed config/eur."""

    def test_resolve_by_name(self):
        info = resolve_symbol("eur", "func_ov002_021aa4a0")
        self.assertEqual(info["module"], "ov002")
        self.assertEqual(info["isa"], "arm")
        self.assertEqual(info["addr"], 0x021AA4A0)

    def test_ambiguous_address_fails_loudly(self):
        # 0x021aa4a0 is shared by overlapping overlays → must NOT silently pick one
        with self.assertRaises(FeedError) as ctx:
            resolve_symbol("eur", "0x021aa4a0")
        self.assertIn("ambiguous", str(ctx.exception))

    def test_address_disambiguated_by_module(self):
        info = resolve_symbol("eur", "0x021aa4a0", module_hint="ov002")
        self.assertEqual(info["name"], "func_ov002_021aa4a0")

    def test_unknown_target_raises(self):
        with self.assertRaises(FeedError):
            resolve_symbol("eur", "func_ov002_deadbeef")

    def test_non_hex_non_name_raises(self):
        with self.assertRaises(FeedError):
            resolve_symbol("eur", "notahexnoraname")


class TestFindCoreHeader(unittest.TestCase):
    """Against the committed src/ tree (brief 555)."""

    def test_eur_is_unprefixed(self):
        h = find_core_header("eur", "ov002")
        self.assertIsNotNone(h)
        self.assertTrue(h.is_file())
        self.assertEqual(h.name, "ov002_core.h")
        self.assertNotIn("/usa/", str(h))
        self.assertNotIn("/jpn/", str(h))

    def test_usa_and_jpn_are_region_prefixed(self):
        for region in ("usa", "jpn"):
            h = find_core_header(region, "ov002")
            self.assertIsNotNone(h)
            self.assertTrue(h.is_file())
            self.assertIn(f"/{region}/", str(h))

    def test_main_has_no_core_header(self):
        # arm9 has no consolidated header — too heterogeneous (brief 555
        # scope note); callers must proceed context-less, not crash.
        self.assertIsNone(find_core_header("eur", "main"))

    def test_nonexistent_overlay_returns_none(self):
        self.assertIsNone(find_core_header("eur", "ov999"))


class TestBuildContext(unittest.TestCase):
    """Real m2ctx.py + gcc integration against the committed ov002_core.h."""

    def test_main_module_short_circuits_without_gcc(self):
        # No header for `main` -> None immediately, no m2ctx/gcc subprocess.
        self.assertIsNone(build_context("eur", "main"))

    def test_ov002_context_carries_struct_and_extern_decls(self):
        ctx_path = build_context("eur", "ov002")
        self.assertIsNotNone(ctx_path)
        self.assertTrue(ctx_path.is_file())
        text = ctx_path.read_text()
        # A representative type + a [shipped]-tagged extern from
        # ov002_core.h — proves the header's OWN content made it through
        # m2ctx's include-only-extraction trick, not just its includes.
        self.assertIn("struct Ov002Self", text)
        self.assertIn("data_ov002_022cd744", text)
        self.assertIn("func_ov002_0229ade0", text)


class TestRunM2C(unittest.TestCase):
    def test_missing_vendor_raises_m2cmissing(self):
        with mock.patch("m2c_feed.M2C_VENDOR", Path("/no/such/m2c.py")):
            with self.assertRaises(M2CMissing):
                run_m2c("func_x", ".text\n", None)

    @unittest.skipUnless(
        (Path(__file__).resolve().parent.parent / "tools/_vendor/m2c/m2c.py").is_file(),
        "m2c not vendored — run tools/m2c_bootstrap.py first",
    )
    def test_context_yields_named_field_not_raw_cast(self):
        # The brief-555 demo function: func_ov002_021ae400 reads
        # data_ov002_022cd744[a] and calls func_ov002_0229ade0, both
        # declared in ov002_core.h.
        s_text = render([
            "00000000 <func_ov002_021ae400>:",
            "   0:\te92d4008 \tpush\t{r3, lr}",
            "   4:\te59f3018 \tldr\tr3, [pc, #24]\t@ 20 <.L_data>",
            "   8:\te1a02001 \tmov\tr2, r1",
            "   c:\te7930100 \tldr\tr0, [r3, r0, lsl #2]",
            "  10:\te3500000 \tcmp\tr0, #0",
            "  14:\t18bd8008 \tpopne\t{r3, pc}",
            "  18:\te3a01000 \tmov\tr1, #0",
            "  1c:\te1a03001 \tmov\tr3, r1",
            "  20:\te3a00031 \tmov\tr0, #49",
            "  24:\teb000000 \tbl\t0 <func_ov002_0229ade0>",
            "\t\t\t24: R_ARM_PC24\tfunc_ov002_0229ade0-0x8",
            "  28:\te8bd8008 \tpop\t{r3, pc}",
            "0000002c <.L_data>:",
            "  2c:\t00000000                                ....",
            "\t\t\t2c: R_ARM_ABS32\tdata_ov002_022cd744",
        ], "func_ov002_021ae400", thumb=False)

        without = run_m2c("func_ov002_021ae400", s_text, None)
        self.assertIn("?", without)  # unknown types, no context

        ctx_path = build_context("eur", "ov002")
        with_ctx = run_m2c("func_ov002_021ae400", s_text, ctx_path)
        self.assertIn("data_ov002_022cd744[a]", with_ctx)  # named field, not *(&sym + …)
        self.assertNotIn("?", with_ctx)


class TestCliExitCodes(unittest.TestCase):
    def test_unknown_func_exit_1(self):
        rc = main(["--version", "eur", "func_ov002_deadbeef"])
        self.assertEqual(rc, 1)

    def test_missing_objdump_exit_2(self):
        rc = main(["--version", "eur", "func_ov002_021aa4a0",
                   "--objdump", "/no/such/objdump-binary-xyz"])
        self.assertEqual(rc, 2)

    def test_bad_target_exit_1(self):
        rc = main(["--version", "eur", "notahexnoraname"])
        self.assertEqual(rc, 1)

    def test_m2c_missing_vendor_exit_2(self):
        # feed() itself needs a real build/ delink tree (baserom-gated, not
        # committed) to resolve a target — mock it so this exercises just
        # main()'s --m2c wiring: M2CMissing -> exit 2, independent of build/.
        canned = FeedResult(".text\n\tbx lr\n", "func_ov002_deadbeef", "ov002")
        with mock.patch("m2c_feed.feed", return_value=canned), \
                mock.patch("m2c_feed.M2C_VENDOR", Path("/no/such/m2c.py")):
            rc = main(["--version", "eur", "--m2c", "func_ov002_deadbeef"])
        self.assertEqual(rc, 2)

    def test_context_warns_not_fails_when_module_has_no_header(self):
        # main has no *_core.h -> --context should warn and still succeed,
        # not crash the whole invocation.
        canned = FeedResult(".text\n\tbx lr\n", "func_02012345", "main")
        with mock.patch("m2c_feed.feed", return_value=canned), \
                mock.patch("m2c_feed.run_m2c", return_value="void func_02012345(void) {}\n"):
            rc = main(["--version", "eur", "--m2c", "--context", "func_02012345"])
        self.assertEqual(rc, 0)


if __name__ == "__main__":
    unittest.main()
