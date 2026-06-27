/* CAMPAIGN-PREP candidate for func_0209dcb8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs-test null-check (h=call;if(h==0)return8); rc<0?8:2 -> movlt/movge ternary
 *   risk:       permuter-class: orig assigns src->r6, len->r4, handle->r5 (not first-use order). mwcc's callee-saved pick for the 3 live values may differ -> stmdb list + mov bytes diverge.
 *   confidence: med
 */
/* func_0209dcb8 — class C: call chain, lt/ge select; reg-alloc shaping.
 * acquires a handle (func_0209dde8), populates it, posts it, returns 8/2. */

extern void func_02094688(void *dst, void *src, int len);
extern void func_020928e8(void *h, int arg);
extern int  func_02096358(int a, void *h, int c);
extern void func_0209256c(void *tag, void *h, int c);
extern void *func_0209dde8(void);

extern int data_021a8d30;

int func_0209dcb8(void *src, int len) {
    void *h;
    int rc;

    h = func_0209dde8();
    if (h == 0) {
        return 8;
    }
    func_02094688(src, h, len);
    func_020928e8(h, len);
    rc = func_02096358(0xa, h, 0);
    func_0209256c(&data_021a8d30, h, 1);
    return rc < 0 ? 8 : 2;
}
