/* CAMPAIGN-PREP candidate for func_021ac890 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two :8 bitfield reads (lsl/lsr) of word +0x9c, inequality 0/1
 *   risk:       reshape-able: proven :8-bitfield-read recipe (021ab6cc) gives the lsl#24/lsl#16+lsr pair; risk is mwcc emitting ldrb/and instead — if so the existing struct-member-at-offset idiom (header recipe 1) forces the word ldr+shifts. struct-guessed offset +0x9c.
 *   confidence: med
 */
/* func_ov000_021ac890 (ov000, D) — two byte-fields of word +0x9c compared.
 *   r1 = (w<<24)>>24   ; b0:8  low byte
 *   r0 = (w<<16)>>24   ; b8:8  second byte
 *   return b0 != b8    ; movne 1 / moveq 0
 * Both extracts are lsl/lsr pairs => model as :8 bitfields (a plain &0xff /
 * (w>>8)&0xff would fold to 'and'; only the bitfield read gives the lsl;lsr).
 * Order matters for reg-numbering: orig reads the LOW byte first (->r1), then
 * the bit8 byte (->r0). */
struct Ov000Pair { char pad0[0x9c]; unsigned b0 : 8; unsigned b8 : 8; unsigned : 16; };

int func_ov000_021ac890(struct Ov000Pair *p) {
    return p->b0 != p->b8;
}
