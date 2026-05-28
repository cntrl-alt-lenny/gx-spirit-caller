"""Unit tests for tools/c42_family_hunter.py (brief 251).

The family classifier is pure: given a function's disasm body it
produces a canonical signature, and structurally-identical bodies
(up to register allocation, relocation targets, and immediates) hash
into the same family. Tests use synthetic `dsd dis` asm fixtures and
in-memory cohorts so they never touch `dsd`, the baserom, or the
toolchain — matching the rest of the suite (stdlib unittest).
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from c42_family_hunter import (  # noqa: E402
    Family,
    FunctionBody,
    _is_instruction,
    _sym_name,
    build_cohort,
    canonical_signature,
    canonicalize_line,
    extract_bodies,
    load_wall_picks,
    parse_asm_bodies,
    signature_hash,
)


class TestCanonicalizeLine(unittest.TestCase):
    """Each value class (register, symbol, label, immediate) abstracts
    to its placeholder while opcodes + operand structure survive."""

    def test_low_registers(self):
        self.assertEqual(canonicalize_line("mov r0, r1"), "mov R, R")
        self.assertEqual(canonicalize_line("add r9, r8, r7"), "add R, R, R")

    def test_high_registers_collapse_whole(self):
        # r10-r12 must collapse without leaving a stray digit.
        self.assertEqual(canonicalize_line("mov r10, r12"), "mov R, R")
        self.assertEqual(canonicalize_line("ldr r11, [r10]"), "ldr R, [R]")

    def test_special_registers(self):
        self.assertEqual(canonicalize_line("push {r3, lr}"), "push {R, LR}")
        self.assertEqual(canonicalize_line("bx lr"), "bx LR")
        self.assertEqual(canonicalize_line("mov pc, lr"), "mov PC, LR")
        self.assertEqual(canonicalize_line("mov ip, sp"), "mov R, SP")
        self.assertEqual(
            canonicalize_line("sub sp, sp, #0xc"), "sub SP, SP, #IMM")

    def test_branch_and_data_symbols(self):
        self.assertEqual(canonicalize_line("bl func_ov006_021b3804"), "bl FUNC")
        self.assertEqual(canonicalize_line("bl func_0201ed3c"), "bl FUNC")
        self.assertEqual(
            canonicalize_line("ldr r0, data_ov010_021b8ce4"), "ldr R, DATA")

    def test_local_labels(self):
        self.assertEqual(canonicalize_line("beq .L_02091858"), "beq L")
        self.assertEqual(canonicalize_line("b .L_02091848"), "b L")
        self.assertEqual(canonicalize_line("ldr r2, .L_020918c8"), "ldr R, L")

    def test_immediates_hex_and_decimal(self):
        self.assertEqual(canonicalize_line("cmp r0, #0x3"), "cmp R, #IMM")
        self.assertEqual(canonicalize_line("mov r0, #1"), "mov R, #IMM")
        self.assertEqual(canonicalize_line("mov r0, #26"), "mov R, #IMM")
        self.assertEqual(
            canonicalize_line("ldrh r3, [r0, #0x10]"), "ldrh R, [R, #IMM]")

    def test_shifted_operand(self):
        self.assertEqual(
            canonicalize_line("orr r0, r0, r1, lsl #0x9"),
            "orr R, R, R, lsl #IMM",
        )

    def test_named_helper_preserved(self):
        # Real named symbols are NOT abstracted — siblings calling the
        # same named helper still cluster; different helpers split.
        self.assertEqual(
            canonicalize_line("bl OS_DisableIrq"), "bl OS_DisableIrq")


class TestSignatureHashing(unittest.TestCase):

    def test_signature_joins_lines(self):
        body = ["push {r3, lr}", "bl func_0201ed3c", "pop {r3, pc}"]
        self.assertEqual(
            canonical_signature(body),
            "push {R, LR}\nbl FUNC\npop {R, PC}",
        )

    def test_hash_is_stable_12_hex(self):
        h = signature_hash("push {R, LR}\nbl FUNC\npop {R, PC}")
        self.assertEqual(len(h), 12)
        self.assertTrue(all(c in "0123456789abcdef" for c in h))
        # Deterministic.
        self.assertEqual(
            h, signature_hash("push {R, LR}\nbl FUNC\npop {R, PC}"))

    def test_siblings_hash_equal(self):
        # Same structure; differ only in regs / symbols / immediates.
        a = ["push {r3, lr}", "ldrh r1, [r0, #0x10]", "cmp r1, #0x0",
             "bl func_ov006_021b3804", "pop {r3, pc}"]
        b = ["push {r4, lr}", "ldrh r2, [r3, #0x24]", "cmp r2, #0x1",
             "bl func_0201ed3c", "pop {r4, pc}"]
        self.assertEqual(
            signature_hash(canonical_signature(a)),
            signature_hash(canonical_signature(b)),
        )

    def test_different_opcodes_hash_differently(self):
        a = ["push {r3, lr}", "bl func_x", "pop {r3, pc}"]
        b = ["push {r3, lr}", "blx func_x", "pop {r3, pc}"]
        self.assertNotEqual(
            signature_hash(canonical_signature(a)),
            signature_hash(canonical_signature(b)),
        )


class TestIsInstruction(unittest.TestCase):

    def test_instruction_lines(self):
        for line in ("mov r0, r1", "ldr r4, [sp, #0x18]", "bl func_x",
                     "beq .L_0201"):
            self.assertTrue(_is_instruction(line), line)

    def test_non_instruction_lines(self):
        for line in ("", ".word func_x", ".L_0201:", "func_0201ed3c:",
                     "arm_func_start func_x", "arm_func_end func_x",
                     "; comment", ".global foo", ".text", ".section .data"):
            self.assertFalse(_is_instruction(line), line)


# A two-function synthetic .s file in dsd-dis (--ual) shape.
_ASM_FIXTURE = """\
    .include "macros/function.inc"

    .text
    arm_func_start func_ov006_021b3218
