/* CAMPAIGN-PREP candidate for func_02055c04 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain returning 2/0 + ==4 dispatch + two tail calls
 *   risk:       func_0205ffc0 first arg is ctr (ip) vs p — ambiguous; offsets 0x108/0x1d8 guessed; predicated early-outs may not match (brief 302 ships .s)
 *   confidence: low
 */
/* func_02055c04: guard-dispatch. ctx=*p; if(!p||!ctx) return 2; if(ctx->f108) return 0;
 *   if (ctx->f1d8 == 4) { func_0205ffc0(ctx_as_intptr? no: p? ) ...; return 2; } else return func_0205a18c(p);
 * The bl func_0205ffc0 takes r0=ctx (the deref, ip) and r1=&data_020ffc10.
 */

extern int func_0205ffc0(void *ctx, void *arg);
extern int func_0205a18c(void *p);
extern unsigned char data_020ffc10[];

typedef struct {
    char pad108[0x108];
    int  f108;          /* +0x108 */
    char pad1d8[0x1d8 - 0x10c];
    int  f1d8;          /* +0x1d8 */
} Ctx;

int func_02055c04(Ctx **p) {
    Ctx *ctx;
    if (p == 0) return 2;
    ctx = *p;
    if (ctx == 0) return 2;
    if (ctx->f108 != 0) return 0;
    if (ctx->f1d8 == 4) {
        func_0205ffc0(ctx, data_020ffc10);
        return 2;
    }
    return func_0205a18c(p);
}
