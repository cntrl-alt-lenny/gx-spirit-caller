"""Unit tests for `tools/objdiff_resolve_relocs.py`.

Coverage focus:

  - **Pure helpers** — name → address parsing, section name → base
    mapping, FNV-1a determinism. These are the trust-anchors for
    "same name in two files → same fictional address."
  - **Reloc primitives** — `_apply_abs32` and `_apply_pc24` against
    hand-built byte buffers, including the condition-code preserve
    invariant for PC24.
  - **End-to-end `resolve_elf_relocs`** — synthetic minimal ARM
    ELF32 with RELA relocations. Validates that two files with
    different reloc shapes but the same intended linked bytes
    produce identical `.text` after the transform (the central
    brief 206 invariant).
  - **REL fallback** — `.rel.text` (entsize=8) with implicit addends
    in the relocated field, just in case some toolchain in the
    chain ever emits it.
  - **Unsupported reloc type** — explicit failure (not silent
    pass-through) so brief 206+ regressions trip the test.
  - **`process_objdiff_json`** — rewrites paths, handles
    idempotency, surfaces failures without sinking the run.

The minimal ELF builder is local to this test file (no pyelftools
dependency, matching the precedent set by
`tests/test_objdiff_filter_panic_units.py`).
"""

from __future__ import annotations

import json
import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from objdiff_resolve_relocs import (  # noqa: E402
    NAME_HASH_BASE,
    R_ARM_ABS32,
    R_ARM_PC24,
    ResolveRelocsError,
    _apply_abs32,
    _apply_pc24,
    _fnv1a_24,
    _is_resolved,
    process_objdiff_json,
    resolve_elf_relocs,
    resolve_symbol_address,
    section_base_for,
)


# --------------------------------------------------------------------------- #
# Minimal-ELF fixture builder
# --------------------------------------------------------------------------- #


