/* CAMPAIGN-PREP candidate for func_021ab520 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order/bitfield: OR-low-byte, ==0x3f guarded store, RELOAD field_8, set bit8
 *   risk:       struct-guessed/reshape-able: orig RELOADS field_8 after the conditional `streq`, so write the second read as a fresh `p->field_8` (don't CSE the load across the if). If mwcc keeps one value, force a reload via volatile or split. Offset +0x8 / stride 0x2c inferred.
 *   confidence: low
 */
/* func_ov000_021ab520: bitfield insert into word +0x8 of data_ov000_021c7530[r0]
 * with an ==0x3f guard, then force bit 0x100.
 *   base = &data_ov000_021c7530 + r0*0x2c
 *   w = base->field_8
 *   t = (w & 0xff) | arg          ; (w<<24>>24)|r1  -> :8 read OR'd with arg
 *   if (t == 0x3f) { w |= 0x200; base->field_8 = w; }   ; conditional store
 *   w = base->field_8             ; RELOAD after the conditional store
 *   w = (w & ~0xff) | (t & 0xff)  ; write low byte = t
 *   w = w | 0x100                 ; set bit 8
 *   store base->field_8 = w
 * The reload of field_8 after the streq is load-bearing (re-reads global). */
struct Ov000_2c {
    char pad[0x8];
    unsigned int field_8;    /* +0x8 (low8 is the inserted byte) */
    char pad2[0x2c - 0xc];
};
extern struct Ov000_2c data_ov000_021c7530[];
void func_ov000_021ab520(int idx, unsigned int v) {
    struct Ov000_2c *p = &data_ov000_021c7530[idx];
    unsigned int t = (p->field_8 & 0xff) | v;
    if (t == 0x3f) {
        p->field_8 |= 0x200;
    }
    p->field_8 = (p->field_8 & ~0xffu) | (t & 0xff) | 0x100;
}
