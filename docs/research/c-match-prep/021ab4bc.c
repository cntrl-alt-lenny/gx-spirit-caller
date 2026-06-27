/* CAMPAIGN-PREP candidate for func_021ab4bc (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield: lsl#24/lsr#24 -> :8 field; OR-merge write-back; MLA stride 0x2c
 *   risk:       struct-guessed/reshape-able: orr is `r1 | byte` (value first) so prefer `low8 = v | low8` if `|=` picks wrong dest reg. Stride 0x2c and field offset +0xc inferred -- confirm struct; the lsl/lsr pair needs a :8 bitfield not a plain `& 0xff` mask.
 *   confidence: med
 */
/* func_ov000_021ab4bc: OR a byte into the low-8 bitfield of word +0xc of
 * data_ov000_021c7530[r0] (0x2c-byte stride struct).
 *   base = &data_ov000_021c7530 + r0*0x2c
 *   w = base->field_c
 *   low = (w<<24)>>24            ; (w & 0xff) via shifts -> :8 bitfield read
 *   low = (r1 | low) & 0xff
 *   w = (w & ~0xff) | low        ; bitfield write-back
 *   store base->field_c = w
 * Net: field_c.low8 |= (unsigned char)arg, value-first (orr r0,r1,byte). */
struct Ov000_2c {
    char pad[0xc];
    unsigned int low8 : 8;   /* +0xc low byte */
    unsigned int hi24 : 24;
    char pad2[0x2c - 0x10];
};
extern struct Ov000_2c data_ov000_021c7530[];
void func_ov000_021ab4bc(int idx, unsigned int v) {
    data_ov000_021c7530[idx].low8 |= v;
}
