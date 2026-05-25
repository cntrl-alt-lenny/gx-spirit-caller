"""Unit tests for `tools/patch_arm_mapping_symbols.py`.

Coverage focus (brief 210):

  - **`is_likely_arm_instruction`** — permissive heuristic that
    accepts any non-`0xF` condition + rejects zero-word. Pinned
    against the canonical patterns from brief 192 / 209 that
    drove the design.
  - **End-to-end rewrite on synthetic ELFs** — three scenarios:
    all-ARM range (promote `$d` → `$a`), partial-ARM range
    (move `st_value` to the boundary), all-data range (no
    change). Plus a Thumb-skip case (`$t` present → tool
    bails).
  - **Mass-rename fallback** — when no existing `$a` slot exists
    and ALL `$d` ranges are entirely-ARM, the strtab `$d\\0`
    string is overwritten to `$a\\0` (single byte). Verified
    on a synthetic shape; the converse (mixed ranges with no
    `$a` slot) leaves the file unchanged.
  - **st_info promotion** — when `$d` is renamed to `$a`, the
    symbol's type nibble must also flip from `STT_OBJECT` to
    `STT_FUNC` (matches mwasmarm's convention; objdiff panics
    on name/type mismatch).
  - **Idempotency** — re-running on an already-rewritten file
    produces no further changes.
"""

from __future__ import annotations

import struct
import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from patch_arm_mapping_symbols import (  # noqa: E402
    STT_FUNC,
    STT_OBJECT,
    MappingSymbolRewriteError,
    is_likely_arm_instruction,
    rewrite_mapping_symbols,
)


# --------------------------------------------------------------------------- #
# Minimal-ELF fixture builder
# --------------------------------------------------------------------------- #


