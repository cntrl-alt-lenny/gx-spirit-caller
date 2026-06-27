/* CAMPAIGN-PREP candidate for func_02088dd8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order stack args in asm order; guard early-return; literal pool order
 *   risk:       reshape-able: arg order/types fix it. Risk that mwcc emits the two `str [sp]`/`str [sp,#4]` in opposite order vs asm; passing as positional 5th/6th args usually preserves it.
 *   confidence: med
 */
/* func_02088dd8 (main, class D): guard on data_021a5204==0 (return if
 * already set), clear data_021a5208, then two setup calls whose stack
 * args are written in asm store-order, finally set data_021a5204=1.
 *   str ip,[sp]    (=0x400) and str r4,[sp,#0x4] (=arg) are the
 *   5th/6th args to func_02091d24 — keep that emission order. */
extern int  data_021a5204;
extern int  data_021a5208;
extern char data_021a520c[];
extern char data_021a522c[];
extern char data_021a5340[];
extern char data_021a5800[];

extern void func_02088620(void);
extern void func_020919d8(void *a0);
extern void func_02091d24(void *a0, void *a1, int a2, void *a3, int a4, int a5);
extern void func_02092614(void *a0, void *a1, int a2);

void func_02088dd8(int arg0) {
    if (data_021a5204 != 0) {
        return;
    }
    data_021a5208 = 0;
    func_02092614(data_021a520c, data_021a522c, 8);
    func_02091d24(data_021a5340, func_02088620, 0, data_021a5800, 0x400, arg0);
    data_021a5204 = 1;
    func_020919d8(data_021a5340);
}
