/* CAMPAIGN-PREP candidate for func_02048880 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: branch-table sel/off per case; ~N mvn; runtime base add; tail func_0204931c; return r4
 *   risk:       struct-guessed (MSG_BASE): _LIT0 0xfffeeaa8 is a relocated base added to ~N at runtime; a plain-int constant folds the mvn+add to one ldr. Otherwise a near-clone of 02047fb8/02046498 — the branch-table itself is reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02048880 (main, class D, MED tier).
 * Identical template to 02047fb8 but tail-calls func_0204931c and base
 * _LIT0 = 0xfffeeaa8. movs r4 guard ==0 -> return 0; switch(r4) 0..4 picks
 * (sel, off=~N); unconditional func_0204931c(sel, MSG_BASE+off); return r4.
 *   recipe: D branch-table; sel/off per case; ~N mvn; runtime base add; tail func_0204931c; return r4
 */
typedef int s32;

extern unsigned char MSG_BASE_02048880[];   /* _LIT0 0xfffeeaa8 */
extern void func_0204931c(s32 sel, void *msg);

s32 func_02048880(s32 r4)
{
    s32 sel;
    s32 off;

    if (r4 == 0)
        return 0;

    switch (r4) {
    case 2:  sel = 9; off = ~0;    break;
    case 3:  sel = 9; off = ~1;    break;
    case 4:  sel = 6; off = ~9;    break;
    default: sel = 6; off = ~0x13; break;  /* 0,1 */
    }

    func_0204931c(sel, MSG_BASE_02048880 + off);
    return r4;
}
