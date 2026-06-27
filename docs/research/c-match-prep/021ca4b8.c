/* CAMPAIGN-PREP candidate for func_021ca4b8 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: single base ptr; bind mask 0x1ff (derive <<16 once); store-order HW,HW,word
 *   risk:       reshape-able: AND operand-order — asm is `and r0, r3, x<<16` (mask 0x1ff0000 FIRST); if mwcc folds/commutes the <<16 or pools 0x1ff twice the pack diverges. Offsets struct-guessed.
 *   confidence: med
 */
/* func_ov006_021ca4b8 (ov006, class D): affine-MMIO RMW + negated-pair pack.
 * Halfword reg @0x0400100a: (r&~3)|1, then (r&0x43)|0x210|0x2000. Then word
 * @+0xa = (-this->f78 & 0x1ff) | ((-this->f7c << 16) & 0x1ff0000). Returns 1.
 * recipe: ONE base ptr (word store reuses [base,#0xa]); bind mask 0x1ff in a
 * local, derive 0x1ff0000 once; store-order = 2 halfword RMW then the word. */

typedef struct {
    char _pad[0x78];
    int  f78;   /* +0x78 */
    int  f7c;   /* +0x7c */
} ov006_ca_obj;

int func_ov006_021ca4b8(ov006_ca_obj *this_) {
    volatile unsigned short *base = (volatile unsigned short *)0x0400100a;
    unsigned int m = 0x1ff;
    base[0] = (base[0] & ~3) | 1;
    base[0] = (base[0] & 0x43) | 0x210 | 0x2000;
    *(volatile unsigned int *)((char *)base + 0xa) =
        ((unsigned int)(-this_->f78) & m) | (((unsigned int)(-this_->f7c) << 16) & (m << 16));
    return 1;
}
