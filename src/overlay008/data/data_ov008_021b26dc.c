/* data_ov008_021b26dc (16 bytes, 4-aligned): OS_SPrintf format-string
 * PREFIX "/card128/%04d.5t" -- 16 characters, deliberately NOT
 * null-terminated within this object. Immediately followed in ROM by the
 * adjacent (already-carved, not part of this wave) symbol
 * data_ov008_021b26ec = "x\0\0\0...", completing the effective template
 * "/card128/%04d.5tx" (per-card texture path, 4-digit zero-padded card
 * id) -- verified directly against the ROM bytes at 0x021b26ec.
 * Consumer: src/overlay008/func_ov008_021afa34.s:48 (`_LIT4`, declared
 *   :115; `ldrh r2,[r6,r0] / ldr r1,_LIT4 / mov r0,r8 /
 *   bl OS_SPrintf`) -- proven by
 *   config/eur/arm9/overlays/ov008/relocs.txt:632
 *   `from:0x021afba8 kind:load to:0x021b26dc module:overlay(8)`.
 * No outgoing relocs from this range -- plain text, not pointers.
 * .data-resident: config/eur/arm9/overlays/ov008/delinks.txt `.data
 *   start:0x021b2440 end:0x021b2780` covers 0x021b26dc -- NOT const.
 * Plain ASCII, quoted literal is safe (contrast data_020c5934.c's
 * Shift-JIS byte-array convention). Array size == string length with no
 * implicit NUL stored -- legal C, matches the verified 16-byte
 * extraction exactly.
 */
char data_ov008_021b26dc[16] = "/card128/%04d.5t";
