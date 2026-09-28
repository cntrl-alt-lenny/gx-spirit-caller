"""Tests for tools/check_fake_matches.py: every rule fails on a known-bad
input, honest asm-C and ordinary C stay clean, and the baseline ratchets."""

from __future__ import annotations

import contextlib
import io
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import check_fake_matches as cfm  # noqa: E402

BAD = {
    "raw-data-directive": (
        "asm void func_02000000(void) {\n"
        "    nofralloc\n"
        "    dcd 0xe92d4010\n"
        "    .word 0xe8bd8010\n"
        "}\n"
    ),
    "section-override": (
        "__declspec(section \".text\") const unsigned int func_02000000[] = {0xe12fff1e};\n"
    ),
    "data-in-pragma-section": (
        "#pragma define_section INIT \".init\" abs32 RX\n"
        "#pragma section INIT begin\n"
        "const unsigned int fake_words[2] = { 0xe92d4010, 0xe8bd8010 };\n"
        "#pragma section INIT end\n"
    ),
    "register-pin": (
        "int f(int a) {\n"
        "    register int x asm(\"r4\") = a;\n"
        "    return x;\n"
        "}\n"
    ),
    "do-while-zero": (
        "void f(int *p) {\n"
        "    do { p[0] = 1; p[1] = 2; } while (0);\n"
        "}\n"
    ),
    "volatile-local": (
        "void f(int *p) {\n"
        "    volatile int spill;\n"
        "    spill = *p;\n"
        "}\n"
    ),
}

CLEAN = (
    "/* A comment may say dcd 0x1234 or asm void fake() or do {} while (0). */\n"
    "#define SAFE(x) do { (x) = 0; } while (0)\n"
    "typedef struct { volatile unsigned short ctrl; } Hw;\n"
    "extern void g(void);\n"
    "asm void func_02000000(register unsigned int a) {\n"
    "    nofralloc\n"
    "    stmdb sp!, {r4, lr}\n"
    "    ldmia sp!, {r4, pc}\n"
    "}\n"
    "#pragma define_section INIT \".init\" abs32 RX\n"
    "#pragma section INIT begin\n"
    "void __sinit_x(void) { g(); }\n"
    "#pragma section INIT end\n"
    "int f(volatile int *reg, int n) {\n"
    "    struct { volatile int raw; } u;\n"
    "    volatile unsigned short *hw = (volatile unsigned short *)0x04000000;\n"
    "    const char *s = \".word 1\";\n"
    "    u.raw = n;\n"
    "    SAFE(n);\n"
    "    *hw = (unsigned short)*reg;\n"
    "    return s[0] + u.raw;\n"
    "}\n"
    "struct P { int word; } q = { .word = 1 };\n"
)


class TestRules(unittest.TestCase):
    def test_each_rule_fails_its_known_bad_input(self):
        for rule, source in BAD.items():
            with self.subTest(rule=rule):
                rules = {f.rule for f in cfm.scan_source("x.c", source)}
                self.assertIn(rule, rules)

    def test_honest_asm_c_and_ordinary_c_are_clean(self):
        self.assertEqual(cfm.scan_source("x.c", CLEAN), [])

    def test_findings_carry_the_source_line(self):
        [finding] = [f for f in cfm.scan_source("x.c", BAD["volatile-local"])]
        self.assertEqual((finding.line, finding.text), (2, "volatile int spill;"))


class TestTree(unittest.TestCase):
    def _tree(self, files: dict[str, str]) -> Path:
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        root = Path(tmp.name)
        for rel, text in files.items():
            path = root / rel
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
        return root

    def _main(self, *args: str) -> tuple[int, str]:
        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            code = cfm.main(list(args))
        return code, out.getvalue()

    def test_text_unit_without_function_fails(self):
        root = self._tree({
            "src/main/func_02000000.c": "const unsigned int words[] = { 0xe12fff1e };\n",
            "config/eur/arm9/delinks.txt": (
                ".text start:0x02000000 end:0x02100000 kind:code align:32\n\n"
                "src/main/func_02000000.c:\n"
                "    complete\n"
                "    .text start:0x02000000 end:0x02000004\n"
            ),
        })
        rules = {f.rule for f in cfm.scan_tree(root)}
        self.assertEqual(rules, {"text-unit-without-function"})

    def test_baseline_tolerates_then_ratchets(self):
        root = self._tree({"src/a.c": BAD["do-while-zero"], "src/b.c": CLEAN})
        code, out = self._main("--root", str(root))
        self.assertEqual(code, 1)
        self.assertIn("NEW: do-while-zero src/a.c", out)

        code, _ = self._main("--root", str(root), "--write-baseline")
        self.assertEqual(code, 0)
        code, out = self._main("--root", str(root))
        self.assertEqual(code, 0, out)

        (root / "src/b.c").write_text(BAD["volatile-local"], encoding="utf-8")
        code, out = self._main("--root", str(root))
        self.assertEqual(code, 1)
        self.assertIn("NEW: volatile-local src/b.c", out)

        (root / "src/b.c").write_text(CLEAN, encoding="utf-8")
        (root / "src/a.c").write_text(CLEAN, encoding="utf-8")
        code, out = self._main("--root", str(root))
        self.assertEqual(code, 1)
        self.assertIn("STALE: do-while-zero src/a.c", out)

    def test_missing_tree_is_an_input_error(self):
        root = self._tree({"README": "x"})
        with contextlib.redirect_stderr(io.StringIO()):
            code, _ = self._main("--root", str(root))
        self.assertEqual(code, 2)


if __name__ == "__main__":
    unittest.main()
