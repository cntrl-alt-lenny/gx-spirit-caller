/* CAMPAIGN-PREP candidate for func_021b4248 (ov014, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     four :5 byte masks shifted 0/5/10/15, accumulator-first or-chain
 *   risk:       reshape-able: the stray 'orr r3,r3,#0x0' suggests b0 is a :5 bitfield member (gives lsl;lsr) not plain &0x1f (gives and); if so switch b0 to a struct :5 bitfield. struct-guessed offsets.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov014_021b4248 (ov014, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: pack RGB555 from four :5 source nibbles.
 * Reads halfword [r0+0x54] (bytes b0,b1) and [r0+0x56] (bytes c0,c1); each byte
 * masked to 5 bits and shifted to 0/5/10/15. The orr #0 on the first term hints
 * b0 came from a bitfield read; modeled via &0x1f. Shifted-or operand order kept.
 */
typedef unsigned char u8;

struct Col4248 { u8 b0; u8 b1; u8 c0; u8 c1; };  /* +0x54..0x57 */

int func_ov014_021b4248(char *base) {
    struct Col4248 *p = (struct Col4248 *)(base + 0x54);
    int b0 = p->b0 & 0x1f;
    int b1 = p->b1 & 0x1f;
    int c0 = p->c0 & 0x1f;
    int c1 = p->c1 & 0x1f;
    return b0 | (b1 << 5) | (c0 << 10) | (c1 << 15);
}
