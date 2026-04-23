"""Unit tests for tools/patch_section_align.py.

mwasmarm-emitted Thumb `.text` sections have sh_addralign=4
regardless of source directives. dsd's LCF template hardcodes
ALIGNALL(4). Combined they cause mwldarm to insert padding,
shifting downstream bytes. This tool is the escape hatch per
docs/research/thumb-align-wall.md Option C.

Regressions in this tool would silently corrupt every hand-written
`.s` object the decomper ships. Pinning:

  - ELF magic + class + endianness validation
  - `.text` sh_addralign rewrite 4 -> 2
  - Idempotence (running again is a no-op)
  - `.text.*` suffixed sections also rewritten
  - `.data` / `.rodata` / `.bss` sh_addralign left untouched
  - Graceful failures (truncated file, missing section header
    table, out-of-bounds string index)
  - patch_file end-to-end (reads + writes)
"""

from __future__ import annotations

import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from patch_section_align import (  # noqa: E402
    E_SHENTSIZE,
    E_SHNUM,
    E_SHOFF,
    E_SHSTRNDX,
    ELFParseError,
    SH_ADDRALIGN,
    SH_NAME,
    SH_OFFSET,
    SH_SIZE,
    TARGET_ALIGN,
    patch_file,
    patch_text_sections,
)


# --------------------------------------------------------------------------- #
# Synthetic ELF fixture helpers
# --------------------------------------------------------------------------- #

SHDR_SIZE = 40


def _shdr(name_off: int, sh_type: int, off: int, size: int,
          addralign: int) -> bytes:
    h = bytearray(SHDR_SIZE)
    struct.pack_into("<I", h, SH_NAME, name_off)
    struct.pack_into("<I", h, 0x04, sh_type)
    struct.pack_into("<I", h, SH_OFFSET, off)
    struct.pack_into("<I", h, SH_SIZE, size)
    struct.pack_into("<I", h, SH_ADDRALIGN, addralign)
    return bytes(h)


def _ehdr(shoff: int, shnum: int, shstrndx: int) -> bytes:
    h = bytearray(0x34)
    h[0:4] = b"\x7fELF"
    h[4] = 1  # ELFCLASS32
    h[5] = 1  # ELFDATA2LSB
    struct.pack_into("<I", h, E_SHOFF, shoff)
    struct.pack_into("<H", h, E_SHENTSIZE, SHDR_SIZE)
    struct.pack_into("<H", h, E_SHNUM, shnum)
    struct.pack_into("<H", h, E_SHSTRNDX, shstrndx)
    return bytes(h)


def _build_elf(sections: list[tuple[str, int, int, int]]) -> bytes:
    """Build a minimal ELF32 LE .o from section definitions.

    Each section entry is (name, sh_type, payload_size, addralign).
    Always adds a leading NULL section + trailing .shstrtab and
    returns the blob bytes.
    """
    # Synthesize a string table containing every section name.
    shstrtab = b"\x00"
    name_offs: dict[str, int] = {"": 0}
    for name, _t, _s, _a in sections:
        if name in name_offs:
            continue
        name_offs[name] = len(shstrtab)
        shstrtab += name.encode() + b"\x00"
    shstrtab_name = ".shstrtab"
    name_offs[shstrtab_name] = len(shstrtab)
    shstrtab += shstrtab_name.encode() + b"\x00"

    # Lay out payloads immediately after Ehdr (offset 0x34).
    payloads: list[bytes] = []
    payload_offs: list[int] = []
    cur = 0x34
    for _n, _t, size, _a in sections:
        payload_offs.append(cur)
        payloads.append(b"\x00" * size)
        cur += size
    shstrtab_off = cur
    cur += len(shstrtab)
    shdr_off = cur

    # Build the section header table: NULL first, then each input
    # section, then .shstrtab.
    headers = [_shdr(0, 0, 0, 0, 0)]  # NULL section
    for (name, typ, size, align), poff in zip(
        sections, payload_offs, strict=True,
    ):
        headers.append(_shdr(name_offs[name], typ, poff, size, align))
    shstr_idx = 1 + len(sections)
    headers.append(_shdr(
        name_offs[shstrtab_name], 3, shstrtab_off, len(shstrtab), 1,
    ))

    blob = (
        _ehdr(shdr_off, len(headers), shstr_idx)
        + b"".join(payloads)
        + shstrtab
        + b"".join(headers)
    )
    return blob


