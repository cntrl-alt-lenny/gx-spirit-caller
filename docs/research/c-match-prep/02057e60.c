/* CAMPAIGN-PREP candidate for func_02057e60 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order; bind obj->r4,ctx->r5; pass &locals as stack out-args; ldrsb read-back
 *   risk:       homed r0..r3 frame reused as &c scratch; func_02057f3c arg packing (3 stacked args + r2=&c) likely reorders. permuter-class/struct-guessed.
 *   confidence: low
 */
/* func_02057e60 (D): stack-arg spill + read-back signed byte tail. */
extern int  func_02054140(int a);
extern int  func_02057f3c(int ctx, void *outq, void *outr, void *lit, int h, char *outc, int one);
extern int  func_020581a8(int ctx, void *p, int c);
extern void func_020a6d54(unsigned char *m, unsigned char *f, int z, int line);
extern unsigned char data_021000d0[], data_021001cc[], data_021001f0[];
typedef struct Obj { char _0[0x08]; int f08; char _c[0x1c]; int f28; char _2c[4]; int f30; int f34; int f38; } Obj;
int func_02057e60(int ctx, Obj *obj) {
    int q, r;
    char c;
    if (obj->f28 == 0)
        func_020a6d54(data_021001cc, data_021000d0, 0, 0xde);
    if (obj->f30 - obj->f34 == 0 && func_02054140(obj->f38) == 0) {
        if (func_02057f3c(ctx, &q, &r, data_021001f0, obj->f08, &c, 1) != 0)
            return 0;
        if (r != 0)
            return 0;
    }
    return func_020581a8(ctx, &obj->f28, c);
}
