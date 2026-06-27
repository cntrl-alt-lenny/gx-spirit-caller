/* CAMPAIGN-PREP candidate for func_0206b814 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch->`addls pc,pc,r3,lsl#2` branch-table; field stores in order; tail-call
 *   risk:       struct-guessed/reshape-able: branch-table only emits for a dense 0..3 switch returning fnptrs — verify case<->handler mapping (case0/default both ->b88c, 1->ba4c, 2->b96c, 3->b8fc) and the 0x498/0x49c/0x4 offsets; tail bx may become bl+pop instead.
 *   confidence: med
 */
/* func_0206b814 — select a handler by index (0..3, default), stash two words and
 * `this` into a global, then tail-call func_02053ddc(this->f4, handler).
 *   switch (r3) {
 *     case 0: h = func_0206b88c; break;   (.L_1c0)
 *     case 1: h = func_0206b96c; break;
 *     case 2: h = func_0206b8fc; break;
 *     case 3: h = func_0206ba4c; break;
 *     default: h = func_0206b88c; break;  (LIT3)
 *   }
 *   ctx[0x498] = r2; ctx[0x49c] = r1; data_0219ecd4 = ctx;
 *   return func_02053ddc(ctx->f4, h);
 * Note the jump-table body order: case bodies appear as ba4c, b96c, b8fc, b88c
 * (i.e. table entry k -> the (4-k)... no: pc-relative table maps 0->.L_1e0(LIT3=b88c),
 * 1->b... ) — handler[0]=b88c(default/0), [1]=ba4c, [2]=b96c, [3]=b8fc, [4]=b88c.
 */
typedef void HandlerFn(void);

extern void func_0206b88c(void);
extern void func_0206b8fc(void);
extern void func_0206b96c(void);
extern void func_0206ba4c(void);
extern void *data_0219ecd4;
extern int func_02053ddc(int field4, HandlerFn *h);

int func_0206b814(char *ctx, int a1, int a2, int sel)
{
    HandlerFn *h;
    switch (sel) {
    case 1:
        h = func_0206ba4c;
        break;
    case 2:
        h = func_0206b96c;
        break;
    case 3:
        h = func_0206b8fc;
        break;
    default:
        h = func_0206b88c;
        break;
    }
    *(int *)(ctx + 0x498) = a2;
    *(int *)(ctx + 0x49c) = a1;
    data_0219ecd4 = ctx;
    return func_02053ddc(*(int *)(ctx + 0x4), h);
}
