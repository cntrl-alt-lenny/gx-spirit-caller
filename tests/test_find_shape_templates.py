"""Unit tests for tools/find_shape_templates.py.

The tool ranks matched functions by opcode-sequence similarity to an
unmatched target. A regression that silently mis-classifies opcodes
or mis-sorts the candidate list would derail the brief-020-style
multi-shape templating workflow. Pinning:

  - condition-code stripping (`movle` → `mov`, `blle` → `bl`)
  - asm-line opcode extraction (instructions vs labels vs directives)
  - parse_asm_file collects multiple function blocks
  - parse_asm_tree maps src/<dir>/ paths to module short keys
  - parse_asm_tree maps `_dsd_gap@<module>_NN.s` to the right module
  - levenshtein basic distances
  - shape_similarity edge cases
  - rank_candidates: same-size first, then ordering, then top-N cap
  - rank_candidates: skips self / un-matched / cross-mode
  - JSON round-trip preserves opcode order
  - Brief-020 regression: bit-getter clones surface as similarity 1.00
"""

from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import ModuleData, Symbol  # noqa: E402
from find_shape_templates import (  # noqa: E402
    DEFAULT_TOP,
    FunctionAsm,
    ShapeMatch,
    _line_opcode,
    _module_from_asm_path,
    _strip_condition,
    levenshtein,
    parse_asm_file,
    parse_asm_tree,
    rank_candidates,
    render_json,
    render_text,
    shape_similarity,
)


def _func(module: str, addr: int, *, size: int = 0x14, mode: str = "arm",
          name: str | None = None) -> Symbol:
    if name is None:
        name = f"func_{addr:08x}"
    return Symbol(name=name, module=module, addr=addr, size=size,
                  type="function", mode=mode)


def _module(name: str, syms: list[Symbol]) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(syms)
    md.by_addr = {s.addr: s for s in syms}
    md.by_addr_sorted = sorted(syms, key=lambda s: s.addr)
    return md


class TestStripCondition(unittest.TestCase):
    def test_known_base_passes_through(self):
        for op in ("mov", "ldr", "ldrsh", "bx", "bl", "stmia", "smull"):
            self.assertEqual(_strip_condition(op), op)

    def test_strip_simple_cond(self):
        self.assertEqual(_strip_condition("movle"), "mov")
        self.assertEqual(_strip_condition("popne"), "pop")
        self.assertEqual(_strip_condition("ldrne"), "ldr")
        self.assertEqual(_strip_condition("addge"), "add")
        self.assertEqual(_strip_condition("bxlt"), "bx")

    def test_longest_base_wins(self):
        # "blle" is "bl" + "le" — must NOT collapse to "b".
        self.assertEqual(_strip_condition("blle"), "bl")
        self.assertEqual(_strip_condition("bleq"), "bl")

    def test_ldrsh_h_is_part_of_base_not_cond(self):
        # "ldrsh" ends in "sh" which is NOT a cond suffix. Must stay
        # as "ldrsh".
        self.assertEqual(_strip_condition("ldrsh"), "ldrsh")
        # And cond on top still works.
        self.assertEqual(_strip_condition("ldrsheq"), "ldrsh")

    def test_strip_flag_set_only(self):
        # `adds` (set flags). Strip "s" leaves a known base.
        self.assertEqual(_strip_condition("adds"), "add")
        self.assertEqual(_strip_condition("subs"), "sub")
        self.assertEqual(_strip_condition("movs"), "mov")

    def test_unknown_falls_through(self):
        self.assertEqual(_strip_condition("vfma"), "vfma")
        self.assertEqual(_strip_condition("weirdop"), "weirdop")

    def test_case_insensitive(self):
        self.assertEqual(_strip_condition("MOVLE"), "mov")
        self.assertEqual(_strip_condition("LDR"), "ldr")


