/* CAMPAIGN-PREP candidate for func_02033718 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bic chain folds to 5 sequential &=~bit; DOUBLE store [+0xeb4] (after 4th bic, then 5th); marshalling
 *   risk:       reshape-able: the two `str ip,[r3,#0xeb4]` (after clearing 0x17000 then again after 0x40000) must both emit. If mwcc coalesces to one store it loses the double-write. Keep two assignments split by the 0x40000 clear. cb literal order guessed.
 *   confidence: low
 */
typedef struct Ctx {
    /* 0x00 */ char _pad00[0xeb4];
    /* 0xeb4 */ unsigned int flags;
} Ctx;

extern void func_020329dc(void);
extern void func_02032ac4(void);
extern int func_02046f24(int a, int b, void *cb, Ctx *ctx);

void func_02033718(Ctx *ctx, int a, int b)
{
    unsigned int f;

    f = ctx->flags;
    f &= ~0x2000u;
    f &= ~0x1000u;
    f &= ~0x4000u;
    f &= ~0x10000u;
    ctx->flags = f;
    f &= ~0x40000u;
    ctx->flags = f;
    func_02046f24(a, b, (void *)func_020329dc, ctx);
}
