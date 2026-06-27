/* CAMPAIGN-PREP candidate for func_020196d8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on u8-field; bool via cmp+movlt/le; signed-byte table[idx*7]; re-call not CSE
 *   risk:       reshape-able: orig re-calls func_02018b94 three times (no CSE) and the addls jump-table needs cases laid 0x36/0x37/0x38/0x3b — if mwcc CSEs the ptr or reorders the table bodies, the dispatch and ldr count diverge.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020196d8 (main, class C) — UNVERIFIED build-free draft.
 * Jump-table dispatch on an unsigned-byte field (val-0x36, range 0..5), several bool returns,
 * plus a default branch that does a signed-byte table lookup data_020b5b80[idx*7] (rsb r1,r1,r1,lsl#3 = *7).
 *   func_02018b94() returns a struct ptr; +0x14 = u8 field, +0x10 = int field (tst #0x200).
 *   sel = (u8)wk->f14; switch(sel){ 0x38: return func_02018f80()<0x2d;  0x36: return func_02018f80()<=0x1b;
 *     0x37: return func_02018f80()<=0x1c;  0x3b: return func_02018f80()<=0x21;  default(.L_90) below }
 *   default: r=1; if (data_020b5b80[wk2->f14*7]==2) return 1;
 *            else { if((wk2->f10 & 0x200)==0) r=0; return r; }   (func_02018b94 re-called, NOT CSE'd) */
extern char *GetSystemWork(void);
extern unsigned char *func_02018b94(void);
extern int func_02018f80(void);
extern signed char data_020b5b80[];

int func_020196d8(void) {
    int r4;
    GetSystemWork();
    switch (func_02018b94()[0x14]) {
    case 0x38:
        return func_02018f80() < 0x2d;
    case 0x36:
        return func_02018f80() <= 0x1b;
    case 0x37:
        return func_02018f80() <= 0x1c;
    case 0x3b:
        return func_02018f80() <= 0x21;
    default:
        r4 = 1;
        if (data_020b5b80[func_02018b94()[0x14] * 7] == 2)
            return r4;
        if ((*(int *)(func_02018b94() + 0x10) & 0x200) == 0)
            r4 = 0;
        return r4;
    }
}