def _sh_addralign_of(
    blob: bytes, name: str,
) -> int | None:
    """Helper: read the sh_addralign of a named section. Returns
    None if the section isn't present."""
    shoff = struct.unpack_from("<I", blob, E_SHOFF)[0]
    shnum = struct.unpack_from("<H", blob, E_SHNUM)[0]
    shstrndx = struct.unpack_from("<H", blob, E_SHSTRNDX)[0]
    shstr_hdr = shoff + shstrndx * SHDR_SIZE
    shstr_off = struct.unpack_from("<I", blob, shstr_hdr + SH_OFFSET)[0]
    shstr_size = struct.unpack_from("<I", blob, shstr_hdr + SH_SIZE)[0]
    shstrtab = blob[shstr_off:shstr_off + shstr_size]
    for i in range(shnum):
        h = shoff + i * SHDR_SIZE
        name_off = struct.unpack_from("<I", blob, h + SH_NAME)[0]
        end = shstrtab.find(b"\x00", name_off)
        n = shstrtab[name_off:end].decode(errors="replace")
        if n == name:
            return struct.unpack_from("<I", blob, h + SH_ADDRALIGN)[0]
    return None


# --------------------------------------------------------------------------- #
# Tests
# --------------------------------------------------------------------------- #


class TestElfValidation(unittest.TestCase):
    def test_too_short_rejected(self):
        with self.assertRaises(ELFParseError):
            patch_text_sections(b"\x7fELF")

    def test_bad_magic_rejected(self):
        blob = bytearray(b"\x00" * 0x34)
        blob[0:4] = b"NOPE"
        with self.assertRaises(ELFParseError):
            patch_text_sections(bytes(blob))

    def test_64_bit_rejected(self):
        # ELFCLASS64 = 2
        blob = _build_elf([(".text", 1, 0x10, 4)])
        mutable = bytearray(blob)
        mutable[4] = 2  # EI_CLASS = 64-bit
        with self.assertRaises(ELFParseError):
            patch_text_sections(bytes(mutable))

    def test_big_endian_rejected(self):
        blob = _build_elf([(".text", 1, 0x10, 4)])
        mutable = bytearray(blob)
        mutable[5] = 2  # EI_DATA = ELFDATA2MSB
        with self.assertRaises(ELFParseError):
            patch_text_sections(bytes(mutable))


