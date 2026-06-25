/* CAMPAIGN-PREP candidate for func_02032b30 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: tst+movne/moveq materializes (flags&0x4000)!=0 into bool then cmp; store-order orr-then-bic.
 *   risk:       The `tst;movne r0,#1;moveq r0,#0;cmp r0,#0` is mwcc materializing a bool from the bittest before branching — written as `if(!(x&0x4000))` it may fold to a direct tst+beq, dropping the two movs. reshape-able only if the bool is forced (e.g. `int t=(x&0x4000)!=0;`).
 *   confidence: low
 */
/* func_02032b30: flag-state machine on ctx->feb4 with a blx tail callback.
 * args: r1=a1, r2=a2, r3=a3, [sp+0x1c]=ctx, [sp+0x18]=a5.
 *   if (func_020334cc(ctx)) return;
 *   if (a1==0) { ctx->feb4 |= 0x3000; func_020327e4(ctx); }
 *   else {
 *     if (!(ctx->feb4 & 0x4000)) {
 *        if (a2) ctx->feb4 |= 0x4000; else ctx->feb4 &= ~0x4000;
 *     }
 *     if (a2==0) { if (a3) { ctx->feb4 |= 0x1000; ctx->feb4 &= ~0x2000; } }
 *     else { ctx->feb4 |= 0x1000; ctx->feb4 &= ~0x2000; }
 *   }
 *   if (ctx->feec) ctx->feec(a1, a2, a3, a5);   ; blx, a5 from [sp+0x18]
 */

extern int  func_020334cc(void *ctx);
extern void func_020327e4(void *ctx);

typedef void (*cbf5_t)(int a, int b, int c, int d);

struct Ctx_02032b30 {
    char   _pad0[0xeb4];
    int    feb4;   /* +0xeb4 */
    char   _pad1[0x34];
    cbf5_t feec;   /* +0xeec */
};

void func_02032b30(void *unused_r0, int a1, int a2, int a3,
                   int a5, struct Ctx_02032b30 *ctx) {
    if (func_020334cc(ctx) != 0) return;
    if (a1 == 0) {
        ctx->feb4 |= 0x3000;
        func_020327e4(ctx);
    } else {
        if (!(ctx->feb4 & 0x4000)) {
            if (a2) ctx->feb4 |= 0x4000;
            else    ctx->feb4 &= ~0x4000;
        }
        if (a2 == 0) {
            if (a3) {
                ctx->feb4 |= 0x1000;
                ctx->feb4 &= ~0x2000;
            }
        } else {
            ctx->feb4 |= 0x1000;
            ctx->feb4 &= ~0x2000;
        }
    }
    if (ctx->feec) {
        ctx->feec(a1, a2, a3, a5);
    }
}
