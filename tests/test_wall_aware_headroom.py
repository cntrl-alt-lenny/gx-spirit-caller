"""Tests for tools/wall_aware_headroom.py (brief 651 rework).

Brief 640 (docs/research/brief-640-wall-audit.md) found the previous
version's regex treated ANY `[CP]-\\d+` citation, and the blanket
GLOBAL_ASM/brief-294/302 cohort stamp, as confirmed-permanent evidence.
It is not: C-NN is the taxonomy's OWN "coercible with knowledge" bucket,
and the cohort stamp is a bulk stamp from a mechanical carving tool, not
per-function proof. These tests pin the corrected 4-way classification.
"""
from __future__ import annotations
import sys
import unittest
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))
import wall_aware_headroom as w  # noqa: E402


class ClassifyText(unittest.TestCase):
    def test_p_series_citation_is_permanent(self):
        c = w.classify_text("; P-16 dispatcher residue\n.text\n")
        self.assertEqual(c.kind, "permanent")
        self.assertEqual(c.codes, ["P-16"])

    def test_c_series_citation_is_coercible_not_permanent(self):
        # the core brief-651 fix: C-NN is a KNOWN LEVER, not a wall.
        c = w.classify_text("; func: C-34 candidate, pool-literal CSE\n.text\n")
        self.assertEqual(c.kind, "coercible")
        self.assertEqual(c.codes, ["C-34"])

    def test_cohort_stamp_alone_is_unknown_not_permanent(self):
        # the other core brief-651 fix: the asm_escape.py generate_whole()
        # boilerplate is a bulk stamp, not per-function evidence.
        body = (
            "; func_ov002_021aa4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):\n"
            "; the original disassembly emitted verbatim as a byte-exact mwasm TU.\n"
            "; For reg-alloc-walled functions with no C match (brief 294 endgame).\n"
            ".text\n"
        )
        c = w.classify_text(body)
        self.assertEqual(c.kind, "unknown")
        self.assertEqual(c.codes, [])

    def test_prose_wall_with_no_code_is_unknown_not_permanent(self):
        c = w.classify_text("; this is a genuine reg-alloc wall, no C match found\n.text\n")
        self.assertEqual(c.kind, "unknown")

    def test_plain_no_marker_is_no_marker(self):
        c = w.classify_text("; ordinary leaf accessor\n.text\nfunc:\n bx lr\n")
        self.assertEqual(c.kind, "no_marker")

    def test_coprocessor_register_names_not_mistaken_for_citation(self):
        # c0/p15 (no dash) are registers, not taxonomy cites.
        c = w.classify_text("; unconditional cache op\n.text\n mrc p15, 0, r0, c0, c0\n")
        # still correctly permanent -- but via the ISA-impossible instruction
        # check, NOT a false-positive taxonomy citation match.
        self.assertEqual(c.kind, "permanent")
        self.assertEqual(c.codes, [])  # no taxonomy code fired, just the mnemonic

    def test_unconditional_mcr_is_permanent(self):
        c = w.classify_text(".text\nfunc:\n mcr p15, 0, r0, c7, c10, 4\n bx lr\n")
        self.assertEqual(c.kind, "permanent")

    def test_unconditional_msr_is_permanent(self):
        c = w.classify_text(".text\nfunc:\n msr cpsr_c, r0\n bx lr\n")
        self.assertEqual(c.kind, "permanent")

    def test_conditional_mcr_is_not_isa_impossible(self):
        # asm_escape.py's _DATA_AS_CODE_RE (brief 488) established the
        # CONDITIONAL form is always disguised data in this game, never a
        # real privileged instruction -- must not trip the permanent check.
        c = w.classify_text(".text\nfunc:\n mcrls p15, 0, r0, c7, c10, 4\n bx lr\n")
        self.assertNotEqual(c.kind, "permanent")

    def test_conditional_svc_is_not_isa_impossible(self):
        c = w.classify_text(".text\nfunc:\n svclt 0x00bfc0c0\n bx lr\n")
        self.assertNotEqual(c.kind, "permanent")

    def test_isa_impossible_takes_priority_over_coercible_citation(self):
        body = "; C-34 candidate\n.text\nfunc:\n mrs r0, cpsr\n"
        c = w.classify_text(body)
        self.assertEqual(c.kind, "permanent")

    def test_p_citation_takes_priority_over_c_citation(self):
        # a file citing both (not currently observed, but should resolve
        # deterministically): permanent wins.
        c = w.classify_text("; see C-34 and P-11 both apply here\n.text\n")
        self.assertEqual(c.kind, "permanent")
        self.assertEqual(c.codes, ["P-11"])

    def test_multiple_c_codes_all_reported(self):
        c = w.classify_text("; stacks C-23 and C-34 (routing trilemma)\n.text\n")
        self.assertEqual(c.kind, "coercible")
        self.assertEqual(c.codes, ["C-23", "C-34"])


class ScanCandidateAccounting(unittest.TestCase):
    """candidate = coercible + unknown + no_marker (everything not permanent)."""

    def test_candidate_excludes_only_permanent(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "config").mkdir()
            (root / "src" / "main").mkdir(parents=True)
            delinks = root / "config" / "delinks.txt"
            files = {
                "src/main/permanent.s": "; P-1 permanent\n.text\n",
                "src/main/coercible.s": "; C-34 candidate\n.text\n",
                "src/main/unknown.s": "; GLOBAL_ASM endgame, brief 302\n.text\n",
                "src/main/plain.s": ".text\nfunc:\n bx lr\n",
            }
            delinks_lines = []
            for rel, body in files.items():
                p = root / rel
                p.write_text(body, encoding="utf-8")
                delinks_lines.append(f"{rel}:\n    complete\n")
            delinks.write_text("\n".join(delinks_lines), encoding="utf-8")

            with mock.patch.object(w, "ROOT", root):
                per = w.scan()

        d = per["main"]
        self.assertEqual(d["total"], 4)
        self.assertEqual(d["permanent"], 1)
        self.assertEqual(d["coercible"], 1)
        self.assertEqual(d["unknown"], 1)
        self.assertEqual(d["no_marker"], 1)
        self.assertEqual(d["candidate"], 3)  # everything except permanent
        self.assertEqual(d["coercible_files"], [{"path": "src/main/coercible.s", "codes": ["C-34"]}])
        self.assertEqual(d["unknown_files"], ["src/main/unknown.s"])
        self.assertEqual(d["no_marker_files"], ["src/main/plain.s"])

    def test_json_module_backward_compat_keys(self):
        d = w._new_module_entry()
        d["total"] = 1
        d["no_marker"] = 1
        d["candidate"] = 1
        d["no_marker_files"] = ["src/main/x.s"]
        out = w._json_module(d)
        self.assertEqual(out["convertible"], 1)
        self.assertEqual(out["convertible_files"], ["src/main/x.s"])


if __name__ == "__main__":
    unittest.main()
