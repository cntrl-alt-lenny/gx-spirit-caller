/* data_ov008_021b275c (36 bytes, 4-aligned): OS_SPrintf format string
 * "/card128/%04d.5bg" (17 chars + NUL), zero-padded to 36 bytes -- a
 * per-card background-image path template (4-digit zero-padded card id).
 * Consumer: src/overlay008/func_ov008_021b2268.s:37 (`_LIT1`, declared
 *   :44; `ldr r0,_LIT0 / ldr r1,_LIT1 / ldr r0,[r0] / ldr r2,[r0,#0xc] /
 *   add r0,r0,#0x70 / bl OS_SPrintf`, i.e.
 *   `OS_SPrintf(scene+0x70, "/card128/%04d.5bg", scene->f0xc)` where
 *   `scene = *data_ov008_021b270c`) -- proven by
 *   config/eur/arm9/overlays/ov008/relocs.txt:936
 *   `from:0x021b22e0 kind:load to:0x021b275c module:overlay(8)`.
 * No outgoing relocs from this range -- plain text, not pointers. The 18
 * trailing zero bytes past the NUL are ordinary tail padding, reproduced
 * automatically by the C initializer (array size 36 > the literal's
 * 18 bytes incl. NUL).
 * .data-resident: config/eur/arm9/overlays/ov008/delinks.txt `.data
 *   start:0x021b2440 end:0x021b2780` covers 0x021b275c, and this
 *   symbol's end (0x021b2780) is exactly the .data/.bss boundary -- NOT
 *   const.
 * Plain ASCII, quoted literal is safe (contrast data_020c5934.c's
 * Shift-JIS byte-array convention).
 */
char data_ov008_021b275c[36] = "/card128/%04d.5bg";
