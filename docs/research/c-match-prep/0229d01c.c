/* CAMPAIGN-PREP candidate for func_0229d01c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: two separate +0x14 RMW (nibble|9 then |0x10); f_10 = -(arg2!=0); bind v=r5
 *   risk:       store order at +0x14/+0x00/+0x0c/+0x10 must match asm exactly; f_10 from cmp r6,#0 + movne/moveq/rsb = -(arg2!=0) — if mwcc emits ternary movcc rotation the rsb pattern flips. reshape-able (store-order + if-assign), struct-guessed
 *   confidence: med
 */
/* func_ov002_0229d01c: build one OAM/OBJ entry; return its computed +0xc word.
 * handle = func_0202be4c(arg2); fill 0x28 local via func_0201d47c; patch
 * attr +0x14 nibble->9 then |0x10; f_0=handle; f_c = (arg1<<10)+0x12800;
 * f_10 = -(arg2!=0) (signed halfword); register; commit; return f_c value. */
extern void *func_0202be4c(int a);
extern void  func_0201d47c(void *p);
extern void  func_0201e5b8(void *p);
extern void  func_02006e1c(void *h);

typedef struct {
    void           *f_00;
    char            _pad04[0x8];
    int             f_0c;
    short           f_10;
    char            _pad12[0x2];
    unsigned short  f_14;
} Oam_d01c;

int func_ov002_0229d01c(int unused, int arg1, int arg2) {
    Oam_d01c oam;
    void *h = func_0202be4c(arg2);
    int v = (arg1 << 10) + 0x12800;
    func_0201d47c(&oam);
    oam.f_00 = h;
    oam.f_14 = (oam.f_14 & ~0xf) | 0x9;
    oam.f_14 = oam.f_14 | 0x10;
    oam.f_0c = v;
    oam.f_10 = (short)-(arg2 != 0);
    func_0201e5b8(&oam);
    func_02006e1c(h);
    return v;
}