def _build_arm_elf(
    *,
    text_bytes: bytes,
    mapping_symbols: list[tuple[str, int]],
) -> bytes:
    """Build a minimal ARM ELF32-LE with one `.text` section, a
    `.symtab` containing the requested mapping symbols (and a
    function symbol named `func_test`), plus the linked `.strtab`
    and `.shstrtab`.

    `mapping_symbols` is a list of `(name, st_value)` where `name`
    must be in `{"$a", "$d", "$t"}`. Order matters: this list
    becomes the symtab in the same order. Each gets the
    appropriate `st_info` per mwasmarm convention:
      - `$a` → STT_FUNC (2)
      - `$d` → STT_OBJECT (1)
      - `$t` → STT_FUNC (2)

    Section layout (idx):
      0 NULL, 1 .text, 2 .symtab (sh_link → 3), 3 .strtab,
      4 .shstrtab
    """
    SHSTR = b"\x00.text\x00.symtab\x00.strtab\x00.shstrtab\x00"
    NAME_TEXT = 1
    NAME_SYMTAB = 7
    NAME_STRTAB = 15
    NAME_SHSTRTAB = 23

    # Build .strtab: NUL + each mapping symbol name (deduped) +
    # "func_test\0".
    strtab = bytearray(b"\x00")
    name_offsets: dict[str, int] = {}
    for name, _ in mapping_symbols:
        if name not in name_offsets:
            name_offsets[name] = len(strtab)
            strtab += name.encode() + b"\x00"
    func_name_offset = len(strtab)
    strtab += b"func_test\x00"
    text_name_offset = len(strtab)
    strtab += b".text\x00"

    # Build symtab. Order: NULL + N mapping + .text + func_test.
    SYM_COUNT = 1 + len(mapping_symbols) + 2
    symtab = bytearray(SYM_COUNT * 16)
    # Idx 0 = NULL (already zeroed).
    cur = 1
    for name, st_value in mapping_symbols:
        base = cur * 16
        struct.pack_into("<I", symtab, base + 0, name_offsets[name])
        struct.pack_into("<I", symtab, base + 4, st_value)
        struct.pack_into("<I", symtab, base + 8, 0)  # st_size
        # st_info: STB_LOCAL << 4 | type
        if name in ("$a", "$t"):
            symtab[base + 12] = STT_FUNC
        else:
            symtab[base + 12] = STT_OBJECT
        symtab[base + 13] = 0
        struct.pack_into("<H", symtab, base + 14, 1)  # shndx → .text
        cur += 1
    # .text section symbol
    text_sym_base = cur * 16
    struct.pack_into("<I", symtab, text_sym_base + 0, text_name_offset)
    struct.pack_into("<I", symtab, text_sym_base + 4, 0)
    struct.pack_into("<I", symtab, text_sym_base + 8, len(text_bytes))
    symtab[text_sym_base + 12] = 3  # STT_SECTION
    struct.pack_into("<H", symtab, text_sym_base + 14, 1)
    cur += 1
    # func_test
    func_sym_base = cur * 16
    struct.pack_into("<I", symtab, func_sym_base + 0, func_name_offset)
    struct.pack_into("<I", symtab, func_sym_base + 4, 0)
    struct.pack_into("<I", symtab, func_sym_base + 8, 0)
    symtab[func_sym_base + 12] = 0  # STT_NOTYPE (mwasmarm convention)
    struct.pack_into("<H", symtab, func_sym_base + 14, 1)

    # File layout
    SH_TABLE_OFF = 0x34
    NUM_SHDRS = 5
    SH_TABLE_SIZE = NUM_SHDRS * 40
    cursor = SH_TABLE_OFF + SH_TABLE_SIZE
    text_off = cursor
    cursor += len(text_bytes)
    symtab_off = cursor
    cursor += len(symtab)
    strtab_off = cursor
    cursor += len(strtab)
    shstrtab_off = cursor
    cursor += len(SHSTR)

    buf = bytearray(cursor)
    # ELF header
    buf[0:4] = b"\x7fELF"
    buf[4] = 1  # ELFCLASS32
    buf[5] = 1  # ELFDATA2LSB
    buf[6] = 1
    struct.pack_into("<H", buf, 0x10, 1)  # ET_REL
    struct.pack_into("<H", buf, 0x12, 0x28)  # EM_ARM
    struct.pack_into("<I", buf, 0x14, 1)
    struct.pack_into("<I", buf, 0x20, SH_TABLE_OFF)
    struct.pack_into("<H", buf, 0x28, 0x34)
    struct.pack_into("<H", buf, 0x2e, 0x28)
    struct.pack_into("<H", buf, 0x30, NUM_SHDRS)
    struct.pack_into("<H", buf, 0x32, 4)  # shstrndx → .shstrtab idx

    def write_shdr(idx, name_off, sh_type, sh_off, sh_size, sh_link,
                   sh_info, sh_entsize):
        base = SH_TABLE_OFF + idx * 40
        struct.pack_into("<I", buf, base + 0, name_off)
        struct.pack_into("<I", buf, base + 4, sh_type)
        struct.pack_into("<I", buf, base + 8, 0x6 if sh_type == 1 else 0)
        struct.pack_into("<I", buf, base + 12, 0)
        struct.pack_into("<I", buf, base + 16, sh_off)
        struct.pack_into("<I", buf, base + 20, sh_size)
        struct.pack_into("<I", buf, base + 24, sh_link)
        struct.pack_into("<I", buf, base + 28, sh_info)
        struct.pack_into("<I", buf, base + 32, 4)
        struct.pack_into("<I", buf, base + 36, sh_entsize)

    write_shdr(0, 0, 0, 0, 0, 0, 0, 0)  # NULL
    write_shdr(1, NAME_TEXT, 1, text_off, len(text_bytes), 0, 0, 0)  # .text
    write_shdr(2, NAME_SYMTAB, 2, symtab_off, len(symtab), 3, 1, 16)  # .symtab
    write_shdr(3, NAME_STRTAB, 3, strtab_off, len(strtab), 0, 0, 0)  # .strtab
    write_shdr(4, NAME_SHSTRTAB, 3, shstrtab_off, len(SHSTR), 0, 0, 0)
    # Section data
    buf[text_off:text_off + len(text_bytes)] = text_bytes
    buf[symtab_off:symtab_off + len(symtab)] = symtab
    buf[strtab_off:strtab_off + len(strtab)] = strtab
    buf[shstrtab_off:shstrtab_off + len(SHSTR)] = SHSTR
    return bytes(buf)


