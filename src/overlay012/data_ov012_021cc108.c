/* data_ov012_021cc108 (24 bytes, 4-aligned): 6-row x 4-column D-pad
 * navigation table for the save-slot panel selector. Row = (current
 * slot nibble - 1), columns in code order = {UP, DOWN, RIGHT, LEFT}
 * target-slot values (all bytes are 1-6, matching a 6-slot UI).
 * Consumer: src/overlay012/func_ov012_021cb088.s (Ov012_HandleTouchInput
 * per docs/research/map/overlay012.md:30) -- :21-28 (12x2-byte copy
 * loop, dest sp+8) and :93-141 (D-pad branch: `tst r3,#0x40/0x80/
 * 0x10/0x20` = NDS KEY_UP/DOWN/RIGHT/LEFT bits on data_02104bac+0x54;
 * `add r0,sp,#0x4/0x5/0x6/0x7; ldrb r0,[r0,r2,lsl#2]`, r2 = raw
 * 1-based slot nibble from data_ov012_021cc6dc+0x160); relocs.txt
 * from:0x021cb314 kind:load to:0x021cc108.
 * The sp+4 base (4 bytes before the sp+8 copy destination) is mwcc's
 * standard fold of a constant `[nibble-1]` index into the base pointer
 * (tbl-4 + nibble*4+k == tbl + (nibble-1)*4+k); this reading is my own
 * trace of the .s (no prior dossier exists for this address) -- flagged
 * as the one structural inference in this batch not corroborated by a
 * second independent source, though the read itself (which bytes, by
 * which instructions) is directly traced, not guessed.
 * .rodata ground truth -> const.
 */

const unsigned char data_ov012_021cc108[24] = {
    0x03, 0x02, 0x04, 0x03, 0x03, 0x03, 0x01, 0x05, 0x02, 0x02, 0x01, 0x04,
    0x06, 0x06, 0x03, 0x01, 0x04, 0x04, 0x02, 0x06, 0x04, 0x04, 0x05, 0x01,
};
