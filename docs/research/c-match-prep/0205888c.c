/* CAMPAIGN-PREP candidate for func_0205888c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r6=o, r5=e, r4=*o bound; reload e->f8 each store; free-then-null pairs in asm order; if-assign guards
 *   risk:       Final guard: orig branches `f8!=0 -> .L_8ac(return1)` else into L_898 shared with the (fc==0||...) path returning 0 via func_0205d674; my &&-chain inverts to `f8==0` for the call. Branch polarity may flip movne/moveq. reshape-able (reorder guard) but block layout risk.
 *   confidence: med
 */
#include "nitro/types.h"

extern void func_020453b4(void *p);
extern void func_0205d674(void *o, void *e);

typedef struct Ent {
    u8   _pad0[0x8];
    s32  f8;             /* 0x8 -> sub */
    s32  fc;             /* 0xc */
    s32  f10;            /* 0x10 */
    s32  f14;            /* 0x14 */
    s32  f18;            /* 0x18 */
} Ent;

typedef struct Sub {
    u8   _pad0[0x8];
    s32  f8;             /* 0x8 */
    s32  fc;             /* 0xc */
} Sub;

typedef struct Base {
    u8   _pad0[0x104];
    s32  f104;           /* 0x104 */
} Base;

typedef struct Obj {
    Base *p;             /* 0x0 */
} Obj;

s32 func_0205888c(Obj *o, Ent *e)
{
    Base *b = o->p;

    if (e->f8 != 0 && b->f104 == 0) {
        func_020453b4((void *)((Sub *)e->f8)->f8);
        ((Sub *)e->f8)->f8 = 0;
        func_020453b4((void *)((Sub *)e->f8)->fc);
        ((Sub *)e->f8)->fc = 0;
        func_020453b4((void *)e->f8);
        e->f8 = 0;
    }
    func_020453b4((void *)e->f10);
    e->f10 = 0;
    func_020453b4((void *)e->f18);
    e->f18 = 0;
    e->f14 = 0;
    if (e->fc != 0 && b->f104 == 1 && e->f8 == 0) {
        func_0205d674(o, e);
        return 0;
    }
    return 1;
}
