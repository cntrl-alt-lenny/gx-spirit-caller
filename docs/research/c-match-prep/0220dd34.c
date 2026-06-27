/* CAMPAIGN-PREP candidate for func_0220dd34 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D nested distinctness loop: a[idx]=*(u16*)(base+idx*24+0x300), count at base[0x484]
 *   risk:       permuter-class: orig FUSES base into the strided induction var (`mla r4,r3,#0x18,base`, then decremented by 0x18); mwcc keeps i*24 in a reg and re-adds base each use (mul + 2 adds). +2 insns (128 vs 120). C-reshape did not force the mla base-fold.
 *   confidence: med
 */
typedef unsigned short u16;
extern char data_ov002_022ce288[];
int func_ov002_0220dd34(int unused, int arg1) {
    char *base = data_ov002_022ce288;
    int i, j;
    if (arg1 == 0) return 0;
    for (i = *(int *)(base + 0x484) - 1; i >= 0; i--) {
        u16 vi = *(u16 *)(base + i * 24 + 0x300);
        for (j = i - 1; j >= 0; j--) {
            if (vi == *(u16 *)(base + j * 24 + 0x300)) return 0;
        }
    }
    return 1;
}
