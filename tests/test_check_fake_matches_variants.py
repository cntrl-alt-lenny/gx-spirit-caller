"""Round 005 tests for tools/check_fake_matches.py: the spellings round 004's
lint let through, and the object check that catches the class whatever the
spelling. Each `rules_of` case below was run against round 004's lint and
fails there (see the round report)."""

from __future__ import annotations

import contextlib
import io
import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import check_fake_matches as cfm  # noqa: E402


def rules_of(source: str, aliases=None) -> set[str]:
    return {f.rule for f in cfm.scan_source("x.c", source, aliases)}


class TestRawDirectiveSpellings(unittest.TestCase):
    """mwcc accepts only `dcd`, but behind a label, a macro alias, a
    function-like macro or token pasting; each compiled to a raw word."""

    def test_after_a_label(self):
        self.assertIn("raw-data-directive", rules_of(
            "asm void f(void) {\nlbl: dcd 0xe12fff1e\n}\n"))
        self.assertIn("raw-data-directive", rules_of(
            "asm void f(void) {\nnop\na: b: dcd 0xe12fff1e\n}\n"))

    def test_through_a_define_alias(self):
        self.assertIn("raw-data-directive", rules_of(
            "#define W dcd\nasm void f(void) {\n    W 0xe12fff1e\n}\n"))

    def test_through_an_alias_of_an_alias(self):
        self.assertIn("raw-data-directive", rules_of(
            "#define W dcd\n#define V W\nasm void f(void) {\n    V 0xe12fff1e\n}\n"))

    def test_through_a_macro_that_carries_the_operand(self):
        self.assertIn("raw-data-directive", rules_of(
            "#define RET dcd 0xe12fff1e\nasm void f(void) {\n    RET\n}\n"))
        self.assertIn("raw-data-directive", rules_of(
            "#define I(x) dcd x\nasm void f(void) {\n    I(0xe12fff1e)\n}\n"))

    def test_alias_defined_in_a_header(self):
        aliases = cfm.collect_aliases(["#define W dcd\n"])
        self.assertIn("raw-data-directive", rules_of(
            "asm void f(void) {\n    W 0xe12fff1e\n}\n", aliases))

    def test_split_over_two_lines_with_a_continuation(self):
        self.assertIn("raw-data-directive", rules_of(
            "asm void f(void) {\n    dc\\\nd 0xe12fff1e\n}\n"))

    def test_after_a_semicolon_or_brace(self):
        self.assertIn("raw-data-directive", rules_of("asm void f(void) { nop; dcd 0x1 }\n"))

    def test_an_alias_name_used_as_plain_c_member_is_clean(self):
        aliases = cfm.collect_aliases(["#define W dcd\n"])
        self.assertEqual(rules_of("int g(struct S *s) { return s->W + s.W; }\n", aliases), set())

    def test_designated_initialiser_named_like_a_directive_is_clean(self):
        self.assertEqual(rules_of("struct P { int word; } q = { .word = 1 };\n"), set())


class TestOtherSpellings(unittest.TestCase):
    def test_while_zero_variants(self):
        for cond in ("0", "0U", "0u", "0L", "0x0", "((0))", "false", "FALSE", "!1", " 0 "):
            with self.subTest(cond=cond):
                self.assertIn("do-while-zero", rules_of(
                    f"void f(int *p) {{\n    do {{ p[0] = 1; }} while ({cond});\n}}\n"))

    def test_while_zero_through_a_macro(self):
        self.assertIn("do-while-zero", rules_of(
            "#define ZERO 0\nvoid f(int *p) {\n    do { p[0] = 1; } while (ZERO);\n}\n"))

    def test_real_loops_are_clean(self):
        self.assertEqual(rules_of(
            "void f(int *p, int n) {\n    do { p[0] = 1; } while (n);\n"
            "    do { p[1] = 1; } while (n > 0);\n    do { p[2] = 1; } while (10);\n}\n"), set())

    def test_volatile_local_spellings(self):
        for decl in ("volatile int x;", "int volatile x;", "const volatile int x;",
                     "int * volatile p;", "int *const volatile p;", "volatile int a[4];",
                     "static volatile int x;", "volatile struct S s;", "volatile int x = 1;"):
            with self.subTest(decl=decl):
                self.assertIn("volatile-local", rules_of(
                    f"struct S {{ int a; }};\nvoid f(int *q) {{\n    {decl}\n    *q = 1;\n}}\n"))

    def test_volatile_through_a_typedef_or_macro(self):
        self.assertIn("volatile-local", rules_of(
            "typedef volatile int vint;\nvoid f(void) {\n    vint x;\n    x = 1;\n}\n"))
        self.assertIn("volatile-local", rules_of(
            "typedef volatile unsigned int vu32;\nvoid f(void) {\n    vu32 x = 0;\n}\n"))
        self.assertIn("volatile-local", rules_of(
            "#define VOL volatile\nvoid f(void) {\n    VOL int x;\n    x = 1;\n}\n"))
        aliases = cfm.collect_aliases(["typedef volatile unsigned short vu16;\n"])
        self.assertIn("volatile-local", rules_of("void f(void) {\n    vu16 x;\n}\n", aliases))

    def test_pointer_to_volatile_and_hardware_access_are_clean(self):
        aliases = cfm.collect_aliases(["typedef volatile unsigned short vu16;\n"])
        source = (
            "extern volatile int g_reg;\n"
            "void f(vu16 *hw, volatile int *p) {\n"
            "    volatile int *q = p;\n"
            "    vu16 *r = hw;\n"
            "    extern volatile int other;\n"
            "    *(volatile int *)0x04000000 = 1;\n"
            "    *q = (int)*r + other;\n"
            "}\n")
        self.assertEqual(rules_of(source, aliases), set())

    def test_section_override_through_a_macro(self):
        self.assertIn("section-override", rules_of(
            '#define IN_TEXT __declspec(section ".text")\n'
            "IN_TEXT const unsigned int w[] = {0xe12fff1e};\n"))

    def test_register_pin_through_a_macro(self):
        self.assertIn("register-pin", rules_of(
            '#define PIN register int x asm("r4")\nint f(int a) {\n    PIN = a;\n    return x;\n}\n'))
        self.assertIn("register-pin", rules_of(
            '#define R4 asm("r4")\nint f(int a) {\n    register int x R4 = a;\n    return x;\n}\n'))