class TestPatchCorePath(unittest.TestCase):
    def test_text_align_4_rewritten_to_2(self):
        blob = _build_elf([(".text", 1, 0x20, 4)])
        self.assertEqual(_sh_addralign_of(blob, ".text"), 4)
        patched, changes = patch_text_sections(blob)
        self.assertEqual(changes, [(".text", 4, 2)])
        self.assertEqual(_sh_addralign_of(bytes(patched), ".text"), 2)

    def test_target_align_overrideable(self):
        blob = _build_elf([(".text", 1, 0x20, 16)])
        patched, changes = patch_text_sections(blob, target_align=4)
        self.assertEqual(changes, [(".text", 16, 4)])
        self.assertEqual(_sh_addralign_of(bytes(patched), ".text"), 4)

    def test_idempotent_when_already_target(self):
        blob = _build_elf([(".text", 1, 0x20, 2)])
        patched, changes = patch_text_sections(blob)
        self.assertEqual(changes, [])
        self.assertEqual(bytes(patched), blob)

    def test_idempotent_when_below_target(self):
        # sh_addralign=1 is valid for some edge cases; we don't
        # raise it, just leave alone.
        blob = _build_elf([(".text", 1, 0x20, 1)])
        patched, changes = patch_text_sections(blob)
        self.assertEqual(changes, [])
        self.assertEqual(_sh_addralign_of(bytes(patched), ".text"), 1)

    def test_text_suffix_variants_also_patched(self):
        # `.text.sinit`, `.text.foo` etc — mwasmarm / mwccarm emits
        # these for section-group LTO layouts. All must be caught.
        blob = _build_elf([
            (".text", 1, 0x10, 4),
            (".text.sinit", 1, 0x10, 4),
            (".text.foo", 1, 0x10, 4),
        ])
        patched, changes = patch_text_sections(blob)
        # Every .text* section got patched.
        names = [c[0] for c in changes]
        self.assertCountEqual(
            names, [".text", ".text.sinit", ".text.foo"],
        )

    def test_non_text_sections_untouched(self):
        # .data / .rodata / .bss have genuine align-4/8 needs (u32
        # tables, doubles). We must NOT rewrite them.
        blob = _build_elf([
            (".text", 1, 0x10, 4),
            (".data", 1, 0x10, 4),
            (".rodata", 1, 0x10, 4),
            (".bss", 8, 0x10, 4),
        ])
        patched, changes = patch_text_sections(blob)
        # Only .text moved.
        self.assertEqual(len(changes), 1)
        self.assertEqual(changes[0][0], ".text")
        # Other sections stayed at 4.
        self.assertEqual(_sh_addralign_of(bytes(patched), ".data"), 4)
        self.assertEqual(_sh_addralign_of(bytes(patched), ".rodata"), 4)
        self.assertEqual(_sh_addralign_of(bytes(patched), ".bss"), 4)


class TestPatchFile(unittest.TestCase):
    def test_end_to_end_roundtrip(self):
        blob = _build_elf([(".text", 1, 0x20, 4)])
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "obj.o"
            p.write_bytes(blob)
            rc = patch_file(p)
            self.assertEqual(rc, 0)
            # File content now has the patched align.
            self.assertEqual(
                _sh_addralign_of(p.read_bytes(), ".text"), TARGET_ALIGN,
            )

    def test_missing_file_returns_error(self):
        with tempfile.TemporaryDirectory() as td:
            rc = patch_file(Path(td) / "nonexistent.o")
            self.assertEqual(rc, 1)

    def test_non_elf_file_returns_error(self):
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "bogus.o"
            p.write_bytes(b"not an ELF")
            rc = patch_file(p)
            self.assertEqual(rc, 1)

    def test_no_text_section_is_noop(self):
        # .o with only .data — tool returns 0, file unchanged.
        blob = _build_elf([(".data", 1, 0x10, 4)])
        with tempfile.TemporaryDirectory() as td:
            p = Path(td) / "data_only.o"
            p.write_bytes(blob)
            rc = patch_file(p)
            self.assertEqual(rc, 0)
            self.assertEqual(p.read_bytes(), blob)


class TestDefensiveParsing(unittest.TestCase):
    def test_corrupt_shstrtab_offset_refuses_to_crash(self):
        # Build a valid ELF then scramble e_shstrndx to point beyond
        # the section count — should raise ELFParseError cleanly.
        blob = bytearray(_build_elf([(".text", 1, 0x10, 4)]))
        # Overwrite e_shstrndx to an out-of-bounds index.
        struct.pack_into("<H", blob, E_SHSTRNDX, 99)
        with self.assertRaises(ELFParseError):
            patch_text_sections(bytes(blob))

    def test_missing_section_header_table_raises(self):
        # Zero out e_shoff.
        blob = bytearray(_build_elf([(".text", 1, 0x10, 4)]))
        struct.pack_into("<I", blob, E_SHOFF, 0)
        with self.assertRaises(ELFParseError):
            patch_text_sections(bytes(blob))


if __name__ == "__main__":
    unittest.main()
