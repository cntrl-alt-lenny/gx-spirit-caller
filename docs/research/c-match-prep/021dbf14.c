/* CAMPAIGN-PREP candidate for func_021dbf14 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested do/while; outer shift+=0x10; tst a1,1<<b; a2 spilled [sp+4], a3 stacked arg5
 *   risk:       a2/a3 spill layout: orig holds a2 at [sp+4] and passes a3 as the stacked 5th arg (str r9,[sp]); mwcc may reorder spill slots or keep a3 in a reg. reshape-able (reorder local decls / arg list).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021dbf14 (ov002, class C) — MED tier.
 *   recipe: nested counted loops; outer o=0..1 (shift base o*16), inner i=0..10; accumulate bits
 * func_021dbf14(a0,a1,a2,a3): out=0; for o in 0..1, i in 0..10, b=i+o*16:
 *   if (a1 & (1<<b)) and 021dbd48(a0,o,i,a2,a3) -> out |= 1<<b.  return out.
 */

extern int func_ov002_021dbd48(int a0, int o, int i, int a2, int a3);

int func_ov002_021dbf14(int a0, int a1, int a2, int a3)
{
    int out = 0;
    int o = 0;
    int shift = 0;

    do {
        int i = 0;
        do {
            int b = i + shift;
            if (a1 & (1 << b)) {
                if (func_ov002_021dbd48(a0, o, i, a2, a3) != 0)
                    out |= 1 << b;
            }
            i++;
        } while (i <= 0xa);
        o++;
        shift += 0x10;
    } while (o < 2);

    return out;
}
