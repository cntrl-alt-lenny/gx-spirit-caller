/* CAMPAIGN-PREP candidate for func_0202ab04 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop, signed-guard call+clear, bit-clear tail
 *   risk:       the separate +0xa7 induction pointer (asm keeps r5) may instead recompute base+i*0x10; strh/-1 ok
 *   confidence: med
 */
/* func_0202ab04: over 4 stride-0x10 elements, if s16 @+0xa4 >= 0 call
 * func_02022580(v), set it to -1, clear bit0 of the byte @+0xa7; then
 * clear bit0 of u16 @0xea. Returns 1. */

extern void func_02022580(int v);

int func_0202ab04(void *self) {
    char *b = (char *)self;
    int i;
    for (i = 0; i < 4; i++) {
        short *p = (short *)(b + (i << 4) + 0xa4);
        if (*p >= 0) {
            func_02022580(*p);
            *p = -1;
            b[(i << 4) + 0xa7] &= ~1;
        }
    }
    *(unsigned short *)(b + 0xea) &= ~1;
    return 1;
}
