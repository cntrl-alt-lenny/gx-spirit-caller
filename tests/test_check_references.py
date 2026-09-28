"""Tests for tools/check_references.py on synthetic ELF objects: identical
bytes with a different reference must fail, and the baseline ratchets."""

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

import check_references as cr  # noqa: E402

ABS32, PC24 = 2, 1


def make_elf(relocs, *, text=b"\0" * 32, local_labels=(), functions=(("func_02000000", 0, 32),),
             rel=False) -> bytes:
    """A minimal ARM ELF relocatable: .text, .symtab, .strtab, .rel(a).text, .shstrtab.

    `relocs` is a list of (offset, type, symbol) where symbol is an external
    name, or ("local", value) for a label defined in .text.
    """
    strtab = bytearray(b"\0")

    def s(name: str) -> int:
        idx = len(strtab)
        strtab.extend(name.encode() + b"\0")
        return idx

    syms = [struct.pack("<IIIBBH", 0, 0, 0, 0, 0, 0),
            struct.pack("<IIIBBH", 0, 0, 0, 3, 0, 1)]  # section symbol for .text
    index: dict[object, int] = {}
    for label, value in local_labels:
        index[label] = len(syms)
        syms.append(struct.pack("<IIIBBH", s(label), value, 0, 1, 0, 1))
    for name, value, size in functions:
        index[name] = len(syms)
        syms.append(struct.pack("<IIIBBH", s(name), value, size, 0x12, 0, 1))
    for _off, _type, sym in relocs:
        if isinstance(sym, str) and sym not in index:
            index[sym] = len(syms)
            syms.append(struct.pack("<IIIBBH", s(sym), 0, 0, 0x10, 0, 0))
    rel_entries = bytearray()
    for off, rtype, sym in relocs:
        if isinstance(sym, tuple):
            sym_index, addend = 1, sym[1]
        else:
            sym_index, addend = index[sym], 0
        if rel:
            rel_entries += struct.pack("<II", off, (sym_index << 8) | rtype)
        else:
            rel_entries += struct.pack("<IIi", off, (sym_index << 8) | rtype, addend)
    shstr = b"\0.text\0.symtab\0.strtab\0.rela.text\0.shstrtab\0"
    sh_name = {".text": 1, ".symtab": 7, ".strtab": 15, ".rela.text": 23, ".shstrtab": 34}
    body = bytearray(b"\0" * 52)
    offsets = {}
    for name, data in ((".text", text), (".symtab", b"".join(syms)), (".strtab", bytes(strtab)),
                       (".rela.text", bytes(rel_entries)), (".shstrtab", shstr)):
        while len(body) % 4:
            body.append(0)
        offsets[name] = (len(body), len(data))
        body += data
    while len(body) % 4:
        body.append(0)
    shoff = len(body)
    headers = [struct.pack("<IIIIIIIIII", *([0] * 10))]
    headers.append(struct.pack("<IIIIIIIIII", sh_name[".text"], 1, 0x6, 0, *offsets[".text"], 0, 0, 4, 0))
    headers.append(struct.pack("<IIIIIIIIII", sh_name[".symtab"], 2, 0, 0, *offsets[".symtab"], 3, 2, 4, 16))
    headers.append(struct.pack("<IIIIIIIIII", sh_name[".strtab"], 3, 0, 0, *offsets[".strtab"], 0, 0, 1, 0))
    headers.append(struct.pack("<IIIIIIIIII", sh_name[".rela.text"], 9 if rel else 4, 0, 0,
                               *offsets[".rela.text"], 2, 1, 4, 8 if rel else 12))
    headers.append(struct.pack("<IIIIIIIIII", sh_name[".shstrtab"], 3, 0, 0, *offsets[".shstrtab"], 0, 0, 1, 0))
    body += b"".join(headers)
    ident = b"\x7fELF\x01\x01\x01" + b"\0" * 9
    header = ident + struct.pack("<HHIIIIIHHHHHH", 1, 40, 1, 0, 0, shoff, 0, 52, 0, 0, 40, 6, 5)
    body[:52] = header
    return bytes(body)