def make_object(text: bytes, marks, relocs=()) -> bytes:
    """A little-endian ARM ELF with one executable `.text`, `$a`/`$t`/`$d`
    mapping symbols at the given offsets, and REL relocations at `relocs`."""
    strtab = bytearray(b"\0")
    syms = [struct.pack("<IIIBBH", 0, 0, 0, 0, 0, 0)]
    for name, offset in marks:
        syms.append(struct.pack("<IIIBBH", len(strtab), offset, 0, 0, 0, 1))
        strtab += name.encode() + b"\0"
    syms.append(struct.pack("<IIIBBH", len(strtab), 0, 0, 0x10, 0, 0))
    strtab += b"extern_sym\0"
    rel = b"".join(struct.pack("<II", off, ((len(syms) - 1) << 8) | 2) for off in relocs)
    shstr = b"\0.text\0.symtab\0.strtab\0.rel.text\0.shstrtab\0"
    names = {".text": 1, ".symtab": 7, ".strtab": 15, ".rel.text": 23, ".shstrtab": 33}
    body = bytearray(52)
    where = {}
    for key, data in ((".text", text), (".symtab", b"".join(syms)), (".strtab", bytes(strtab)),
                      (".rel.text", rel), (".shstrtab", shstr)):
        while len(body) % 4:
            body.append(0)
        where[key] = (len(body), len(data))
        body += data
    while len(body) % 4:
        body.append(0)
    shoff = len(body)
    body += struct.pack("<IIIIIIIIII", *([0] * 10))
    body += struct.pack("<IIIIIIIIII", names[".text"], 1, 0x6, 0, *where[".text"], 0, 0, 4, 0)
    body += struct.pack("<IIIIIIIIII", names[".symtab"], 2, 0, 0, *where[".symtab"], 3, 1, 4, 16)
    body += struct.pack("<IIIIIIIIII", names[".strtab"], 3, 0, 0, *where[".strtab"], 0, 0, 1, 0)
    body += struct.pack("<IIIIIIIIII", names[".rel.text"], 9, 0, 0, *where[".rel.text"], 2, 1, 4, 8)
    body += struct.pack("<IIIIIIIIII", names[".shstrtab"], 3, 0, 0, *where[".shstrtab"], 0, 0, 1, 0)
    body[:52] = b"\x7fELF\x01\x01\x01" + b"\0" * 9 + struct.pack(
        "<HHIIIIIHHHHHH", 1, 40, 1, 0, 0, shoff, 0, 52, 0, 0, 40, 6, 5)
    return bytes(body)


def words(*values: int) -> bytes:
    return b"".join(struct.pack("<I", v) for v in values)


def data_words(data: bytes) -> list:
    with tempfile.TemporaryDirectory() as directory:
        path = Path(directory) / "x.o"
        path.write_bytes(data)
        return cfm.data_words_in_code(path)


