/* CAMPAIGN-PREP candidate for func_0206d96c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain nested if; ~N consts; bind eng/sub; busy flag; decl-order ok,eng,busy
 *   risk:       reshape-able: the (flags&4 || f72) branch maps to 0209268c-else-020927b8; orig threads the e64 vs e68 base ([r8,#0x68] here) — if I mis-id the field the +0xe0 base diverges. Tail epilogue trivially completes. struct-guessed.
 *   confidence: med
 */
/* func_0206d96c @ main : class C (flag guard-chain, multi early-exit).
   NOTE: source asm tail is truncated by 1 epilogue (only ldmia/bx lr after
   'add sp,sp,#0x8' is implied) — body is otherwise complete. */
typedef struct Ctx Ctx;
struct Ctx {
    char pad00[0x68];
    void *e68;             /* 0x68 engine (+0xe0 sub) */
    char pad6c[0x70 - 0x6c];
    short f70;             /* 0x70 flags16 */
    signed char f72;       /* 0x72 */
    signed char f73;       /* 0x73 */
};

extern int func_0206e4a4(Ctx *ctx);
extern int func_0209268c(void *sub);
extern void func_020927b8(void *sub);
extern void func_02092748(void *sub);
extern int func_0206d854(Ctx *ctx, int a, int b, int c, int e, int busy);

int func_0206d96c(Ctx *ctx, int a, int b, int c, int flags)
{
    int ok;
    void *eng;
    int busy;
    int ret;
    void *sub;

    if (func_0206e4a4(ctx) != 0) {
        return ~0x1b;
    }
    ok = 0;
    if (ctx != 0 && (ctx->f70 & 1)) {
        ok = 1;
    }
    if (!ok) {
        return ~0x26;
    }
    ok = 1;
    if (ctx->f73 != 0 && ctx->f73 != 4) {
        ok = 0;
    }
    if (ok && !(ctx->f70 & 4) && (ctx->f70 & 8)) {
        return ~0x37;
    }
    eng = ctx->e68;
    sub = (char *)eng + 0xe0;
    if (!(flags & 4) && ctx->f72 == 0) {
        func_020927b8(sub);
        busy = 1;
    } else {
        if (func_0209268c(sub) == 0) {
            return ~0x5;
        }
        busy = 0;
    }
    ret = func_0206d854(ctx, a, b, c, /*e=sp#0x20*/0, busy);
    func_02092748(sub);
    return ret;
}
