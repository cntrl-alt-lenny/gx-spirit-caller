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
    def test_typedef_text_in_a_literal_does_not_hide_real_prototype(self):
        # The old comment-only scrubber saw the string's `typedef` and
        # treated HeaderType as a file-local typedef, silently dropping the
        # real definition. The shared scrubber blanks literals too.
        funcs = parse_function_definitions(
            'const char *doc = "typedef int HeaderType;";\n'
            "int use(HeaderType value) { return 0; }\n"
        )
        self.assertEqual(_names(funcs), {"use"})

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

    def test_asm_qualified_function_is_excluded_not_kept(self):
        # q-prototypes-golive-fix: an earlier version of this parser just
        # stripped the `asm` qualifier and kept the function -- but an
        # asm body's written parameter list (almost always a placeholder
        # `(void)` in this codebase's own convention, confirmed against
        # 96 real matched functions including well-known multi-arg SDK
        # calls like Fill32/CpuSet) is not trustworthy arity evidence at
        # all, since the real args just land in registers the raw
        # instructions reference directly, invisible to this parser.
        # Excluded entirely now, regardless of what its param list says.
        funcs = parse_function_definitions(
            "asm void func_0208b0fc(void) {\n"
            "    nofralloc\n"
            "    str r2, [r0, #0]\n"
            "    bx lr\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), set())

    def test_asm_qualified_function_with_written_args_is_still_excluded(self):
        # Even when the asm body's signature LOOKS like real evidence
        # (non-void params), it's still untrustworthy -- exclude
        # unconditionally, don't try to judge case by case.
        funcs = parse_function_definitions(
            "asm void Fill32(u32 fillData, void *dest, u32 size) {\n"
            "    nofralloc\n"
            "    bx lr\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), set())

    def test_asm_exclusion_reported_in_skipped_dict(self):
        skipped: dict = {}
        parse_function_definitions(
            "asm void func_0208b0fc(void) {\n    bx lr\n}\n",
            skipped=skipped,
        )
        self.assertEqual(skipped.get("asm"), ["func_0208b0fc"])

    def test_byvalue_struct_param_is_excluded(self):
        # A by-value struct/union's ABI depends on its SIZE, unlike a
        # pointer (always 4 bytes) -- no void*-style normalization is
        # ABI-safe, so the whole function must be excluded, not just
        # that one parameter. Pins the real func_ov000_021aaa20 bug
        # shape (struct Ov000V3, defined only inside that one TU).
        skipped: dict = {}
        funcs = parse_function_definitions(
            "struct Ov000V3 { int x, y, z; };\n"
            "void func_ov000_021aaa20(struct Ov000V3 a, struct Ov000V3 b) {\n"
            "    (void)a; (void)b;\n"
            "}\n",
            skipped=skipped,
        )
        self.assertEqual(_names(funcs), set())
        self.assertEqual(skipped.get("byvalue_struct"), ["func_ov000_021aaa20"])

    def test_byvalue_struct_return_is_excluded(self):
        funcs = parse_function_definitions(
            "struct Point { int x, y; };\n"
            "struct Point func_X(void) {\n"
            "    struct Point p; return p;\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), set())

    def test_pointer_to_local_struct_is_not_excluded(self):
        # A POINTER to a by-value-unsafe struct type is still ABI-safe
        # to normalize to void* -- only genuine by-value passing is the
        # problem. Must not over-exclude.
        funcs = parse_function_definitions(
            "struct Ov000V3 { int x, y, z; };\n"
            "void func_X(struct Ov000V3 *p) {\n"
            "    (void)p;\n"
            "}\n"
        )
        f = _by_name(funcs, "func_X")
        self.assertEqual(f["params"], ["void *"])

    def test_local_typedef_funcptr_param_is_excluded(self):
        # Pins the real func_02032074 bug: a callback parameter typed via
        # a file-local function-pointer typedef has no literal "(" at
        # the parameter use site (it's hidden behind the typedef name),
        # so the existing "function-pointer parameter, too complex"
        # check (which looks for a literal "(" in the raw param text)
        # doesn't catch it -- confirmed via a real mwccarm pilot compile
        # of the generated header, which failed on exactly this shape
        # before this fix.
        skipped: dict = {}
        funcs = parse_function_definitions(
            "typedef void *(*alloc_02032074_t)(int size, int align);\n"
            "void func_02032074(void *p, alloc_02032074_t alloc, void *q) {\n"
            "    (void)p; (void)alloc; (void)q;\n"
            "}\n",
            skipped=skipped,
        )
        self.assertEqual(_names(funcs), set())
        self.assertEqual(skipped.get("local_typedef"), ["func_02032074"])

    def test_local_typedef_return_is_excluded(self):
        funcs = parse_function_definitions(
            "typedef int local_status_t;\n"
            "local_status_t func_X(void) {\n"
            "    return 0;\n"
            "}\n"
        )
        self.assertEqual(_names(funcs), set())

    def test_local_typedef_used_as_pointer_is_not_excluded(self):
        # Same non-over-exclusion principle as the struct-pointer case:
        # a POINTER to a locally-typedef'd type is still void*-safe.
        funcs = parse_function_definitions(
            "typedef struct { int x; } LocalT;\n"
            "void func_X(LocalT *p) {\n"
            "    (void)p;\n"
            "}\n"
        )
        f = _by_name(funcs, "func_X")
        self.assertEqual(f["params"], ["void *"])

    def test_local_typedef_exclusion_is_per_function_not_whole_file(self):
        # A file-local typedef existing SOMEWHERE in the TU must only
        # exclude the specific function(s) that actually use it as a
        # non-pointer type -- an unrelated function in the same file
        # must still be banked normally.
        skipped: dict = {}
        funcs = parse_function_definitions(
            "typedef void *(*cb_t)(int);\n"
            "void func_uses_it(cb_t callback) { (void)callback; }\n"
            "int func_unrelated(int x) { return x + 1; }\n",
            skipped=skipped,
        )
        self.assertEqual(_names(funcs), {"func_unrelated"})
        self.assertEqual(skipped.get("local_typedef"), ["func_uses_it"])

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
