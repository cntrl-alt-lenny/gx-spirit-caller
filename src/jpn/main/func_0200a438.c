/* CAMPAIGN-PREP candidate for func_0200a438 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted copy loop, indexed load + computed-base store
 *   risk:       the 0x1aa8 immediate split (+0x1000 then str #0xaa8) is mwcc addressing; may emit single add
 *   confidence: med
 */
/* func_0200a438 — 4-word copy from one global table to another.
   dst addr = &data_02104e6c + 0x1aa8 + i*4 (mwcc splits 0x1aa8 -> +0x1000 then str #0xaa8). */

extern unsigned int data_02104e6c[];   /* dest base */
extern unsigned int data_020b4678[];   /* src  base */

void func_0200a438(void)
{
    unsigned int *dst = data_02104e6c;
    int i;
    for (i = 0; i < 4; i++)
        dst[0x6aa + i] = data_020b4678[i];
}
