/* CAMPAIGN-PREP candidate for func_0202bb88 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted byte-clear loop, guard, no calls
 *   risk:       loop may index [base+0xf6c, i] vs the asm's pointer-walk (add r3,#1); ldr [r0] needs int-typed count
 *   confidence: med
 */
/* func_0202bb88: clear bit3 of bytes data_02104f4c[0xf6c + i] for
 * i in [0, count), count = *(int*)data_020b4768. No-op if count<=0. */

extern int data_020b4768;               /* word count at +0 */
extern unsigned char data_02104f4c[];

void func_0202bb88(void) {
    int count = data_020b4768;
    int i;
    if (count <= 0) return;
    for (i = 0; i < count; i++)
        data_02104f4c[i + 0xf6c] &= ~8;
}
