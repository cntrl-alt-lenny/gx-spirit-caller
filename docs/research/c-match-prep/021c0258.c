/* CAMPAIGN-PREP candidate for func_021c0258 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind row=mla(..)+0x30 then +=0x14; flags-mask (a & ~b6 & ~b21); k-dispatch returns
 *   risk:       mask order is exact: r3=a&~b6 then tst r3,~b21 — write (a & ~b6) & ~b21 not regrouped. r5 holds row across iters, ip=[r5,#0x40]/r1=[r5,#0x38] reload. mwcc may pick different temp regs for the 4 shifts. permuter-class on the shift/mvn reg assignment.
 *   confidence: med
 */
/* func_ov002_021c0258: scan rows j=0..4 of player arg0; for each where
 * 021b9ecc!=0, test the active(+0x38)/flags(+0x40) mask; if it passes, branch
 * on the 021b9ecc result (0x13cd -> require 021bd6c8 clear; 0x164e -> skip).
 * Return 1 if any row's mask passes and isn't vetoed, else 0. */

extern char  data_ov002_022cf16c[];
extern int   func_ov002_021b9ecc(int a, int b);
extern int   func_ov002_021bd6c8(int a);

int func_ov002_021c0258(int arg0) {
    char *base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    char *row = base + 0x30;
    int j = 0;
    do {
        int k = func_ov002_021b9ecc(arg0, j);
        if (k != 0) {
            unsigned int f = *(unsigned int *)(row + 0x10);
            unsigned short a = *(unsigned short *)(row + 0x08);
            if ((a & ~((f >> 6) & 1)) & ~((((f >> 2) | (f >> 1)) & 1))) {
                if (k == 0x13cd) {
                    if (func_ov002_021bd6c8(0x10f4) == 0)
                        return 1;
                } else if (k != 0x164e) {
                    return 1;
                }
            }
        }
        j++;
        row += 0x14;
    } while (j < 5);
    return 0;
}
