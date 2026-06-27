/* CAMPAIGN-PREP candidate for func_0206d148 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind e64 to one local; restore-flag bool; save/restore brackets call; decl-order
 *   risk:       reshape-able: orig keeps (flags&2)&&eng pattern via r6 — if mwcc spills r4(saved) early, ldrsb/strb order around the call may diverge; struct-guessed offsets.
 *   confidence: med
 */
/* func_0206d148 @ main : class C (flag dispatch, save/restore field, stack args) */
typedef struct Ctx Ctx;
typedef struct Eng Eng;
struct Eng {
    char pad00[0xfe];
    signed char fFE;   /* 0xfe busy-flag */
};
struct Ctx {
    char pad00[0x64];
    Eng *e64;          /* 0x64 */
    char pad68[0x73 - 0x68];
    signed char f73;   /* 0x73 */
};

extern int func_0206cb6c(Ctx *ctx, int a, int b, int c, int e, int g);
extern int func_0206d0b0(Ctx *ctx, int a, int b, int c, int e, int g);
extern void func_0206cd0c(Ctx *ctx);

int func_0206d148(Ctx *ctx, int a, int b, int c, int e, int g, int flags)
{
    Eng *eng;
    int restore;
    signed char saved;
    int ret;

    eng = ctx->e64;
    restore = (flags & 2) && (eng != 0);
    if (restore) {
        saved = eng->fFE;
        eng->fFE = 1;
    }
    if (ctx->f73 == 1) {
        ret = func_0206cb6c(ctx, a, b, c, e, g);
    } else {
        ret = func_0206d0b0(ctx, a, b, c, e, g);
        if (ret >= 0) {
            func_0206cd0c(ctx);
        }
    }
    if (restore) {
        eng->fFE = saved;
    }
    return ret;
}
