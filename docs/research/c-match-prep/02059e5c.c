/* CAMPAIGN-PREP candidate for func_02059e5c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     4-word unrolled copy loop = ldmia/stmia (mwcc lowers struct/array block copy); reload h->fc (ldr r1,[r5,#0xc]) before each transformed store
 *   risk:       The ldmia!/stmia! 4-reg loop only emerges from a struct/array copy mwcc deems worthy of block-move; an explicit dp[0..3] loop may instead emit single ldr/str. permuter-class (block-copy heuristic). The per-field reload of h->fc is asm-faithful (good). Offsets struct-guessed.
 *   confidence: low
 */
#include "nitro/types.h"

extern void *func_020453e8(u32 size);
extern s32   func_020552dc(s32 v);
extern void  func_02059d90(void *r);

typedef struct Dst {
    u8   _pad0[0xc8 + 4];
    /* fields written: 0x0,0x4,0x8,0xc,0x10,0x14,0xc8 via func_020552dc */
} Dst;

typedef struct Holder {
    u8   _pad0[0xc];
    Dst *fc;             /* 0xc -> allocated */
} Holder;

typedef struct Base {
    u8   _pad0[0x100];
    s32  f100;           /* 0x100 */
} Base;

typedef struct Obj {
    Base *p;             /* 0x0 */
} Obj;

s32 func_02059e5c(Obj *o, Holder *h, s32 *src)
{
    Dst *d;

    if (((Base *)o->p)->f100 == 0) {
        return 1;
    }
    func_02059d90((void *)h);
    h->fc = (Dst *)func_020453e8(0xf0);
    d = h->fc;
    if (d != 0) {
        /* 16-word (0x40-byte) block copy: ldmia/stmia x15 of 4 words */
        s32 *dp = (s32 *)d;
        s32 *sp = src;
        s32 n = 0xf;
        do {
            dp[0] = sp[0];
            dp[1] = sp[1];
            dp[2] = sp[2];
            dp[3] = sp[3];
            dp += 4;
            sp += 4;
        } while (--n != 0);

        *(s32 *)((char *)h->fc + 0x0)  = func_020552dc(src[0]);
        *(s32 *)((char *)h->fc + 0x4)  = func_020552dc(src[1]);
        *(s32 *)((char *)h->fc + 0x8)  = func_020552dc(src[2]);
        *(s32 *)((char *)h->fc + 0xc)  = func_020552dc(src[3]);
        *(s32 *)((char *)h->fc + 0x10) = func_020552dc(src[4]);
        *(s32 *)((char *)h->fc + 0x14) = func_020552dc(src[5]);
        *(s32 *)((char *)h->fc + 0xc8) = func_020552dc(*(s32 *)((char *)src + 0xc8));
    }
    return h->fc != 0 ? 1 : 0;
}
