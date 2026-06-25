/* CAMPAIGN-PREP candidate for func_021ca63c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tst-flag dispatch; combined tst;cmpne for bit1; cmp gates
 *   risk:       021ca51c first-call arg0-in-r0 no-reload; the (flags&2)&&arg1 must fold to tst;cmpne not a branch; arg1 held in r4
 *   confidence: med
 */
/* func_ov002_021ca63c: tst-flag dispatch. flags = 021ca51c(arg0) (arg0 left
 * live in r0). bit0 => 0. bit1 & arg1!=0 => 0. bit2 & arg0==0 => 0.
 * bit3 & arg0==1 => 0. else 1. arg0=r5, arg1=r4. */
extern int func_ov002_021ca51c(int arg0);

int func_ov002_021ca63c(int arg0, int arg1) {
    int flags = func_ov002_021ca51c(arg0);
    if (flags & 1) return 0;
    if ((flags & 2) && arg1 != 0) return 0;
    if (flags & 4) {
        if (arg0 == 0) return 0;
    }
    if (flags & 8) {
        if (arg0 == 1) return 0;
    }
    return 1;
}
