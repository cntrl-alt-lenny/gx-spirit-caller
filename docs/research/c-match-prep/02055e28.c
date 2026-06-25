/* CAMPAIGN-PREP candidate for func_02055e28 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     triple null/flag guard + lock call + tail call
 *   risk:       ldmeq/ldmne predicated returns instead of branches may not reproduce; f108 offset guessed; brief 302 shipped this as .s
 *   confidence: low
 */
/* func_02055e28: if(!p) return; ctx=*p; if(!ctx) return; if(ctx->f108) return;
 *   func_020586c8(ctx, 1); return func_02056594(p);
 * r4=p preserved; the f108!=0 path early-returns (ldmne), else two calls.
 */

extern void func_020586c8(void *ctx, int v);
extern int  func_02056594(void *p);

typedef struct {
    char pad108[0x108];
    int  f108;          /* +0x108 */
} Ctx;

int func_02055e28(Ctx **p) {
    Ctx *ctx;
    if (p == 0) return 0;
    ctx = *p;
    if (ctx == 0) return 0;
    if (ctx->f108 != 0) return 0;
    func_020586c8(ctx, 1);
    return func_02056594(p);
}
