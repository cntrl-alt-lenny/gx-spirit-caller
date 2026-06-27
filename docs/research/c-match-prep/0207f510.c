/* CAMPAIGN-PREP candidate for func_0207f510 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: decl-order r9/r8/r7/r6 then h,w; switch cmp-chain 0/1/2; if-then-else f4 guard; tail store f0,f4 then call
 *   risk:       reshape-able: dispatch tests 0 then 1 then 2 — keep case order 0/1/2 so the cmp-chain matches; sub sp,#4 spill slot is the only frame oddity, likely a benign mwcc scratch.
 *   confidence: med
 */
/* func_0207f510: 3-way dispatch on mode (arg2). Loads h=ctx->f0c, w=ctx->f08,
 * calls render(h,w), then per-mode draw chains, then writes ctx->f0/ctx->f4 into
 * out and tail-calls func_0207f850(out, mode, arg1). Regs: r9 ctx, r8 a1, r7 mode,
 * r6 out, r5 h, r4 w (callee-saved decl-order). */
extern void func_02092904(int h, int w);
extern void func_0207f850(int *out, int mode, int a1);
extern void func_0208f458(void);
extern void func_0208f3e4(int h, int a1, int w);
extern void func_0208f38c(void);
extern void func_0208ff1c(int h, int a1, int w);
extern void func_0208f284(void);
extern void func_0208f210(int h, int a1, int w);
extern void func_0208f1c4(void);
extern void func_0208feb4(int h, int a1, int w);
extern void func_02090114(void);
extern void func_020900a0(int h, int a1, int w);
extern void func_02090048(void);

typedef struct {
    int f0;   /* +0x00 */
    int f4;   /* +0x04 */
    int f8;   /* +0x08 */
    int fc;   /* +0x0c */
} Ctx;

void func_0207f510(Ctx *ctx, int a1, int mode, int *out) {
    int h = ctx->fc;
    int w = ctx->f8;
    func_02092904(h, w);
    switch (mode) {
    case 0:
        func_02090114();
        func_020900a0(h, a1, w);
        func_02090048();
        break;
    case 1:
        if (ctx->f4 != 0) {
            func_0208f458();
            func_0208f3e4(h, a1, w);
            func_0208f38c();
        } else {
            func_0208ff1c(h, a1, w);
        }
        break;
    case 2:
        if (ctx->f4 != 0) {
            func_0208f284();
            func_0208f210(h, a1, w);
            func_0208f1c4();
        } else {
            func_0208feb4(h, a1, w);
        }
        break;
    }
    out[0] = ctx->f0;
    out[1] = ctx->f4;
    func_0207f850(out, mode, a1);
}