def _build_arm_elf_with_relocs(
    *,
    text_bytes: bytes,
    symbols: list[tuple[str, int, int, int]],
    relocs: list[tuple[int, int, int, int]],
    rela: bool = True,
) -> bytes:
    """Build a minimal ARM ELF32-LE with one `.text`, one symtab,
    one strtab, one `.rela.text` (or `.rel.text` if `rela=False`),
    and one shstrtab.

    `symbols`: list of `(name, st_value, st_size, st_shndx)`. The
    first entry is always the NULL symbol — caller supplies the
    rest (so it's easy to compose). st_info = STT_FUNC for
    in-section symbols and STT_NOTYPE for externals; the test
    doesn't actually care about st_info, but we pick STT_FUNC to
    match what the panic-units filter would accept.

    `relocs`: list of `(r_offset, r_type, sym_idx, r_addend)`.
    For RELA, addend is stored explicitly. For REL, the caller
    must have already baked the addend into `text_bytes` at the
    appropriate location (matching ABI semantics: implicit addend
    lives in the relocated field).

    Section layout (idx):
      0 — NULL
      1 — .text (PROGBITS + ALLOC + EXEC)
      2 — .symtab (sh_link → 3)
      3 — .strtab
      4 — .rela.text (sh_link → 2, sh_info → 1)
      5 — .shstrtab
    """
    SHSTR = b"\x00.text\x00.symtab\x00.strtab\x00"
    rel_name = b".rela.text\x00" if rela else b".rel.text\x00"
    shstr_rel_off = len(SHSTR)
    SHSTR = SHSTR + rel_name + b".shstrtab\x00"
    NAME_TEXT = 1
    NAME_SYMTAB = 7
    NAME_STRTAB = 15
    NAME_REL = shstr_rel_off
    NAME_SHSTRTAB = NAME_REL + len(rel_name)

    # Build .strtab from symbol names (NUL-prefixed pool).
    strtab = bytearray(b"\x00")
    strtab_offsets: list[int] = [0]
    for (name, _, _, _) in symbols[1:]:
        strtab_offsets.append(len(strtab))
        strtab += name.encode("utf-8") + b"\x00"
    strtab_size = len(strtab)

    # Symtab — 16 bytes per entry.
    SYMTAB_SIZE = len(symbols) * 16
    symtab = bytearray(SYMTAB_SIZE)
    for i, (_name, st_value, st_size, st_shndx) in enumerate(symbols):
        if i == 0:
            continue
        base = i * 16
        struct.pack_into("<I", symtab, base + 0, strtab_offsets[i])
        struct.pack_into("<I", symtab, base + 4, st_value)
        struct.pack_into("<I", symtab, base + 8, st_size)
        # st_info: STB_GLOBAL (1) << 4 | STT_FUNC (2) = 0x12. For
        # external (shndx 0) symbols use STB_GLOBAL | STT_NOTYPE
        # = 0x10 — neither field is checked by the tool, but
        # producing plausibly-shaped binaries keeps the test ELFs
        # ingestable by readelf for debugging.
        if st_shndx == 0:
            symtab[base + 12] = 0x10
        else:
            symtab[base + 12] = 0x12
        symtab[base + 13] = 0
        struct.pack_into("<H", symtab, base + 14, st_shndx)

    # Reloc table — 12 bytes (RELA) or 8 bytes (REL) per entry.
    ent_size = 12 if rela else 8
    relbuf = bytearray(len(relocs) * ent_size)
    for i, (r_offset, r_type, sym_idx, r_addend) in enumerate(relocs):
        base = i * ent_size
        struct.pack_into("<I", relbuf, base + 0, r_offset)
        r_info = (sym_idx << 8) | (r_type & 0xff)
        struct.pack_into("<I", relbuf, base + 4, r_info)
        if rela:
            struct.pack_into("<i", relbuf, base + 8, r_addend)

    # File layout (all section data after the 6 shdrs).
    SH_TABLE_OFF = 0x34
    NUM_SHDRS = 6
    SH_TABLE_SIZE = NUM_SHDRS * 40

    cursor = SH_TABLE_OFF + SH_TABLE_SIZE
    text_off = cursor
    cursor += len(text_bytes)
    symtab_off = cursor
    cursor += SYMTAB_SIZE
    strtab_off = cursor
    cursor += strtab_size
    rel_off = cursor
    cursor += len(relbuf)
    shstrtab_off = cursor
    cursor += len(SHSTR)

    buf = bytearray(cursor)
    # ELF header
    buf[0:4] = b"\x7fELF"
    buf[4] = 1  # ELFCLASS32
    buf[5] = 1  # ELFDATA2LSB
    buf[6] = 1  # EV_CURRENT
    struct.pack_into("<H", buf, 0x10, 1)  # ET_REL
    struct.pack_into("<H", buf, 0x12, 0x28)  # EM_ARM
    struct.pack_into("<I", buf, 0x14, 1)
    struct.pack_into("<I", buf, 0x20, SH_TABLE_OFF)
    struct.pack_into("<H", buf, 0x28, 0x34)
    struct.pack_into("<H", buf, 0x2e, 0x28)
    struct.pack_into("<H", buf, 0x30, NUM_SHDRS)
    struct.pack_into("<H", buf, 0x32, 5)  # shstrndx → idx 5

    def write_shdr(idx, name_off, sh_type, sh_flags, sh_off, sh_size,
                   sh_link, sh_info, sh_entsize):
        base = SH_TABLE_OFF + idx * 40
        struct.pack_into("<I", buf, base + 0, name_off)
        struct.pack_into("<I", buf, base + 4, sh_type)
        struct.pack_into("<I", buf, base + 8, sh_flags)
        struct.pack_into("<I", buf, base + 12, 0)
        struct.pack_into("<I", buf, base + 16, sh_off)
        struct.pack_into("<I", buf, base + 20, sh_size)
        struct.pack_into("<I", buf, base + 24, sh_link)
        struct.pack_into("<I", buf, base + 28, sh_info)
        struct.pack_into("<I", buf, base + 32, 4)
        struct.pack_into("<I", buf, base + 36, sh_entsize)

    SHT_PROGBITS = 1
    SHT_SYMTAB = 2
    SHT_STRTAB = 3
    SHT_RELA = 4
    SHT_REL = 9
    SHF_ALLOC = 2
    SHF_EXECINSTR = 4
    write_shdr(0, 0, 0, 0, 0, 0, 0, 0, 0)
    write_shdr(1, NAME_TEXT, SHT_PROGBITS, SHF_ALLOC | SHF_EXECINSTR,
               text_off, len(text_bytes), 0, 0, 0)
    write_shdr(2, NAME_SYMTAB, SHT_SYMTAB, 0,
               symtab_off, SYMTAB_SIZE, 3, 1, 16)
    write_shdr(3, NAME_STRTAB, SHT_STRTAB, 0,
               strtab_off, strtab_size, 0, 0, 0)
    write_shdr(4, NAME_REL, SHT_RELA if rela else SHT_REL, 0,
               rel_off, len(relbuf), 2, 1, ent_size)
    write_shdr(5, NAME_SHSTRTAB, SHT_STRTAB, 0,
               shstrtab_off, len(SHSTR), 0, 0, 0)

    # Section data
    buf[text_off:text_off + len(text_bytes)] = text_bytes
    buf[symtab_off:symtab_off + SYMTAB_SIZE] = symtab
    buf[strtab_off:strtab_off + strtab_size] = strtab
    buf[rel_off:rel_off + len(relbuf)] = relbuf
    buf[shstrtab_off:shstrtab_off + len(SHSTR)] = SHSTR
    return bytes(buf)


