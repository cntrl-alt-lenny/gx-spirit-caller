/* CAMPAIGN-PREP candidate for func_022affe4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield-insert (&~0xf)|9 then |0x10; exact field store-order
 *   risk:       reshape-able: store-order is the lever -- orig does ldrh f14;bic;orr;strh; THEN str handle; ldrh f14;orr 0x10. If mwcc folds the two f14 RMWs or reorders the handle store, strh/str sequence diverges. f10/fc offsets struct-guessed.
 *   confidence: med
 */
/* func_ov002_022affe4: store 7 into self+4, alloc OAM handle
 * (func_02006c0c on data_ov002_022cc7b0), init descriptor
 * (func_0201d47c), then build it in source store-order: handle@0,
 * f14=(x&~0xf)|9 then |0x10, fc=0x1400, f10=0x200, submit, release. */

struct oam_cell2 {
    int   handle;           /* 0x00 */
    int   f4;
    int   f8;
    int   fc;               /* 0x0c */
    unsigned short f10;     /* 0x10 */
    unsigned short pad12;
    unsigned short f14;     /* 0x14 : bitfield insert */
    unsigned short pad16;
    int   pad18[(0x28 - 0x18) / 4];
};

extern int  data_ov002_022cc7b0[];
extern int  func_02006c0c(int *src, int a, int b);
extern void func_02006e1c(int handle);
extern void func_0201d47c(struct oam_cell2 *d);
extern void func_0201e5b8(struct oam_cell2 *d);

void func_ov002_022affe4(int *self) {
    struct oam_cell2 d;
    int handle;

    self[1] = 7;
    handle = func_02006c0c(data_ov002_022cc7b0, 4, 0);
    func_0201d47c(&d);

    d.f14 = (d.f14 & ~0xf) | 9;
    d.handle = handle;
    d.f14 |= 0x10;
    d.fc = 0x1400;
    d.f10 = 0x200;
    func_0201e5b8(&d);
    func_02006e1c(handle);
}
