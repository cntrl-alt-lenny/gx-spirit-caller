"""Unit tests for tools/gen_prototypes.py's signature parser.

The whole point of this tool is that a wrong prototype is a landmine
(PR #1327 shipped 59/102 sampled conflicts against matched bodies) — these
tests pin the parser against the specific shapes seen in this codebase's
real matched functions, plus the false-positive shapes it must reject.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from gen_prototypes import parse_function_definitions  # noqa: E402


def _names(funcs):
    return {f["name"] for f in funcs}


def _by_name(funcs, name):
    return next(f for f in funcs if f["name"] == name)


class TestParseFunctionDefinitions(unittest.TestCase):
    def test_simple_int_function(self):
        funcs = parse_function_definitions(
            "int func_0201a0e0(int arg0) {\n"
            "    return arg0 + 1;\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), {"func_0201a0e0"})
        f = _by_name(funcs, "func_0201a0e0")
        self.assertEqual(f["return_type"], "int")
        self.assertFalse(f["is_void_return"])
        self.assertEqual(f["params"], ["int"])

    def test_void_return_and_void_params(self):
        funcs = parse_function_definitions(
            "void func_X(void) {\n"
            "    data_Y = 0;\n"
            "}\n"
        )
        f = _by_name(funcs, "func_X")
        self.assertTrue(f["is_void_return"])
        self.assertEqual(f["params"], [])

    def test_extern_declaration_is_not_a_definition(self):
        funcs = parse_function_definitions(
            "extern int func_helper(int a, int b);\n"
            "\n"
            "int func_main(int x) {\n"
            "    return func_helper(x, 1);\n"
            "}\n"
        )
        # Only the real definition counts — the extern must not appear.
        self.assertEqual(_names(funcs), {"func_main"})

    def test_multiple_functions_in_one_file(self):
        funcs = parse_function_definitions(
            "void func_ov005_021b0b28(void) {}\n"
            "void func_ov005_021b0b2c(void) {}\n"
        )
        self.assertEqual(_names(funcs), {"func_ov005_021b0b28", "func_ov005_021b0b2c"})

    def test_asm_qualifier_stripped_from_return_type(self):
        funcs = parse_function_definitions(
            "asm void func_0208b0fc(void) {\n"
            "    nofralloc\n"
            "    str r2, [r0, #0]\n"
            "    bx lr\n"
            "}\n"
        )
        f = _by_name(funcs, "func_0208b0fc")
        self.assertTrue(f["is_void_return"])
        self.assertEqual(f["params"], [])

    def test_pointer_param_normalized_to_void_star(self):
        funcs = parse_function_definitions(
            "int func_ov002_02296f54(struct S *self) {\n"
            "    return 0;\n"
            "}\n"
        )
        f = _by_name(funcs, "func_ov002_02296f54")
        self.assertEqual(f["params"], ["void *"])

    def test_pointer_return_normalized_to_void_star(self):
        funcs = parse_function_definitions(
            "state_021a18b8_t *func_020820f8(void) {\n"
            "    return 0;\n"
            "}\n"
        )
        f = _by_name(funcs, "func_020820f8")
        self.assertEqual(f["return_type"], "void *")
        self.assertFalse(f["is_void_return"])

    def test_scalar_types_kept_verbatim_not_normalized(self):
        funcs = parse_function_definitions(
            "unsigned int func_02011a7c(int idx) {\n"
            "    return 0;\n"
            "}\n"
        )
        f = _by_name(funcs, "func_02011a7c")
        self.assertEqual(f["return_type"], "unsigned int")
        self.assertEqual(f["params"], ["int"])

    def test_mixed_pointer_and_scalar_params(self):
        funcs = parse_function_definitions(
            "int func_02064d88(T_02064d88 *p, unsigned int divisor) {\n"
            "    return 0;\n"
            "}\n"
        )
        f = _by_name(funcs, "func_02064d88")
        self.assertEqual(f["params"], ["void *", "unsigned int"])

    def test_does_not_match_nested_control_flow(self):
        # A real function body containing if/while/for at non-zero
        # indentation must not itself be mistaken for a definition.
        funcs = parse_function_definitions(
            "int func_X(int a) {\n"
            "    if (a > 0) {\n"
            "        while (a > 0) {\n"
            "            a--;\n"
            "        }\n"
            "    }\n"
            "    return a;\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), {"func_X"})

    def test_function_pointer_parameter_is_skipped_not_guessed(self):
        # Too complex to parse safely (nested parens) — must be skipped
        # entirely, not emitted with a wrong/truncated param list.
        funcs = parse_function_definitions(
            "void func_X(void (*callback)(int), int a) {\n"
            "    callback(a);\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), set())

    def test_unrecognized_macro_return_type_is_skipped(self):
        funcs = parse_function_definitions(
            "MY_WEIRD_MACRO(int) func_X(void) {\n"
            "    return 0;\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), set())

    def test_comments_stripped_before_parsing(self):
        funcs = parse_function_definitions(
            "/* extern int func_fake_in_comment(int a); */\n"
            "// int also_fake(void) { return 1; }\n"
            "int func_real(void) {\n"
            "    return 1;\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), {"func_real"})

    def test_typedef_struct_before_function_not_mismatched(self):
        # The struct's own member lines (e.g. `int field0;`) must not be
        # mistaken for a zero-arg-looking definition.
        funcs = parse_function_definitions(
            "typedef struct {\n"
            "    int field0;\n"
            "    unsigned short field4;\n"
            "} Q_X;\n"
            "\n"
            "int func_X(Q_X *q) {\n"
            "    return q->field0;\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), {"func_X"})

    def test_long_long_and_fixed_width_return_types(self):
        funcs = parse_function_definitions(
            "long long func_A(void) { return 0; }\n"
            "u32 func_B(void) { return 0; }\n"
            "BOOL func_C(void) { return 1; }\n"
        )
        self.assertEqual(_by_name(funcs, "func_A")["return_type"], "long long")
        self.assertEqual(_by_name(funcs, "func_B")["return_type"], "u32")
        self.assertEqual(_by_name(funcs, "func_C")["return_type"], "BOOL")


if __name__ == "__main__":
    unittest.main()
