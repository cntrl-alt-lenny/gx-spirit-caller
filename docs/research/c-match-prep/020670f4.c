/* CAMPAIGN-PREP candidate for func_020670f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Range-remap if-ladder; unsigned cmp -> bcc; (u8) cast -> and #0xff
 *   risk:       mwcc may emit signed blt instead of unsigned bcc if param widening differs; the final ==0x3e/==0x3f cmp pair ordering could swap.
 *   confidence: med
 */
/* func_020670f4: character/code remap ladder. Unsigned compares give
 * the `cmp;addcc;andcc;bxcc` chain; the `& 0xff` falls out of the
 * (unsigned char) result truncation. */

int func_020670f4(unsigned int c) {
    if (c < 0x1a) return (unsigned char)(c + 0x41);
    if (c < 0x34) return (unsigned char)(c + 0x47);
    if (c < 0x3e) return (unsigned char)(c - 0x04);
    if (c == 0x3e) return 0x2b;
    if (c == 0x3f) return 0x2f;
    return 0;
}
