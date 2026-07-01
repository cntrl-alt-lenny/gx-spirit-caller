/* CAMPAIGN-PREP candidate for func_02086b9c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT STORE-ORDER + reload src@0x1c + rsb/sub/mul/lsl
 *   risk:       src@0x1c reloaded for the mul (not bound) — must keep separate ref; mul operand order and final 0x10 store position may shift.
 *   confidence: med
 */
/* func_02086b9c: transform init variant. dst ints; src int@0x18, int@0x1c, u16@0x2e.
 * [0x34] = (-u16@0x2e) * (src@0x1c - 0x1000), <<4. Stores in asm order. */
void func_02086b9c(char *dst, char *src) {
    *(int *)(dst + 0x00) = *(int *)(src + 0x18);
    *(int *)(dst + 0x14) = *(int *)(src + 0x1c);
    *(int *)(dst + 0x04) = 0;
    *(int *)(dst + 0x30) = 0;
    *(int *)(dst + 0x34) = (-*(unsigned short *)(src + 0x2e) * (*(int *)(src + 0x1c) - 0x1000)) << 4;
    *(int *)(dst + 0x10) = 0;
}
