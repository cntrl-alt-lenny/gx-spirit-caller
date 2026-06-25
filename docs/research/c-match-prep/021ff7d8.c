/* CAMPAIGN-PREP candidate for func_021ff7d8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     tag6/b0/f1 bitfields one ldrh; reload f2 for 2nd block; rsb(1-b0); short-circuit && compare chain in asm order
 *   risk:       permuter-class: the && chain's leftover-register args to 021c1ef0 (orig leaves r1=cd3f4[?], r3=f1 from the compare and only sets r0,r2) mean the call's arg regs are colouring-dependent; a clean 4-arg call will set them explicitly and diverge. cd3f4 indices struct-guessed.
 *   confidence: low
 */
/* func_ov002_021ff7d8 (ov002, class C/D) — require f2.tag6==0xd; require 021b4054(bit0,f1,
 * 0x1119,3)==0; then a 3-way struct-compare of global cd3f4[0/1/8] against (1-bit0)/bit0/f1
 * (f2 reloaded), and if all match call 021c1ef0(self, cd3f4[7]). */
typedef unsigned short u16;

extern int data_ov002_022cd3f4[];   /* record: [0],[1],[7]@0x1c,[8]@0x20 */
extern int func_ov002_021b4054(unsigned int bit0, unsigned int f1, int lit, int three);
extern int func_ov002_021c1ef0(void *self, int a, int idx, int d);

struct F021ff7d8_F2 {
    u16 b0  : 1;
    u16 f1  : 5;   /* bits 1..5 */
    u16 tag6: 6;   /* bits 6..11 */
    u16 hi  : 4;
};
struct F021ff7d8_Self { u16 pad0; struct F021ff7d8_F2 f2; };

int func_ov002_021ff7d8(struct F021ff7d8_Self *self) {
    if (self->f2.tag6 != 0xd) return 0;
    if (func_ov002_021b4054(self->f2.b0, self->f2.f1, 0x1119, 3) != 0) return 0;
    if (data_ov002_022cd3f4[0] == (1 - self->f2.b0) &&
        data_ov002_022cd3f4[1] == self->f2.b0 &&
        data_ov002_022cd3f4[8] == self->f2.f1) {
        if (func_ov002_021c1ef0(self, self->f2.b0, data_ov002_022cd3f4[7], 0) != 0)
            return 1;
    }
    return 0;
}
