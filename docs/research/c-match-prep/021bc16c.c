/* CAMPAIGN-PREP candidate for func_021bc16c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind continue-guard (:13 lsl/lsrs); short-circuit && so f6 loads under eq-predicate; operands a==f8 first
 *   risk:       orig keeps base(r4) + elem(lr=r4+0x30) as two lockstep pointers and counter ip separate; if mwcc collapses to one scaled-index base the loop body addressing diverges. reshape-able (pointer-walk).
 *   confidence: med
 */
/* func_ov002_021bc16c : counted 5-loop, kind-guard then a==f8 && b==f6 */
typedef struct {
    unsigned int kind:13;
    unsigned int :19;
    unsigned short _p4;
    unsigned short f6;       /* +0x06 */
    unsigned short f8;       /* +0x08 */
    unsigned short _pa;
    int fc;
    unsigned int f10;
} Slot;

extern char data_ov002_022cf16c[];

int func_ov002_021bc16c(int side, int a, int b)
{
    Slot *s = (Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
    int count = 0;
    int i;

    for (i = 0; i < 5; i++) {
        if (s[i].kind == 0) continue;
        if (a == s[i].f8 && b == s[i].f6) count++;
    }
    return count;
}
