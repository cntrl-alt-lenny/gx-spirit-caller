/* CAMPAIGN-PREP candidate for func_02070980 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order saved/avail/notify; unsigned cmp for cs; bind avail once
 *   risk:       Cascade of conditional-return tails (state==0xa, ==0xb, f44, notify) — mwcc may merge two adjacent ldmeq/bxeq differently or reorder the f44-load; permuter-class scheduling of the 4-way tail.
 *   confidence: med
 */
/* func_02070980: IRQ-bracketed ring/buffer advance with multi-tail
 * state check. r7=count(arg0), r4=ctx(arg1).
 *  - disable IRQs (saved=r6)
 *  - if ctx->f44 == ctx->f3c (head==tail) then notify = (count!=0)
 *  - if count >= ctx->f44: ctx->f44 = 0   (consume all)
 *    else: drain partial via func_020a7388(ctx->f40 + count, f44-count),
 *          ctx->f44 -= count
 *  - restore IRQs
 *  - state=ctx->_8: if 0xa or 0xb -> return (drop)
 *  - if ctx->f44 != 0 -> return
 *  - else if notify==0 -> return
 *  - else func_02072384(ctx, 0x1b)
 */

typedef struct Ctx {
    char  _pad08[0x8];
    unsigned char state;   /* +0x8 */
    char  _pad09[0x33];
    int   f3c;             /* +0x3c */
    void *f40;             /* +0x40 */
    int   f44;             /* +0x44 */
} Ctx;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02072384(Ctx *ctx, int code);
extern void func_020a7388(void *dst, int len);

void func_02070980(int count, Ctx *ctx) {
    int saved;
    int avail;
    int notify;

    saved = OS_DisableIrq();
    avail = ctx->f44;
    notify = 0;
    if (avail == ctx->f3c) {
        if (count != 0) notify = 1;
    }
    if ((unsigned int)count >= (unsigned int)avail) {
        ctx->f44 = 0;
    } else {
        func_020a7388((char *)ctx->f40 + count, avail - count);
        ctx->f44 = avail - count;
    }
    OS_RestoreIrq(saved);

    if (ctx->state == 0xa) return;
    if (ctx->state == 0xb) return;
    if (ctx->f44 != 0) return;
    if (notify == 0) return;
    func_02072384(ctx, 0x1b);
}
