"""Unit tests for tools/external_obj.py.

Brief 068 implementation. Pins:
  - BuildProfile selection routes (repo, src_rel) → correct profile
  - ELF parser handles ARM-mode `$a` / `$d` markers (skips them
    so real function names are picked up)
  - byte_similarity matches Hamming-sim semantics from
    find_region_siblings._byte_similarity
  - ExternalFunc.fingerprint() zeroes reloc slots correctly

End-to-end compilation + extraction is exercised by manual smoke
tests pre-push (see brief 068 PR description for the OS_tick.c
sample validation showing 5/5 perfect byte-similarity matches
against our pokediamond pool). The wine + mwccarm dependency
makes that path unsuitable for CI in this repo; the architecture
+ parser tests pinned here are CI-safe.

Run locally:
    python -m unittest tests.test_external_obj
"""

from __future__ import annotations

import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from external_obj import (  # noqa: E402
    ExternalFunc,
    PROFILES,
    POKEDIAMOND_NITROSDK,
    _parse_elf32,
    byte_similarity,
    extract_functions,
    profile_for,
)


# --------------------------------------------------------------------------- #
# Profile selection
# --------------------------------------------------------------------------- #


class TestProfileFor(unittest.TestCase):
    def test_nitro_sdk_routes_to_pokediamond_nitrosdk(self):
        prof = profile_for("pokediamond",
                           "arm9/lib/NitroSDK/src/OS_tick.c")
        self.assertIs(prof, POKEDIAMOND_NITROSDK)
        self.assertEqual(prof.sp, "1.2/sp2p3")

    def test_libnns_routes_to_pokediamond_nitrosdk(self):
        # libnns uses the same SP as NitroSDK (1.2/sp2p3) per
        # pokediamond's arm9/lib/Makefile inheritance.
        prof = profile_for("pokediamond",
                           "arm9/lib/libnns/src/foo.c")
        self.assertIs(prof, POKEDIAMOND_NITROSDK)

    def test_unknown_repo_returns_none(self):
        self.assertIsNone(profile_for("notarepo",
                                       "arm9/lib/foo.c"))

    def test_unrelated_subtree_returns_none(self):
        # `arm9/src/` is game code, not lib code.
        self.assertIsNone(profile_for("pokediamond",
                                       "arm9/src/main.c"))


class TestBuildProfileMetadata(unittest.TestCase):
    def test_sp_is_legacy_compatible(self):
        # pokediamond's NitroSDK uses 1.2/sp2p3 — exact match to
        # our project's `.legacy.c` routing tier. This is the
        # "bonus finding" from brief 066 that brief 068 leverages
        # for the ≥95% precision target on NitroSDK code.
        self.assertEqual(POKEDIAMOND_NITROSDK.sp, "1.2/sp2p3")

    def test_includes_present(self):
        # Must at minimum include the NitroSDK headers; missing
        # them produces ENOENT-style compile errors.
        self.assertIn("arm9/lib/NitroSDK/include",
                      POKEDIAMOND_NITROSDK.include_paths)


# --------------------------------------------------------------------------- #
# ELF parser
# --------------------------------------------------------------------------- #


