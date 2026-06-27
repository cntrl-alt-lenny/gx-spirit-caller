/* CAMPAIGN-PREP candidate for func_021ab4ec (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield: lsl#24/lsr#24 -> :8 field; mvn-then-and clear; MLA stride 0x2c
 *   risk:       struct-guessed/reshape-able: orig does `mvn r1` then `and r1, byte` (negated value as first operand). If mwcc emits `bic`/reorders, force the ~ via a temp: `t=~v; low8 &= t`. Stride 0x2c / field +0xc inferred -- confirm; needs :8 field for the shift pair.
 *   confidence: med
 */
/* func_ov000_021ab4ec: AND-NOT a byte into the low-8 bitfield of word +0xc of
 * data_ov000_021c7530[r0].
 *   base = &data_ov000_021c7530 + r0*0x2c
 *   w = base->field_c
 *   r1 = ~arg                    ; mvn FIRST
 *   low = ~arg & ((w<<24)>>24)   ; ~arg & (w & 0xff)  -> :8 bitfield read
 *   low = low & 0xff
 *   w = (w & ~0xff) | low
 *   store base->field_c = w
 * Net: field_c.low8 &= ~(unsigned char)arg, with ~arg computed first. */
struct Ov000_2c {
    char pad[0xc];
    unsigned int low8 : 8;   /* +0xc low byte */
    unsigned int hi24 : 24;
    char pad2[0x2c - 0x10];
};
extern struct Ov000_2c data_ov000_021c7530[];
void func_ov000_021ab4ec(int idx, unsigned int v) {
    data_ov000_021c7530[idx].low8 &= ~v;
}
