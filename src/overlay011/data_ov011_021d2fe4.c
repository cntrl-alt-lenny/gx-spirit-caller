/* data_ov011_021d2fe4 (20 bytes, 4-aligned): 5-slot short coordinate-
 * shaped table (10 x u16: 0/0xa8, 0xa0/0xa8, 0xc0/0xa8, 0xe0/0xa8,
 * 0xe0/0). LOWER CONFIDENCE than its siblings in this batch -- see
 * rationale below.
 * Consumer: src/overlay011/func_ov011_021cb574.s (Ov011_ViewModeTransition,
 * 1520-byte GLOBAL_ASM cross-overlay-BL wall, shipped as raw opcode
 * words). Hand-decoded: `.word 0xe59f7384` at file offset 0x2c4 (line
 * 193) = `ldr r7,[pc,#0x384]`, resolving to file offset 0x5d0 = ARM addr
 * 0x021cbb44 (relocs.txt from:0x021cbb44 kind:load to:0x021d2fe4) --
 * matches exactly. The same 5-instruction cluster also loads
 * data_ov011_021d41a0 (documented actor table, stride 0x14),
 * data_ov011_021d2ff8, func_ov011_021cc4c8 (verified via
 * ov011/relocs.txt:315 from:0x021cbb48 to:0x021cc4c8), and
 * data_ov011_021d2fb4 -- a per-actor loop over several parallel tables
 * + callback. The specific per-element read instruction was NOT
 * further hand-disassembled (this function is a documented "wall",
 * brief-192/209 straggler, no mnemonic .s or .c exists). Shape/role
 * inferred from: (a) identical 20-byte / 5-pair layout to the PROVEN
 * sibling data_ov011_021d300c above, (b) docs/research/map/overlay011.md
 * explicitly describing this code region as containing "coordinate
 * lookup tables". unsigned (no ldrsh evidence either way; values are
 * all < 256 so signedness doesn't affect the emitted bytes).
 * .rodata ground truth -> const.
 */

const unsigned short data_ov011_021d2fe4[10] = {
    0x0000, 0x00a8, 0x00a0, 0x00a8, 0x00c0, 0x00a8, 0x00e0, 0x00a8, 0x00e0, 0x0000,
};
