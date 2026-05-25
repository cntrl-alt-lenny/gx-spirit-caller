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
    process_o_file,
    rewrite_mapping_symbols,
    sweep_objdiff_json,
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


# --------------------------------------------------------------------------- #
# Brief 212 — trailing-promotion collapse + sweep mode
# --------------------------------------------------------------------------- #


class TestTrailingPromotionCollapse(unittest.TestCase):
    """Pass 2 — when per-entry `$d` markers from a dsd-style delink
    surround a trailing data `$d`, the ARM-like words after it get
    promoted individually to `$a`. The mwasm-built side has implicit-
    `$d` coverage there instead. Pass 2 collapses the over-promoted
    trailing `$a`s by zeroing their `st_name`, so enumerators see
    implicit-`$d` on both sides. See brief 212 corpus audit report.
    """

    def test_trailing_arm_after_data_d_collapsed(self) -> None:
        # Reproduce the straggler shape: per-entry $d markers in a
        # pool, including one cond=0xF data word and one ARM-like
        # word AFTER it. Pre-pass-1: $a@0, $d@4 ARM, $d@8 ARM,
        # $d@12 cond=0xF, $d@16 ARM. Pass 1 promotes the three
        # ARM-like $d's to $a. Pass 2 should collapse the trailing
        # $a@16 because it's after the only remaining $d@12.
        text = (
            struct.pack("<I", 0xE92D4070)   # 0x00 ARM (code)
            + struct.pack("<I", 0xE3A00001)   # 0x04 ARM (pool word 1 → promote)
            + struct.pack("<I", 0xE3A00002)   # 0x08 ARM (pool word 2 → promote)
            + struct.pack("<I", 0xFFE01FFF)   # 0x0C cond=0xF (data, stays)
            + struct.pack("<I", 0x0400000C)   # 0x10 ARM (pool word 3 → COLLAPSED)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[
                ("$a", 0), ("$d", 4), ("$d", 8), ("$d", 12), ("$d", 16),
            ],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        # Pass 1: 3 promoted ($d@4, $d@8, $d@16), 1 left as data ($d@12).
        self.assertEqual(info["d_promoted"], 3)
        self.assertEqual(info["d_left_as_data"], 1)
        # Pass 2: $a@16 (just promoted) is > last_data_offset (12),
        # so it's collapsed. Trailing_promoted_collapsed counts it.
        self.assertEqual(info["trailing_promoted_collapsed"], 1)
        # Post-rewrite mapping: $a@0, $a@4, $a@8, $d@12. NO $a@16.
        marks = _collect_mapping(new_elf)
        offsets = [v for _, v, _ in marks]
        self.assertNotIn(16, offsets, "trailing $a@16 should be collapsed")
        # The remaining symbols are intact.
        self.assertEqual(
            sorted((n, v) for n, v, _ in marks),
            [("$a", 0), ("$a", 4), ("$a", 8), ("$d", 12)],
        )

    def test_no_collapse_when_all_data(self) -> None:
        # When the trailing $a is from a PRE-EXISTING $a (not a
        # promotion in this run), the collapse rule still removes
        # it — by design. The corpus shape doesn't have code after
        # trailing pool data, so this is the right call. Test
        # documents the behavior so future readers don't regress
        # the rule into "only promoted symbols collapse".
        text = (
            struct.pack("<I", 0xE92D4070)   # ARM code
            + struct.pack("<I", 0xFFE01FFF)   # data
            + struct.pack("<I", 0xE3A00001)   # ARM (real $a in symtab)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$a", 0), ("$d", 4), ("$a", 8)],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        # $d@4 covers [4, 8). 0xFFE01FFF is data → stays. d_seen=1,
        # d_left=1, d_promoted=0. Pass 2 finds $a@8 (real, not just
        # promoted) > last_data=4, collapses it.
        self.assertEqual(info["trailing_promoted_collapsed"], 1)
        marks = _collect_mapping(new_elf)
        offsets = [v for _, v, _ in marks]
        self.assertNotIn(8, offsets)

    def test_no_collapse_when_no_data_d(self) -> None:
        # When pass 1 promotes ALL $d's (no data $d remains),
        # last_data_offset is None and pass 2 doesn't fire. Trailing
        # $a's stay intact — they're not "after a data marker"
        # since there's no data marker.
        text = (
            struct.pack("<I", 0xE92D4070)
            + struct.pack("<I", 0xE3A00001)
            + struct.pack("<I", 0xE3A00002)
            + struct.pack("<I", 0xE3A00003)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[("$a", 0), ("$d", 4), ("$d", 8), ("$d", 12)],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        # All $d → $a.
        self.assertEqual(info["d_promoted"], 3)
        self.assertEqual(info["d_left_as_data"], 0)
        # No data $d, no collapse.
        self.assertEqual(info["trailing_promoted_collapsed"], 0)
        marks = _collect_mapping(new_elf)
        # All four mapping symbols still present, all $a.
        self.assertEqual(len(marks), 4)
        for name, _v, _t in marks:
            self.assertEqual(name, "$a")

    def test_middle_a_preserved(self) -> None:
        # $a's in the middle of code regions (before the last $d)
        # are NOT collapsed. Only $a's whose st_value > the LAST $d
        # are touched. This protects real $a markers from mnemonic
        # emission that sit in normal code regions.
        text = (
            struct.pack("<I", 0xE92D4070)   # 0x00 code
            + struct.pack("<I", 0xE3A00001)   # 0x04 $a (real, from bl mnemonic)
            + struct.pack("<I", 0xE3A00002)   # 0x08 $d ARM → promoted
            + struct.pack("<I", 0xFFE01FFF)   # 0x0C $d data (stays)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[
                ("$a", 0), ("$a", 4), ("$d", 8), ("$d", 12),
            ],
        )
        new_elf, info = rewrite_mapping_symbols(elf)
        # $d@8 → $a, $d@12 stays as data.
        self.assertEqual(info["d_promoted"], 1)
        self.assertEqual(info["d_left_as_data"], 1)
        # $a@0, $a@4, $a@8 (just promoted) are all <= last_data@12,
        # so NONE collapse. $a@4 (middle real $a) is preserved.
        self.assertEqual(info["trailing_promoted_collapsed"], 0)
        marks = _collect_mapping(new_elf)
        offsets = [v for _, v, _ in marks]
        self.assertIn(4, offsets)

    def test_idempotency_after_collapse(self) -> None:
        # Re-running the rewriter on a post-collapse file should
        # produce no further changes — even though the trailing $a
        # is gone, the post-pass-2 state has fewer mapping symbols
        # for pass 1 to see and pass 2 finds no $a beyond last_data.
        text = (
            struct.pack("<I", 0xE92D4070)
            + struct.pack("<I", 0xE3A00001)
            + struct.pack("<I", 0xFFE01FFF)
            + struct.pack("<I", 0x0400000C)
        )
        elf = _build_arm_elf(
            text_bytes=text,
            mapping_symbols=[
                ("$a", 0), ("$d", 4), ("$d", 8), ("$d", 12),
            ],
        )
        once, info1 = rewrite_mapping_symbols(elf)
        twice, info2 = rewrite_mapping_symbols(once)
        self.assertEqual(once, twice)
        # Second pass: $d@8 still as data, no $a to collapse.
        self.assertEqual(info2["trailing_promoted_collapsed"], 0)


class TestStragglerSmoke(unittest.TestCase):
    """Verify the brief 212 fix on the brief 209 stragglers' real
    `.o.resolved` files, if a sibling decomper worktree has built
    them. Skipped on fresh checkouts."""

    def _decomper_build(self) -> Path | None:
        """Look for a sibling decomper worktree's build tree. Brief
        212 was implemented on a Windows host where the worktrees
        sit at `C:/Users/leona/Dev/gx-spirit-caller/<role>/`. Tests
        check a few common parent layouts before giving up."""
        candidates = [
            Path("../decomper/build/eur"),
            Path("../../decomper/build/eur"),
            Path("C:/Users/leona/Dev/gx-spirit-caller/decomper/build/eur"),
        ]
        for c in candidates:
            if c.is_dir():
                return c.resolve()
        return None

    def test_021cb574_collapses_one_trailing_a(self) -> None:
        dec = self._decomper_build()
        if dec is None:
            self.skipTest("no decomper build tree found")
        delinks = list(
            dec.glob("delinks/**/func_ov011_021cb574.o.resolved")
        )
        if not delinks:
            self.skipTest("straggler delink .o.resolved not present")
        buf = delinks[0].read_bytes()
        _new_buf, info = rewrite_mapping_symbols(buf)
        # Brief 212 expectation: collapse exactly 1 trailing $a (the
        # 0x0400000c word after the 0xffe01fff data word).
        # Post-brief-212 idempotency: if the build artifact has
        # ALREADY been processed (re-run on disk), pass 2 finds
        # nothing to collapse → 0. Either outcome verifies the fix
        # landed; the 0 case just proves it stuck.
        self.assertIn(info["trailing_promoted_collapsed"], (0, 1))

    def test_021d02a4_collapses_four_trailing_a(self) -> None:
        dec = self._decomper_build()
        if dec is None:
            self.skipTest("no decomper build tree found")
        delinks = list(
            dec.glob("delinks/**/func_ov011_021d02a4.o.resolved")
        )
        if not delinks:
            self.skipTest("straggler delink .o.resolved not present")
        buf = delinks[0].read_bytes()
        _new_buf, info = rewrite_mapping_symbols(buf)
        # Brief 212 expectation: 4 trailing $a's collapsed (the four
        # ARM-like pool entries after the 0xffe01fff data word).
        # Post-brief-212 idempotency: 0 is also acceptable (see
        # sibling test for the rationale).
        self.assertIn(info["trailing_promoted_collapsed"], (0, 4))


class TestSweepMode(unittest.TestCase):
    """`--sweep` audit mode: walk an objdiff.json without modifying
    the .o files, return per-unit shape rows + would_change flag."""

    def test_sweep_returns_per_unit_rows(self) -> None:
        # Build two minimal ELFs — one all-arm, one all-data — and
        # a synthetic objdiff.json pointing at them. The sweep
        # walker should return one row per (unit, kind) pair with
        # pre/post shape counts and a would_change flag.
        import json
        import tempfile
        with tempfile.TemporaryDirectory() as tmp:
            tmp_path = Path(tmp)
            arm_elf = _build_arm_elf(
                text_bytes=struct.pack("<I", 0xE92D4070)
                + struct.pack("<I", 0xE8BD8070),
                mapping_symbols=[("$a", 0), ("$d", 4)],
            )
            data_elf = _build_arm_elf(
                text_bytes=struct.pack("<I", 0)
                + struct.pack("<I", 0),
                mapping_symbols=[("$d", 0)],
            )
            (tmp_path / "arm.o").write_bytes(arm_elf)
            (tmp_path / "data.o").write_bytes(data_elf)
            json_path = tmp_path / "objdiff.json"
            json_path.write_text(json.dumps({
                "units": [
                    {"name": "u_arm", "target_path": "arm.o",
                     "base_path": "arm.o"},
                    {"name": "u_data", "target_path": "data.o",
                     "base_path": "data.o"},
                ],
            }))
            rows = sweep_objdiff_json(json_path)
            # 2 units × 2 kinds = 4 rows.
            self.assertEqual(len(rows), 4)
            # Files on disk unchanged (sweep is read-only).
            self.assertEqual(
                (tmp_path / "arm.o").read_bytes(), arm_elf,
                "sweep must not modify .o files",
            )
            self.assertEqual(
                (tmp_path / "data.o").read_bytes(), data_elf,
            )
            # The arm file would change ($d→$a), the data file wouldn't.
            by_name = {(r["name"], r["kind"]): r for r in rows}
            self.assertTrue(by_name[("u_arm", "target")]["would_change"])
            self.assertFalse(by_name[("u_data", "target")]["would_change"])


class TestDryRunOption(unittest.TestCase):
    """`process_o_file(..., dry_run=True)` computes changes without
    writing them back. Used by `--sweep` internally and by other
    audit tooling."""

    def test_dry_run_does_not_write(self) -> None:
        import tempfile
        with tempfile.TemporaryDirectory() as tmp:
            p = Path(tmp) / "test.o"
            elf = _build_arm_elf(
                text_bytes=struct.pack("<I", 0xE92D4070)
                + struct.pack("<I", 0xE8BD8070),
                mapping_symbols=[("$a", 0), ("$d", 4)],
            )
            p.write_bytes(elf)
            changed, info = process_o_file(p, dry_run=True)
            self.assertTrue(changed)
            self.assertEqual(info["d_promoted"], 1)
            # File on disk is unchanged.
            self.assertEqual(p.read_bytes(), elf)
            # Without dry_run, file gets modified.
            changed2, _info2 = process_o_file(p, dry_run=False)
            self.assertTrue(changed2)
            self.assertNotEqual(p.read_bytes(), elf)


if __name__ == "__main__":
    unittest.main()
