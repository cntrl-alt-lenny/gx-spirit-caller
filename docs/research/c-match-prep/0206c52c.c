/* CAMPAIGN-PREP candidate for func_0206c52c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain: mvn err consts, ok/ok2 bool idiom; pass ctx->f72 (not literal 1) to bf94
 *   risk:       bf94 arg3: asm has NO `mov r2,#1` before func_0206bf94 -- r2 still holds f72 (=1, proven by guard) from the `ldrsb f72;cmp#1` test. reshape-able: pass `ctx->f72` so mwcc reuses that reg; writing literal 1 emits `mov r2,#1` and diverges. struct-guessed offsets.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206c52c (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Sibling of 0206d96c/0206d1f0 guard chain.
 *   recipe: guard chain w/ mvn err codes; ok/ok2 bool shape; f72 reused as bf94 arg3
 * Guards (each early-return on failure):
 *   func_0206e4a4(ctx)!=0 -> ~0x1b
 *   !(ctx && (f70&1)) -> ~0x26
 *   (f70 & 2) -> ~0x1b
 *   !(f73==0 || f73==4) -> ~0x1b
 *   (f72 != 1) -> ~0x5
 *   (f74 == 0) -> ~0x1b
 * Success: p = func_0206bf94(func_0206c4b0, ctx, ctx->f72);
 *   p->h10 = ctx->f74; p->p14 = a1; p->p18 = a2; ctx->f70 |= 2;
 *   return func_0206be54(ctx);
 */
typedef struct Ctx Ctx;
struct Ctx {
    char  _pad_00[0x70];
    short f70;             /* +0x70 ldrsh/strh */
    signed char f72;       /* +0x72 ldrsb */
    signed char f73;       /* +0x73 ldrsb */
    unsigned short f74;    /* +0x74 ldrh */
};
typedef struct {
    char  _pad_00[0x10];
    short h10;             /* +0x10 strh = f74 */
    char  _pad_12[0x14 - 0x12];
    void *p14;             /* +0x14 str = a1 */
    void *p18;             /* +0x18 str = a2 */
} Cmd;

extern int  func_0206e4a4(Ctx *ctx);
extern Cmd *func_0206bf94(void *tag, Ctx *ctx, int kind);
extern int  func_0206be54(Ctx *ctx);
extern void func_0206c4b0(void);    /* _LIT0, by address */

int func_0206c52c(Ctx *ctx, void *a1, void *a2) {
    Cmd *p;
    int ok;
    if (func_0206e4a4(ctx) != 0)
        return ~0x1b;
    ok = 0;
    if (ctx != 0 && (ctx->f70 & 1))
        ok = 1;
    if (!ok)
        return ~0x26;
    if (ctx->f70 & 2)
        return ~0x1b;
    ok = 1;
    if (ctx->f73 != 0 && ctx->f73 != 4)
        ok = 0;
    if (!ok)
        return ~0x1b;
    if (ctx->f72 != 1)
        return ~0x5;
    if (ctx->f74 == 0)
        return ~0x1b;
    p = func_0206bf94((void *)func_0206c4b0, ctx, ctx->f72);
    p->h10 = (short)ctx->f74;
    p->p14 = a1;
    p->p18 = a2;
    ctx->f70 |= 2;
    return func_0206be54(ctx);
}