class TestCompare(unittest.TestCase):
    def _diff(self, original: bytes, built: bytes):
        with tempfile.TemporaryDirectory() as d:
            a, b = Path(d) / "a.o", Path(d) / "b.o"
            a.write_bytes(original)
            b.write_bytes(built)
            return cr.compare_objects("eur", "src/x.c", cr.read_object(a), cr.read_object(b))

    def test_same_references_match(self):
        elf = make_elf([(0x1c, ABS32, "data_02100000"), (0x4, PC24, "func_02000800")])
        self.assertEqual(self._diff(elf, elf), [])

    def test_raw_number_for_a_symbol_is_missing_reloc(self):
        [d] = self._diff(make_elf([(0x1c, ABS32, "data_027e0000")]), make_elf([]))
        self.assertEqual((d.kind, d.offset, d.function), ("missing-reloc", 0x1c, "func_02000000"))
        self.assertEqual(d.original.target, "data_027e0000")

    def test_alias_at_the_same_address_is_wrong_target(self):
        [d] = self._diff(make_elf([(0x4, PC24, "func_02000800")]),
                         make_elf([(0x4, PC24, "Alias_02000800")]))
        self.assertEqual(d.kind, "wrong-target")
        self.assertIn("Alias_02000800", d.describe())

    def test_extra_reloc_is_reported(self):
        [d] = self._diff(make_elf([]), make_elf([(0x8, ABS32, "data_02100000")]))
        self.assertEqual(d.kind, "extra-reloc")

    def test_local_label_equals_section_offset(self):
        original = make_elf([(0x1c, ABS32, ".L_0200001c")], local_labels=((".L_0200001c", 0x10),))
        built = make_elf([(0x1c, ABS32, ("local", 0x10))])
        self.assertEqual(self._diff(original, built), [])

    def test_rel_implicit_addend_is_read(self):
        text = bytearray(32)
        struct.pack_into("<i", text, 0x1c, 4)
        a = make_elf([(0x1c, ABS32, "data_02100000")], rel=True, text=bytes(text))
        b = make_elf([(0x1c, ABS32, "data_02100000")])
        [d] = self._diff(a, b)
        self.assertEqual((d.kind, d.original.addend, d.built.addend), ("wrong-target", 4, 0))


class TestMain(unittest.TestCase):
    def _tree(self, original: bytes, built: bytes) -> Path:
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        root = Path(tmp.name)
        (root / "config/eur/arm9").mkdir(parents=True)
        (root / "config/eur/arm9/delinks.txt").write_text(
            ".text start:0x02000000 end:0x02100000 kind:code align:32\n\n"
            "src/main/func_02000000.c:\n    complete\n"
            "    .text start:0x02000000 end:0x02000020\n", encoding="utf-8")
        for path, data in (("build/eur/delinks/src/main/func_02000000.o", original),
                           ("build/eur/src/main/func_02000000.o", built)):
            (root / path).parent.mkdir(parents=True, exist_ok=True)
            (root / path).write_bytes(data)
        return root

    def _main(self, *args):
        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            code = cr.main(list(args))
        return code, out.getvalue()

    def test_wrong_reference_fails_then_baseline_tolerates_and_ratchets(self):
        good = make_elf([(0x1c, ABS32, "data_02100000")])
        root = self._tree(good, make_elf([(0x1c, ABS32, "data_02100004")]))
        code, out = self._main("--version", "eur", "--root", str(root))
        self.assertEqual(code, 1)
        self.assertIn("NEW: eur src/main/func_02000000.c wrong-target", out)
        self.assertIn("original ABS32 data_02100000+0x0, built ABS32 data_02100004+0x0", out)

        self.assertEqual(self._main("--version", "eur", "--root", str(root), "--write-baseline")[0], 0)
        self.assertEqual(self._main("--version", "eur", "--root", str(root))[0], 0)

        (root / "build/eur/src/main/func_02000000.o").write_bytes(good)
        code, out = self._main("--version", "eur", "--root", str(root))
        self.assertEqual(code, 1)
        self.assertIn("STALE: eur src/main/func_02000000.c wrong-target", out)

    def test_unbuilt_region_is_an_input_error(self):
        root = self._tree(make_elf([]), make_elf([]))
        code, out = self._main("--version", "usa", "--root", str(root))
        self.assertEqual(code, 2)
        self.assertIn("build the region first", out)

    def test_missing_built_object_is_an_input_error(self):
        root = self._tree(make_elf([]), make_elf([]))
        (root / "build/eur/src/main/func_02000000.o").unlink()
        code, out = self._main("--version", "eur", "--root", str(root))
        self.assertEqual(code, 2)
        self.assertIn("missing build/eur/src/main/func_02000000.o", out)


if __name__ == "__main__":
    unittest.main()