class TestLineOpcode(unittest.TestCase):
    def test_instruction_line(self):
        self.assertEqual(_line_opcode("    mov r0, #0x1"), "mov")
        self.assertEqual(_line_opcode("    ldrne r1, [r0, #0x4]"), "ldr")

    def test_skips_blank(self):
        self.assertIsNone(_line_opcode(""))
        self.assertIsNone(_line_opcode("   "))

    def test_skips_comment(self):
        self.assertIsNone(_line_opcode("    ; this is a comment"))
        self.assertIsNone(_line_opcode("    // also a comment"))

    def test_skips_directive(self):
        self.assertIsNone(_line_opcode("    .syntax unified"))
        self.assertIsNone(_line_opcode("    .word data_02103d74"))
        self.assertIsNone(_line_opcode("    .global func_foo"))

    def test_skips_local_label(self):
        self.assertIsNone(_line_opcode(".L_021b7cf8:"))
        self.assertIsNone(_line_opcode("func_foo:"))

    def test_skips_macro_pseudo_op(self):
        self.assertIsNone(_line_opcode("    arm_func_start func_foo"))
        self.assertIsNone(_line_opcode("    thumb_func_end bar"))


class TestParseAsmFile(unittest.TestCase):
    SAMPLE = """\
    .syntax unified
    .include "macros/function.inc"

    .text
    .global func_021c81a4
    arm_func_start func_021c81a4
func_021c81a4: ; 0x021c81a4
    str r1, [r0, #0x54]
    str r2, [r0, #0x58]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0x5c]
    str r1, [r0, #0x60]
    mov r0, #0x1
    bx lr
    arm_func_end func_021c81a4

    .global func_021c81c0
    arm_func_start func_021c81c0
func_021c81c0: ; 0x021c81c0
    ldr r0, .L_021c81d8
    mov r1, #0x0
    str r1, [r0, #0x0]
    bxle lr
    bl func_other
.L_021c81d8: .word data_021c0000
    arm_func_end func_021c81c0
"""

    def setUp(self):
        self.tmp = tempfile.NamedTemporaryFile(
            mode="w", suffix=".s", delete=False, encoding="utf-8",
        )
        self.tmp.write(self.SAMPLE)
        self.tmp.close()
        self.path = Path(self.tmp.name)

    def tearDown(self):
        self.path.unlink(missing_ok=True)

    def test_two_functions_extracted(self):
        fns = parse_asm_file(self.path, module="ov006")
        self.assertEqual(len(fns), 2)
        self.assertEqual(fns[0].name, "func_021c81a4")
        self.assertEqual(fns[0].addr, 0x021c81a4)
        self.assertEqual(fns[0].mode, "arm")
        self.assertEqual(fns[0].opcodes,
                         ("str", "str", "ldr", "str", "str", "mov", "bx"))
        self.assertEqual(fns[1].name, "func_021c81c0")
        self.assertEqual(fns[1].addr, 0x021c81c0)
        self.assertEqual(fns[1].opcodes,
                         ("ldr", "mov", "str", "bx", "bl"))

    def test_module_is_tagged(self):
        fns = parse_asm_file(self.path, module="ov006")
        for fn in fns:
            self.assertEqual(fn.module, "ov006")

    def test_pool_word_skipped(self):
        # `.L_021c81d8: .word data_021c0000` is two non-instructions:
        # a local label and a directive. They MUST NOT count as ops.
        fns = parse_asm_file(self.path, module="ov006")
        # 2nd function's instruction count: ldr, mov, str, bxle, bl = 5
        self.assertEqual(len(fns[1].opcodes), 5)


class TestModuleFromAsmPath(unittest.TestCase):
    def setUp(self):
        self.tmp_root = Path(tempfile.mkdtemp())

    def tearDown(self):
        import shutil
        shutil.rmtree(self.tmp_root)

    def _make(self, rel: str) -> Path:
        full = self.tmp_root / rel
        full.parent.mkdir(parents=True, exist_ok=True)
        full.write_text("")
        return full

    def test_main_src_dir(self):
        p = self._make("src/main/CpuSet.s")
        self.assertEqual(_module_from_asm_path(p, self.tmp_root), "main")

    def test_overlay_src_dir(self):
        p = self._make("src/overlay005/ov005_021b1000.s")
        self.assertEqual(_module_from_asm_path(p, self.tmp_root), "ov005")

    def test_overlay_padding(self):
        p = self._make("src/overlay023/file.s")
        self.assertEqual(_module_from_asm_path(p, self.tmp_root), "ov023")

    def test_itcm_dtcm(self):
        p = self._make("src/itcm/something.s")
        self.assertEqual(_module_from_asm_path(p, self.tmp_root), "itcm")
        p = self._make("src/dtcm/something.s")
        self.assertEqual(_module_from_asm_path(p, self.tmp_root), "dtcm")

    def test_dsd_gap_files(self):
        p = self._make("_dsd_gap@main_25.s")
        self.assertEqual(_module_from_asm_path(p, self.tmp_root), "main")
        p = self._make("_dsd_gap@ov006_11.s")
        self.assertEqual(_module_from_asm_path(p, self.tmp_root), "ov006")

    def test_unknown_returns_none(self):
        p = self._make("random/file.s")
        self.assertIsNone(_module_from_asm_path(p, self.tmp_root))


