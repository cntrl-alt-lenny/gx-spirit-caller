/* CAMPAIGN-PREP candidate for func_022316a8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mul bit*0x868 into data_022cf178 word table; bind data_022ce288 base; switch ordered 0x7e/0x7f/0x80
 *   risk:       asm tests 0x7e->0x7f->0x80 in that cmp order with beq fall-through; mwcc if/else chain on mode must keep that compare order. The (self[1]&1)*0x868 index into a u32[] (>>2) may instead emit mul not lsl. reshape-able (operand/index form).
 *   confidence: med
 */
/* func_ov002_022316a8 : cls C - mul struct-index + bind globals; reg-reuse recipe */

extern unsigned char data_ov002_022ce288[];
extern unsigned int  data_ov002_022cf178[];
extern unsigned char data_ov002_022d0e6c[];
extern void func_ov002_021d71e0(int side, int b, int zero);
extern int  func_ov002_0221074c(void);
extern int  func_ov002_0226afb4(int h);

int func_ov002_022316a8(unsigned short *self)
{
    int mode = *(int *)(data_ov002_022ce288 + 0x5a8);

    if (mode == 0x7e) {
        if (*(unsigned short *)(data_ov002_022d0e6c + 0xb2) != 0)
            func_ov002_021d71e0(self[1] & 1,
                                *(unsigned short *)(data_ov002_022d0e6c + 0xb0),
                                0);
        return 0;
    }
    if (mode == 0x7f) {
        int p = data_ov002_022cf178[(self[1] & 1) * (0x868 / 4)];
        if (p == 0)
            return 0;
        if (p <= *(int *)(data_ov002_022ce288 + 0x5ac))
            return 0;
        func_ov002_0226afb4(self[0]);
        return 0x7e;
    }
    if (mode == 0x80) {
        *(int *)(data_ov002_022ce288 + 0x5ac) =
            data_ov002_022cf178[(self[1] & 1) * (0x868 / 4)];
        func_ov002_0221074c();
        return 0x7f;
    }
    return 0;
}
