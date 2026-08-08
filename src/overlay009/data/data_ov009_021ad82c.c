/* data_ov009_021ad82c (16 bytes, 4-aligned): spiral-mapped palette-index
 * lookup table, indexed 0-15 by a 4-bit mask.
 * Consumer: src/overlay009/func_ov009_021ab374.s (Ov009_EntryPanel_DrawAll
 * per docs/research/map/overlay009.md) -- copied byte-by-byte into a local
 * 16-byte stack buffer right after entry (lines 31-39: `ldrb`x2/`strb`x2
 * loop, 8 iterations), then indexed later (line 89: `ldrb r1,[r0,r1]`
 * where r1 = (data_021040ac[0x38]>>2)&0xf) to pick the palette offset used
 * when drawing each of the 8 card-slot sprites. relocs.txt:126
 * `from:0x021ab740 kind:load to:0x021ad82c module:overlay(9)`.
 * docs/research/map/overlay009.md independently corroborates this call
 * site: "draws card-slot sprites (8 slots, offset by spiral-mapped
 * palette index from data_ov009_021ad82c)".
 * Values are a palindrome (byte i == byte 15-i), consistent with a
 * symmetric spiral/fan offset table. All access is `ldrb` (never
 * `ldrsb`), so plain `unsigned char`. Falls in ov009's
 * `.rodata start:0x021ad82c end:0x021ad868`, so `const` (matches sibling
 * rodata convention, e.g. src/main/data_020b4680.c).
 * Note: naive 4-byte word view of bytes[4..7] reads as 0x02020201 and
 * superficially "looks like a pointer" -- false positive. relocs.txt has
 * no `from:` entry anywhere in 0x021ad82c..0x021ad83c, and the real
 * consumer only ever does byte-wide copies/reads over these 16 bytes,
 * never a 4-byte load.
 */
const unsigned char data_ov009_021ad82c[16] = {
    0x00, 0x00, 0x00, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x01,
    0x01, 0x00, 0x00, 0x00,
};
