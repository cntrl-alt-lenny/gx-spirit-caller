/* CAMPAIGN-PREP candidate for func_02056594 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind inner base r4 once; emit field stores in asm order incl doubled f1dc/f1ec/f1f4/f440/f450 writes
 *   risk:       Doubled `str r0,[r4,#X]` twice per free-block: mwcc may dead-store-eliminate the duplicate. Keep both literal C assignments; reshape-able (literal dup stores). Offsets struct-guessed.
 *   confidence: med
 */
#include "nitro/types.h"

extern void func_020453b4(void *p);
extern void func_020566d8(void *o);
extern void func_0205bd58(void *o);
extern void func_0205d560(void *o, void *q);

extern u8 data_020fff4c[]; /* _LIT0 target (referenced via func_0205d560 r1) */

typedef struct Inner {
    u8   _pad0[0x110];
    u8   f110;            /* 0x110 */
    u8   _pad111[0x12f - 0x111];
    u8   f12f;            /* 0x12f */
    u8   _pad130[0x144 - 0x130];
    u8   f144;            /* 0x144 */
    u8   _pad145[0x198 - 0x145];
    s32  f198;            /* 0x198 */
    s32  f19c;            /* 0x19c */
    s32  f1a0;            /* 0x1a0 */
    u8   _pad1a4[0x1d4 - 0x1a4];
    s32  f1d4;            /* 0x1d4 */
    s32  f1d8;            /* 0x1d8 */
    s32  f1dc;            /* 0x1dc */
    s32  f1e0;            /* 0x1e0 */
    s32  f1e4;            /* 0x1e4 */
    s32  f1e8;            /* 0x1e8 */
    s32  f1ec;            /* 0x1ec */
    s32  f1f0;            /* 0x1f0 */
    s32  f1f4;            /* 0x1f4 */
    s32  f1f8;            /* 0x1f8 */
    s32  f1fc;            /* 0x1fc */
    s32  f200;            /* 0x200 */
    s32  f204;            /* 0x204 */
    u8   _pad208[0x20c - 0x208];
    s32  f20c;            /* 0x20c */
    s32  f210;            /* 0x210 */
    s32  f214;            /* 0x214 */
    u8   f218;            /* 0x218 */
    u8   _pad219[0x318 - 0x219];
    u8   f318;            /* 0x318 */
    u8   _pad319[0x41c - 0x319];
    s32  f41c;            /* 0x41c */
    u8   _pad420[0x424 - 0x420];
    s32  f424;            /* 0x424 */
    u8   _pad428[0x430 - 0x428];
    s32  f430;            /* 0x430 */
    s32  f434;            /* 0x434 */
    u8   _pad438[0x440 - 0x438];
    s32  f440;            /* 0x440 */
    s32  f444;            /* 0x444 */
    s32  f448;            /* 0x448 */
    u8   _pad44c[0x450 - 0x44c];
    s32  f450;            /* 0x450 */
    s32  f454;            /* 0x454 */
    s32  f458;            /* 0x458 */
    s32  f45c;            /* 0x45c */
} Inner;

typedef struct Outer {
    Inner *p;            /* 0x0 */
} Outer;

void func_02056594(Outer *o)
{
    Inner *p = o->p;

    p->f110 = 0;
    p->f12f = 0;
    p->f144 = 0;
    p->f1d4 = -1;
    p->f1d8 = 0;
    p->f1e4 = 0;
    p->f1e8 = 0;
    p->f1e0 = 0;
    func_020453b4((void *)p->f1dc);
    p->f1dc = 0;
    p->f1dc = 0;
    p->f1f0 = 0;
    func_020453b4((void *)p->f1ec);
    p->f1ec = 0;
    p->f1ec = 0;
    p->f1fc = 0;
    p->f200 = 0;
    p->f1f8 = 0;
    func_020453b4((void *)p->f1f4);
    p->f1f4 = 0;
    p->f1f4 = 0;
    p->f448 = 0;
    p->f44c = 0;
    p->f444 = 0;
    func_020453b4((void *)p->f440);
    p->f440 = 0;
    p->f440 = 0;
    p->f458 = 0;
    p->f45c = 0;
    p->f454 = 0;
    func_020453b4((void *)p->f450);
    p->f450 = 0;
    p->f450 = 0;
    p->f204 = -1;
    p->f20c = 2;
    while (p->f424 != 0) {
        func_0205bd58(o);
    }
    p->f424 = 0;
    p->f430 = 0;
    func_0205d560(o, data_020fff4c);
    p->f19c = 0;
    p->f1a0 = 0;
    p->f198 = 0;
    p->f210 = 0;
    p->f41c = 0;
    p->f434 = 0;
    p->f214 = -1;
    p->f218 = 0;
    p->f318 = 0;
}
