/* data_ov016_021b8df8 (12 bytes, 4-aligned): const u16[6] template. Read as
 * 5 individual halfwords (offsets 0/2/4/6/8), copied to a stack buffer, and
 * forwarded to func_ov016_021b5424; offset 10 (0x0000) is unread 4-byte-
 * alignment tail.
 * Consumer: src/overlay016/func_ov016_021b423c.s:123-137 (_LIT3 pool word):
 *   `ldr r1, _LIT3; ldrh r0,[r1,#2]; ldrh r2,[r1]; ldrh r3,[r1,#4];
 *    ldrh r2,[r1,#6]; ldrh r1,[r1,#8]` -> stack buffer at sp+0x14..0x1c ->
 *   `add r2,sp,#0x14; bl func_ov016_021b5424` (line 371/375).
 * (config/eur/arm9/overlays/ov016/relocs.txt:349,
 *   from:0x021b4790 kind:load to:0x021b8df8 module:overlay(16)).
 * Section: config/eur/arm9/overlays/ov016/delinks.txt .rodata
 * start:0x021b8de8 end:0x021b8e7c -- candidate is inside, so const (matches
 * the neighboring rodata fn-ptr-table siblings' convention).
 */
const unsigned short data_ov016_021b8df8[6] = {
    0x0863, 0x114b, 0x0eb9, 0x031f, 0x13bf, 0x0000,
};
