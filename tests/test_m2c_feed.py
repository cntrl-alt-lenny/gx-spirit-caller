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

import json
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from m2c_feed import (  # noqa: E402
    FeedError,
    FeedResult,
    FewshotExample,
    M2CMissing,
    build_context,
    find_core_header,
    format_fewshot_block,
    main,
    render,
    resolve_symbol,
    retrieve_fewshot,
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


class TestFormatFewshotBlock(unittest.TestCase):
    """brief 604 --fewshot: pure formatter, no subprocess/filesystem."""

    def test_empty_examples_yields_empty_string(self):
        self.assertEqual(format_fewshot_block([]), "")

    def test_every_line_is_comment_prefixed(self):
        ex = FewshotExample("func_ov002_deadbeef", "ov002", 0xdeadbeef,
                            "int func_ov002_deadbeef(void) {\n    return 1;\n}\n")
        block = format_fewshot_block([ex])
        for line in block.rstrip("\n").split("\n"):
            self.assertTrue(line.startswith("//"), f"non-comment line: {line!r}")

    def test_survives_source_with_its_own_block_comment(self):
        # brief 604 gotcha: a wrapping `/* ... */` block breaks the moment
        # the retrieved source has its own `/* header */` comment (C/GAS
        # comments don't nest) -- the source's own `*/` would close the
        # wrapper early and the rest becomes live, mis-parsed code. Confirm
        # the shipped formatter (per-line `//`) has no such delimiter to
        # break, by asserting every line survives as a comment even when
        # the source is stuffed with `/* */` pairs and a stray bare `*/`.
        ex = FewshotExample("func_x", "ov000", 0x1000,
                            "/* header */\nint func_x(void) {\n"
                            "    /* nested-looking */ return 1; /* trailing */\n"
                            "}\n*/\n")
        block = format_fewshot_block([ex])
        lines = block.rstrip("\n").split("\n")
        self.assertTrue(all(line.startswith("//") for line in lines))
        self.assertIn("// */", lines)

    def test_numbers_multiple_examples_in_order(self):
        examples = [
            FewshotExample("func_a", "ov001", 0x1000, "void func_a(void) {}\n"),
            FewshotExample("func_b", "ov001", 0x2000, "void func_b(void) {}\n"),
        ]
        block = format_fewshot_block(examples)
        self.assertIn("[1/2] func_a", block)
        self.assertIn("[2/2] func_b", block)
        self.assertLess(block.index("func_a"), block.index("func_b"))

    def test_blank_source_lines_become_bare_comment_marker(self):
        ex = FewshotExample("func_x", "main", 0x02000000, "int x;\n\nint y;\n")
        block = format_fewshot_block([ex])
        self.assertIn("\n//\n", block)


class TestRetrieveFewshot(unittest.TestCase):
    """brief 604 --fewshot: corpus lookup + BM25 query, subprocess mocked."""

    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.corpus_path = self.root / "corpus.jsonl"
        self.c_dir = self.root / "src"
        self.c_dir.mkdir()

    def _write_corpus(self, rows):
        with self.corpus_path.open("w") as f:
            for row in rows:
                f.write(json.dumps(row) + "\n")

    def _write_c(self, relpath, content):
        p = self.root / relpath
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(content)
        return relpath

    def test_top_k_ranked_by_similarity_and_reads_c_source(self):
        near = self._write_c("src/near.c", "int near(void) { return 1; }\n")
        far = self._write_c("src/far.c", "int far(void) { return 2; }\n")
        self._write_corpus([
            {"name": "func_near", "module": "ov001", "addr": 0x1000,
             "c_path": near, "mnemonics": "push mov bl ldr ldr ldr pop"},
            # shares only "pop" with the query -- a real (if weak) BM25
            # candidate, not a zero-overlap doc BM25's postings-union
            # candidate generation would drop before ranking even starts.
            {"name": "func_far", "module": "ov001", "addr": 0x2000,
             "c_path": far, "mnemonics": "swi mrs mcr pop"},
        ])
        # target disassembles to the SAME shape as func_near
        disasm_stub = (
            "00000000 <func_target>:\n"
            "   0:\te92d4008 \tpush\t{r3, lr}\n"
            "   4:\te1a00000 \tmov\tr0, r0\n"
            "   8:\teb000000 \tbl\t0 <helper>\n"
            "   c:\te5900000 \tldr\tr0, [r0]\n"
            "  10:\te5900000 \tldr\tr0, [r0]\n"
            "  14:\te5900000 \tldr\tr0, [r0]\n"
            "  18:\te8bd8008 \tpop\t{r3, pc}\n"
        )
        with mock.patch("m2c_feed.subprocess.run") as run:
            run.return_value = mock.Mock(stdout=disasm_stub)
            with mock.patch("m2c_feed.ROOT", self.root):
                results = retrieve_fewshot("eur", "some.o", "func_target", k=2,
                                           corpus_path=self.corpus_path)
        self.assertEqual([r.name for r in results], ["func_near", "func_far"])
        self.assertIn("return 1", results[0].c_source)

    def test_excludes_self_by_name(self):
        own = self._write_c("src/own.c", "int func_target(void) { return 0; }\n")
        self._write_corpus([
            {"name": "func_target", "module": "ov001", "addr": 0x1000,
             "c_path": own, "mnemonics": "push pop"},
        ])
        with mock.patch("m2c_feed.subprocess.run") as run:
            run.return_value = mock.Mock(
                stdout="00000000 <func_target>:\n   0:\te92d4008 \tpush\t{r3, lr}\n")
            with mock.patch("m2c_feed.ROOT", self.root):
                results = retrieve_fewshot("eur", "some.o", "func_target", k=5,
                                           corpus_path=self.corpus_path)
        self.assertEqual(results, [])

    def test_missing_corpus_raises_feed_error(self):
        with self.assertRaises(FeedError):
            retrieve_fewshot("eur", "some.o", "func_target", k=3,
                             corpus_path=self.root / "does-not-exist.jsonl")

    def test_missing_c_source_file_is_skipped_not_fatal(self):
        self._write_corpus([
            {"name": "func_ghost", "module": "ov001", "addr": 0x1000,
             "c_path": "src/does-not-exist.c", "mnemonics": "push pop"},
        ])
        with mock.patch("m2c_feed.subprocess.run") as run:
            run.return_value = mock.Mock(
                stdout="00000000 <func_target>:\n   0:\te92d4008 \tpush\t{r3, lr}\n")
            with mock.patch("m2c_feed.ROOT", self.root):
                results = retrieve_fewshot("eur", "some.o", "func_target", k=3,
                                           corpus_path=self.corpus_path)
        self.assertEqual(results, [])

    def test_empty_disassembly_raises_feed_error(self):
        self._write_corpus([{"name": "func_a", "module": "ov001", "addr": 0x1000,
                             "c_path": "src/a.c", "mnemonics": "push pop"}])
        with mock.patch("m2c_feed.subprocess.run") as run:
            run.return_value = mock.Mock(stdout="")
            with self.assertRaises(FeedError):
                retrieve_fewshot("eur", "some.o", "func_target", k=3,
                                 corpus_path=self.corpus_path)


class TestCliFewshotWiring(unittest.TestCase):
    def test_fewshot_prepends_block_to_output(self):
        canned = FeedResult(".text\n\tbx lr\n", "func_02012345", "main", "some.o")
        example = FewshotExample("func_sibling", "main", 0x02000100,
                                 "void func_sibling(void) {}\n")
        with mock.patch("m2c_feed.feed", return_value=canned), \
                mock.patch("m2c_feed.retrieve_fewshot", return_value=[example]) as rf, \
                tempfile.TemporaryDirectory() as td:
            out = Path(td) / "out.s"
            rc = main(["--version", "eur", "func_02012345",
                      "--fewshot", "3", "-o", str(out)])
            self.assertEqual(rc, 0)
            rf.assert_called_once()
            self.assertEqual(rf.call_args.args[3], 3)  # k positional
            text = out.read_text()
        self.assertIn("func_sibling", text)
        self.assertIn("bx lr", text)
        self.assertLess(text.index("func_sibling"), text.index("bx lr"),
                        "few-shot context must be prepended, not appended")

    def test_fewshot_zero_is_a_noop(self):
        canned = FeedResult(".text\n\tbx lr\n", "func_02012345", "main", "some.o")
        with mock.patch("m2c_feed.feed", return_value=canned), \
                mock.patch("m2c_feed.retrieve_fewshot") as rf:
            rc = main(["--version", "eur", "func_02012345"])
        self.assertEqual(rc, 0)
        rf.assert_not_called()


if __name__ == "__main__":
    unittest.main()
