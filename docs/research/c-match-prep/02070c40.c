/* CAMPAIGN-PREP candidate for func_02070c40 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref+NULL guard; flag-gated call then unconditional call; ctx in r4
 *   risk:       offsets 0x4/0xa4/0x9 guessed; helper arg types (ctx ptr) assumed; r4-cache vs reload of ctx for second call
 *   confidence: med
 */
/* func_02070c40 (main, class A): global->ctx deref, NULL guard, an
 * optional call gated by a byte flag (+0x9), then an unconditional
 * second call with ctx. Saves {r4,lr}; r4=ctx.
 *
 *   ctx = *(T**)(data_021a63d0 + 0x4) -> ->field_a4
 *   if(!ctx) return;
 *   if(ctx->f9) func_0207475c(ctx);
 *   func_02070c84(ctx);
 *
 * Both helpers take ctx (r0=r4 set before each bl). The first is
 * conditional (skipped to .L_1004 when f9==0); the second always runs.
 * r4 holds ctx across both. This is NOT a tail-only call — f9 gates the
 * first, the second is the common continuation.
 */

struct Ctx02070c40 {
    char _pad[0x9];
    unsigned char f9;       /* +0x9 */
};
struct Root02070c40 {
    char _pad04[0x4];
    struct Ctx02070c40 *p4; /* +0x4 */
};
struct Mid02070c40 {
    char _padA4[0xa4];
    struct Ctx02070c40 *ctx; /* +0xa4 */
};

extern char data_021a63d0[];
extern void func_0207475c(struct Ctx02070c40 *p);
extern void func_02070c84(struct Ctx02070c40 *p);

void func_02070c40(void)
{
    struct Ctx02070c40 *ctx;

    ctx = ((struct Mid02070c40 *)
               ((struct Root02070c40 *)data_021a63d0)->p4)->ctx;
    if (ctx == 0)
        return;

    if (ctx->f9)
        func_0207475c(ctx);
    func_02070c84(ctx);
}
