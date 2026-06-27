/* CAMPAIGN-PREP candidate for func_021ca518 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: single base ptr; bind mask 0x1ff (derive <<16 once); two HW RMW then word
 *   risk:       reshape-able: same AND operand-order risk as 021ca4b8 (`and r0,r3,x<<16` mask-first); the first HW store is bare `bic #3` (no orr) — keep it as `&~3` only. Offsets struct-guessed.
 *   confidence: med
 */
/* func_ov006_021ca518 (ov006, class D): sibling of 021ca4b8 at reg 0x0400100c.
 * Halfword RMW: (r&~3) [no |1], then (r&0x43)|0x410 [no 0x2000]. Word @+0xc =
 * (-this->f78 & 0x1ff) | ((-this->f7c << 16) & 0x1ff0000). Returns 1.
 * recipe: identical structure to the sibling; bind mask, derive <<16 once,
 * keep the two halfword RMW stores before the word store. */

typedef struct {
    char _pad[0x78];
    int  f78;   /* +0x78 */
    int  f7c;   /* +0x7c */
} ov006_ca_obj;

int func_ov006_021ca518(ov006_ca_obj *this_) {
    volatile unsigned short *base = (volatile unsigned short *)0x0400100c;
    unsigned int m = 0x1ff;
    base[0] = base[0] & ~3;
    base[0] = (base[0] & 0x43) | 0x410;
    *(volatile unsigned int *)((char *)base + 0xc) =
        ((unsigned int)(-this_->f78) & m) | (((unsigned int)(-this_->f7c) << 16) & (m << 16));
    return 1;
}
