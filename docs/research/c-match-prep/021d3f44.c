/* CAMPAIGN-PREP candidate for func_021d3f44 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     tst-as-bool (t&mask?1:0 then cmp), store-order mode/f38/f3c, reload 0203268c each call
 *   risk:       struct-guessed: +0x258 and the +0x30/+0x38/+0x3c state offsets inferred; the two 0203268c() calls are reloaded (orig calls bl twice) so don't CSE into one — a bound temp would drop a bl.
 *   confidence: med
 */
/* func_ov004_021d3f44: guard-chain state decision. a0=self(r4).
 * if (!data_022915e8[0]) { 0203268c(); if (020337fc()) return 0; <fall to .L_198 not taken> }
 * else .L_198: if (self->f258==0) return 0; t=0203268c()->f_eb4;
 *   if (t&0x1000) { if (t2&0x2000){ self->mode=0x20 } else { self->mode=0x1f }
 *     self->f38=1; self->f3c=0; } else return 0. Class C: tst-as-bool + store-order selects. */
extern char data_ov004_022915e8[];
extern int  func_0203268c(void);
extern int  func_020337fc(void);

struct Ov004St {
    char  _pad0[0x30];
    int   mode;   /* +0x30 */
    char  _pad34[4];
    int   f38;    /* +0x38 */
    int   f3c;    /* +0x3c */
    char  _pad40[0x258 - 0x40];
    int   f258;   /* +0x258 */
};

int func_ov004_021d3f44(struct Ov004St *self) {
    int t;

    if (*(int *)data_ov004_022915e8 == 0) {
        func_0203268c();
        if (func_020337fc())
            return 0;
    } else {
        if (self->f258 == 0)
            return 0;
        t = *(int *)((char *)func_0203268c() + 0xeb4);
        if (t & 0x1000) {
            if (*(int *)((char *)func_0203268c() + 0xeb4) & 0x2000)
                self->mode = 0x20;
            else
                self->mode = 0x1f;
            self->f38 = 1;
            self->f3c = 0;
        } else {
            return 0;
        }
    }
    return 0;
}
