/* CAMPAIGN-PREP candidate for func_021f95f8 (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tag6:6 bitfield, (==2||==5) guard, tail call
 *   risk:       KNOWN .s wall (brief 358): mwcc PREDICATES the single early `return 1` (movne;popne) where orig BRANCHES (bne). C-form cannot reproduce the branch
 *   confidence: low
 */
/* func_ov002_021f95f8: if tag6 is 2 or 5, tail-call func_021f9434(self);
 * else return 1.
 *   tag6 = bits[11:6] of self->f2 (lsl#20;lsr#26).
 * NOTE: brief 358 routed this to .s -- the single early `return 1` gets
 * PREDICATED (movne #1; popne) by mwcc, but the orig BRANCHES (bne).
 * No C shaping reproduces the branch; this candidate is the logical match
 * only and is expected to near-miss by the predicate-vs-branch instruction.
 */
typedef unsigned short u16;

struct Ov002Self021f95f8 {
    u16 f0;
    struct {
        u16 pad  : 6;
        u16 tag6 : 6;
        u16 top  : 4;
    } f2;
};

extern int func_ov002_021f9434(struct Ov002Self021f95f8 *self);

int func_ov002_021f95f8(struct Ov002Self021f95f8 *self) {
    if (self->f2.tag6 != 2 && self->f2.tag6 != 5) return 1;
    return func_ov002_021f9434(self);
}