func_ov006_021b3218: ; 0x021b3218
    push {r3, lr}
    bl func_ov006_021b1000
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_021b322c
    bl func_ov006_021b2000
.L_021b322c:
    mov r0, #0x1
    pop {r3, pc}
    .word func_ov006_021b1000
    arm_func_end func_ov006_021b3218

    arm_func_start func_ov006_021b3804
func_ov006_021b3804: ; 0x021b3804
    push {r3, lr}
    bl func_ov006_021b1500
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_021b3818
    bl func_ov006_021b2500
.L_021b3818:
    mov r0, #0x1
    pop {r3, pc}
    arm_func_end func_ov006_021b3804
"""


class TestParseAsmBodies(unittest.TestCase):

    def setUp(self):
        self._tmp = tempfile.TemporaryDirectory()
        self.path = Path(self._tmp.name) / "_dsd_gap@ov006_0.s"
        self.path.write_text(_ASM_FIXTURE, encoding="utf-8")

    def tearDown(self):
        self._tmp.cleanup()

    def test_finds_both_functions(self):
        fns = parse_asm_bodies(self.path, "ov006")
        self.assertEqual(len(fns), 2)
        self.assertEqual([f.addr for f in fns], [0x021b3218, 0x021b3804])
        self.assertEqual(fns[0].name, "func_ov006_021b3218")

    def test_body_excludes_labels_directives_and_pool(self):
        first = parse_asm_bodies(self.path, "ov006")[0]
        # 8 instruction lines; the `.L_` label, `.word`, and pseudo-ops
        # are dropped.
        self.assertEqual(first.body, [
            "push {r3, lr}",
            "bl func_ov006_021b1000",
            "ldr r0, [r0, #0x8]",
            "cmp r0, #0x0",
            "beq .L_021b322c",
            "bl func_ov006_021b2000",
            "mov r0, #0x1",
            "pop {r3, pc}",
        ])

    def test_two_functions_are_siblings(self):
        # The fixture's two functions differ only in branch targets and
        # label addresses → identical canonical signature.
        fns = parse_asm_bodies(self.path, "ov006")
        self.assertEqual(
            signature_hash(canonical_signature(fns[0].body)),
            signature_hash(canonical_signature(fns[1].body)),
        )

    def test_module_attached(self):
        for fn in parse_asm_bodies(self.path, "ov006"):
            self.assertEqual(fn.module, "ov006")


class TestExtractBodies(unittest.TestCase):

    def test_indexes_by_module_and_addr(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / "_dsd_gap@ov006_0.s").write_text(
                _ASM_FIXTURE, encoding="utf-8")
            bodies = extract_bodies(root)
        self.assertIn(("ov006", 0x021b3218), bodies)
        self.assertIn(("ov006", 0x021b3804), bodies)
        self.assertEqual(
            bodies[("ov006", 0x021b3218)].name, "func_ov006_021b3218")

    def test_skips_function_without_addr_comment(self):
        # A function block whose label lacks the `; 0x…` comment has
        # addr 0 and is dropped from the index.
        asm = (
            "    arm_func_start func_ov006_aaaa\n"
            "func_ov006_aaaa:\n"  # no addr comment
            "    push {r3, lr}\n"
            "    pop {r3, pc}\n"
            "    arm_func_end func_ov006_aaaa\n"
        )
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / "_dsd_gap@ov006_9.s").write_text(asm, encoding="utf-8")
            bodies = extract_bodies(root)
        self.assertEqual(bodies, {})


class TestLoadWallPicks(unittest.TestCase):

    def test_selects_only_requested_wall(self):
        import json
        data = {
            "main:0x02000100": [{"id": "C-42", "cue": "x"}],
            "ov006:0x021b3218": [{"id": "C-1"}, {"id": "C-42", "cue": "y"}],
            "ov002:0x021fa5e8": [{"id": "C-1", "cue": "z"}],
        }
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / "wall_predictions.json"
            p.write_text(json.dumps(data), encoding="utf-8")
            picks = load_wall_picks(p, "C-42")
        self.assertEqual(
            sorted(picks),
            [("main", 0x02000100), ("ov006", 0x021b3218)],
        )


def _sib(reg: str) -> list[str]:
    """A small sibling body, parameterized by a register so distinct
    callers still canonicalize identically."""
    return [f"push {{{reg}, lr}}", "bl func_x", "pop {r3, pc}"]


class TestBuildCohort(unittest.TestCase):

    def _bodies(self, mapping):
        return {
            (m, a): FunctionBody(name=_sym_name(m, a), module=m, addr=a,
                                 body=body)
            for (m, a), body in mapping.items()
        }

    def test_matched_picks_are_excluded(self):
        picks = [("main", 0x100), ("main", 0x200)]
        bodies = self._bodies({
            ("main", 0x100): _sib("r3"),
            ("main", 0x200): _sib("r4"),
        })
        matched = {"main": [(0x100, 0x104)]}  # 0x100 is matched
        report = build_cohort(picks, bodies, matched)
        self.assertEqual(report.matched, 1)
        self.assertEqual(report.unmatched, 1)
        self.assertEqual(report.clustered_picks, 1)

    def test_bodyless_pick_counted_missing(self):
        picks = [("main", 0x100), ("main", 0x300)]
        bodies = self._bodies({("main", 0x100): _sib("r3")})
        report = build_cohort(picks, bodies, {})
        self.assertEqual(report.body_missing, 1)
        self.assertEqual(report.clustered_picks, 1)

    def test_siblings_cluster_and_sort_by_size(self):
        picks = [("main", 0x100), ("ov006", 0x200), ("ov006", 0x300),
                 ("main", 0x400)]
        bodies = self._bodies({
            ("main", 0x100): _sib("r3"),         # family A
            ("ov006", 0x200): _sib("r4"),        # family A
            ("ov006", 0x300): _sib("r5"),        # family A
            ("main", 0x400): ["mov r0, #0x0", "bx lr"],  # family B (singleton)
        })
        report = build_cohort(picks, bodies, {})
        self.assertEqual(report.distinct_sigs, 2)
        # Largest family first.
        self.assertEqual(report.families[0].size, 3)
        self.assertEqual(report.families[1].size, 1)
        self.assertEqual(
            sorted(report.families[0].members),
            [("main", 0x100), ("ov006", 0x200), ("ov006", 0x300)],
        )

    def test_histogram(self):
        picks = [("main", 0x100), ("ov006", 0x200), ("main", 0x400)]
        bodies = self._bodies({
            ("main", 0x100): _sib("r3"),
            ("ov006", 0x200): _sib("r4"),
            ("main", 0x400): ["bx lr"],
        })
        report = build_cohort(picks, bodies, {})
        # one size-2 family (2 picks), one size-1 family (1 pick).
        self.assertEqual(report.histogram(), [(2, 1, 2), (1, 1, 1)])

    def test_exclude_seed_tags_owning_family(self):
        picks = [("main", 0x100), ("ov006", 0x200), ("main", 0x400)]
        bodies = self._bodies({
            ("main", 0x100): _sib("r3"),     # family A (size 2)
            ("ov006", 0x200): _sib("r4"),    # family A
            ("main", 0x400): ["bx lr"],      # family B
        })
        # Seed the family-A member → whole family A excluded.
        report = build_cohort(picks, bodies, {},
                              exclude_seeds=[("ov006", 0x200)])
        excluded = [f for f in report.families if f.excluded_by is not None]
        self.assertEqual(len(excluded), 1)
        self.assertEqual(excluded[0].size, 2)
        self.assertEqual(excluded[0].excluded_by, _sym_name("ov006", 0x200))
        # Worklist (min_size=2) skips the excluded family.
        self.assertEqual(report.worklist(min_size=2), [])

    def test_worklist_min_size_filters_singletons(self):
        picks = [("main", 0x100), ("ov006", 0x200), ("main", 0x400)]
        bodies = self._bodies({
            ("main", 0x100): _sib("r3"),
            ("ov006", 0x200): _sib("r4"),
            ("main", 0x400): ["bx lr"],
        })
        report = build_cohort(picks, bodies, {})
        self.assertEqual(len(report.worklist(min_size=1)), 2)
        self.assertEqual(len(report.worklist(min_size=2)), 1)


class TestFamilyToJson(unittest.TestCase):

    def test_to_json_shape(self):
        fam = Family(
            sig_hash="abc123def456",
            signature="push {R, LR}\nbx LR",
            members=[("ov006", 0x021b3218), ("main", 0x02000100)],
            body_len=2,
        )
        j = fam.to_json()
        self.assertEqual(j["sig_hash"], "abc123def456")
        self.assertEqual(j["size"], 2)
        self.assertEqual(j["body_len"], 2)
        self.assertIsNone(j["excluded_by"])
        self.assertEqual(
            j["members"][0],
            {"module": "ov006", "addr": "0x021b3218",
             "sym": "func_ov006_021b3218"},
        )
        self.assertEqual(
            j["members"][1]["sym"], "func_02000100")


if __name__ == "__main__":
    unittest.main()
