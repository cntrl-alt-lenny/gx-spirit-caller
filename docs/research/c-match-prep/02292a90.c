/* CAMPAIGN-PREP candidate for func_02292a90 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain, signed cmp (-2), !bit0, range bool
 *   risk:       signed compares (mvn#1=-2) polarity; func_02257ab8 sig (self,!bit0) guessed; <2/>=2 tail
 *   confidence: med
 */
/* func_ov002_02292a90: if(helper1(bit0)) return 1; if(helper2(bit0) < -2) return 1; return helper3(self,!bit0) >= 2. */

struct F02292a90_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02292a90_Self { unsigned short f0; struct F02292a90_F2 f2; };

extern int func_ov002_0228c460(unsigned int bit);
extern int func_ov002_02280980(unsigned int bit);
extern int func_ov002_02257ab8(struct F02292a90_Self *self, unsigned int bit);

int func_ov002_02292a90(struct F02292a90_Self *self) {
    if (func_ov002_0228c460(self->f2.bit0) != 0)
        return 1;
    if (func_ov002_02280980(self->f2.bit0) < -2)
        return 1;
    return func_ov002_02257ab8(self, 1 - self->f2.bit0) >= 2;
}
