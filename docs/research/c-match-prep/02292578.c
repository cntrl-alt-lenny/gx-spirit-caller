/* CAMPAIGN-PREP candidate for func_02292578 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     :2 bitfield guard, !bit0 rsb, 4-arg call, bool tails
 *   risk:       tag2 :2 field at bit12 offset guessed; tail func_02291160(self) arg assumed; equality polarity
 *   confidence: low
 */
/* func_ov002_02292578: if(f2.tag2==0) return tail(self); if(helper1(!bit0,1,0,0)) return 0; return helper2(!bit0)==0. */

struct F02292578_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 11;
    unsigned short tag2 : 2;
    unsigned short top  : 2;
};
struct F02292578_Self { unsigned short f0; struct F02292578_F2 f2; };

extern int func_ov002_021bcf18(int a, int b, int c, int d);
extern int func_ov002_021bbf50(unsigned int bit);
extern int func_ov002_02291160(struct F02292578_Self *self);

int func_ov002_02292578(struct F02292578_Self *self) {
    if (self->f2.tag2 == 0)
        return func_ov002_02291160(self);
    if (func_ov002_021bcf18(1 - self->f2.bit0, 1, 0, 0) != 0)
        return 0;
    return func_ov002_021bbf50(1 - self->f2.bit0) == 0;
}