class TestDataInText(unittest.TestCase):
    """The object check catches a raw word however its source spelled it."""

    def test_a_dcd_word_is_flagged(self):
        # mov r0,#1 ; dcd 0xe12fff1e  ($d at 4, loaded by nothing)
        self.assertEqual(data_words(make_object(words(0xE3A00001, 0xE12FFF1E),
                                                [("$a", 0), ("$d", 4)])), [(".text", 4)])

    def test_a_literal_pool_word_is_clean(self):
        # ldr r0,[pc,#0] loads offset 8; bx lr; the pool word
        self.assertEqual(data_words(make_object(words(0xE59F0000, 0xE12FFF1E, 0x12345678),
                                                [("$a", 0), ("$d", 8)])), [])

    def test_a_pool_word_before_its_load_is_clean(self):
        # the word at 0 is loaded by `ldr r0,[pc,#-12]` at 4: 4 + 8 - 12 = 0
        self.assertEqual(data_words(make_object(words(0x12345678, 0xE51F000C, 0xE12FFF1E),
                                                [("$d", 0), ("$a", 4)])), [])

    def test_adr_style_add_pc_is_clean(self):
        # add r0,pc,#0 at 0 references offset 8
        self.assertEqual(data_words(make_object(words(0xE28F0000, 0xE12FFF1E, 0xCAFEBABE),
                                                [("$a", 0), ("$d", 8)])), [])

    def test_thumb_pool_word_is_clean_and_thumb_data_is_flagged(self):
        # ldr r0,[pc,#0] (0x4800) at 0 loads ((0+4)&~3)+0 = 4
        clean = struct.pack("<HH", 0x4800, 0x4770) + words(0x11223344)
        self.assertEqual(data_words(make_object(clean, [("$t", 0), ("$d", 4)])), [])
        fake = struct.pack("<HH", 0x2001, 0x4770) + words(0x11223344)
        self.assertEqual(data_words(make_object(fake, [("$t", 0), ("$d", 4)])), [(".text", 4)])

    def test_a_relocated_word_is_clean(self):
        self.assertEqual(data_words(make_object(words(0xE12FFF1E, 0), [("$a", 0), ("$d", 4)],
                                                relocs=(4,))), [])

    def test_a_word_no_load_reaches_is_flagged_even_beside_a_pool(self):
        # the pool word at 8 is loaded; the extra word at 12 is not
        self.assertEqual(data_words(make_object(words(0xE59F0000, 0xE12FFF1E, 1, 0xE12FFF1E),
                                                [("$a", 0), ("$d", 8)])), [(".text", 12)])

    def test_plain_code_has_no_findings(self):
        self.assertEqual(data_words(make_object(words(0xE3A00001, 0xE12FFF1E), [("$a", 0)])), [])

    def test_not_an_elf_is_an_error(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "x.o"
            path.write_bytes(b"not an elf at all")
            with self.assertRaises(cfm.ObjectError):
                cfm.data_words_in_code(path)


class TestObjectCheckInATree(unittest.TestCase):
    DELINKS = (".text start:0x02000000 end:0x02100000 kind:code align:32\n\n"
               "src/main/func_02000000.c:\n    complete\n"
               "    .text start:0x02000000 end:0x02000008\n")

    def _tree(self, obj: bytes | None) -> Path:
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        root = Path(tmp.name)
        (root / "src/main").mkdir(parents=True)
        (root / "src/main/func_02000000.c").write_text(
            "asm void func_02000000(void) {\n    mov r0, #1\n    lbl: dcd 0xe12fff1e\n}\n",
            encoding="utf-8")
        (root / "config/eur/arm9").mkdir(parents=True)
        (root / "config/eur/arm9/delinks.txt").write_text(self.DELINKS, encoding="utf-8")
        (root / "build/eur/delinks").mkdir(parents=True)
        if obj is not None:
            target = root / "build/eur/src/main/func_02000000.o"
            target.parent.mkdir(parents=True)
            target.write_bytes(obj)
        return root

    def _main(self, *args):
        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            code = cfm.main(list(args))
        return code, out.getvalue()

    def test_object_finding_fails_even_when_the_source_lint_is_blind(self):
        # Token pasting hides `dcd` from the lexical rules; the object shows it.
        root = self._tree(make_object(words(0xE3A00001, 0xE12FFF1E), [("$a", 0), ("$d", 4)]))
        (root / "src/main/func_02000000.c").write_text(
            "#define CAT(a, b) a##b\nasm void func_02000000(void) {\n    mov r0, #1\n"
            "    CAT(d, cd) 0xe12fff1e\n}\n", encoding="utf-8")
        code, out = self._main("--root", str(root))
        self.assertEqual(code, 0, out)  # source lint alone is blind to it
        code, out = self._main("--root", str(root), "--version", "eur")
        self.assertEqual(code, 1)
        self.assertIn("NEW: data-in-text src/main/func_02000000.c: eur .text+0x4", out)

    def test_clean_object_passes(self):
        root = self._tree(make_object(words(0xE3A00001, 0xE12FFF1E), [("$a", 0)]))
        code, out = self._main("--root", str(root), "--version", "eur")
        self.assertEqual(code, 1, out)  # the source still has the lexical `dcd`
        self.assertIn("raw-data-directive", out)
        self.assertNotIn("data-in-text src", out)

    def test_unbuilt_version_is_an_input_error(self):
        root = self._tree(None)
        code, out = self._main("--root", str(root), "--version", "usa")
        self.assertEqual(code, 2)
        self.assertIn("build the region first", out)

    def test_missing_object_is_an_input_error(self):
        root = self._tree(None)
        code, out = self._main("--root", str(root), "--version", "eur")
        self.assertEqual(code, 2)
        self.assertIn("missing build/eur/src/main/func_02000000.o", out)


class TestBaselineIdentity(unittest.TestCase):
    """Round 005: a baseline line is one finding, so swapping one for another
    in the same file fails, and pruning only ever removes lines."""

    def _tree(self, source: str) -> Path:
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        root = Path(tmp.name)
        (root / "src").mkdir()
        (root / "src/a.c").write_text(source, encoding="utf-8")
        return root

    def _main(self, *args):
        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            code = cfm.main(list(args))
        return code, out.getvalue()

    TWO = ("void f(int *p) {\n    do { p[0] = 1; } while (0);\n}\n"
           "void g(int *p) {\n    volatile int spill;\n    spill = *p;\n}\n")

    def test_swapping_one_finding_for_another_in_the_same_file_fails(self):
        root = self._tree(self.TWO)
        self.assertEqual(self._main("--root", str(root), "--write-baseline")[0], 0)
        self.assertEqual(self._main("--root", str(root))[0], 0)
        # Fix the volatile local, add a different one in the same file.
        (root / "src/a.c").write_text(
            self.TWO.replace("volatile int spill;", "int spill;")
            + "void h(int *p) {\n    volatile int other;\n    other = *p;\n}\n", encoding="utf-8")
        code, out = self._main("--root", str(root))
        self.assertEqual(code, 1)
        self.assertIn("NEW: volatile-local src/a.c: volatile int other;", out)
        self.assertIn("STALE: volatile-local src/a.c: volatile int spill;", out)

    def test_prune_removes_a_stale_line_and_adds_nothing(self):
        root = self._tree(self.TWO)
        self._main("--root", str(root), "--write-baseline")
        baseline = root / "tools/fake_match_baseline.txt"
        before = baseline.read_text(encoding="utf-8").splitlines()
        (root / "src/a.c").write_text(self.TWO.replace("volatile int spill;", "int spill;"),
                                      encoding="utf-8")
        code, out = self._main("--root", str(root), "--prune-baseline")
        self.assertEqual(code, 0, out)
        after = baseline.read_text(encoding="utf-8").splitlines()
        self.assertEqual([line for line in before if line not in after],
                         [line for line in before if line.startswith("volatile-local")])
        self.assertEqual([line for line in after if line not in before], [])
        self.assertEqual(self._main("--root", str(root))[0], 0)

    def test_prune_never_records_a_new_finding(self):
        root = self._tree(self.TWO)
        self._main("--root", str(root), "--write-baseline")
        baseline = root / "tools/fake_match_baseline.txt"
        before = baseline.read_text(encoding="utf-8")
        (root / "src/a.c").write_text(self.TWO + "void h(int *p) {\n    volatile int other;\n}\n",
                                      encoding="utf-8")
        code, _ = self._main("--root", str(root), "--prune-baseline")
        self.assertEqual(code, 1)  # the new finding still fails
        self.assertEqual(baseline.read_text(encoding="utf-8"), before)

    def test_two_identical_lines_are_two_entries(self):
        root = self._tree("void f(int *p) {\n    do { p[0] = 1; } while (0);\n}\n"
                          "void g(int *p) {\n    do { p[0] = 1; } while (0);\n}\n")
        self._main("--root", str(root), "--write-baseline")
        lines = [ln for ln in (root / "tools/fake_match_baseline.txt")
                 .read_text(encoding="utf-8").splitlines() if ln.startswith("do-while-zero")]
        self.assertEqual([ln.split("\t")[2] for ln in lines], ["1", "2"])

    def test_format_one_baseline_is_refused(self):
        root = self._tree("int x;\n")
        (root / "tools").mkdir()
        (root / "tools/fake_match_baseline.txt").write_text(
            "do-while-zero\tsrc/a.c\t1\n", encoding="utf-8")
        with contextlib.redirect_stderr(io.StringIO()):
            code, _ = self._main("--root", str(root))
        self.assertEqual(code, 2)


if __name__ == "__main__":
    unittest.main()