def _extract_text(buf: bytes) -> bytes:
    """Pull the `.text` section bytes out of an ELF32-LE buffer."""
    e_shoff = struct.unpack_from("<I", buf, 0x20)[0]
    e_shnum = struct.unpack_from("<H", buf, 0x30)[0]
    e_shstrndx = struct.unpack_from("<H", buf, 0x32)[0]
    shstr_sh = e_shoff + e_shstrndx * 40
    shstr_off = struct.unpack_from("<I", buf, shstr_sh + 16)[0]
    shstr_size = struct.unpack_from("<I", buf, shstr_sh + 20)[0]
    shstr = buf[shstr_off:shstr_off + shstr_size]
    for i in range(e_shnum):
        base = e_shoff + i * 40
        name_idx = struct.unpack_from("<I", buf, base)[0]
        end = shstr.find(b"\x00", name_idx)
        name = shstr[name_idx:end].decode("ascii", errors="replace")
        if name == ".text":
            off = struct.unpack_from("<I", buf, base + 16)[0]
            size = struct.unpack_from("<I", buf, base + 20)[0]
            return buf[off:off + size]
    raise AssertionError(".text not found")


def _rela_text_size(buf: bytes) -> int:
    """Return the `.rela.text` section's `sh_size` (0 after the tool
    has zeroed it, original count before)."""
    e_shoff = struct.unpack_from("<I", buf, 0x20)[0]
    e_shnum = struct.unpack_from("<H", buf, 0x30)[0]
    e_shstrndx = struct.unpack_from("<H", buf, 0x32)[0]
    shstr_sh = e_shoff + e_shstrndx * 40
    shstr_off = struct.unpack_from("<I", buf, shstr_sh + 16)[0]
    shstr_size = struct.unpack_from("<I", buf, shstr_sh + 20)[0]
    shstr = buf[shstr_off:shstr_off + shstr_size]
    for i in range(e_shnum):
        base = e_shoff + i * 40
        name_idx = struct.unpack_from("<I", buf, base)[0]
        end = shstr.find(b"\x00", name_idx)
        name = shstr[name_idx:end].decode("ascii", errors="replace")
        if name in (".rela.text", ".rel.text"):
            return struct.unpack_from("<I", buf, base + 20)[0]
    raise AssertionError("reloc section not found")


# --------------------------------------------------------------------------- #
# Helper-function tests (pure, no I/O)
# --------------------------------------------------------------------------- #


class TestFnv1a24(unittest.TestCase):
    """`_fnv1a_24` — deterministic 24-bit hash."""

    def test_returns_24_bit_value(self) -> None:
        for name in ["foo", "OSi_PostIrqEvent", "x" * 100, ""]:
            h = _fnv1a_24(name)
            self.assertGreaterEqual(h, 0)
            self.assertLess(h, 1 << 24)

    def test_deterministic(self) -> None:
        # Same name → same hash, every run. This is the invariant
        # that lets two .o files referencing the same external
        # produce identical post-relocation bytes.
        self.assertEqual(_fnv1a_24("memcpy"), _fnv1a_24("memcpy"))
        self.assertEqual(
            _fnv1a_24("OSi_PostIrqEvent"),
            _fnv1a_24("OSi_PostIrqEvent"),
        )

    def test_different_names_differ(self) -> None:
        # Sanity: not a constant function.
        self.assertNotEqual(_fnv1a_24("foo"), _fnv1a_24("bar"))


