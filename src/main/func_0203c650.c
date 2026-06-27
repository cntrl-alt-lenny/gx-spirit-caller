/* CAMPAIGN-PREP candidate for func_0203c650 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload ctx for +0x78/+0x74; mul by literal 0x3e8; movcc guards via if-return
 *   risk:       reshape-able: arg order into func_020b3a7c. Orig sets r0=t (the *1000 product) and r1=h before bl; if mwcc swaps eval order, the two args land reversed -- keep product as first arg / first-evaluated.
 *   confidence: med
 */
/* func_0203c650: gated cooldown check returning a small status int.
 * If !arg return 0. If halfword[arg+0xb0] bit 0x4000 clear return 1.
 * Else t = arg[+0x78].word[+0x20] * 1000; h = halfword[ arg[+0x74] +0x1c ];
 * r = func_020b3a7c(t, h); return r==0 ? 1 : r. Struct base arg reloaded
 * for the two [+0x78]/[+0x74] derefs (orig does ldr r2,[r0,#0x78];
 * ldr r1,[r0,#0x74] back-to-back off r0). */

extern int func_020b3a7c(int a, int b);

typedef struct Ctx_0203c650 {
    char           _pad0[0x74];
    unsigned char *f_74;         /* +0x74 */
    int           *f_78;         /* +0x78 */
    char           _pad1[0x34];  /* 0x7c..0xb0 */
    unsigned short f_b0;         /* +0xb0 */
} Ctx_0203c650;

int func_0203c650(Ctx_0203c650 *ctx) {
    int r;
    if (ctx == 0) return 0;
    if ((ctx->f_b0 & 0x4000) == 0) return 1;
    r = func_020b3a7c(ctx->f_78[8] * 1000, *(unsigned short *)(ctx->f_74 + 0x1c));
    if (r == 0) return 1;
    return r;
}
