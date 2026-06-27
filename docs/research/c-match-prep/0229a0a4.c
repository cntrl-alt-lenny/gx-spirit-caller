/* CAMPAIGN-PREP candidate for func_0229a0a4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: store-order; reload global base per block; reuse guard value as 1st stored word
 *   risk:       orig reloads ldr r0,_LIT0 each of 4 blocks; mwcc may CSE base into one callee-saved reg, dropping 3 ldr. reshape-able (separate-block scoping; else split reads / sequence per block)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229a0a4 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: 4x guarded 4-word copy to fixed
 * DMA regs; reload global base per block; store-order; reuse guard value as
 * first stored word. */
extern char data_ov002_022d0f2c[];

void func_ov002_0229a0a4(void) {
    {
        int v = *(int *)(data_ov002_022d0f2c + 0x88);
        if (v != 0) {
            *(int *)0x04000020 = v;
            *(int *)0x04000024 = *(int *)(data_ov002_022d0f2c + 0x8c);
            *(int *)0x04000028 = *(int *)(data_ov002_022d0f2c + 0x90);
            *(int *)0x0400002c = *(int *)(data_ov002_022d0f2c + 0x94);
            *(int *)(data_ov002_022d0f2c + 0x88) = 0;
        }
    }
    {
        int v = *(int *)(data_ov002_022d0f2c + 0x98);
        if (v != 0) {
            *(int *)0x04000030 = v;
            *(int *)0x04000034 = *(int *)(data_ov002_022d0f2c + 0x9c);
            *(int *)0x04000038 = *(int *)(data_ov002_022d0f2c + 0xa0);
            *(int *)0x0400003c = *(int *)(data_ov002_022d0f2c + 0xa4);
            *(int *)(data_ov002_022d0f2c + 0x98) = 0;
        }
    }
    {
        int v = *(int *)(data_ov002_022d0f2c + 0xa8);
        if (v != 0) {
            *(int *)0x04001020 = v;
            *(int *)0x04001024 = *(int *)(data_ov002_022d0f2c + 0xac);
            *(int *)0x04001028 = *(int *)(data_ov002_022d0f2c + 0xb0);
            *(int *)0x0400102c = *(int *)(data_ov002_022d0f2c + 0xb4);
            *(int *)(data_ov002_022d0f2c + 0xa8) = 0;
        }
    }
    {
        int v = *(int *)(data_ov002_022d0f2c + 0xb8);
        if (v != 0) {
            *(int *)0x04001030 = v;
            *(int *)0x04001034 = *(int *)(data_ov002_022d0f2c + 0xbc);
            *(int *)0x04001038 = *(int *)(data_ov002_022d0f2c + 0xc0);
            *(int *)0x0400103c = *(int *)(data_ov002_022d0f2c + 0xc4);
            *(int *)(data_ov002_022d0f2c + 0xb8) = 0;
        }
    }
}
