/* CAMPAIGN-PREP candidate for func_02070430 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind ctx in r5; r4 holds n then reused for result r; unsigned cs compare; reload m60
 *   risk:       r4 reuse (n -> func result r) plus ctx->m60 RELOADED 3x (not bound): if mwcc binds m60 to one reg the post-call reloads collapse, or if it keeps n live in a fresh reg the r4 alias breaks (reshape-able: re-read ctx->m60 after the call; reuse one local for n/r). m60 unsigned compare (cs).
 *   confidence: med
 */
/* func_02070430 (main, class C): drain/advance a ring at ctx (root chain).
 * If the consume count m60 fits, memmove the remainder down; else flush.
 * Two incoming params thread through as trailing args of func_020704e8. */

struct Ctx430 {
    char  _pad_00[0x5c];
    void *m5c;        /* +0x5c buffer base */
    int   m60;        /* +0x60 pending count */
};
struct Root430 {
    char  _pad_00[0x4];
    struct Mid430 *p4;
};
struct Mid430 {
    char  _pad_00[0xa4];
    struct Ctx430 *ctx;
};

extern char data_021a63d0[];
extern int  func_020704e8(int a0, int a1, int a2, int a3);
extern void func_020a7388(void *dst, void *src, int n);

int func_02070430(int a0, int a1) {
    struct Ctx430 *ctx;
    int n, r;

    ctx = ((struct Root430 *)data_021a63d0)->p4->ctx;
    if (ctx == 0) return 0;

    n = ctx->m60;
    if (n == 0) {
        func_020704e8(a0, a1, 0, 0);
        return 0;
    }

    r = func_020704e8((int)ctx->m5c, n, a0, a1);
    if ((unsigned int)r >= (unsigned int)ctx->m60) {
        int m = ctx->m60;
        ctx->m60 = 0;
        return r - m;
    }
    func_020a7388(ctx->m5c, (char *)ctx->m5c + r, ctx->m60 - r);
    ctx->m60 = ctx->m60 - r;
    return 0;
}
