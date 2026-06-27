/* CAMPAIGN-PREP candidate for func_022338b0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch counter@0x5b4 cases 0/1/2; RMW +=1; strh self[0] bitfield then 0x1a0b sentinel; mla bit*0x868
 *   risk:       func_021b99b4 called with 1 arg here but 2 args in 022325f8 - arity mismatch (b arg dropped); body truncated in source after case 2 store (no final epilogue shown). The case-1 double strh self[0] (bitfield then 0x1a0b) store-order must hold. struct-guessed.
 *   confidence: low
 */
/* func_ov002_022338b0 : cls C - 3-way switch, global RMW counter, bitfield strh */

extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf16c[2][0x868];
extern unsigned short data_ov002_022d0250[];
extern int  func_ov002_021b99b4(int side, int b);
extern void func_ov002_021d8128(void *p, int zero);
extern int  func_ov002_0223def4(void *self, int zero);
extern int  func_ov002_02257cfc(void *self, void *arg, int idx);

int func_ov002_022338b0(unsigned short *self, void *arg)
{
    int idx = func_ov002_0223def4(self, 0);
    int slot;

    switch (*(int *)(data_ov002_022ce288 + 0x5b4)) {
    case 0:
        if (((self[3] << 0x10) >> 0x18) == 0)
            return 0;
        if (func_ov002_021b99b4(self[1] & 1) < 0)
            return 0;
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 1;
    case 1:
        self[0] = (data_ov002_022d0250[idx] << 0x13) >> 0x13;
        if (func_ov002_02257cfc(self, arg, (data_ov002_022d0250[idx] << 0x13) >> 0x13) != 0) {
            self[0] = 0x1a0b;
            return 0;
        }
        self[0] = 0x1a0b;
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 1;
    case 2:
        slot = func_ov002_021b99b4(self[1] & 1);
        if (slot >= 0)
            func_ov002_021d8128(
                (void *)(data_ov002_022cf16c[self[1] & 1] + 0x18 + 0x400 + slot * 4),
                0);
        *(int *)(data_ov002_022ce288 + 0x5b4) = 0;
        return 0;
    }
    return 0;
}
