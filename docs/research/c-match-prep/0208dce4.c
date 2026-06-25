/* CAMPAIGN-PREP candidate for func_0208dce4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unrolled bit-test predicated byte-store (if(x&BIT) *p=0x80)
 *   risk:       mwcc must emit ands/ldrne/movne/strneb predicated form per test (not branches); at -O4 tiny bodies usually predicate, but a beq form would still be byte-different
 *   confidence: med
 */
/* func_0208dce4: for each set bit 0x1..0x100 of the arg, write 0x80 to
 * the matching sound-channel MMIO byte. Orig emits a predicated
 * ands/movne/strneb per bit (no branches).
 *
 *   bit 0x001 -> 0x04000240
 *   bit 0x002 -> 0x04000241
 *   bit 0x004 -> 0x04000242
 *   bit 0x008 -> 0x04000243
 *   bit 0x010 -> 0x04000244
 *   bit 0x020 -> 0x04000245
 *   bit 0x040 -> 0x04000246
 *   bit 0x080 -> 0x04000248
 *   bit 0x100 -> 0x04000249
 */

void func_0208dce4(int mask) {
    if (mask & 0x001) *(volatile unsigned char *)0x04000240 = 0x80;
    if (mask & 0x002) *(volatile unsigned char *)0x04000241 = 0x80;
    if (mask & 0x004) *(volatile unsigned char *)0x04000242 = 0x80;
    if (mask & 0x008) *(volatile unsigned char *)0x04000243 = 0x80;
    if (mask & 0x010) *(volatile unsigned char *)0x04000244 = 0x80;
    if (mask & 0x020) *(volatile unsigned char *)0x04000245 = 0x80;
    if (mask & 0x040) *(volatile unsigned char *)0x04000246 = 0x80;
    if (mask & 0x080) *(volatile unsigned char *)0x04000248 = 0x80;
    if (mask & 0x100) *(volatile unsigned char *)0x04000249 = 0x80;
}
