/* CAMPAIGN-PREP candidate for func_021ff400 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield-xor bind; guard-chain + sink; !=0 bool
 *   risk:       eor operand order may flip (b14 vs b0 dest-reg); 0223f6c4 result must land in r2 as the 3rd arg
 *   confidence: high
 */
/* func_ov002_021ff400: x = b14^b0; two boolean guards (021ff2b8 thunk,
 * 021ca2b8) then helper2(x, f0, 0223f6c4(self)) != 0. The xor is held in a
 * callee-saved reg across all calls (read f2 once, bind to a local). */

struct F021ff400_F2 {
    unsigned short b0  : 1;
    unsigned short     : 13;
    unsigned short b14 : 1;
};
struct F021ff400_Self {
    unsigned short f0;
    struct F021ff400_F2 f2;
};

extern int func_ov002_021ff2b8(struct F021ff400_Self *self, unsigned int x);
extern int func_ov002_021ca2b8(unsigned int x);
extern int func_ov002_0223f6c4(struct F021ff400_Self *self);
extern int func_ov002_022536e8(unsigned int x, unsigned int f0, unsigned int z);

int func_ov002_021ff400(struct F021ff400_Self *self) {
    unsigned int x = self->f2.b14 ^ self->f2.b0;
    int r2;
    if (func_ov002_021ff2b8(self, x) == 0) return 0;
    if (func_ov002_021ca2b8(x) == 0) return 0;
    r2 = func_ov002_0223f6c4(self);
    return func_ov002_022536e8(x, self->f0, r2) != 0;
}
