/* CAMPAIGN-PREP candidate for func_0206dad8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain; orr#8 then strh = |=8; bind eng r5; reload [r5,#0x10c] each use (3x ldr)
 *   risk:       reshape-able: orig RELOADS [r5,#0x10c] three times (ldr before bf94, ldr after for be44) — if mwcc binds it to one reg the ldr count drops; keep separate derefs. f72 passed as 3rd arg (r2). struct-guessed.
 *   confidence: med
 */
/* func_0206dad8 @ main : class C (guard chain + flag set + call) */
typedef struct Ctx Ctx;
struct Ctx {
    char pad00[0x68];
    void *e68;             /* 0x68 engine (+0x10c handle) */
    char pad6c[0x70 - 0x6c];
    short f70;             /* 0x70 flags16 */
    signed char f72;       /* 0x72 */
};
struct Eng {
    char pad00[0x10c];
    void *h10c;            /* 0x10c */
};

extern int func_0206e4a4(Ctx *ctx);
extern int func_0206bf94(void *tag, int handle, int kind);
extern void func_0206be44(void *handle);
extern void func_0206da98(void);   /* _LIT0 address taken */

int func_0206dad8(Ctx *ctx)
{
    void *eng;
    int handle;
    int r;

    if (func_0206e4a4(ctx) != 0) {
        return ~0x1b;
    }
    {
        int ok = 0;
        if (ctx != 0 && (ctx->f70 & 1)) {
            ok = 1;
        }
        if (!ok) {
            return ~0x26;
        }
    }
    if (!(ctx->f70 & 4) && (ctx->f70 & 8)) {
        return ~0x37;
    }
    ctx->f70 |= 8;
    eng = ctx->e68;
    if (eng == 0) {
        return 0;
    }
    handle = *(int *)((char *)eng + 0x10c);
    if (handle == 0) {
        return 0;
    }
    r = func_0206bf94((void *)func_0206da98, *(int *)((char *)eng + 0x10c), ctx->f72);
    if (r == 0) {
        return ~0x20;
    }
    func_0206be44(*(void **)((char *)eng + 0x10c));
    return r;
}
