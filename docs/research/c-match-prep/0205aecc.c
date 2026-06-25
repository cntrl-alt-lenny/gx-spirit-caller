/* CAMPAIGN-PREP candidate for func_0205aecc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r6=o, r4=*o bound across both blocks, r5=a1; signed >0 guard (ble); r2 arg loaded per-call (reload f198 each block)
 *   risk:       First call in block-1 (`bl func_02058070` with r2=_LIT0) executes BEFORE r0/r1 are set to r6/r5 in the asm — implying the FIRST call reuses incoming r0/r1 (o,a1 already there). If mwcc reorders the r2 load vs r0/r1 setup, scheduling diverges. reshape-able (operand-eval order) but borderline. Offsets struct-guessed.
 *   confidence: med
 */
#include "nitro/types.h"

extern void func_02058038(void *a, void *b, s32 v);
extern void func_02058070(void *a, void *b, s32 v);

extern u8 data_021007bc[]; /* _LIT1 */
extern u8 data_021009ac[]; /* _LIT0 */
extern u8 data_021009c4[]; /* _LIT2 */

typedef struct Inner {
    u8   _pad0[0x198];
    s32  f198;           /* 0x198 */
    u8   _pad19c[0x440 - 0x19c];
    s32  f440;           /* 0x440 */
    u8   _pad444[0x448 - 0x444];
    s32  f448;           /* 0x448 */
    u8   _pad44c[0x450 - 0x44c];
    s32  f450;           /* 0x450 */
    u8   _pad454[0x458 - 0x454];
    s32  f458;           /* 0x458 */
} Inner;

typedef struct Obj {
    Inner *p;            /* 0x0 */
} Obj;

s32 func_0205aecc(Obj *o, void *a1)
{
    Inner *p = o->p;

    if (p->f448 > 0) {
        func_02058070(o, a1, (s32)data_021009ac);
        func_02058038(o, a1, p->f198);
        func_02058070(o, a1, p->f440);
        func_02058070(o, a1, (s32)data_021007bc);
        p->f448 = 0;
    }
    if (p->f458 > 0) {
        func_02058070(o, a1, (s32)data_021009c4);
        func_02058038(o, a1, p->f198);
        func_02058070(o, a1, p->f450);
        func_02058070(o, a1, (s32)data_021007bc);
        p->f458 = 0;
    }
    return 0;
}
