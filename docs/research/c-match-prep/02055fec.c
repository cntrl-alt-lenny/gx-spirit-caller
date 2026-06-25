/* CAMPAIGN-PREP candidate for func_02055fec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     double null-guard return-2 + flag return-0 + tail call
 *   risk:       addne/movne predicated return-0 vs branch may differ; f108 offset guessed; brief 302 shipped this as .s
 *   confidence: low
 */
/* func_02055fec: ctx=*p; if(!p||!ctx) return 2; if(ctx->f108) return 0;
 *   return func_020560a8(p, 0);  (r1=0 passed)
 */

extern int func_020560a8(void *p, int v);

typedef struct {
    char pad108[0x108];
    int  f108;          /* +0x108 */
} Ctx;

int func_02055fec(Ctx **p) {
    Ctx *ctx;
    if (p == 0) return 2;
    ctx = *p;
    if (ctx == 0) return 2;
    if (ctx->f108 != 0) return 0;
    return func_020560a8(p, 0);
}
