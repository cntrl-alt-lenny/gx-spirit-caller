/* CAMPAIGN-PREP candidate for func_022ae2e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return guard; bitfield-insert (&~0xf)|9; field store-order preserved
 *   risk:       struct-guessed: the format buffer and descriptor share one stack frame (sp+0x28 vs sp+0x0); if mwcc lays the two locals in the other order, the sp offsets (0x14/0xc) diverge.
 *   confidence: med
 */
/* func_ov002_022ae2e0: build one OAM cell from table entry r2(<=10) and a
 * shift base r1. Guards r2>10 (early return). Looks up
 * data_ov002_022ca4e4[r2], formats via func_02091554, allocates handle
 * (func_02006c0c), inits descriptor (func_0201d47c), then writes fields
 * in source store-order: handle@0, flags14=(x&~0xf)|9, fc=(r1<<11)+0x80
 * +0x4000, f10=-1, submit (func_0201e5b8), release (func_02006e1c). */

struct oam_cell {
    int   handle;           /* 0x00 */
    int   f4;
    int   f8;
    int   fc;               /* 0x0c */
    unsigned short f10;     /* 0x10 */
    unsigned short pad12;
    unsigned short f14;     /* 0x14 : bitfield insert */
    unsigned short pad16;
    int   pad18[(0x48 - 0x18) / 4];
};

extern int  data_ov002_022ca4e4[];
extern int  data_ov002_022cc764[];
extern int  func_02006c0c(int *src, int a, int b);
extern void func_02006e1c(int handle);
extern void func_0201d47c(struct oam_cell *d);
extern void func_0201e5b8(struct oam_cell *d);
extern void func_02091554(char *dst, int *fmt, int arg);

void func_ov002_022ae2e0(void *self, int shift, int idx) {
    char buf[0x48 - 0x28];   /* sp+0x28 region; struct-guessed */
    struct oam_cell d;
    int handle;

    if (idx > 10)
        return;

    func_02091554(buf, (int *)data_ov002_022cc764, data_ov002_022ca4e4[idx]);
    handle = func_02006c0c((int *)buf, 4, 0);
    func_0201d47c(&d);

    d.handle = handle;
    d.f14 = (d.f14 & ~0xf) | 9;
    d.fc = (shift << 11) + 0x80 + 0x4000;
    d.f10 = (unsigned short)-1;
    func_0201e5b8(&d);
    func_02006e1c(handle);
}
