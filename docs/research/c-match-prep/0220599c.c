/* CAMPAIGN-PREP candidate for func_0220599c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag==bitfield cmp guards + tail-call
 *   risk:       KNOWN .s wall (brief 358): single-return predicate-branch reg-mirror; early return-0 likely predicates not branches
 *   confidence: low
 */
/* func_ov002_0220599c: guard(d016c+0xcec==bit0) + guard(d016c+0xcf8==1) + tail.
 *   if (*(int*)(d016c+0xcec) != self->b0) return 0;
 *   if (*(int*)(d016c+0xcf8) != 1)        return 0;
 *   return func_ov002_021ff354(self);
 * (cmp ip,r3,lsr#31 folds the bit0 bitfield into the compare)
 * NOTE: brief 358 shipped this as whole-function .s (reg-mirror inline-branch wall).
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022d016c[];
extern int func_ov002_021ff354(struct Ov002Self *self);

int func_ov002_0220599c(struct Ov002Self *self) {
    if (*(int *)(data_ov002_022d016c + 0xcec) != self->b0) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 1)        return 0;
    return func_ov002_021ff354(self);
}
