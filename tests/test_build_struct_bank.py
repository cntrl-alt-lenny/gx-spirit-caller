"""Tests for tools/build_struct_bank.py (brief 609 struct/type bank miner).

All tests run against hand-built `objdump -d -r` text fixtures -- no real
build tree needed, matching brief 609's explicit "unit-test the miner's
offset->type inference on a small objdump fixture" requirement. Fixture
spacing (hex-bytes SPACE-then-TAB mnemonic TAB operands) matches a real
`arm-none-eabi-objdump -d -r --architecture=armv5te` dump byte-for-byte
(verified against build/eur/delinks/src/overlay002/func_ov002_021b141c.o
during development -- see brief-609 doc).
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))

from build_struct_bank import (  # noqa: E402
    Access,
    aggregate,
    mine_object_text,
    parse_symbol_accesses,
    render_context_block,
    render_struct,
    update_header,
)

SYM = "data_test_sym"


def fn(name: str, addr: int, body: str, pool_addr: int, pool_label: str = ".L_pool") -> str:
    """One synthetic function + its trailing pool word, in objdump -d -r shape."""
    return (
        f"{addr:08x} <{name}>:\n"
        f"{body}"
        f"{pool_addr:08x} <{pool_label}>:\n"
        f"  {pool_addr:x}:\t00000000 \t\t\t\t....\n"
        f"\t\t\t{pool_addr:x}: R_ARM_ABS32\t{SYM}\n"
    )


class TestPoolLoadAndBasicWidths(unittest.TestCase):
    def test_word_load_and_store_same_offset(self):
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te5901010 \tldr\tr1, [r0, #16]\t@ 0x10\n"
            "   8:\te5801010 \tstr\tr1, [r0, #16]\t@ 0x10\n"
        ), 0xc)
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(len(accesses), 2)
        self.assertTrue(all(a.offset == 16 for a in accesses))
        self.assertEqual({a.mnemonic for a in accesses}, {"ldr", "str"})
        self.assertFalse(accesses[0].is_store)
        self.assertTrue(accesses[1].is_store)

    def test_implicit_zero_offset_is_recognized(self):
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te5901000 \tldr\tr1, [r0]\t@ 0\n"
        ), 0xc)
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(accesses[0].offset, 0)

    def test_predicated_store_is_recognized(self):
        """streq must be attributed as a `str` access, not silently
        dropped -- the exact bug found mining the real ov002 build."""
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te3500000 \tcmp\tr0, #0\n"
            "   8:\t05801010 \tstreq\tr1, [r0, #16]\t@ 0x10\n"
        ), 0xc)
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(len(accesses), 1)
        self.assertEqual(accesses[0].mnemonic, "str")
        self.assertTrue(accesses[0].is_store)

    def test_halfword_unsigned_vs_signed(self):
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te1d012b0 \tldrh\tr1, [r0, #32]\t@ 0x20\n"
            "   8:\te1d032f0 \tldrsh\tr3, [r0, #36]\t@ 0x24\n"
        ), 0xc)
        accesses = parse_symbol_accesses(text, SYM)
        by_off = {a.offset: a for a in accesses}
        self.assertEqual(by_off[32].mnemonic, "ldrh")
        self.assertEqual(by_off[36].mnemonic, "ldrsh")

    def test_byte_unsigned_vs_signed(self):
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te5d01030 \tldrb\tr1, [r0, #48]\t@ 0x30\n"
            "   8:\te1d032d4 \tldrsb\tr3, [r0, #52]\t@ 0x34\n"
        ), 0xc)
        accesses = parse_symbol_accesses(text, SYM)
        by_off = {a.offset: a for a in accesses}
        self.assertEqual(by_off[48].mnemonic, "ldrb")
        self.assertEqual(by_off[52].mnemonic, "ldrsb")


class TestBitfieldDetection(unittest.TestCase):
    def test_bit0_aligned_bitfield_is_a_symmetric_shift_pair(self):
        """13-bit field via lsl#19;lsr#19 -- the exact Ov002Slot shape
        ov002_core.h:37-38 already documents as match-critical (`slot.id
        is a 13-bit field read lsl#19;lsr#19 -- type it as a BITFIELD,
        never (v<<19)>>19`). A bit-0-aligned N-bit field's extraction is
        ALWAYS symmetric (lsl#(32-N);lsr#(32-N) -- same K both times) by
        construction; this is a different shape from brief 596's P-1
        wall, which is mwcc collapsing a symmetric shift written as *C
        source* to a single `and` -- it does not collapse the shift pair
        a real bitfield MEMBER access compiles to. An earlier draft of
        `_detect_bitfield` rejected K1==K2 on a backwards reading of that
        finding and broke on exactly this, the project's own documented
        ground truth."""
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te5902040 \tldr\tr2, [r0, #64]\t@ 0x40\n"
            "   8:\te1a02982 \tlsl\tr2, r2, #19\n"
            "   c:\te1a029a2 \tlsr\tr2, r2, #19\n"
        ), 0x10)
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(len(accesses), 1)
        a = accesses[0]
        self.assertEqual(a.offset, 64)
        self.assertEqual(a.bitfield_width, 13)
        self.assertEqual(a.bitfield_shift, 0)

    def test_offset_shifted_bitfield(self):
        """A field that isn't bit-0-aligned: lsl#17 then lsr#23 -> width
        32-23=9, shift 23-17=6 (bits 6..14)."""
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te5902048 \tldr\tr2, [r0, #72]\t@ 0x48\n"
            "   8:\te1a02882 \tlsl\tr2, r2, #17\n"
            "   c:\te1a02ba2 \tlsr\tr2, r2, #23\n"
        ), 0x10)
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(accesses[0].bitfield_width, 9)
        self.assertEqual(accesses[0].bitfield_shift, 6)

    def test_mov_lsl_lsr_alt_rendering_also_detected(self):
        """objdump sometimes renders the identical shift-register encoding
        as `mov rD,rD,lsl #N` instead of the `lsl rD,rD,#N` pseudo-op
        (brief 596's own P-1 finding) -- must be recognized either way."""
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te590204c \tldr\tr2, [r0, #76]\t@ 0x4c\n"
            "   8:\te1a02982 \tmov\tr2, r2, lsl #19\n"
            "   c:\te1a029a2 \tmov\tr2, r2, lsr #19\n"
        ), 0x10)
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(accesses[0].bitfield_width, 13)


class TestRegisterLiveness(unittest.TestCase):
    def test_overwritten_base_register_stops_attribution(self):
        text = fn("f", 0, (
            "   0:\te59f000c \tldr\tr0, [pc, #12]\t@ 10 <.L_pool>\n"
            "   4:\te5901010 \tldr\tr1, [r0, #16]\t@ 0x10\n"
            "   8:\te3a00005 \tmov\tr0, #5\n"
            "   c:\te5901020 \tldr\tr2, [r0, #32]\t@ 0x20\n"
        ), 0x10)
        accesses = parse_symbol_accesses(text, SYM)
        # only the access BEFORE r0 was clobbered by `mov r0,#5` counts
        self.assertEqual(len(accesses), 1)
        self.assertEqual(accesses[0].offset, 16)

    def test_pop_reloading_base_register_stops_attribution(self):
        """A register-list load (`pop`/`ldm`) overwrites every register it
        names -- must be recognized as a clobber even though it doesn't
        match the single-dest-operand shape most other writes do."""
        text = fn("f", 0, (
            "   0:\te59f0010 \tldr\tr0, [pc, #16]\t@ 14 <.L_pool>\n"
            "   4:\te5901010 \tldr\tr1, [r0, #16]\t@ 0x10\n"
            "   8:\te8bd0001 \tpop\t{r0}\n"
            "   c:\te5901020 \tldr\tr2, [r0, #32]\t@ 0x20\n"
        ), 0x14)
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(len(accesses), 1)
        self.assertEqual(accesses[0].offset, 16)

    def test_predicated_pop_also_recognized(self):
        text = fn("f", 0, (
            "   0:\te59f0010 \tldr\tr0, [pc, #16]\t@ 14 <.L_pool>\n"
            "   4:\te5901010 \tldr\tr1, [r0, #16]\t@ 0x10\n"
            "   8:\t08bd0001 \tpopeq\t{r0}\n"
            "   c:\te5901020 \tldr\tr2, [r0, #32]\t@ 0x20\n"
        ), 0x14)
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(len(accesses), 1)

    def test_unrelated_pool_symbol_is_ignored(self):
        """A pool slot resolving a DIFFERENT symbol must not contribute
        accesses to ours, even if the code shape looks identical."""
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_other>\n"
            "   4:\te5901010 \tldr\tr1, [r0, #16]\t@ 0x10\n"
        ), 0xc, pool_label=".L_other")
        text = text.replace(SYM, "data_unrelated_sym")
        accesses = parse_symbol_accesses(text, SYM)
        self.assertEqual(accesses, [])


