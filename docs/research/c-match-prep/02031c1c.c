/* CAMPAIGN-PREP candidate for func_02031c1c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: movs>>24 then idx==0?6:idx-1; mla via idx*0x64 stride; store-order f2c,f8,fc.
 *   risk:       The mla (idx*0x64 + base) fuses only if mwcc keeps idx in a reg and folds *0x64; binding the product may emit mul+add not mla. Store interleave (f2c before, f8/fc mid) is decl/store-order. reshape-able.
 *   confidence: med
 */
/* func_02031c1c: store args, compute table index from (r2>>24), mla into a
 * 0x64-stride table at data_0219adcc, dispatch to one of two helpers based on
 * (r2 & 1), return obj->f10/f14 as a 64-bit pair.
 *   idx = (r2>>24); if(idx==0) idx=6 else idx-=1
 *   slot = &data_0219adcc + idx*0x64
 *   if (r2 & 1) func_02031ab0(slot, obj) else func_02031b38(slot, obj)
 */

extern char data_0219adcc[];
extern void func_02031ab0(void *slot, void *obj);
extern void func_02031b38(void *slot, void *obj);

struct Obj_02031c1c {
    char  _pad0[0x8];
    int   f8;    /* +0x8 */
    int   fc;    /* +0xc */
    int   f10;   /* +0x10 */
    int   f14;   /* +0x14 */
    char  _pad1[0x14];
    void *f2c;   /* +0x2c */
};

unsigned long long func_02031c1c(struct Obj_02031c1c *obj, void *a1,
                                 int a2, int a3, int a4) {
    unsigned int hi = (unsigned int)a2 >> 0x18;
    int idx;
    char *slot;
    obj->f2c = a1;
    if (hi == 0) idx = 6; else idx = hi - 1;
    obj->f8 = a3;
    obj->fc = a4;
    slot = data_0219adcc + idx * 0x64;
    if (a2 & 1) {
        func_02031ab0(slot, obj);
    } else {
        func_02031b38(slot, obj);
    }
    return *(unsigned long long *)&obj->f10;
}