class TestResolveSymbolAddress(unittest.TestCase):
    """`resolve_symbol_address` — the trust anchor for cross-file
    address consistency."""

    def test_extern_with_embedded_hex(self) -> None:
        # dsd's `data_021a6354` should resolve to 0x021a6354 — exactly
        # the address mwcc would emit as a raw literal for the same
        # pool word. This is the central "no diff" invariant.
        self.assertEqual(
            resolve_symbol_address(
                "data_021a6354", st_value=0, st_shndx=0,
                section_bases_by_idx={},
            ),
            0x021a6354,
        )
        self.assertEqual(
            resolve_symbol_address(
                "func_020905dc", st_value=0, st_shndx=0,
                section_bases_by_idx={},
            ),
            0x020905dc,
        )

    def test_extern_with_overlay_tagged_address(self) -> None:
        # dsd also emits names like `data_ov006_021ceae4` for
        # overlay-tagged externs. The 8-hex-digit suffix wins.
        self.assertEqual(
            resolve_symbol_address(
                "data_ov006_021ceae4", st_value=0, st_shndx=0,
                section_bases_by_idx={},
            ),
            0x021ceae4,
        )

    def test_named_extern_falls_back_to_hash(self) -> None:
        # `memcpy` has no embedded address. Both files reference it
        # by name, so the hash-based fallback gives the same value.
        addr = resolve_symbol_address(
            "memcpy", st_value=0, st_shndx=0, section_bases_by_idx={},
        )
        self.assertGreaterEqual(addr, NAME_HASH_BASE)
        self.assertLess(addr, NAME_HASH_BASE + (1 << 24))
        # Repeatable.
        self.assertEqual(
            addr,
            resolve_symbol_address(
                "memcpy", st_value=0, st_shndx=0, section_bases_by_idx={},
            ),
        )

    def test_in_section_symbol_uses_section_base(self) -> None:
        # A symbol pointing INTO .text (st_shndx points at .text's
        # idx; st_value is its in-section offset). Resolved
        # address = section base + st_value.
        addr = resolve_symbol_address(
            "local_label", st_value=0x40, st_shndx=1,
            section_bases_by_idx={1: 0x02000000},
        )
        self.assertEqual(addr, 0x02000040)

    def test_shn_abs_returns_st_value(self) -> None:
        addr = resolve_symbol_address(
            "absolute_thing", st_value=0xdeadbeef, st_shndx=0xfff1,
            section_bases_by_idx={},
        )
        self.assertEqual(addr, 0xdeadbeef)


class TestSectionBaseFor(unittest.TestCase):
    """`section_base_for` — section name → fictional base."""

    def test_known_section_exact_match(self) -> None:
        self.assertEqual(section_base_for(".text"), 0x02000000)
        self.assertEqual(section_base_for(".data"), 0x02100000)
        self.assertEqual(section_base_for(".rodata"), 0x02200000)

    def test_subsection_prefix_match(self) -> None:
        # `.rodata.str1.1` should land in the `.rodata` region.
        base = section_base_for(".rodata.str1.1")
        self.assertGreaterEqual(base, 0x02200000)
        self.assertLess(base, 0x02300000)
        # Deterministic.
        self.assertEqual(base, section_base_for(".rodata.str1.1"))

    def test_unknown_section_uses_name_hash(self) -> None:
        base = section_base_for(".weird_section_name")
        self.assertGreaterEqual(base, NAME_HASH_BASE)
        self.assertLess(base, NAME_HASH_BASE + (1 << 24))

    def test_custom_bases_override(self) -> None:
        # Tests may want to pin bases for assertion clarity.
        bases = {".text": 0x01000000}
        self.assertEqual(section_base_for(".text", bases), 0x01000000)