def _collect_mapping(buf: bytes) -> list[tuple[str, int, int]]:
    """Extract (name, st_value, st_info_type) for every $a/$d/$t
    symbol in `.text`. Used by tests to assert post-rewrite layout."""
    e_shoff = struct.unpack_from("<I", buf, 0x20)[0]
    e_shnum = struct.unpack_from("<H", buf, 0x30)[0]
    e_shstrndx = struct.unpack_from("<H", buf, 0x32)[0]
    shstr_sh = e_shoff + e_shstrndx * 40
    # (shstrtab content read elsewhere via per-section iteration)
    _ = struct.unpack_from("<I", buf, shstr_sh + 16)[0]
    _ = struct.unpack_from("<I", buf, shstr_sh + 20)[0]
    symtab_off = symtab_size = symtab_link = 0
    for i in range(e_shnum):
        base = e_shoff + i * 40
        if struct.unpack_from("<I", buf, base + 4)[0] == 2:
            symtab_off = struct.unpack_from(
                "<I", buf, base + 16,
            )[0]
            symtab_size = struct.unpack_from(
                "<I", buf, base + 20,
            )[0]
            symtab_link = struct.unpack_from(
                "<I", buf, base + 24,
            )[0]
    strtab_sh = e_shoff + symtab_link * 40
    strtab_off = struct.unpack_from(
        "<I", buf, strtab_sh + 16,
    )[0]
    strtab_size = struct.unpack_from(
        "<I", buf, strtab_sh + 20,
    )[0]
    strtab = buf[strtab_off:strtab_off + strtab_size]
    out: list[tuple[str, int, int]] = []
    for i in range(0, symtab_size, 16):
        so = symtab_off + i
        st_name = struct.unpack_from("<I", buf, so)[0]
        if st_name == 0:
            continue
        st_value = struct.unpack_from("<I", buf, so + 4)[0]
        st_info = buf[so + 12]
        end = strtab.find(b"\x00", st_name)
        name = strtab[st_name:end].decode(errors="replace")
        if name in ("$a", "$d", "$t"):
            out.append((name, st_value, st_info & 0xF))
    out.sort(key=lambda t: t[1])
    return out


# --------------------------------------------------------------------------- #
# Heuristic tests
# --------------------------------------------------------------------------- #


class TestArmInstructionHeuristic(unittest.TestCase):
    """`is_likely_arm_instruction` — permissive accept rules."""

    def test_al_condition_instructions_accepted(self) -> None:
        # The canonical AL-condition patterns from brief 192 .s files.
        for word in (
            0xE92D4070,  # STMDB sp!, {r4, r5, r6, lr}
            0xE59F00F8,  # LDR r0, [pc, #0xf8]
            0xEB000000,  # BL <offset=0>
            0xEBFF9C10,  # BL <neg offset>
            0xE8BD8070,  # LDMIA sp!, {r4, r5, r6, pc}
            0xEA000017,  # B
        ):
            self.assertTrue(
                is_likely_arm_instruction(word),
                f"expected ARM accept for 0x{word:08x}",
            )

    def test_predicated_branches_accepted(self) -> None:
        # BEQ/BNE/BLT/BLE patterns from compiler output
        for word in (
            0x0A000022,  # BEQ
            0x1A000031,  # BNE
            0xDA000000,  # BLE
            0xBA000000,  # BLT
        ):
            self.assertTrue(is_likely_arm_instruction(word))

    def test_predicated_data_processing_accepted(self) -> None:
        # The case that broke brief 210's first iteration: brief
        # 192 recipe files contain predicated EQ instructions
        # (early-return chain). All-AL heuristic rejected these
        # and mis-placed the $d boundary, triggering objdiff's
        # ARM crash. Permissive heuristic must accept them.
        for word in (
            0x05971220,  # LDREQ r1, [r7, #0x220]
            0x05940004,  # LDREQ r0, [r4, #0x4]
            0x01510000,  # CMPEQ r1, r0
            0x028DD034,  # ADDEQ sp, sp, #0x34
            0x08BD8FF0,  # LDMEQIA sp!, {r4..r11, pc}
            0x03A00001,  # MOVEQ r0, #1
            0x13A00001,  # MOVNE r0, #1
        ):
            self.assertTrue(
                is_likely_arm_instruction(word),
                f"expected accept for predicated 0x{word:08x}",
            )

    def test_unconditional_special_rejected(self) -> None:
        # Condition 0xF — BLX literal, CPS, SETEND, PLD. Rare in
        # compiler output for ARMv5TE; safe to reject.
        for word in (
            0xF0000000,
            0xFA000000,  # BLX literal
            0xFFFFFFFF,
        ):
            self.assertFalse(is_likely_arm_instruction(word))

    def test_zero_word_rejected(self) -> None:
        # Placeholder bytes — reloc slots, .bss zero-fill,
        # uninitialised padding. Should NOT be promoted.
        self.assertFalse(is_likely_arm_instruction(0x00000000))


