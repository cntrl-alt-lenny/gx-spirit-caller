/* CAMPAIGN-PREP candidate for func_02086e44 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT STORE-ORDER + double-rsb + mul(operand-order)/lsl
 *   risk:       Whether mwcc spills to lr (frame) vs reuses a low reg is fragile; mul operand order at 0x34 (neg-u16 first, neg-int second) may flip; offsets guessed.
 *   confidence: low
 */
/* func_02086e44: transform init, both factors negated for [0x34].
 * Frame appears because lr is used as a zero temp. dst ints; src int@0x24, u16@0x2c,
 * int@0x28, u16@0x2e. Stores in asm order. */
void func_02086e44(char *dst, char *src) {
    *(int *)(dst + 0x00) = 0x1000;
    *(int *)(dst + 0x14) = 0x1000;
    *(int *)(dst + 0x04) = 0;
    *(int *)(dst + 0x30) = (-*(int *)(src + 0x24) * *(unsigned short *)(src + 0x2c)) << 4;
    *(int *)(dst + 0x34) = (-*(unsigned short *)(src + 0x2e) * -*(int *)(src + 0x28)) << 4;
    *(int *)(dst + 0x10) = 0;
}