class TestApplyAbs32(unittest.TestCase):
    """`_apply_abs32` — writes 32-bit LE at target offset."""

    def test_writes_sum(self) -> None:
        out = bytearray(b"\x00" * 16)
        _apply_abs32(out, target_off=0, r_offset=4,
                     sym_addr=0x02000000, addend=0x42)
        self.assertEqual(
            struct.unpack_from("<I", out, 4)[0],
            0x02000042,
        )

    def test_wraps_on_overflow(self) -> None:
        # (S + A) may overflow 32 bits — should wrap, not raise.
        out = bytearray(b"\x00" * 8)
        _apply_abs32(out, target_off=0, r_offset=0,
                     sym_addr=0xffffffff, addend=2)
        self.assertEqual(struct.unpack_from("<I", out, 0)[0], 1)


class TestApplyPc24(unittest.TestCase):
    """`_apply_pc24` — writes 24-bit displacement, preserves cond+op."""

    def test_forward_branch(self) -> None:
        # Template: 0xeb000000 (BL Always, no offset). Branching
        # from P=0x02000000 to S=0x02000020, addend=-8 (the
        # standard ARM PC offset baked into the addend).
        # Displacement = (0x02000020 - 8 - 0x02000000) >> 2 = 6.
        # Expected instr = 0xeb000006.
        out = bytearray(struct.pack("<I", 0xeb000000) + b"\x00" * 4)
        _apply_pc24(out, target_off=0, target_base_va=0x02000000,
                    r_offset=0, sym_addr=0x02000020, addend=-8)
        self.assertEqual(
            struct.unpack_from("<I", out, 0)[0], 0xeb000006,
        )

    def test_backward_branch(self) -> None:
        # Branch BACKWARD: S < P. Displacement < 0 → low 24 bits
        # are the 2's complement representation. Condition bits
        # preserved. Buffer is sized so r_offset=0x20 has 4 bytes
        # of slack.
        out = bytearray(b"\x00" * 0x20 + struct.pack("<I", 0x1a000000))
        # Branch from 0x02000020 to 0x02000000, addend=-8.
        # Displacement = (0x02000000 - 8 - 0x02000020) >> 2
        #              = (-0x28) >> 2 = -10 = 0xfffff6 in 24 bits.
        _apply_pc24(out, target_off=0, target_base_va=0x02000000,
                    r_offset=0x20, sym_addr=0x02000000, addend=-8)
        self.assertEqual(
            struct.unpack_from("<I", out, 0x20)[0], 0x1afffff6,
        )

    def test_preserves_condition_bits(self) -> None:
        # Instruction starts with NE condition + B opcode (0x1a).
        # After applying a PC24 reloc, the top byte must stay 0x1a.
        out = bytearray(struct.pack("<I", 0x1a000000) + b"\x00" * 4)
        _apply_pc24(out, target_off=0, target_base_va=0x02000000,
                    r_offset=0, sym_addr=0x02000010, addend=-8)
        top_byte = out[3]
        self.assertEqual(top_byte, 0x1a)


# --------------------------------------------------------------------------- #
# End-to-end `resolve_elf_relocs` tests
# --------------------------------------------------------------------------- #


