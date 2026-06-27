/* CAMPAIGN-PREP candidate for func_021ac35c (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind data_021b2790 base once; bitfield insert via (a&~m)|v; store-order [0x34],[0x38],[0x2c] as asm
 *   risk:       struct-guessed: offsets/sizes of the 0x48 work area are inferred from raw sp displacements; the bic/orr field-insert order on [sp,#0x34] and [sp,#0x38] is store-order-rigid. If struct layout wrong, every strh/str displacement diverges.
 *   confidence: low
 */
/* func_ov008_021ac35c: build an OAM/affine entry with bitfield inserts,
   bind a global, two helper calls. cls C/D (bitfield insert + bind). */

extern unsigned short data_ov008_021b2790[]; /* _LIT0, [r0*0x34] guard */
extern int data_021040ac;                    /* _LIT1, [+0x34] mode */
extern int data_ov008_021b266c;              /* _LIT2 */
extern int data_ov008_021b2680;              /* _LIT3 */

extern int  func_02091554(void *dst, void *src);
extern void func_0201d47c(void *p);
extern void func_02006c0c(void *p, int a1, int a2);
extern void func_0201e5b8(void *p);
extern void func_02006e1c(int h);

typedef struct {            /* the 0x48 stack work area */
    int  handle;            /* +0x0  (sp+0x0 -> [sp,#0x20] stores handle) */
    char _pad4[0x20 - 0x4];
    int  oam0;              /* +0x20 */
    char _pad24[0x2c - 0x24];
    int  oam_c;            /* +0x2c */
    char _pad30[0x34 - 0x30];
    unsigned short attr;    /* +0x34 */
    char _pad36[0x38 - 0x36];
    int  f38;              /* +0x38 */
} Oam_021ac35c;

void func_ov008_021ac35c(int idx, int pal)
{
    Oam_021ac35c w;
    int prio;
    unsigned short a;

    if (((unsigned short *)data_ov008_021b2790)[idx * 0x34 / 2] == 0)
        return;

    if ((&data_021040ac)[0x34 / 4] == 0)
        func_02091554(&w, &data_ov008_021b266c);
    else
        func_02091554(&w, &data_ov008_021b2680);

    func_0201d47c(&w.oam0);
    func_02006c0c(&w, 4, 0);

    a = w.attr;
    prio = (pal << 4) + 0x93;
    a = (a & ~0xf) | 0x9;
    w.attr = a;
    prio = (prio + 0x200) << 7;

    w.handle = (int)&w;                 /* str r0,[sp,#0x20] ; r0 was sp+0 */
    w.f38 = (w.f38 & ~0x1c000) | 0x1c000;
    a = w.attr;
    w.oam_c = prio;
    w.attr = a | 0x10;
    func_0201e5b8(&w);
    func_02006e1c(w.handle);
}
