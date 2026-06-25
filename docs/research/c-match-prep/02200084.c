/* CAMPAIGN-PREP candidate for func_02200084 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field6 dispatch; two tail calls; single-read CSE
 *   risk:       both arms are tail calls — mwcc may set up the frame differently; field6 cmp#2 polarity (bne to default)
 *   confidence: high
 */
/* func_ov002_02200084: field6==2 -> tail 021b4098(bit0, multi5, f0); else tail
 * 02203930(). Single f2 read, three extractions (no call between -> CSE). */

struct F02200084_F2 {
    unsigned short b0     : 1;
    unsigned short multi5 : 5;
    unsigned short field6 : 6;
    unsigned short        : 4;
};
struct F02200084_Self {
    unsigned short f0;
    struct F02200084_F2 f2;
};

extern int func_ov002_021b4098(unsigned int bit, unsigned int multi, unsigned short tag);
extern int func_ov002_02203930(void);

int func_ov002_02200084(struct F02200084_Self *self) {
    if (self->f2.field6 == 2)
        return func_ov002_021b4098(self->f2.b0, self->f2.multi5, self->f0);
    return func_ov002_02203930();
}