class TestParseAsmTree(unittest.TestCase):
    def test_walks_tree(self):
        tmp = Path(tempfile.mkdtemp())
        try:
            (tmp / "src" / "main").mkdir(parents=True)
            (tmp / "src" / "main" / "Foo.s").write_text(
                "    arm_func_start Foo\n"
                "Foo: ; 0x02000004\n"
                "    mov r0, #0x0\n"
                "    bx lr\n"
                "    arm_func_end Foo\n"
            )
            (tmp / "_dsd_gap@ov006_1.s").write_text(
                "    arm_func_start gap_fn\n"
                "gap_fn: ; 0x021b0000\n"
                "    nop\n"
                "    arm_func_end gap_fn\n"
            )
            corpus = parse_asm_tree(tmp)
            self.assertIn(("main", 0x02000004), corpus)
            self.assertIn(("ov006", 0x021b0000), corpus)
            foo = corpus[("main", 0x02000004)]
            self.assertEqual(foo.opcodes, ("mov", "bx"))
            self.assertEqual(foo.module, "main")
        finally:
            import shutil
            shutil.rmtree(tmp)


class TestLevenshtein(unittest.TestCase):
    def test_identical(self):
        self.assertEqual(levenshtein(("a", "b", "c"), ("a", "b", "c")), 0)

    def test_empty_either(self):
        self.assertEqual(levenshtein((), ("a",)), 1)
        self.assertEqual(levenshtein(("a", "b"), ()), 2)
        self.assertEqual(levenshtein((), ()), 0)

    def test_one_substitution(self):
        self.assertEqual(levenshtein(("a", "b", "c"), ("a", "x", "c")), 1)

    def test_one_deletion(self):
        self.assertEqual(levenshtein(("a", "b", "c"), ("a", "c")), 1)

    def test_full_disjoint_same_length(self):
        self.assertEqual(levenshtein(("a", "b", "c"), ("x", "y", "z")), 3)


class TestShapeSimilarity(unittest.TestCase):
    def test_identical(self):
        self.assertEqual(shape_similarity(("a", "b"), ("a", "b")), 1.0)

    def test_both_empty(self):
        self.assertEqual(shape_similarity((), ()), 1.0)

    def test_full_disjoint(self):
        self.assertEqual(
            shape_similarity(("a", "b", "c"), ("x", "y", "z")), 0.0,
        )

    def test_partial(self):
        sim = shape_similarity(("a", "b", "c", "d"), ("a", "x", "c", "d"))
        self.assertAlmostEqual(sim, 0.75)


def _asm(module: str, addr: int, opcodes: tuple[str, ...],
         *, mode: str = "arm", src_path: str = "") -> FunctionAsm:
    return FunctionAsm(
        name=f"func_{addr:08x}", module=module, addr=addr,
        mode=mode, opcodes=opcodes,
        src_path=src_path or f"src/{module}/{addr:08x}.s",
    )


