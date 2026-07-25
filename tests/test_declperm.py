"""Tests for tools/declperm.py (q-khdays-toolkit port).

Ported from khdays-decomp (CC0-1.0) -- see
docs/research/data/khdays-callsite-arity-report-2026-07-25.md for the
attribution note. The declaration-block detection (`find_leading_decls`,
`find_function_body_start`) is pure text analysis and tested directly
here, no toolchain needed. `run_sweep`'s real compile+compare path is
exercised separately -- see the memory/writeup for the real end-to-end
smoke test against a genuine gap object (needs the EUR toolchain, not
appropriate for the always-run pytest suite).
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import declperm as dp  # noqa: E402


class FindFunctionBodyStart(unittest.TestCase):
    def test_finds_simple_definition(self):
        lines = [
            "int func_X(int a) {\n",
            "    int b;\n",
            "    return a;\n",
            "}\n",
        ]
        self.assertEqual(dp.find_function_body_start(lines, "func_X"), 1)

    def test_brace_on_its_own_line(self):
        lines = [
            "int func_X(int a)\n",
            "{\n",
            "    int b;\n",
            "}\n",
        ]
        self.assertEqual(dp.find_function_body_start(lines, "func_X"), 2)

    def test_missing_function_returns_none(self):
        lines = ["int other(void) {\n", "}\n"]
        self.assertIsNone(dp.find_function_body_start(lines, "func_X"))

    def test_does_not_match_prefix_of_another_name(self):
        # func_X2's definition must not be mistaken for func_X's.
        lines = ["int func_X2(void) {\n", "}\n"]
        self.assertIsNone(dp.find_function_body_start(lines, "func_X"))


class FindLeadingDecls(unittest.TestCase):
    def test_bare_declarations_only(self):
        lines = [
            "int func_X(void) {\n",
            "    int a;\n",
            "    int b;\n",
            "    return a + b;\n",
            "}\n",
        ]
        decls, inits, tail_start = dp.find_leading_decls(lines, 1)
        self.assertEqual(len(decls), 2)
        self.assertEqual(inits, [])
        self.assertEqual(lines[tail_start], "    return a + b;\n")

    def test_initialized_declaration_is_split(self):
        lines = [
            "int func_X(void) {\n",
            "    int a = 1;\n",
            "    int b = 2;\n",
            "    return a + b;\n",
            "}\n",
        ]
        decls, inits, tail_start = dp.find_leading_decls(lines, 1)
        self.assertEqual(decls, ["    int a;\n", "    int b;\n"])
        self.assertEqual(inits, ["    a = 1;\n", "    b = 2;\n"])
        self.assertEqual(lines[tail_start], "    return a + b;\n")

    def test_stops_at_control_flow_even_with_assignment_shape(self):
        # A line that LOOKS like "TYPE NAME = value;" but is actually a
        # control-flow statement must not be swallowed into the block.
        lines = [
            "int func_X(void) {\n",
            "    int a;\n",
            "    if (a) return 1;\n",
            "}\n",
        ]
        decls, inits, tail_start = dp.find_leading_decls(lines, 1)
        self.assertEqual(len(decls), 1)
        self.assertEqual(lines[tail_start], "    if (a) return 1;\n")

    def test_pointer_declaration(self):
        lines = [
            "void func_X(void) {\n",
            "    char *p;\n",
            "    int n;\n",
            "    (void)p; (void)n;\n",
            "}\n",
        ]
        decls, _inits, _tail = dp.find_leading_decls(lines, 1)
        self.assertEqual(decls, ["    char *p;\n", "    int n;\n"])

    def test_return_of_a_bare_local_not_mistaken_for_a_declaration(self):
        # Regression test for a real bug found while porting: khdays'
        # original bare-declaration regex has no notion of C keywords, so
        # "return a;" parses exactly as validly as a declaration (TYPE=
        # "return", NAME="a") -- khdays' own control-flow guard was only
        # ever applied to the WITH-initializer branch, leaving this
        # extremely common `{ int a; int b; return a; }` shape exposed.
        # Fixed in this port by applying the same guard to both branches.
        lines = [
            "int func_X(void) {\n",
            "    int a;\n",
            "    return a;\n",
            "}\n",
        ]
        decls, _inits, tail_start = dp.find_leading_decls(lines, 1)
        self.assertEqual(len(decls), 1)  # caller enforces the >=2 requirement
        self.assertEqual(lines[tail_start], "    return a;\n")

    def test_return_of_expression_not_mistaken_for_a_declaration(self):
        lines = [
            "int func_X(void) {\n",
            "    int a;\n",
            "    int b;\n",
            "    return a + b;\n",
            "}\n",
        ]
        decls, _inits, tail_start = dp.find_leading_decls(lines, 1)
        self.assertEqual(len(decls), 2)
        self.assertEqual(lines[tail_start], "    return a + b;\n")


class RenderDeclOrder(unittest.TestCase):
    def test_renders_in_permutation_order(self):
        decls = ["    int a;\n", "    int b;\n"]
        self.assertEqual(dp.render_decl_order(decls, (1, 0)), "int b; int a;")


if __name__ == "__main__":
    unittest.main()
