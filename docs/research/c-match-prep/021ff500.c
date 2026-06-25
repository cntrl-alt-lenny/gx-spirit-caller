/* CAMPAIGN-PREP candidate for func_021ff500 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield-xor bind; sink; !=0 bool
 *   risk:       eor operand order (b14 first) and the r2/r1/r0 arg colouring for the 022536e8 call may differ
 *   confidence: high
 */
/* func_ov002_021ff500: x = b14^b0; r2 = 0223f6c4(self); return
 * helper2(x, f0, r2) != 0. Tiny leaf, no early guards. */

struct F021ff500_F2 {
    unsigned short b0  : 1;
    unsigned short     : 13;
    unsigned short b14 : 1;
};
struct F021ff500_Self {
    unsigned short f0;
    struct F021ff500_F2 f2;
};

extern int func_ov002_0223f6c4(struct F021ff500_Self *self);
extern int func_ov002_022536e8(unsigned int x, unsigned int f0, unsigned int z);

int func_ov002_021ff500(struct F021ff500_Self *self) {
    unsigned int x = self->f2.b14 ^ self->f2.b0;
    int r2 = func_ov002_0223f6c4(self);
    return func_ov002_022536e8(x, self->f0, r2) != 0;
}
