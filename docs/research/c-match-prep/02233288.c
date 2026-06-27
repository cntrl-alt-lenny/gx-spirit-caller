/* CAMPAIGN-PREP candidate for func_02233288 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     rsb 1-side then &1; mla bit*0x868; +0x120 + h*4 word index; mode 0x7f then 0x80
 *   risk:       0x80 arm: rsb r0,r0,#1; and r3,#1; mul r3*0x868 used as u32[] index may emit mul vs lsl. self[0] passed as r1 to 0226af94 (h0) offset-guessed. 0x7f arm builds &data[bit][0x120+h*4]. reshape-able (index form).
 *   confidence: med
 */
/* func_ov002_02233288 : cls C - mla struct base, rsb dup; reg-reuse recipe */

extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf16c[2][0x868];
extern unsigned int  data_ov002_022cf178[];
extern unsigned char data_ov002_022d0e6c[];
extern void func_ov002_021d7c1c(void *p, int one, int two);
extern void func_ov002_0226af94(void *self, int h0, int one);

int func_ov002_02233288(unsigned short *self)
{
    int mode = *(int *)(data_ov002_022ce288 + 0x5a8);
    int bit;

    if (mode == 0x7f) {
        bit = (1 - (self[1] & 1)) & 1;
        func_ov002_021d7c1c(
            (void *)(data_ov002_022cf16c[bit] + 0x120 +
                     (*(unsigned short *)(data_ov002_022d0e6c + 0xb0) << 2)),
            1, 0);
        return 0;
    }
    if (mode != 0x80)
        return 0;

    bit = (1 - (self[1] & 1)) & 1;
    if (data_ov002_022cf178[bit * (0x868 / 4)] == 0)
        return 0;
    func_ov002_0226af94((void *)self, self[0], 1);
    return 0x7f;
}
