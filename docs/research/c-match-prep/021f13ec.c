/* CAMPAIGN-PREP candidate for func_021f13ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Decl i late; first-guard tail-call; counted loop i=0..4 with skip-when-equal continue
 *   risk:       early 'if(_a) return helper(...)' is a tail-bl then ldmia (orig keeps r0 from bl); mwcc tail-merge vs the loop's movne1 path may reorder blocks. reshape-able (keep explicit return at top).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern int func_ov002_021efa38(void);
extern int func_ov002_021efe44(int a, int b, int c);

struct S13ec { u8 _0[0xa]; u16 _a; };

int func_ov002_021f13ec(struct S13ec *a0, int a1, int a2)
{
    int i;

    if (a0->_a != 0)
        return func_ov002_021efe44((int)a0, a1, a2);
    if (func_ov002_021efa38() == 0)
        return 0;
    for (i = 0; i <= 4; i++) {
        if (a2 != i) {
            if (func_ov002_021efe44((int)a0, a1, i) != 0)
                return 1;
        }
    }
    return 0;
}
