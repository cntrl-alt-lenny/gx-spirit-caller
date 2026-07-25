"""Tests for tools/audit_callsite_arity.py (q-khdays-toolkit port).

Ported from khdays-decomp (CC0-1.0) -- see
docs/research/data/khdays-callsite-arity-report-2026-07-25.md for the
attribution note. Pure parsing (`split_args`, `call_sites`) is kept
close to the original and tested directly; `build_consensus`/`audit`
are this project's own re-targeting (delinks.txt `complete` TUs as the
matched-tree source, gen_prototypes.py's provenance JSON as the audit
target) and tested against synthetic fixtures.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import audit_callsite_arity as aca  # noqa: E402


class SplitArgs(unittest.TestCase):
    def test_empty(self):
        self.assertEqual(aca.split_args(""), [])
        self.assertEqual(aca.split_args("   "), [])

    def test_simple(self):
        self.assertEqual(aca.split_args("a, b, c"), ["a", "b", "c"])

    def test_nested_parens_not_split(self):
        self.assertEqual(aca.split_args("f(a, b), c"), ["f(a, b)", "c"])

    def test_nested_brackets_and_braces(self):
        self.assertEqual(aca.split_args("arr[i, j], x"), ["arr[i, j]", "x"])


class CallSites(unittest.TestCase):
    def test_simple_call(self):
        sites = list(aca.call_sites("int f(void) { return g(a, b, c); }"))
        self.assertIn(("g", 3), sites)

    def test_zero_arg_call(self):
        sites = list(aca.call_sites("void f(void) { g(); }"))
        self.assertIn(("g", 0), sites)

    def test_extern_declaration_not_a_call(self):
        # NOTE: the "is this near an extern" check is a fixed 90-CHARACTER
        # lookback (inherited from khdays' original, unchanged in this
        # port) -- a real call site within ~90 chars of an unrelated
        # extern for the SAME function is also suppressed as a known,
        # accepted false-negative risk. Padded well past that window here
        # so this test isolates "the extern's own parens aren't double-
        # counted as a call" without also tripping that known edge.
        # Comments are stripped to a single space BEFORE the lookback
        # check runs, so comment-shaped padding would collapse away and
        # defeat the point -- use real (non-comment) filler code instead
        # so it survives stripping and genuinely separates the two.
        text = (
            "extern int g(int a, int b);\n"
            + "int padding_var_00 = 0, padding_var_01 = 0, padding_var_02 = 0;\n" * 3
            + "void f(void) { g(1, 2); }"
        )
        sites = list(aca.call_sites(text))
        names = [n for n, _ in sites]
        self.assertEqual(names.count("g"), 1)

    def test_call_shortly_after_its_own_extern_is_a_known_false_negative(self):
        # Documents the inherited limitation directly: this IS a real
        # call, but it sits within the 90-char lookback of the extern
        # declaring the same name, so call_sites will NOT report it.
        # Not a regression to fix here -- a known, inherited heuristic
        # boundary, pinned so a future change to the window size is a
        # deliberate edit, not an accidental one.
        text = "extern int g(int a, int b);\nvoid f(void) { g(1, 2); }"
        sites = list(aca.call_sites(text))
        names = [n for n, _ in sites]
        self.assertNotIn("g", names)

    def test_function_definition_not_a_call(self):
        sites = list(aca.call_sites("int helper(int a, int b) {\n    return a + b;\n}\n"))
        self.assertEqual(sites, [])

    def test_comments_and_strings_stripped(self):
        text = '/* fake(1,2,3) */ void f(void) { g("literal(1,2)"); }'
        sites = list(aca.call_sites(text))
        names_and_counts = {(n, c) for n, c in sites}
        self.assertIn(("g", 1), names_and_counts)
        self.assertNotIn(("fake", 3), names_and_counts)

    def test_keyword_parens_ignored(self):
        sites = list(aca.call_sites("int f(int a) { if (a) return sizeof(a); }"))
        names = [n for n, _ in sites]
        self.assertNotIn("if", names)
        self.assertNotIn("sizeof", names)


class BuildConsensusAndAudit(unittest.TestCase):
    def _make_tree(self, tmp: str) -> Path:
        root = Path(tmp)
        (root / "config" / "eur" / "arm9").mkdir(parents=True)
        (root / "src" / "main").mkdir(parents=True)

        # Matched caller: calls target(a, b) with 2 args, 3 independent
        # sites (>= the confidence threshold).
        (root / "src/main/caller_a.c").write_text(
            "void caller_a(void) { target(1, 2); }\n"
            "void caller_b(void) { target(3, 4); }\n"
            "void caller_c(void) { target(5, 6); }\n",
            encoding="utf-8",
        )
        (root / "config/eur/arm9/delinks.txt").write_text(
            "src/main/caller_a.c:\n    complete\n    .text start:0x0 end:0x40\n",
            encoding="utf-8",
        )
        return root

    def test_consensus_counts_real_call_sites(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(aca, "ROOT", root), \
                 mock.patch.object(aca, "CONFIG_DIR", root / "config" / "eur" / "arm9"):
                consensus = aca.build_consensus()
        self.assertEqual(consensus["target"], {2: 3})

    def test_audit_flags_confident_contradiction(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(aca, "ROOT", root), \
                 mock.patch.object(aca, "CONFIG_DIR", root / "config" / "eur" / "arm9"):
                consensus = aca.build_consensus()
        # bank declares 0 args, tree confidently (3 sites) always uses 2.
        contradictions = aca.audit(consensus, {"target": 0})
        self.assertEqual(len(contradictions), 1)
        self.assertEqual(contradictions[0]["name"], "target")
        self.assertEqual(contradictions[0]["declared"], 0)
        self.assertEqual(contradictions[0]["tree_uses"], [2])
        self.assertEqual(contradictions[0]["site_count"], 3)

    def test_audit_does_not_flag_matching_declaration(self):
        consensus = {"target": {2: 3}}
        self.assertEqual(aca.audit(consensus, {"target": 2}), [])

    def test_audit_ignores_low_confidence(self):
        # Only 2 sites (< _MIN_CONFIDENT_SITES) -- not enough evidence
        # to call a mismatch a real contradiction.
        consensus = {"target": {2: 2}}
        self.assertEqual(aca.audit(consensus, {"target": 0}), [])

    def test_audit_ignores_undeclared_functions(self):
        consensus = {"target": {2: 3}}
        self.assertEqual(aca.audit(consensus, {"other_func": 0}), [])


if __name__ == "__main__":
    unittest.main()
