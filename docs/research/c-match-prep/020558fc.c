/* CAMPAIGN-PREP candidate for func_020558fc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     double null-guard return-2, branchless cond out-store
 *   risk:       struct field offsets guessed (0x108/0x430); mwcc may not fuse both stores branchless via movne/moveq predication
 *   confidence: low
 */
/* func_020558fc: leaf. ctx = *p (=p[0]); if(!p||!ctx) return 2;
 *   if (ctx->f108) { *out = 0; } else { *out = ctx->f430; } return 0.
 * (movne r0,0; strne; ldreq f430; moveq r0,0; streq) -> both branches set out and r0=0.
 */

typedef struct {
    char pad108[0x108];
    int  f108;          /* +0x108 */
    char pad10c[0x430 - 0x10c];
    int  f430;          /* +0x430 */
} Ctx;

int func_020558fc(Ctx **p, int *out) {
    Ctx *ctx;
    if (p == 0) return 2;
    ctx = *p;
    if (ctx == 0) return 2;
    if (ctx->f108 != 0)
        *out = 0;
    else
        *out = ctx->f430;
    return 0;
}