def _make_minimal_elf(sections_data: dict[str, bytes],
                     symbols: list[tuple[str, int, int, int, int]]) -> bytes:
    """Build a minimal ELF32 for parser testing.

    `sections_data` maps section name → raw bytes.
    `symbols` is a list of (name, value, size, type, shndx).
    Always adds the null section + .shstrtab + .strtab + .symtab.

    Layout:
        [header][.text sections][.shstrtab][.strtab][.symtab][sec hdrs]
    """
    # Build .shstrtab content
    shstrtab = b"\x00"
    name_offsets = {"": 0}
    for name in [".shstrtab", ".strtab", ".symtab"] + list(
            sections_data.keys()):
        name_offsets[name] = len(shstrtab)
        shstrtab += name.encode() + b"\x00"

    # Build .strtab for symbol names
    strtab = b"\x00"
    sym_name_offsets = {"": 0}
    for sym in symbols:
        name = sym[0]
        if name not in sym_name_offsets:
            sym_name_offsets[name] = len(strtab)
            strtab += name.encode() + b"\x00"

    # Build symbol table — Sym32 = 16 bytes each
    # Add null symbol first
    symtab = b"\x00" * 16
    for name, value, size, type_, shndx in symbols:
        symtab += struct.pack(
            "<IIIBBH",
            sym_name_offsets[name], value, size,
            (1 << 4) | (type_ & 0xf),   # info: STB_GLOBAL + type
            0,                          # other
            shndx,
        )

    # Layout: header(52) + each section's data + section headers
    sections = [("", b"", 0)]  # null section
    for name, data in sections_data.items():
        # type 1 = SHT_PROGBITS
        sections.append((name, data, 1))
    sections.append((".shstrtab", shstrtab, 3))   # SHT_STRTAB
    sections.append((".strtab", strtab, 3))
    sections.append((".symtab", symtab, 2))       # SHT_SYMTAB

    # Compute file layout
    offset = 52  # ELF header size
    section_offsets = []
    for _name, data, _type in sections:
        section_offsets.append(offset)
        offset += len(data)
    shoff = offset

    # Section header (40 bytes each)
    def sh_entry(name, sz, offset, type_, link=0):
        return struct.pack(
            "<IIIIIIIIII",
            name_offsets[name],
            type_,
            0, 0, offset, sz, link, 0, 0, 0,
        )
    shdrs = b""
    for i, (name, data, type_) in enumerate(sections):
        link = 0
        if type_ == 2:  # SYMTAB links to STRTAB
            for j, (n, _, _t) in enumerate(sections):
                if n == ".strtab":
                    link = j
                    break
        shdrs += sh_entry(name, len(data),
                           section_offsets[i] if data else 0,
                           type_, link)

    # ELF header
    shstrndx = 0
    for i, (n, _, _) in enumerate(sections):
        if n == ".shstrtab":
            shstrndx = i
            break
    e_header = b"\x7fELF\x01\x01\x01\x00" + b"\x00" * 8
    e_header += struct.pack(
        "<HHIIIIIHHHHHH",
        1,   # e_type ET_REL
        40,  # e_machine ARM
        1,
        0, 0, shoff,
        0,
        52,  # e_ehsize
        0, 0,  # e_phentsize, e_phnum
        40,  # e_shentsize
        len(sections),
        shstrndx,
    )
    out = bytearray(e_header)
    for _name, data, _type in sections:
        out.extend(data)
    out.extend(shdrs)
    return bytes(out)


class TestElfParser(unittest.TestCase):
    def test_rejects_non_elf(self):
        with self.assertRaises(ValueError):
            _parse_elf32(b"NOTELF" + b"\x00" * 50)

    def test_rejects_elf64(self):
        # e_ident[4] = 2 means ELF64
        data = b"\x7fELF\x02\x01\x01\x00" + b"\x00" * 50
        with self.assertRaises(ValueError):
            _parse_elf32(data)

    def test_parses_section_names(self):
        elf = _make_minimal_elf(
            sections_data={".text": b"\x00\xf0\x20\xe3"},  # 4-byte nop-ish
            symbols=[("func1", 0, 4, 2, 1)],  # STT_FUNC in section 1
        )
        parsed = _parse_elf32(elf)
        section_names = [s["name"] for s in parsed["sections"]]
        self.assertIn(".text", section_names)
        self.assertIn(".symtab", section_names)

    def test_extracts_named_function(self):
        # One .text section with one named function symbol.
        elf = _make_minimal_elf(
            sections_data={".text": b"\xe1\xa0\x00\x00"},
            symbols=[("OS_GetTick", 0, 4, 2, 1)],
        )
        with tempfile.NamedTemporaryFile(suffix=".o", delete=False) as f:
            f.write(elf)
            path = Path(f.name)
        try:
            funcs = extract_functions(path)
            self.assertEqual(len(funcs), 1)
            self.assertEqual(funcs[0].name, "OS_GetTick")
            self.assertEqual(funcs[0].size, 4)
        finally:
            path.unlink()

    def test_skips_dollar_a_markers(self):
        # ARM-mode marker `$a` is STT_FUNC at offset 0 — must be
        # skipped so we pick the real function name.
        elf = _make_minimal_elf(
            sections_data={".text": b"\xe1\xa0\x00\x00"},
            symbols=[
                ("$a", 0, 0, 2, 1),       # skip — ARM marker
                ("OS_GetTick", 0, 4, 2, 1),  # this is the real one
            ],
        )
        with tempfile.NamedTemporaryFile(suffix=".o", delete=False) as f:
            f.write(elf)
            path = Path(f.name)
        try:
            funcs = extract_functions(path)
            self.assertEqual(len(funcs), 1)
            self.assertEqual(funcs[0].name, "OS_GetTick")
            self.assertEqual(funcs[0].ish, "arm")
        finally:
            path.unlink()

    def test_thumb_bit_detected(self):
        # ARM ELF convention: THUMB STT_FUNC symbols have st_value's
        # LSB set. A THUMB function at section offset 0 has
        # st_value == 1. Brief 070 wave-1 follow-up: catch ish
        # mismatches that the byte-fingerprint would false-pass.
        elf = _make_minimal_elf(
            sections_data={".text": b"\x70\x47\x00\x00"},   # bx lr Thumb
            symbols=[
                ("MI_Zero36B", 1, 2, 2, 1),  # value=1 → THUMB
            ],
        )
        with tempfile.NamedTemporaryFile(suffix=".o", delete=False) as f:
            f.write(elf)
            path = Path(f.name)
        try:
            funcs = extract_functions(path)
            self.assertEqual(len(funcs), 1)
            self.assertEqual(funcs[0].name, "MI_Zero36B")
            self.assertEqual(funcs[0].ish, "thumb")
        finally:
            path.unlink()