# --------------------------------------------------------------------------- #
# End-to-end rewrite tests
# --------------------------------------------------------------------------- #


class TestRewriteAllArmRange(unittest.TestCase):
    """`$d` covers a range of ALL ARM instructions → promote to `$a`."""

    def test_full_promotion_via_st_name(self) -> None:
        # 4 ARM-AL words + 1 $a marker after, single $d at offset 0.
        text = (
            struct.pack("<I", 0xE92D4070)
            + struct.pack("<I", 0xE59F00F8)
            + struct.pack("<I", 0xEB000000)
            + struct.pack("<I", 0xE8BD8070)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$a", 0), ("$d", 4)],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        self.assertEqual(info["d_seen"], 1)
        self.assertEqual(info["d_promoted"], 1)
        self.assertEqual(info["d_split"], 0)
        self.assertEqual(info["d_left_as_data"], 0)
        marks = _collect_mapping(new_elf)
        # $d at 4 should now be $a (and STT_FUNC).
        names_by_value = {v: (n, t) for n, v, t in marks}
        self.assertEqual(names_by_value[4][0], "$a")
        self.assertEqual(names_by_value[4][1], STT_FUNC)

    def test_st_info_type_flips_to_stt_func(self) -> None:
        # Promoted $d must have its st_info type nibble updated
        # to STT_FUNC, matching mwasmarm's $a convention.
        # Without this, objdiff panics on the name/type mismatch.
        text = struct.pack("<I", 0xE3A00001) + struct.pack("<I", 0xE1A0F00E)
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$a", 0), ("$d", 4)],
        )
        new_elf, _ = rewrite_mapping_symbols(elf)
        marks = _collect_mapping(new_elf)
        # Both should be $a, both STT_FUNC.
        for _name, _value, t in marks:
            self.assertEqual(t, STT_FUNC)


class TestRewritePartialArmRange(unittest.TestCase):
    """`$d` covers a range with leading ARM, trailing data — move
    `st_value` to the boundary so `$d` covers only the data."""

    def test_partial_split_via_st_value(self) -> None:
        # Mixed range: ARM-AL prefix, all-zero tail. The
        # permissive heuristic accepts non-0xF non-zero words;
        # zero words are explicitly rejected. So a $d covering
        # [ARM, ARM, 0, 0] has its boundary at the first zero.
        text = (
            struct.pack("<I", 0xE92D4070)   # ARM
            + struct.pack("<I", 0xE8BD8070)   # ARM
            + struct.pack("<I", 0x00000000)   # data (zero placeholder)
            + struct.pack("<I", 0x00000000)   # data
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$a", 0), ("$d", 0x4)],
        )
        # $a covers [0, 4), $d covers [4, end=16). bytes at
        # [4, 8) = ARM, bytes at [8, 16) = zeros. The boundary
        # should be 8 (first zero word).
        new_elf, info = rewrite_mapping_symbols(elf)
        self.assertEqual(info["d_seen"], 1)
        self.assertEqual(info["d_split"], 1)
        self.assertEqual(info["d_promoted"], 0)
        marks = _collect_mapping(new_elf)
        names_by_value = {v: n for n, v, _ in marks}
        # $d should now be at offset 8 (the boundary).
        self.assertIn(8, names_by_value)
        self.assertEqual(names_by_value[8], "$d")
        # st_info stays STT_OBJECT for the still-$d symbol.
        for n, v, t in marks:
            if v == 8 and n == "$d":
                self.assertEqual(t, STT_OBJECT)


