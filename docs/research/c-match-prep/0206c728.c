/* CAMPAIGN-PREP candidate for func_0206c728 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain; ok/ok2 bool idiom; final ternary f72==1?0:~0x5 maps to moveq/mvnne
 *   risk:       final select: asm ends `cmp f72,#1; moveq r0,#0; mvnne r0,#0x5` -- write it as a ternary (NOT if/return) so mwcc emits the predicated moveq/mvnne pair, not a branch. reshape-able (ternary vs if). Lowest-risk of the batch; struct-guessed offsets only.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206c728 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Simplest guard-chain sibling (no bf94 call).
 *   recipe: guard chain (mvn consts); final ternary f72==1 ? 0 : ~0x5 (moveq/mvnne)
 * func_0206c728(ctx):
 *   func_0206e4a4(ctx)!=0 -> ~0x1b
 *   !(ctx && (f70&1)) -> ~0x26
 *   (f70 & 2) -> ~0x1b
 *   !(f73==0 || f73==4) -> ~0x1b
 *   return (f72 == 1) ? 0 : ~0x5;
 */
typedef struct Ctx Ctx;
struct Ctx {
    char  _pad_00[0x70];
    short f70;             /* +0x70 ldrsh */
    signed char f72;       /* +0x72 ldrsb */
    signed char f73;       /* +0x73 ldrsb */
};

extern int func_0206e4a4(Ctx *ctx);

int func_0206c728(Ctx *ctx) {
    int ok;
    if (func_0206e4a4(ctx) != 0)
        return ~0x1b;
    ok = 0;
    if (ctx != 0 && (ctx->f70 & 1))
        ok = 1;
    if (!ok)
        return ~0x26;
    if (ctx->f70 & 2)
        return ~0x1b;
    ok = 1;
    if (ctx->f73 != 0 && ctx->f73 != 4)
        ok = 0;
    if (!ok)
        return ~0x1b;
    return ctx->f72 == 1 ? 0 : ~0x5;
}
