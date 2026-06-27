/* CAMPAIGN-PREP candidate for func_0209ee20 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early `return rc` keeps r0=db88 result; u16(+0x150) store before u32(+0x14c) store-order; rc==0?2:rc -> moveq
 *   risk:       reshape-able: a->r5,b->r4 callee-saved assignment is reg-alloc; if mwcc swaps, the two mov + stmdb list diverge. Reorder de5c(a)/dd30(b) uses to bias. (Real .s on hand confirms structure.)
 *   confidence: med
 */
/* func_0209ee20 — class C: guarded setup + struct clears + call.
 * db88 gate; clear *(u16*)(+0x150) then *(u32*)(+0x14c); de5c; dd30.
 * 0x150 is not a 1-op ARM immediate -> add #0x100 + strh #0x50 split is forced. */

extern int  func_0209db88(int a, int b);
extern void *func_0209dca8(void);
extern int  func_0209dd30(int first, unsigned short count, ...);
extern void func_0209de5c(int a, int b);

int func_0209ee20(int a, int b) {
    char *s;
    int rc;

    rc = func_0209db88(1, 2);
    if (rc != 0) {
        return rc;
    }
    s = (char *)func_0209dca8();
    *(unsigned short *)(s + 0x150) = 0;
    *(int *)(s + 0x14c) = 0;
    func_0209de5c(8, a);
    rc = func_0209dd30(8, 1, b);
    return rc == 0 ? 2 : rc;
}
