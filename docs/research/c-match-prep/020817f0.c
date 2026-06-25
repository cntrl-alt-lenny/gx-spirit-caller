/* CAMPAIGN-PREP candidate for func_020817f0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind ctx->iter fnptr once (r4-held), blx loop, r9 accumulate
 *   risk:       permuter-class: r9/r8/r7 arg-shuffle into the blx call plus the loc/x scheduling around blx is a register-rotation coin-flip a C reshape likely won't pin.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020817f0 (main, class C) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: bind fnptr cb=ctx->iter once (held in r4 across loop); blx-dispatch while(cb(&loc)); accumulate r9
 */
/* func_020817f0: pull a virtual-table fn ptr from ctx->parser->vtbl[1],
 * iterate it over a token buffer, advancing an x-cursor by per-token width
 * (func_020807fc) plus a fixed stride, until the iterator returns 0/10. */

extern int func_020807fc(void *root, void *parser, int x, int y, int tok, int loc);

typedef int (*IterFn)(int *loc);

struct Ctx {
    void *root;     /* +0x0 */
    void *parser;   /* +0x4 */
    int   stride;   /* +0x8 */
};

int func_020817f0(struct Ctx *ctx, int x, int y, int tok, int arg4, int *out) {
    int loc;
    int stride = ctx->stride;
    void *parser = ctx->parser;
    IterFn cb = *(IterFn *)((char *)parser + 4);
    int r;
    loc = arg4;
    r = cb(&loc);
    if (r == 0)
        goto done;
    while (r != 10) {
        x += func_020807fc(ctx->root, parser, x, y, r, loc) + stride;
        r = cb(&loc);
        if (r == 0)
            break;
    }
done:
    if (out != 0)
        *out = (r == 10) ? loc : 0;
    return x;
}