class TestRewriteAllDataRange(unittest.TestCase):
    """`$d` covers data-only — no change."""

    def test_no_change_when_all_data(self) -> None:
        # Two zero-word data placeholders. The permissive
        # heuristic accepts most non-AL non-zero patterns, so
        # to test "all data" we use zero words explicitly.
        text = (
            struct.pack("<I", 0x00000000)
            + struct.pack("<I", 0x00000000)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$d", 0)],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        self.assertEqual(info["d_seen"], 1)
        self.assertEqual(info["d_left_as_data"], 1)
        self.assertEqual(info["d_promoted"], 0)
        self.assertEqual(info["d_split"], 0)
        # Bytes unchanged.
        self.assertEqual(new_elf, elf)


class TestThumbFilesSkipped(unittest.TestCase):
    """Files with `$t` (Thumb) mapping symbols are out of scope —
    the AL/predicated ARM heuristic doesn't apply to Thumb code."""

    def test_thumb_file_left_alone(self) -> None:
        text = (
            b"\x00\x22"   # MOVS r2, #0 (Thumb)
            + b"\x05\xDF"  # SWI 5
            + b"\x70\x47"  # BX LR
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$t", 0), ("$d", 6)],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        # File should be unchanged.
        self.assertEqual(info["d_promoted"], 0)
        self.assertEqual(info["d_split"], 0)
        self.assertEqual(info["d_left_as_data"], 0)
        self.assertFalse(info["mass_renamed"])
        self.assertEqual(new_elf, elf)


class TestMassRenameFallback(unittest.TestCase):
    """When no existing `$a\\0` exists in strtab AND all `$d`
    ranges are entirely-ARM, mass-rename via strtab overwrite."""

    def test_mass_rename_when_no_a_in_strtab(self) -> None:
        # File has only $d, no $a. All bytes are ARM-AL.
        text = (
            struct.pack("<I", 0xE92D4070)
            + struct.pack("<I", 0xE8BD8070)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$d", 0)],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        self.assertTrue(info["mass_renamed"])
        self.assertEqual(info["d_promoted"], 1)
        # The single $d should now read as $a in strtab.
        marks = _collect_mapping(new_elf)
        self.assertEqual([n for n, _, _ in marks], ["$a"])

    def test_no_mass_rename_when_mixed(self) -> None:
        # File has only $d (no $a). One range is ARM, the next is
        # an all-zero data placeholder → can't mass-rename without
        # misclassifying the data range.
        text = (
            struct.pack("<I", 0xE92D4070)
            + struct.pack("<I", 0x00000000)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$d", 0), ("$d", 4)],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        self.assertFalse(info["mass_renamed"])
        self.assertEqual(info["d_promoted"], 0)
        self.assertEqual(new_elf, elf)


class TestIdempotency(unittest.TestCase):
    """Re-running the rewrite produces no further changes."""

    def test_double_run_no_change(self) -> None:
        text = (
            struct.pack("<I", 0xE92D4070)
            + struct.pack("<I", 0xE59F00F8)
            + struct.pack("<I", 0xE8BD8070)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$a", 0), ("$d", 4)],
        )
        once, info1 = rewrite_mapping_symbols(elf)
        twice, info2 = rewrite_mapping_symbols(once)
        # Second pass should see 0 $d (already promoted) and
        # make no changes.
        self.assertEqual(info2["d_seen"], 0)
        self.assertEqual(once, twice)


# --------------------------------------------------------------------------- #
# Real-fixture smoke test
# --------------------------------------------------------------------------- #


class TestRealFixtureSmoke(unittest.TestCase):
    """Sanity check against the canonical brief 192 pick if its
    `.o.resolved` file is present in the build tree. Skipped on
    fresh checkouts."""

    def test_func_ov011_021ca9e8(self) -> None:
        root = Path(__file__).resolve().parent.parent
        built = root / (
            "build/eur/src/overlay011/func_ov011_021ca9e8.o.resolved"
        )
        if not built.is_file():
            self.skipTest(
                "build artifacts not present — "
                "run `ninja report` first",
            )
        buf = built.read_bytes()
        _new_buf, info = rewrite_mapping_symbols(buf)
        # Canonical brief 192 / 209 invariant: this file either
        # has $d symbols to promote (fresh build) OR has already
        # been processed (subsequent run, idempotent — d_seen=0).
        # Both states are acceptable; we just confirm the tool
        # didn't crash and produced a sensible info dict.
        self.assertIn("d_seen", info)
        if info["d_seen"] > 0:
            # Fresh state: expect at least one promotion.
            self.assertGreaterEqual(
                info["d_promoted"] + info["d_split"], 1,
            )
            self.assertFalse(info["mass_renamed"])


# --------------------------------------------------------------------------- #
# Defensive parsing
# --------------------------------------------------------------------------- #


class TestMalformedInput(unittest.TestCase):
    """Defensive checks for malformed ELF inputs."""

    def test_not_elf_raises(self) -> None:
        with self.assertRaises(MappingSymbolRewriteError):
            rewrite_mapping_symbols(b"not an ELF file at all")

    def test_truncated_header_raises(self) -> None:
        with self.assertRaises(MappingSymbolRewriteError):
            rewrite_mapping_symbols(b"\x7fELF" + b"\x00" * 10)


if __name__ == "__main__":
    unittest.main()
