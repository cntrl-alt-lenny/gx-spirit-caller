/* CAMPAIGN-PREP candidate for func_0223252c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     rsb 1-bit then &1 for second branch; mul bit*0x868; dup +0x120 blocks; mode 0x7f then 0x80
 *   risk:       second branch reuses r0 from first (rsb r0,r0,#1) so orig keeps the lsr-extracted side live across both; if mwcc re-derives self[1]&1 the rsb source diverges. and r3*0x868 may emit mul vs lsl in u32[] index. reshape-able (reuse value/index form).
 *   confidence: med
 */
/* func_ov002_0223252c : cls C - mul struct-index, rsb branch dup; reg-reuse recipe */

extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf16c[2][0x868];
extern unsigned int  data_ov002_022cf178[];
extern void func_ov002_021d7c1c(void *p, int two, int flag);
extern void func_ov002_021ded1c(void *self, int r);
extern int  func_ov002_02257704(void);

int func_ov002_0223252c(unsigned short *self)
{
    int mode = *(int *)(data_ov002_022ce288 + 0x5a8);
    int bit;

    if (mode == 0x7f) {
        int r = func_ov002_02257704();
        func_ov002_021ded1c(self, r);
        return 0x7f;
    }
    if (mode != 0x80)
        return 0;

    bit = self[1] & 1;
    if (data_ov002_022cf178[bit * (0x868 / 4)] != 0) {
        func_ov002_021d7c1c(
            (void *)(data_ov002_022cf16c[bit] + 0x120), 0, 0);
        return 0x7f;
    }
    bit = (1 - (self[1] & 1)) & 1;
    if (data_ov002_022cf178[bit * (0x868 / 4)] == 0)
        return 0;
    func_ov002_021d7c1c(
        (void *)(data_ov002_022cf16c[bit] + 0x120), 1, 0);
    return 0x7f;
}
