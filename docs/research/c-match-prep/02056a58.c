/* CAMPAIGN-PREP candidate for func_02056a58 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r4=this, r5=this->p bound up front (ldr r5,[r4] before call); stack slot &e passed as r2; reload [sp] as Ent*
 *   risk:       Signature of func_0205d6bc unclear (r0=this,r1 untouched? r2=&stack). I could not cleanly express the r2=sp out-param + r5 pre-load ordering; control-flow stub only. permuter-class/struct-guessed — needs real prototype + struct before build.
 *   confidence: low
 */
#include "nitro/types.h"

extern void func_020453b4(void *p);
extern s32  func_02057730(void *o);
extern s32  func_0205d4c0(void *q);
extern void func_0205d674(void *o, void *e);
extern void func_0205d6bc(void *o, void *u, void **out);
extern void func_0205ffc0(void *o, void *lit);

extern u8 data_020fff64[]; /* _LIT0 */

typedef struct Ent {
    u8   _pad0[0x10];
    s32  f10;            /* 0x10 */
    s32  f14;            /* 0x14 */
} Ent;

typedef struct Obj {
    s32  f0;             /* 0x0 -> base */
} Obj;

typedef struct Base {
    u8   _pad0[0x100];
    s32  f100;           /* 0x100 */
} Base;

s32 func_02056a58(Obj *o)
{
    Base *b = (Base *)o->f0;
    Ent *e;

    if (func_0205d6bc(o, (void *)&e /*r2=sp*/, 0), /* placeholder */ 0) {}
    return 0;
}
