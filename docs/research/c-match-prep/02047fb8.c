/* CAMPAIGN-PREP candidate for func_02047fb8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: branch-table sel/off per case; ~N mvn; runtime base add; unconditional tail; return r4
 *   risk:       struct-guessed (MSG_BASE): _LIT0 0xffff11b8 is a relocated base added to ~N at runtime; modeling it as a plain int constant folds mvn+add into one ldr. Default (case 0/1) reaches sel=6 via fallthrough — keep table width 5.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02047fb8 (main, class D, MED tier).
 * Same shape as 02046498/02048880: movs r4 guard ==0 -> return 0; switch(r4)
 * 0..4 selects (sel, off=~N); always call func_020480b4(sel, MSG_BASE+off)
 * (no sel!=0 guard here — unconditional). MSG_BASE = _LIT0 0xffff11b8 runtime
 * add. Returns r4.
 *   recipe: D branch-table; sel/off per case; ~N mvn; runtime base add; unconditional tail; return r4
 */
typedef int s32;

extern unsigned char MSG_BASE_02047fb8[];   /* _LIT0 0xffff11b8 */
extern void func_020480b4(s32 sel, void *msg);

s32 func_02047fb8(s32 r4)
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

    func_020480b4(sel, MSG_BASE_02047fb8 + off);
    return r4;
}
