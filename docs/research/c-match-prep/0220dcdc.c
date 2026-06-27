/* CAMPAIGN-PREP candidate for func_0220dcdc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D parity-select: (b0&1)*0x868 byte-offset into char[]; >>26 bit-test value-map
 *   risk:       permuter-class/inline-branch: arith core matches; orig epilogue is `movne#0;bxne; mov#1;bx` + a DEAD `beq` (88B), mwcc collapses to `moveq#1;movne#0` (80B). 2-insn epilogue-shape miss, unsteerable by C form.
 *   confidence: med
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern char data_ov002_022cf288[];
int func_ov002_0220dcdc(struct Ov002Self *self) {
    unsigned int w;
    if (self->b6_11 == 0x23) return 0;
    w = *(unsigned int *)(data_ov002_022cf288 + (self->b0 & 1) * 0x868);
    return ((w >> 26) & 1) == 0;
}
