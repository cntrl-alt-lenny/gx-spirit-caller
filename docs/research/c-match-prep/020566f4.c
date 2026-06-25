/* CAMPAIGN-PREP candidate for func_020566f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     teardown: lock, free+null field, free field, free ctx, null handle
 *   risk:       ctx held in r4 across all calls (bind) matches; store-order of f460=0 vs f428 free may reorder; offsets guessed; shipped .s
 *   confidence: med
 */
/* func_020566f4: teardown. ctx=*p (r4); func_020586c8(ctx,1);
 *   func_020453b4(ctx->f460); ctx->f460=0; func_02054684(ctx->f428);
 *   func_020453b4(ctx); *p=0;
 * Note: ctx loaded BEFORE the lock call; f460 freed+nulled, f428 freed, ctx freed.
 */

extern void func_020586c8(void *ctx, int v);
extern void func_020453b4(void *mem);
extern void func_02054684(void *mem);

typedef struct {
    char pad428[0x428];
    void *f428;         /* +0x428 */
    char pad42c[0x460 - 0x42c];
    void *f460;         /* +0x460 */
} Ctx;

void func_020566f4(Ctx **p) {
    Ctx *ctx = *p;
    func_020586c8(ctx, 1);
    func_020453b4(ctx->f460);
    ctx->f460 = 0;
    func_02054684(ctx->f428);
    func_020453b4(ctx);
    *p = 0;
}
