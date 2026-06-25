/* CAMPAIGN-PREP candidate for func_02200630 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield extract; two-value equality (cmp;cmpne)
 *   risk:       mwcc may range-opt 6||7 to sub#6;cmp#1;movls instead of the cmp;cmpne chain the orig uses
 *   confidence: low
 */
/* func_ov002_02200630: return field6 == 6 || field6 == 7 (extracted as the
 * 6-bit field at bits 6-11). Orig kept a cmp;cmpne chain (no range-opt). */

struct F02200630_F2 {
    unsigned short        : 6;
    unsigned short field6 : 6;
    unsigned short        : 4;
};
struct F02200630_Self {
    unsigned short f0;
    struct F02200630_F2 f2;
};

int func_ov002_02200630(struct F02200630_Self *self) {
    return self->f2.field6 == 6 || self->f2.field6 == 7;
}