class TestAggregateDisagreement(unittest.TestCase):
    def test_consistent_width_no_disagreement(self):
        accesses = [
            Access(offset=16, mnemonic="ldr", is_store=False, site="a"),
            Access(offset=16, mnemonic="ldr", is_store=False, site="b"),
            Access(offset=16, mnemonic="str", is_store=True, site="c"),
        ]
        fields = aggregate(accesses)
        self.assertIsNone(fields[16].disagreement)
        self.assertEqual(fields[16].width, 4)
        self.assertEqual(fields[16].n_sites, 3)

    def test_width_disagreement_is_flagged(self):
        """The brief's own honesty requirement: a real disagreement at one
        offset (word here, halfword there) must surface as a flag to
        investigate -- a union or a miscall -- never silently resolved."""
        accesses = [
            Access(offset=32, mnemonic="ldr", is_store=False, site="a"),
            Access(offset=32, mnemonic="ldrh", is_store=False, site="b"),
        ]
        fields = aggregate(accesses)
        self.assertIsNotNone(fields[32].disagreement)
        self.assertIn("width", fields[32].disagreement)

    def test_signedness_disagreement_is_flagged(self):
        accesses = [
            Access(offset=32, mnemonic="ldrh", is_store=False, site="a"),
            Access(offset=32, mnemonic="ldrsh", is_store=False, site="b"),
        ]
        fields = aggregate(accesses)
        self.assertIsNotNone(fields[32].disagreement)
        self.assertIn("signedness", fields[32].disagreement)

    def test_bitfield_shape_disagreement_is_flagged(self):
        accesses = [
            Access(offset=64, mnemonic="ldr", is_store=False,
                   bitfield_width=13, bitfield_shift=0, site="a"),
            Access(offset=64, mnemonic="ldr", is_store=False,
                   bitfield_width=1, bitfield_shift=31, site="b"),
        ]
        fields = aggregate(accesses)
        self.assertIsNotNone(fields[64].disagreement)
        self.assertIn("bitfield", fields[64].disagreement)

    def test_bitfield_vs_plain_mix_at_same_offset_is_flagged(self):
        """Live case at ov002 +0xd44: ~304 sites narrow a word load to 16
        bits (lsl#16;lsr#16) but func_ov002_021d1be4.o reads the SAME
        offset as a plain, un-narrowed word with no shift pair at all.
        Same instruction (`ldr`), same width (4) -- a width/signedness-only
        comparison can't see this at all; it has to be checked explicitly,
        or the disagreement silently vanishes into 'no disagreements
        found' the moment even one bitfield-shaped site exists."""
        accesses = [
            Access(offset=0xd44, mnemonic="ldr", is_store=False,
                   bitfield_width=16, bitfield_shift=0, site="a"),
            Access(offset=0xd44, mnemonic="ldr", is_store=False,
                   bitfield_width=16, bitfield_shift=0, site="b"),
            Access(offset=0xd44, mnemonic="ldr", is_store=False, site="c"),  # plain, no bitfield
        ]
        fields = aggregate(accesses)
        self.assertIsNotNone(fields[0xd44].disagreement)
        self.assertIn("1/3", fields[0xd44].disagreement)

    def test_disagreement_emits_the_majority_shape_not_any_bitfield(self):
        """Live case at ov002 +0xd44: 1 narrowed read among 142 total loads
        must NOT make the emitted field a bitfield -- the naive "a bitfield
        was seen, so report one" rule is exactly backwards when the
        narrowed read is the minority. The disagreement note still carries
        both counts either way; only the STRUCT FIELD TYPE follows the
        vote."""
        accesses = (
            [Access(offset=0xd44, mnemonic="ldr", is_store=False,
                    bitfield_width=16, bitfield_shift=0, site="bf")] +
            [Access(offset=0xd44, mnemonic="ldr", is_store=False, site=f"plain{i}")
             for i in range(5)]
        )
        fields = aggregate(accesses)
        f = fields[0xd44]
        self.assertIsNotNone(f.disagreement)
        self.assertIsNone(f.bitfield_width)
        self.assertEqual(f.c_type(), "int")