class TestResolveElfRelocsRela(unittest.TestCase):
    """End-to-end transform on RELA-format synthetic ELFs."""

    def test_built_and_delinked_converge_on_same_bytes(self) -> None:
        """**The central brief 206 invariant.**

        Two ELFs reference the same logical code, but differ in
        reloc shape:
          - Built: `.text[0x04]` is a raw literal `0x02345678`, no
            reloc.
          - Delinked: `.text[0x04]` is zero, with an
            R_ARM_ABS32 reloc against `data_02345678` (addend 0).
        After resolving both, the `.text` bytes must match — that's
        the metric the brief is fixing.
        """
        # Built: raw literal at offset 4.
        text_built = struct.pack("<II", 0xeb000000, 0x02345678)
        built = _build_arm_elf_with_relocs(
            text_bytes=text_built,
            symbols=[
                ("", 0, 0, 0),  # NULL
                ("func_02000020", 0, 0, 0),  # external for PC24
            ],
            relocs=[
                # PC24 to func_02000020 with addend -8
                (0x00, R_ARM_PC24, 1, -8),
            ],
            rela=True,
        )
        # Delinked: zero at offset 4, R_ARM_ABS32 reloc instead.
        text_delinked = struct.pack("<II", 0xeb000000, 0x00000000)
        delinked = _build_arm_elf_with_relocs(
            text_bytes=text_delinked,
            symbols=[
                ("", 0, 0, 0),  # NULL
                ("func_02000020", 0, 0, 0),
                ("data_02345678", 0, 0, 0),
            ],
            relocs=[
                (0x00, R_ARM_PC24, 1, -8),
                (0x04, R_ARM_ABS32, 2, 0),
            ],
            rela=True,
        )

        built_out = resolve_elf_relocs(built)
        delinked_out = resolve_elf_relocs(delinked)

        bt = _extract_text(built_out)
        dt = _extract_text(delinked_out)
        self.assertEqual(
            bt, dt,
            msg=(
                f"Post-resolve .text bytes diverge:\n"
                f"  built    = {bt.hex()}\n"
                f"  delinked = {dt.hex()}\n"
                "This is the central brief 206 invariant — if it "
                "fails, the matched_functions metric won't tick "
                "for .legacy.c / .legacy_sp3.c / .s ships."
            ),
        )

    def test_strips_rela_text_size(self) -> None:
        """After resolve, `.rela.text` should report sh_size=0
        (entries become invisible to readers like objdiff)."""
        elf = _build_arm_elf_with_relocs(
            text_bytes=struct.pack("<II", 0xeb000000, 0),
            symbols=[
                ("", 0, 0, 0),
                ("data_02345678", 0, 0, 0),
            ],
            relocs=[(0x04, R_ARM_ABS32, 1, 0)],
            rela=True,
        )
        self.assertEqual(_rela_text_size(elf), 12)  # 1 RELA entry
        out = resolve_elf_relocs(elf)
        self.assertEqual(_rela_text_size(out), 0)

    def test_pc24_to_internal_symbol(self) -> None:
        """PC24 to an IN-SECTION symbol: result depends on the
        symbol's section + st_value, not on its name."""
        # .text = [B 0x10, ..., target nop@0x10]
        text = b"\x00\x00\x00\xeb" + b"\x00" * 12 + b"\x00\xf0\x20\xe3"
        elf = _build_arm_elf_with_relocs(
            text_bytes=text,
            symbols=[
                ("", 0, 0, 0),
                # In-section symbol at .text offset 0x10. shndx = 1
                # (.text is idx 1 in our builder).
                ("internal_target", 0x10, 4, 1),
            ],
            relocs=[(0x00, R_ARM_PC24, 1, -8)],
            rela=True,
        )
        out = resolve_elf_relocs(elf)
        bt = _extract_text(out)
        # Displacement = (0x02000010 - 8 - 0x02000000) >> 2 = 2.
        # Instr template was 0xeb000000 (little-endian bytes
        # 00 00 00 eb), so post-resolve instr = 0xeb000002.
        self.assertEqual(struct.unpack_from("<I", bt, 0)[0], 0xeb000002)

    def test_unsupported_reloc_type_raises(self) -> None:
        """Unknown reloc types must fail loudly — silent skip would
        let brief 206+ regressions slip through."""
        elf = _build_arm_elf_with_relocs(
            text_bytes=b"\x00\x00\x00\x00",
            symbols=[
                ("", 0, 0, 0),
                ("some_symbol", 0, 0, 0),
            ],
            relocs=[
                # R_ARM_THM_CALL = 10 — doesn't appear in the
                # spirit-caller corpus, should raise.
                (0x00, 10, 1, 0),
            ],
            rela=True,
        )
        with self.assertRaises(ResolveRelocsError) as cm:
            resolve_elf_relocs(elf)
        self.assertIn("unsupported reloc type", str(cm.exception))


