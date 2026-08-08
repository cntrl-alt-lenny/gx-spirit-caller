/* data_ov008_021b26c4 (12 bytes, 4-aligned): OS_SPrintf format-string
 * PREFIX "/Pack/s_pack" -- 12 characters, deliberately NOT
 * null-terminated within this object. At runtime the format string is
 * completed by whatever immediately follows in ROM: the adjacent
 * (already-carved, not part of this wave) symbol data_ov008_021b26d0 =
 * "%02d_e.5bg\0\0", giving the effective template
 * "/Pack/s_pack%02d_e.5bg". Confirmed by its sibling: the *other* branch
 * of the same caller uses data_ov008_021b26ac, which is the fully
 * self-contained 24-byte literal "/Pack/s_pack%02d.5bg\0\0\0\0" -- i.e.
 * this symbol's "missing" 12 bytes are structurally the analogous suffix,
 * just carved as a separate object.
 * Consumer: src/overlay008/func_ov008_021aefd4.s:36 (`_LIT3`, declared
 *   :72; branch `.L_f8`: `ldr r1,_LIT1 / ldrh r2,[r1,r2] / ldr r1,_LIT3 /
 *   bl OS_SPrintf`) -- proven by
 *   config/eur/arm9/overlays/ov008/relocs.txt:559
 *   `from:0x021af0a4 kind:load to:0x021b26c4 module:overlay(8)`.
 * No outgoing relocs from this range -- plain text, not pointers.
 * .data-resident: config/eur/arm9/overlays/ov008/delinks.txt `.data
 *   start:0x021b2440 end:0x021b2780` covers 0x021b26c4 -- NOT const.
 * Plain ASCII (no Shift-JIS bytes), so a quoted literal is safe here
 * (contrast data_020c5934.c's Shift-JIS byte-array convention). Array
 * size == string length with no implicit NUL stored -- legal C, and
 * matches the verified 12-byte extraction exactly.
 */
char data_ov008_021b26c4[12] = "/Pack/s_pack";