class TestBatchAndContextEmission(unittest.TestCase):
    def test_one_objdump_result_can_feed_multiple_symbols(self):
        text = fn("f", 0, (
            "   0:\te59f0008 \tldr\tr0, [pc, #8]\t@ c <.L_pool>\n"
            "   4:\te5901010 \tldr\tr1, [r0, #16]\t@ 0x10\n"
        ), 0xc)
        result = mine_object_text(text, Path("sample.o"), [SYM, "data_other"])
        self.assertEqual(result[SYM][0].offset, 16)
        self.assertEqual(result["data_other"], [])

    def test_context_block_preserves_real_build_declaration(self):
        fields = aggregate([Access(offset=4, mnemonic="ldr", is_store=False)])
        block = render_context_block(fields, "Demo", SYM, f"extern char {SYM}[];")
        self.assertIn("#ifdef M2C_CONTEXT_BUILD", block)
        self.assertIn(f"extern struct Demo {SYM};", block)
        self.assertIn(f"#else\nextern char {SYM}[];\n#endif", block)

    def test_render_omits_ambiguous_overlapping_field(self):
        fields = aggregate([
            Access(offset=0, mnemonic="ldr", is_store=False),
            Access(offset=2, mnemonic="ldrh", is_store=False),
        ])
        block = render_struct(fields, "Demo", SYM)
        self.assertIn("omitted overlapping field at +0x0", block)
        self.assertIn("u16 f_2", block)
        self.assertNotIn("int f_0;", block)

    def test_header_update_wraps_only_plain_declarations(self):
        with tempfile.TemporaryDirectory() as tmp:
            header = Path(tmp) / "core.h"
            header.write_text(
                "extern char data_ov002_022d0000[]; /* keep */\n"
                "#ifdef M2C_CONTEXT_BUILD\n"
                "extern struct Existing data_ov002_022d0004;\n"
                "#else\n"
                "extern char data_ov002_022d0004[];\n"
                "#endif\n"
            )
            fields = aggregate([Access(offset=4, mnemonic="ldr", is_store=False)])
            added = update_header(header, {"data_ov002_022d0000": fields,
                                           "data_ov002_022d0004": fields})
            text = header.read_text()
            self.assertEqual(added, 1)
            self.assertEqual(text.count("extern struct"), 2)
            self.assertIn("#else\nextern char data_ov002_022d0000[]; /* keep */\n#endif", text)

    def test_bitfield_plus_store_is_not_a_disagreement(self):
        """A store at the same offset never carries bitfield info (there's
        no narrowing on write in this project's observed idioms) -- it
        must not be treated as a 'plain load' contradicting the narrowed
        reads."""
        accesses = [
            Access(offset=0xd44, mnemonic="ldr", is_store=False,
                   bitfield_width=16, bitfield_shift=0, site="a"),
            Access(offset=0xd44, mnemonic="str", is_store=True, site="b"),
        ]
        fields = aggregate(accesses)
        self.assertIsNone(fields[0xd44].disagreement)

    def test_store_only_offset_has_no_signedness_opinion(self):
        """Stores don't carry sign information (strh has no `strsh`) --
        a store-only offset must not be flagged just because signedness
        was never observed."""
        accesses = [Access(offset=16, mnemonic="str", is_store=True, site="a")]
        fields = aggregate(accesses)
        self.assertIsNone(fields[16].disagreement)
        self.assertIsNone(fields[16].signed)


class TestRenderStruct(unittest.TestCase):
    def test_padding_and_field_order(self):
        fields = aggregate([
            Access(offset=4, mnemonic="ldr", is_store=False, site="a"),
            Access(offset=12, mnemonic="ldrh", is_store=False, site="b"),
        ])
        out = render_struct(fields, "TestStruct", "data_test_sym")
        self.assertIn("struct TestStruct {", out)
        self.assertIn("char _pad0[4];", out)   # 0..4
        self.assertIn("int f_4;", out)
        self.assertIn("char _pad1[4];", out)   # 8..12 (after the 4-byte int ends at 8)
        self.assertIn("u16 f_c;", out)
        self.assertIn("extern struct TestStruct data_test_sym;", out)
        self.assertLess(out.index("f_4"), out.index("f_c"))

    def test_bitfield_renders_colon_width(self):
        fields = aggregate([
            Access(offset=0, mnemonic="ldr", is_store=False,
                   bitfield_width=13, bitfield_shift=0, site="a"),
        ])
        out = render_struct(fields, "TestStruct", "data_test_sym")
        self.assertIn("unsigned int f_0 : 13;", out)


if __name__ == "__main__":
    unittest.main()
