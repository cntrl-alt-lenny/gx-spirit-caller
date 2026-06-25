/* CAMPAIGN-PREP candidate for func_0206d0b0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order ctx-first; if-chain not ternary; signed char :8 read first
 *   risk:       struct-guessed: f73 offset 0x73 inferred from ldrsb; reshape-able fallback if mwcc reloads stack arg e (sp#0x18 re-ldr'd 3x in orig).
 *   confidence: med
 */
/* func_0206d0b0 @ main : class C (dispatch on field, stack args) */
typedef struct Ctx Ctx;
struct Ctx {
    char pad00[0x73];
    signed char f73;   /* 0x73 mode/state */
};

extern int func_0206ceb8(Ctx *ctx, int a, int b, int c, int e);
extern int func_0206cfa0(Ctx *ctx, int a, int b, int c, int e);

int func_0206d0b0(Ctx *ctx, int a, int b, int c, int e, int f)
{
    int r;
    if (ctx->f73 == 4) {
        return func_0206ceb8(ctx, a, b, c, e);
    }
    r = func_0206cfa0(ctx, a, b, c, e);
    if (r != -6) {
        return r;
    }
    if (!(f & 1)) {
        return r;
    }
    return func_0206ceb8(ctx, a, b, c, e);
}