class TestResolveElfRelocsRel(unittest.TestCase):
    """REL fallback — entsize=8, addend baked into relocated field."""

    def test_abs32_reads_addend_from_field(self) -> None:
        """REL R_ARM_ABS32: addend is the current value of the
        relocated word."""
        # .text[0x00] = 0xeb000000 (placeholder)
        # .text[0x04] = 0x42 (implicit addend for the REL reloc)
        text = struct.pack("<II", 0xeb000000, 0x42)
        elf = _build_arm_elf_with_relocs(
            text_bytes=text,
            symbols=[
                ("", 0, 0, 0),
                ("data_02000100", 0, 0, 0),
            ],
            relocs=[(0x04, R_ARM_ABS32, 1, 0)],
            rela=False,
        )
        out = resolve_elf_relocs(elf)
        bt = _extract_text(out)
        # Resolved = 0x02000100 (from name) + 0x42 (implicit) = 0x02000142
        self.assertEqual(struct.unpack_from("<I", bt, 4)[0], 0x02000142)


# --------------------------------------------------------------------------- #
# `process_objdiff_json` integration
# --------------------------------------------------------------------------- #


class TestProcessObjdiffJson(unittest.TestCase):
    """End-to-end JSON-driven pipeline against synthetic units."""

    def setUp(self) -> None:
        self.tmpdir = tempfile.TemporaryDirectory()
        self.root = Path(self.tmpdir.name)

    def tearDown(self) -> None:
        self.tmpdir.cleanup()

    def _write_pair(self, target_rel: str, base_rel: str) -> None:
        """Write a matching pair of synthetic .o files at the
        given relative paths. Both reference the same external
        symbol — so after resolve, both should produce identical
        post-relocation `.text` bytes."""
        # Built shape: raw literal.
        built = _build_arm_elf_with_relocs(
            text_bytes=struct.pack("<II", 0xeb000000, 0x02345678),
            symbols=[
                ("", 0, 0, 0),
                ("func_02000020", 0, 0, 0),
            ],
            relocs=[(0x00, R_ARM_PC24, 1, -8)],
            rela=True,
        )
        # Delinked shape: reloc against data_02345678.
        delinked = _build_arm_elf_with_relocs(
            text_bytes=struct.pack("<II", 0xeb000000, 0),
            symbols=[
                ("", 0, 0, 0),
                ("func_02000020", 0, 0, 0),
                ("data_02345678", 0, 0, 0),
            ],
            relocs=[
                (0x00, R_ARM_PC24, 1, -8),
                (0x04, R_ARM_ABS32, 2, 0),
            ],
            rela=True,
        )
        target_path = self.root / target_rel
        base_path = self.root / base_rel
        target_path.parent.mkdir(parents=True, exist_ok=True)
        base_path.parent.mkdir(parents=True, exist_ok=True)
        # Convention: target = delinked (orig side), base = built.
        target_path.write_bytes(delinked)
        base_path.write_bytes(built)

    def _write_objdiff_json(self, units: list[dict]) -> Path:
        p = self.root / "objdiff.json"
        p.write_text(json.dumps({"units": units}, indent=2))
        return p

    def test_rewrites_paths_and_creates_sidecars(self) -> None:
        self._write_pair(
            "build/eur/delinks/foo.o",
            "build/eur/src/foo.o",
        )
        p = self._write_objdiff_json([
            {
                "name": "foo",
                "target_path": "build/eur/delinks/foo.o",
                "base_path": "build/eur/src/foo.o",
            },
        ])

        processed, skipped, failures = process_objdiff_json(
            p, project_root=self.root,
        )
        self.assertEqual(processed, 1)
        self.assertEqual(skipped, 0)
        self.assertEqual(failures, [])

        with p.open() as f:
            written = json.load(f)
        self.assertEqual(
            written["units"][0]["target_path"],
            "build/eur/delinks/foo.o.resolved",
        )
        self.assertEqual(
            written["units"][0]["base_path"],
            "build/eur/src/foo.o.resolved",
        )
        # Sidecars exist on disk.
        self.assertTrue(
            (self.root / "build/eur/delinks/foo.o.resolved").is_file(),
        )
        self.assertTrue(
            (self.root / "build/eur/src/foo.o.resolved").is_file(),
        )
        # And their .text bytes match — the matched_functions
        # invariant.
        t1 = _extract_text(
            (self.root / "build/eur/delinks/foo.o.resolved").read_bytes(),
        )
        t2 = _extract_text(
            (self.root / "build/eur/src/foo.o.resolved").read_bytes(),
        )
        self.assertEqual(t1, t2)

    def test_idempotency(self) -> None:
        """Re-running on already-rewritten JSON is a no-op for the
        unit list. Sidecar files are regenerated (source might have
        changed), but the JSON's paths stay pointing at them."""
        self._write_pair(
            "build/eur/delinks/foo.o",
            "build/eur/src/foo.o",
        )
        p = self._write_objdiff_json([
            {
                "name": "foo",
                "target_path": "build/eur/delinks/foo.o",
                "base_path": "build/eur/src/foo.o",
            },
        ])
        # First pass: process.
        processed1, _, _ = process_objdiff_json(p, project_root=self.root)
        self.assertEqual(processed1, 1)
        # Second pass: paths already end in .resolved → skipped.
        processed2, skipped2, _ = process_objdiff_json(
            p, project_root=self.root,
        )
        self.assertEqual(processed2, 0)
        self.assertEqual(skipped2, 1)

    def test_missing_file_reports_failure_but_continues(self) -> None:
        """Brief 206: a single bad unit shouldn't sink the whole
        report. Failures get collected and reported; the JSON
        still gets rewritten for the survivors."""
        # One good pair.
        self._write_pair(
            "build/eur/delinks/good.o",
            "build/eur/src/good.o",
        )
        # One unit whose target doesn't exist on disk.
        p = self._write_objdiff_json([
            {
                "name": "good",
                "target_path": "build/eur/delinks/good.o",
                "base_path": "build/eur/src/good.o",
            },
            {
                "name": "ghost",
                "target_path": "build/eur/delinks/ghost.o",
                "base_path": "build/eur/src/ghost.o",
            },
        ])

        processed, _, failures = process_objdiff_json(
            p, project_root=self.root,
        )
        self.assertEqual(processed, 1)
        self.assertEqual(len(failures), 1)
        self.assertEqual(failures[0][0], "ghost")