class TestRankCandidates(unittest.TestCase):
    def setUp(self):
        # Target: 5-instruction shape `ldr ldr lsl lsr bx`
        self.target = _asm("main", 0x02000000, ("ldr", "ldr", "lsl", "lsr", "bx"))
        self.target_size = 0x14
        self.target_module = "main"
        # Three corpus members:
        #   exact-match (similarity 1.0, same size)
        #   close-match (similarity 0.8, same size)
        #   different-size, exact-match shape
        #   different-mode (thumb), should be filtered
        self.corpus = {
            ("main", 0x02000100): _asm(
                "main", 0x02000100, ("ldr", "ldr", "lsl", "lsr", "bx")),
            ("main", 0x02000200): _asm(
                "main", 0x02000200, ("ldr", "ldr", "lsl", "and", "bx")),
            ("ov005", 0x021b0000): _asm(
                "ov005", 0x021b0000, ("ldr", "ldr", "lsl", "lsr", "bx")),
            ("main", 0x02000300): _asm(
                "main", 0x02000300, ("ldr", "ldr", "lsl", "lsr", "bx"),
                mode="thumb"),
        }
        # Symbols backing the candidates so size lookup works.
        self.modules = {
            "main": _module("main", [
                _func("main", 0x02000100, size=0x14),
                _func("main", 0x02000200, size=0x14),
                _func("main", 0x02000300, size=0x14, mode="thumb"),
            ]),
            "ov005": _module("ov005", [
                _func("ov005", 0x021b0000, size=0x18),
            ]),
        }
        # All four candidates are inside `complete` TUs.
        self.matched = {
            "main": [(0x02000100, 0x02000204),
                     (0x02000300, 0x02000400)],
            "ov005": [(0x021b0000, 0x021b1000)],
        }

    def test_default_returns_same_size_only(self):
        results = rank_candidates(
            self.target, self.target_size, self.target_module,
            self.corpus, self.modules, self.matched,
            top=5, all_sizes=False,
        )
        names = [m.candidate.name for m in results]
        # ov005's exact-match clone is dropped (size mismatch).
        # main's thumb clone is dropped (mode mismatch).
        self.assertEqual(names, ["func_02000100", "func_02000200"])
        self.assertAlmostEqual(results[0].similarity, 1.0)
        self.assertAlmostEqual(results[1].similarity, 0.8)

    def test_all_sizes_includes_other_size(self):
        results = rank_candidates(
            self.target, self.target_size, self.target_module,
            self.corpus, self.modules, self.matched,
            top=5, all_sizes=True,
        )
        names = [m.candidate.name for m in results]
        # The 1.0-similarity same-size match comes first (same_size
        # tiebreak); then the 1.0 different-size; then the 0.8 same.
        self.assertEqual(names[0], "func_02000100")
        self.assertEqual(names[1], "func_021b0000")
        self.assertEqual(names[2], "func_02000200")

    def test_skips_self(self):
        # Add the target itself to the corpus + matched-set.
        self.corpus[("main", 0x02000000)] = self.target
        self.matched["main"].append((0x02000000, 0x02000014))
        self.modules["main"].symbols.append(_func("main", 0x02000000))
        self.modules["main"].by_addr[0x02000000] = (
            self.modules["main"].symbols[-1]
        )
        results = rank_candidates(
            self.target, self.target_size, self.target_module,
            self.corpus, self.modules, self.matched,
            top=5, all_sizes=True,
        )
        # The self-match at addr 0x02000000 must NOT appear.
        for m in results:
            self.assertNotEqual(
                (m.candidate.module, m.candidate.addr),
                (self.target_module, self.target.addr),
            )

    def test_skips_unmatched(self):
        # Drop everything from the matched-set: should return []
        results = rank_candidates(
            self.target, self.target_size, self.target_module,
            self.corpus, self.modules, {},
            top=5,
        )
        self.assertEqual(results, [])

    def test_top_n_cap(self):
        # Add 30 same-size 1.0-similarity duplicates.
        big_corpus = dict(self.corpus)
        big_matched = {
            k: list(v) for k, v in self.matched.items()
        }
        big_modules = {
            k: ModuleData(
                name=v.name, symbols=list(v.symbols),
                by_addr=dict(v.by_addr),
                by_addr_sorted=list(v.by_addr_sorted),
            )
            for k, v in self.modules.items()
        }
        for i in range(30):
            addr = 0x02010000 + i * 0x20
            big_corpus[("main", addr)] = _asm(
                "main", addr, ("ldr", "ldr", "lsl", "lsr", "bx"))
            big_matched["main"].append((addr, addr + 0x14))
            big_modules["main"].symbols.append(_func("main", addr))
            big_modules["main"].by_addr[addr] = (
                big_modules["main"].symbols[-1]
            )
        results = rank_candidates(
            self.target, self.target_size, self.target_module,
            big_corpus, big_modules, big_matched,
            top=5,
        )
        self.assertEqual(len(results), 5)


