/* CAMPAIGN-PREP candidate for func_021ae514 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign count add; walking MMIO ptr; reload count each iter; store-order
 *   risk:       permuter-class: orig holds MMIO base in lr (post-inc +4), data base in r5, and shares -0x2000 to derive both masks (0xffffe000 & lsr#19=0x1fff); mwcc rematerializes consts and indexes reg[i] -> heavy reg-alloc/scheduling divergence.
 *   confidence: low
 */
/* func_ov002_021ae514: 4-iteration loop packing 4 payload words + a per-bit
 * flag (arg5>>i bit0) into a 4-word MMIO block at data_ov002_022cdc88, while
 * counting nonzero payloads into data_ov002_022cdc78[3]; then post 0x31/3.
 * 6 args: r0..r3 + two on the incoming stack ([sp+0x30]=arg4,[sp+0x34]=arg5). */

extern char data_ov002_022cdc78[];
extern char data_ov002_022cdc88[];
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

int func_ov002_021ae514(int arg0, int arg1, int arg2, int arg3,
                        int arg4, int arg5) {
    int local[4];
    int i;
    local[0] = arg1;
    local[1] = arg2;
    local[2] = arg3;
    local[3] = arg4;
    *(int *)(data_ov002_022cdc78 + 0xc) = 0;
    for (i = 0; i < 4; i++) {
        int v = local[i];
        unsigned int reg = ((volatile unsigned int *)data_ov002_022cdc88)[i];
        reg = (reg & 0xffffe000) | (v & 0x1fff);
        reg = (reg & ~0x4000) | (((arg5 >> i) & 1) << 14);
        ((volatile unsigned int *)data_ov002_022cdc88)[i] = reg;
        *(int *)(data_ov002_022cdc78 + 0xc) += (v != 0) ? 1 : 0;
    }
    *(int *)(data_ov002_022cdc78 + 0x8) = 0;
    return func_ov002_0229ade0(0x31, 3, arg0, 0);
}