class TestIsResolved(unittest.TestCase):
    """`_is_resolved` — path suffix check used for idempotency."""

    def test_resolved_path(self) -> None:
        self.assertTrue(_is_resolved("build/foo.o.resolved"))

    def test_plain_o_is_not_resolved(self) -> None:
        self.assertFalse(_is_resolved("build/foo.o"))

    def test_legacy_o_is_not_resolved(self) -> None:
        # Pre-resolve `.legacy.o` should NOT match — it's still
        # the source-of-truth artifact that the resolver writes
        # a `.resolved` sidecar for.
        self.assertFalse(_is_resolved("build/foo.legacy.o"))


# --------------------------------------------------------------------------- #
# Real-world fixture (if available)
# --------------------------------------------------------------------------- #


class TestRealWorldFixture(unittest.TestCase):
    """Smoke check against the real OSi_PostIrqEvent.legacy.o pair
    if it's present in the build tree. Skipped on fresh checkouts
    where the build hasn't run yet.

    This is the canary unit from
    `docs/research/objdiff-fuzzy-vs-complete-metric.md`: built has
    5 .rela.text entries, delinked has 6 (extra `data_027e0000`).
    Post-resolve, both must produce identical `.text` bytes."""

    def test_osi_post_irq_event_legacy(self) -> None:
        root = Path(__file__).resolve().parent.parent
        built = root / "build/eur/src/main/OSi_PostIrqEvent.legacy.o"
        delinked = root / "build/eur/delinks/src/main/OSi_PostIrqEvent.legacy.o"
        if not built.is_file() or not delinked.is_file():
            self.skipTest("build artifacts not present — run `ninja` first")
        built_out = resolve_elf_relocs(built.read_bytes())
        delinked_out = resolve_elf_relocs(delinked.read_bytes())
        bt = _extract_text(built_out)
        dt = _extract_text(delinked_out)
        self.assertEqual(
            bt, dt,
            msg=(
                "Canonical brief 206 example diverges post-resolve. "
                "Check section_base_for or resolve_symbol_address."
            ),
        )


if __name__ == "__main__":
    unittest.main()
