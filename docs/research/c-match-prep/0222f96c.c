/* CAMPAIGN-PREP candidate for func_0222f96c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     induction i*0x14 row base; bind row; lsl#13;lsr#13 mask; loop i<=4 break-on-mismatch
 *   risk:       Loop hoists r6=&data,fp=0x868,r9=i*0x14 as live induction regs and re-reads side&1 each use; mwcc may CSE the &data[bit] base or reorder the 3 field guards. permuter-class.
 *   confidence: low
 */
/* func_ov002_0222f96c : cls C - loop, mla struct base + packed bitfield, reg-alloc */

extern unsigned char data_ov002_022cf16c[2][0x868];
extern int  func_ov002_021c8940(void *self, int i);
extern void func_ov002_021d5a08(void *self, int lo, int hi, int d4, int d5, int sub);
extern int  func_ov002_0223de94(void *self, int zero);
extern int  func_ov002_0223df38(void *self, int a, int b);
extern int  func_ov002_0225764c(void *self, int lo, int hi);

int func_ov002_0222f96c(void *self)
{
    int v;
    int lo, hi;
    int i;
    unsigned char *row;

    if (func_ov002_0223df38(self, 0, 0) == 0)
        return 0;

    v  = func_ov002_0223de94(self, 0);
    lo = v & 0xff;
    hi = ((v << 16) >> 16 >> 8) & 0xff;

    if (func_ov002_0225764c(self, lo, hi) == 0)
        return 0;

    func_ov002_021d5a08(self, lo, hi, 2, 1, *(unsigned short *)self);

    for (i = 0; i <= 4; i++) {
        if (i == hi)
            break;
        row = data_ov002_022cf16c[((unsigned short *)self)[1] & 1] + i * 0x14;
        if (((*(unsigned int *)(row + 0x30) << 0x13) >> 0x13) == 0)
            break;
        if (*(unsigned short *)(row + 0x38) == 0)
            break;
        if (*(unsigned short *)(row + 0x36) != 0)
            break;
        if (func_ov002_021c8940(self, i) != 0x12)
            break;
        func_ov002_021d5a08(self, ((unsigned short *)self)[1] & 1, i, 2, 0,
                            *(unsigned short *)self);
    }
    return 0;
}
