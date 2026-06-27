/* CAMPAIGN-PREP candidate for func_020336cc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack-arg marshalling: [sp]=ctx, stmib {func_02032998,ctx}; orr #0x200 flag after call
 *   risk:       struct-guessed: the call signature/arg-order is reverse-engineered from str [sp]/stmib + r0..r3; literal pool order (cb2=02032a00 in r3, cb1=02032c78 in r1). High chance arg layout differs -> permuter-class for the stack-arg packing.
 *   confidence: low
 */
typedef struct Ctx {
    /* 0x00 */ char _pad00[0xeb4];
    /* 0xeb4 */ unsigned int flags;
} Ctx;

extern void func_02032998(void);
extern void func_02032a00(void);
extern void func_02032c78(void);
extern int func_02046fc4(int a, void *cb1, Ctx *ctx, void *cb2, void *self, int x, Ctx *ctx2);

void func_020336cc(Ctx *ctx)
{
    func_02046fc4(0, (void *)func_02032c78, ctx, (void *)func_02032a00,
                  (void *)func_02032998, (int)ctx, ctx);
    ctx->flags |= 0x200;
}
