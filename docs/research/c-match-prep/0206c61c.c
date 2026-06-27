/* CAMPAIGN-PREP candidate for func_0206c61c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain; signed obj handle in r7; tail return (t>=0)?obj:t via movge
 *   risk:       signedness/return-fold: obj from func_0206c46c is tested `<0` (movs/bmi) and re-returned -- type it `int` not void* or the signed mi/ge guards invert. Tail `movge r0,r7` = `t>=0 ? obj : t`. f72 loaded to r0 here (not r2, no bf94). reshape-able. struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206c61c (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Same guard-chain family; obj is a signed handle.
 *   recipe: guard chain (mvn consts) + signed obj handle kept in r7; tail >=0 ? obj : err
 * Guards as in siblings, then:
 *   obj = func_0206c46c(&data_02101e64); if (obj < 0) return obj;        ; movs/bmi
 *   r = func_0206c9b0(obj, ctx->f74); if (r < 0) return r;               ; cmp#0/blt
 *   t = func_0206c52c(obj, a1, a2); return (t >= 0) ? obj : t;           ; movge r0,r7
 */
typedef struct Ctx Ctx;
struct Ctx {
    char  _pad_00[0x70];
    short f70;             /* +0x70 ldrsh */
    signed char f72;       /* +0x72 ldrsb */
    signed char f73;       /* +0x73 ldrsb */
    unsigned short f74;    /* +0x74 ldrh */
};

extern int data_02101e64;            /* _LIT0, address taken */
extern int func_0206e4a4(Ctx *ctx);
extern int func_0206c46c(void *tag);
extern int func_0206c9b0(int obj, int h74);
extern int func_0206c52c(int obj, void *a1, void *a2);

int func_0206c61c(Ctx *ctx, void *a1, void *a2) {
    int obj;
    int r;
    int t;
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
    obj = func_0206c46c(&data_02101e64);
    if (obj < 0)
        return obj;
    r = func_0206c9b0(obj, ctx->f74);
    if (r < 0)
        return r;
    t = func_0206c52c(obj, a1, a2);
    if (t >= 0)
        return obj;
    return t;
}