class TestRender(unittest.TestCase):
    def test_json_round_trip(self):
        target = _asm("main", 0x02000000, ("mov", "bx"))
        cand = _asm("main", 0x02000100, ("mov", "bx"))
        results = [ShapeMatch(
            candidate=cand, candidate_size=0x10,
            similarity=1.0, same_size=True,
        )]
        out = render_json(target, target_size=0x10, results=results)
        parsed = json.loads(out)
        self.assertEqual(parsed["target"]["name"], "func_02000000")
        self.assertEqual(parsed["target"]["module"], "main")
        self.assertEqual(parsed["target"]["size"], 16)
        self.assertEqual(len(parsed["candidates"]), 1)
        self.assertEqual(parsed["candidates"][0]["similarity"], 1.0)
        self.assertEqual(parsed["candidates"][0]["opcodes"],
                         ["mov", "bx"])

    def test_text_renders_all_sections(self):
        target = _asm("main", 0x02000000, ("mov", "bx"))
        cand = _asm("ov005", 0x021b0000, ("mov", "bx"))
        results = [ShapeMatch(
            candidate=cand, candidate_size=0x14,
            similarity=0.875, same_size=False,
        )]
        out = render_text(
            target, target_module="main", target_size=0x10,
            results=results, all_sizes=True,
        )
        self.assertIn("target: func_02000000", out)
        self.assertIn("size 0x14", out)  # candidate's size shown
        self.assertIn("similarity 0.88", out)
        self.assertIn("mov bx", out)


class TestBriefTwentyRegression(unittest.TestCase):
    """Brief 020 regression: bit-getter shape clones surface at 1.00.

    Brief 020 anchor was `func_02006164` (a 5-instruction bit-getter:
    `ldr ldr lsl lsr bx`). The brief shipped 20 byte-identical clones
    at 87% yield by per-shape templating. The tool should surface
    clones of that exact shape as similarity 1.00 same-size when a
    decomper points it at any matched member of the cluster.

    This test pins the behaviour with synthetic data — no dsd dis
    invocation, so it runs fast and offline.
    """

    def test_bit_getter_clones_score_1_0(self):
        target = _asm("main", 0x02006164, ("ldr", "ldr", "lsl", "lsr", "bx"))
        clones = {
            ("main", 0x0200617c): _asm(
                "main", 0x0200617c, ("ldr", "ldr", "lsl", "lsr", "bx")),
            ("main", 0x02006194): _asm(
                "main", 0x02006194, ("ldr", "ldr", "lsl", "lsr", "bx")),
            ("ov000", 0x021ace6c): _asm(
                "ov000", 0x021ace6c, ("ldr", "ldr", "lsl", "lsr", "bx")),
            # An unrelated 0x14-byte shape that mwcc emits commonly:
            ("main", 0x02006100): _asm(
                "main", 0x02006100, ("push", "bl", "mov", "pop", "bx")),
        }
        modules = {
            "main": _module("main", [
                _func("main", 0x0200617c, size=0x14),
                _func("main", 0x02006194, size=0x14),
                _func("main", 0x02006100, size=0x14),
            ]),
            "ov000": _module("ov000", [
                _func("ov000", 0x021ace6c, size=0x14),
            ]),
        }
        matched = {
            "main": [(0x02006100, 0x02006200)],
            "ov000": [(0x021ace00, 0x021ad000)],
        }
        results = rank_candidates(
            target, 0x14, "main", clones, modules, matched,
            top=DEFAULT_TOP,
        )
        # Top three are the bit-getter clones, similarity 1.00.
        self.assertEqual(len(results), 4)
        for m in results[:3]:
            self.assertAlmostEqual(m.similarity, 1.0)
            self.assertEqual(m.candidate.opcodes,
                             ("ldr", "ldr", "lsl", "lsr", "bx"))
        # The 4th match is the unrelated shape, lower similarity.
        self.assertLess(results[3].similarity, 0.5)


if __name__ == "__main__":
    unittest.main()
