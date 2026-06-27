/* CAMPAIGN-PREP candidate for func_0206d1f0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain as nested if; ~N error consts; flag bools branch/ok; decl-order
 *   risk:       TRUNCATED asm: success tail after .L_610 is missing, so this cannot byte-match — campaign must re-extract full body. Secondary: struct-guessed offsets; permuter-class reg rotation likely.
 *   confidence: low
 */
/* func_0206d1f0 @ main : class C (guard chain, multi early-exit).
   WARNING: source asm in batch is TRUNCATED (size=368 but body cut at .L_610);
   the success tail after the func_0209268c==0 check is MISSING. This TU
   reconstructs only the visible guard chain + flag r4; the final dispatch
   block is a best-effort stub and will NOT byte-match without the tail. */
typedef struct Ctx Ctx;
struct Ctx {
    char pad00[0x64];
    void *e64;             /* 0x64 (engine, +0xe0 substruct) */
    char pad68[0x70 - 0x68];
    short f70;             /* 0x70 flags16 (ldrsh) */
    signed char f72;       /* 0x72 */
    signed char f73;       /* 0x73 */
};

extern int func_0206e4a4(Ctx *ctx);
extern int func_02093808(void);
extern int func_0209268c(void *sub);
extern int func_02092748(void *sub);
extern int func_020927b8(void *sub);
extern int func_0206d148(Ctx *ctx, int a, int b, int c, int e, int g, int flags);

int func_0206d1f0(Ctx *ctx, int a, int b, int c, int e, int flags)
{
    int branch;
    int ok;
    int sub;
    int r;

    if (func_0206e4a4(ctx) != 0) {
        return ~0x1b;
    }
    if (!(flags & 4) && ctx->f72 == 0) {
        if (ctx->f73 == 4) {
            return ~0x1b;
        }
        branch = 0;
    } else {
        if (func_02093808() == 0x12) {
            return ~0x1b;
        }
        branch = 1;
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
    /* --- truncated tail (reconstructed skeleton, not byte-exact) --- */
    sub = (int)ctx->e64 + 0xe0;
    if (!(branch & 1)) {
        if (func_0209268c((void *)sub) == 0) {
            return ~0x5;
        }
    }
    r = func_0206d148(ctx, a, b, c, e, /*g*/0, flags);
    return r;
}
