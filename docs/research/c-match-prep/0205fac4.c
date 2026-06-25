/* CAMPAIGN-PREP candidate for func_0205fac4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     memset then zero-stores in exact asm order (f8,f10,f14,fc,f20,f24); reload f1c before +1
 *   risk:       store-order of the six zero-fields (asm does f10/f14 before fc) and the str-then-ldr reload of f1c; reshape-able by source-order/reload. struct-guessed.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0205fac4 (main, class D).
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:  alloc 0x144 + memset; emit field zero-stores in the asm's EXACT order (f8,f10,f14,fc,f20,f24 - NOT ascending); reload f1c before +1
 *   risk:    store-order of the zero-fields and the str-then-ldr reload of f1c (0x1000) must reproduce; offsets guessed
 *   confidence: med
 */
/* func_0205fac4: allocate 0x144-byte object, memset 0, init fields, allocate a
 * (0x1000+1) sub-buffer into f18; on success zero f13c/f140, publish *out=p,
 * return 0; on either alloc failure call func_0205ffc0(err,...) and return 1. */

extern void *func_020453e8(int size);
extern void  func_0205ffc0(void *err, void *arg);
extern void  func_020a73d4(void *dst, int val, int len);
extern unsigned char data_02100e20[];

typedef struct Obj {
    int   f0;            /* +0x00  = arg2 */
    int   f4;            /* +0x04  = -1 */
    int   f8;            /* +0x08  = 0 */
    int   fc;            /* +0x0c  = 0 */
    int   f10;           /* +0x10  = 0 */
    int   f14;           /* +0x14  = 0 */
    char  _p18a[0x18 - 0x18];
    void *f18;           /* +0x18  sub-buffer */
    int   f1c;           /* +0x1c  = 0x1000 (reloaded before +1) */
    int   f20;           /* +0x20  = 0 */
    int   f24;           /* +0x24  = 0 */
    char  _p28[0x13c - 0x28];
    int   f13c;          /* +0x13c  = 0 on success */
    int   f140;          /* +0x140  = 0 on success */
} Obj;

int func_0205fac4(void *err, Obj **out, int arg2) {
    Obj *p = (Obj *)func_020453e8(0x144);
    if (p == 0) {
        func_0205ffc0(err, data_02100e20);
        return 1;
    }
    func_020a73d4(p, 0, 0x144);
    p->f0 = arg2;
    p->f4 = -1;
    p->f8 = 0;
    p->f10 = 0;
    p->f14 = 0;
    p->fc = 0;
    p->f20 = 0;
    p->f24 = 0;
    p->f1c = 0x1000;
    p->f18 = func_020453e8(p->f1c + 1);
    if (p->f18 != 0) {
        p->f13c = 0;
        p->f140 = 0;
        *out = p;
        return 0;
    }
    func_0205ffc0(err, data_02100e20);
    return 1;
}
