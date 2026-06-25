/* CAMPAIGN-PREP candidate for func_0204ec90 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ctx->b0 guard block (return 2); 5-iter loop; status 0/3 early-returns
 *   risk:       loop body is mis-rendered: orig threads func_02062510's result as r0 into func_020657c0 with func_02049990/func_02049d6c address literals stacked ([sp]=&f, [sp+4]=ctx). The chained call/arg flow is struct-guessed and won't compile as written — confirm the real call graph. struct-guessed.
 *   confidence: low
 */
// func_0204ec90 — early-out guard then fixed 5-iteration poll loop (class C)
// arg r0=ctx held in r7. First branch: if ctx->b0==0 do an init+submit and
// possibly return 2. Then loop 5 times calling a dispatch that returns a
// status; 0 or 3 returns immediately, otherwise continue.

typedef struct GxState GxState;
typedef struct Ctx Ctx;

extern GxState *func_020498f0(void);
extern int  func_02049990(void);
extern int  func_02049d6c(void);
extern int  func_0204aaf4(void);
extern int  func_02062510(int);
extern int  func_02064f84(int, int, int);
extern int  func_020657c0(int, int, int, int);   // (a, b, c, d) + 2 stacked
extern int  func_02068d50(int, int, int, int);

struct GxState { unsigned char pad[0xe4]; int we4; };
struct Ctx {
    unsigned char b0;     // +0x0
    unsigned char b1;
    unsigned short h2;    // +0x2
    int w4;               // +0x4
    int w8;               // +0x8
};

int func_0204ec90(Ctx *ctx) {
    int i;

    if (ctx->b0 == 0) {
        GxState *p = func_020498f0();   // r4
        int v = func_02064f84(ctx->w4, 0, 0);
        func_02068d50(p->we4, v, ctx->h2, ctx->w8);
        if (func_0204aaf4() != 0) return 2;
    }

    for (i = 0; i < 5; i++) {
        int s;
        func_02062510(*(int *)func_020498f0()->pad /* [r0+4]->[0] */);
        s = func_020657c0(func_02062510_val_placeholder, ctx->w8, ctx->b0, (int)func_02049d6c);
        (void)s;
        if (s == 0) return s;     /* placeholder body, see note */
    }
    return 0;
}
