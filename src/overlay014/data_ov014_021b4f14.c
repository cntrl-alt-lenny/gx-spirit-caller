/* data_ov014_021b4f14 (12 bytes, 4-aligned): first 12 bytes of the ASCII
 * path/format-string literal "/CharaMake/face/face%02d.LZNCLR\0" (32
 * bytes total). The census's 12-byte boundary lands mid-string (between
 * "...ke/f" and "ace/...") -- NOT a natural token break, just where this
 * particular symbol's relocatable span ends; the remaining 20 bytes
 * ("ace/face%02d.LZNCLR\0") continue in the immediately-following,
 * not-yet-carved symbol data_ov014_021b4f20 (confirmed contiguous:
 * 0x021b4f14 + 12 = 0x021b4f20, per symbols.txt). Both readers load ONLY
 * the base address 0x021b4f14 (never 0x021b4f20 directly), so the whole
 * 32-byte literal is consumed as one C string by its callers -- this
 * file supplies just its own 12-byte slice, byte-exact, no synthesized
 * NUL.
 *
 * TWO readers (matches the census), both using this symbol as the `fmt`
 * arg of `OS_SPrintf(dest, fmt, (unsigned char)field)`:
 *  1. func_ov014_021b3c20 (map name Ov014_BuildPaneBTiles) --
 *     src/overlay014/func_ov014_021b3c20.s:132-137 (`_LIT9`). relocs.txt
 *     :249 (from:0x021b3f9c kind:load to:0x021b4f14 module:overlay(14)).
 *  2. func_ov014_021b43b8 (map name Ov014_RenderDeckSlotB) --
 *     src/overlay014/func_ov014_021b43b8.s:40-45 (`_LIT3`). relocs.txt
 *     :294 (from:0x021b44d8 kind:load to:0x021b4f14 module:overlay(14)).
 * Both call sites are structurally identical: `ldrh r2,[r4,#0x54];
 * ldr r1,=data_ov014_021b4f14; add r0,sp,#N; mov r2,r2,lsl#0x10;
 * mov r2,r2,lsr#0x18; bl OS_SPrintf` -- i.e. `OS_SPrintf(&buf[N],
 * "/CharaMake/face/face%02d.LZNCLR", (unsigned char)r4->0x54)`,
 * building a face-texture filename from a per-object id byte. Both
 * functions repeat the same call 4x against 4 sibling format strings
 * (data_ov014_021b4eb4/_4ed4/_4ef4/_this), one per texture slot.
 *
 * Bytes: ASCII "/CharaMake/f" (2f 43 68 61 72 61 4d 61 6b 65 2f 66),
 * exactly 12 characters. Written as a raw byte array rather than a
 * quoted `char[] = "..."` literal, per this project's established
 * convention for literal/text data (data_020c5934.c, data_ov004_
 * 02209fd0.c: "kept as a plain byte array ... for zero byte-layout
 * benefit" over a quoted literal -- doubly relevant here since it also
 * avoids any confusion about a missing terminator). Section: ov014
 * .data span 0x021b4cc0-0x021b5040 (delinks.txt) contains this address
 * -- kept non-const.
 */

unsigned char data_ov014_021b4f14[12] = {
    0x2f, 0x43, 0x68, 0x61, 0x72, 0x61, 0x4d, 0x61, 0x6b, 0x65, 0x2f, 0x66,
};
