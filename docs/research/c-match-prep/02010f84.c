/* CAMPAIGN-PREP candidate for func_02010f84 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     &arr[index] mla (no pre-bind); fixed-value stores in exact asm order; switch(mode)
 *   risk:       struct-guessed/reshape-able: many fixed stores; mwcc may CSE the zero constant or reorder same-value stores (esp. mode0 re-zeroes f60/f64 already common). Offsets/0xb8 stride inferred from data_0218fd10
 *   confidence: med
 */
/* func_02010f84 @ 0x02010f84 (main, class D)
 * mla base + many fixed init stores + switch(mode). Indexes a 0xb8-stride
 * struct array at data_0218fd10 by `index` (valid index 0..1), runs two
 * sub-inits via func_020110c4, writes a fixed common block, then a mode-0
 * or mode-1 specific block. returns &arr[index].
 *
 * r0 = mode, r1 = index. guard: index in [0,2) else return 0.
 * mla r4,index,0xb8,base  == &arr[index]  (do NOT pre-bind base; let &arr[i]
 * fold the index*0xb8 into the mla).
 *
 * STORE-ORDER SENSITIVE: emit fields in exactly the asm order.
 */

extern unsigned char data_0218fd10[];
extern void func_020110c4(void *p);
extern void func_02010eb8(void);

struct El02010f84 {
    char  _p00[0x60];
    int   f60;            /* 0x60 */
    int   f64;            /* 0x64 */
    int   f68;            /* 0x68 */
    int   f6c;            /* 0x6c */
    int   f70;            /* 0x70 */
    int   f74;            /* 0x74 */
    int   f78;            /* 0x78 */
    int   f7c;            /* 0x7c */
    int   f80;            /* 0x80 */
    int   f84;            /* 0x84 */
    int   f88;            /* 0x88 */
    int   f8c;            /* 0x8c */
    int   f90;            /* 0x90 */
    short h94;            /* 0x94 */
    short h96;            /* 0x96 */
    short h98;            /* 0x98 */
    short h9a;            /* 0x9a */
    int   f9c;            /* 0x9c */
    int   fa0;            /* 0xa0 */
    char  _pa4[0xa8 - 0xa4];
    int   fa8;            /* 0xa8 */
    int   fac;            /* 0xac */
    int   fb0;            /* 0xb0 */
    int   fb4;            /* 0xb4 */
};

void *func_02010f84(int mode, int index)
{
    struct El02010f84 *e;

    if (index < 0 || index >= 2) {
        return 0;
    }
    e = &((struct El02010f84 *)data_0218fd10)[index];

    e->fa8 = 1;
    func_020110c4(e);
    func_020110c4((char *)e + 0x30);

    e->f60 = 0;
    e->f64 = 0;
    e->f68 = 0xa000;
    e->f6c = 0;
    e->f70 = 0;
    e->f74 = 0;
    e->f78 = 0;
    e->f7c = 0x1000;
    e->f80 = 0;
    e->f90 = 0;

    if (mode == 0) {
        e->f9c = 0x7500;
        e->h94 = 0;
        e->h96 = 0;
        e->h98 = 0;
        e->h9a = (short)0x8000;
        e->f84 = 0;
        e->f88 = 0;
        e->f8c = 0;
        e->f60 = 0;
        e->f64 = 0;
        e->f68 = 0x00008fb2;
        e->f6c = 0;
        e->f70 = 0;
        e->f74 = 0;
        e->fa0 = 0x41c80000;
        e->fb4 = 0;
        e->fac = 0;
        e->fb0 = 0;
    } else if (mode == 1) {
        e->fb4 = 1;
        e->fac = 0;
        e->fb0 = (int)&func_02010eb8;
    }
    return e;
}
