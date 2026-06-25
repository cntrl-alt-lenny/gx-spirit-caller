/* CAMPAIGN-PREP candidate for func_021d4ae4 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag-toggle; tst-as-bool guards; bic RMW (&=~0x100); reload 0203268c per use
 *   risk:       reshape-able: orig sets self->mode=0x12 on BOTH branches via streq/str — if mwcc hoists the common store it stays matched, but the bic-RMW must read f_eb4 into a temp(r2), bic, store back in that order; reloading 0203268c (not CSE) keeps the 3 bls.
 *   confidence: med
 */
/* func_ov004_021d4ae4: flag-toggle + tst-flag guards + bic RMW. a0=self(r4).
 * if (self->f38){ self->f38=0; h=0202c0c0(0x66a); 021d8798(g_022915e8, h, 0); }
 * t=0203268c()->f_eb4; if (t&0x200) return; t=...f_eb4; if(!(t&0x100)){ self->mode=0x12; }
 * else { 021d3d2c(self,2); p=0203268c(); p->f_eb4 &= ~0x100; self->mode=0x12; }
 * self->f38=1; self->f3c=0; 021d8cd0(g_022915e8). Class D-ish: tst-bool + bic RMW + store-order. */
extern char data_ov004_022915e8[];
extern int  func_0202c0c0(int a);
extern int  func_0203268c(void);
extern void func_ov004_021d3d2c(void *self, int a);
extern void func_ov004_021d8798(void *a, int b, int c);
extern void func_ov004_021d8cd0(void *a);

struct Ov004St4 {
    char  _pad0[0x30];
    int   mode;   /* +0x30 */
    char  _pad34[4];
    int   f38;    /* +0x38 */
    int   f3c;    /* +0x3c */
};

void func_ov004_021d4ae4(struct Ov004St4 *self) {
    int *p;
    int h;

    if (self->f38) {
        self->f38 = 0;
        h = func_0202c0c0(0x66a);
        func_ov004_021d8798(data_ov004_022915e8, h, 0);
    }
    if (*(int *)((char *)func_0203268c() + 0xeb4) & 0x200)
        return;
    if ((*(int *)((char *)func_0203268c() + 0xeb4) & 0x100) == 0) {
        self->mode = 0x12;
    } else {
        func_ov004_021d3d2c(self, 2);
        p = (int *)((char *)func_0203268c() + 0xeb4);
        *p &= ~0x100;
        self->mode = 0x12;
    }
    self->f38 = 1;
    self->f3c = 0;
    func_ov004_021d8cd0(data_ov004_022915e8);
}
