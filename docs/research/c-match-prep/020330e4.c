/* CAMPAIGN-PREP candidate for func_020330e4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign clamp; ctx bound r7; store-order ebc/ec0/eb0/eac; fn-ptr literal-pool order
 *   risk:       Store-order ebc->ec0->eb0->eac: mwcc may schedule stores by ascending offset (eac,eb0,ebc,ec0) differing from orig; reshape-able by re-ordering field writes.
 *   confidence: med
 */
/* func_020330e4 (main, class C) — alloc/init dispatch via blx callback + chained setup.
 * r0=flag(test only), r1=n(clamp 0x40), r2=alloc fn-ptr (blx), r3=a3. r7=ctx held across stores. */
typedef struct {
    unsigned char _pad_00[0xeac];
    int   f_eac;          /* +0xeac */
    int   f_eb0;          /* +0xeb0 */
    unsigned char _pad_eb4[0xebc - 0xeb4];
    int   f_ebc;          /* +0xebc */
    int   f_ec0;          /* +0xec0 */
} Obj_020330e4;

typedef void *(*Alloc_020330e4)(int sz, int align);

extern int   data_020fe468;
extern void  func_02032624(int a);
extern void  func_0203267c(Obj_020330e4 *c);
extern void  func_0203269c(void);
extern void  func_020326bc(void);
extern int   func_020326d4(Obj_020330e4 *c, int n);
extern int   func_02033054(void *alloc, int a3, int z);
extern void  func_020454f0(void *cb1, void *cb2);
extern void  func_020945f4(Obj_020330e4 *c, int z, int sz);

int func_020330e4(int flag, int n, Alloc_020330e4 alloc, int a3)
{
    int r;
    if (flag == 0) {
        Obj_020330e4 *c = (Obj_020330e4 *)alloc(0xfa4, 4);
        if (c == 0)
            return -1;
        func_020945f4(c, 0, 0xfa4);
        c->f_ebc = (int)alloc;
        if (n > 0x40)
            n = 0x40;
        c->f_ec0 = a3;
        c->f_eb0 = 0x7530;
        c->f_eac = n;
        if (func_020326d4(c, n) < 0)
            return -1;
        func_0203267c(c);
    }
    func_02032624(2);
    r = data_020fe468;
    if (r < 0)
        r = func_02033054((void *)alloc, a3, 0);
    func_020454f0((void *)func_0203269c, (void *)func_020326bc);
    return r;
}