# --------------------------------------------------------------------------- #
# Byte-similarity + fingerprint
# --------------------------------------------------------------------------- #


class TestByteSimilarity(unittest.TestCase):
    def test_identical(self):
        self.assertEqual(byte_similarity(b"abc", b"abc"), 1.0)

    def test_disjoint(self):
        self.assertEqual(byte_similarity(b"abc", b"xyz"), 0.0)

    def test_half_match(self):
        self.assertAlmostEqual(byte_similarity(b"abcd", b"abef"), 0.5)

    def test_length_mismatch_is_zero(self):
        self.assertEqual(byte_similarity(b"abc", b"abcd"), 0.0)

    def test_both_empty_is_one(self):
        self.assertEqual(byte_similarity(b"", b""), 1.0)


class TestExternalFuncFingerprint(unittest.TestCase):
    def test_no_relocs_passthrough(self):
        fn = ExternalFunc(
            name="f", section_index=1,
            bytes_=b"\xaa\xbb\xcc\xdd", size=4, reloc_offsets=(),
        )
        self.assertEqual(fn.fingerprint(), b"\xaa\xbb\xcc\xdd")

    def test_single_reloc_zeros_four_bytes(self):
        fn = ExternalFunc(
            name="f", section_index=1,
            bytes_=b"\xaa\xbb\xcc\xdd\xee\xff\x11\x22",
            size=8, reloc_offsets=(4,),  # zero out word at offset 4
        )
        self.assertEqual(fn.fingerprint(),
                         b"\xaa\xbb\xcc\xdd\x00\x00\x00\x00")

    def test_multiple_relocs(self):
        fn = ExternalFunc(
            name="f", section_index=1,
            bytes_=b"\x11" * 16,
            size=16, reloc_offsets=(0, 8, 12),
        )
        expected = (b"\x00\x00\x00\x00"      # reloc at 0
                    + b"\x11" * 4            # untouched
                    + b"\x00\x00\x00\x00"    # reloc at 8
                    + b"\x00\x00\x00\x00")   # reloc at 12
        self.assertEqual(fn.fingerprint(), expected)

    def test_out_of_range_reloc_ignored(self):
        # Reloc offset past end-of-bytes — must not crash, must
        # not overrun.
        fn = ExternalFunc(
            name="f", section_index=1,
            bytes_=b"\x11\x22\x33\x44",
            size=4, reloc_offsets=(100,),
        )
        self.assertEqual(fn.fingerprint(), b"\x11\x22\x33\x44")


# --------------------------------------------------------------------------- #
# Profile registry
# --------------------------------------------------------------------------- #


class TestProfilesRegistry(unittest.TestCase):
    def test_all_profiles_have_valid_sp(self):
        valid_prefixes = ("1.2/", "2.0/", "dsi/")
        for key, prof in PROFILES.items():
            self.assertTrue(
                any(prof.sp.startswith(p) for p in valid_prefixes),
                f"profile {key} has unexpected SP {prof.sp}",
            )

    def test_all_profiles_have_includes(self):
        for key, prof in PROFILES.items():
            self.assertGreater(
                len(prof.include_paths), 0,
                f"profile {key} has empty include_paths",
            )


if __name__ == "__main__":
    unittest.main()
