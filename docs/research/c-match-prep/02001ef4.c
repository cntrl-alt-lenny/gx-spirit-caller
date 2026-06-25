/* CAMPAIGN-PREP candidate for func_02001ef4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: two adjacent :4 bitfields, chained orr -> single str (C-22)
 *   risk:       reshape-able: matched func_02001c98 sibling. Main risk = the temp-register choice in orr chain (ip/r3 pairing) could rotate, a permuter-class tail; but the bitfield shapes the bic+orr correctly. struct-guessed: f_24 offset.
 *   confidence: high
 */
/* func_02001ef4: two adjacent 4-bit inserts into *p[0x24], single store.
 *   p->f_24.f_a = (r1 & 0xf) << 8   -> bits 8..11  (bic #0xf00)
 *   p->f_24.f_b = (r2 & 0xf) << 12  -> bits 12..15 (bic #0xf000)
 * Class D adjacent-bitfield (C-22 recipe, like func_02001c98). bic+orr per
 * window => separate :4 members; the lsl#28/lsr pair only comes from a
 * bitfield, a plain `& 0xf` mask would emit `and`. Two assigns to the same
 * word coalesce here into the orig's single str (chained orr, one store). */

typedef union {
    unsigned int word;
    struct {
        unsigned int lo  : 8;
        unsigned int f_a : 4;   /* bits 8..11  */
        unsigned int f_b : 4;   /* bits 12..15 */
        unsigned int hi  : 16;
    } b;
} bitfield_24_t;

typedef struct {
    char          _pad0[0x24];
    bitfield_24_t f_24;     /* +0x24 */
} obj_t;

void func_02001ef4(obj_t *p, unsigned int a, unsigned int b) {
    p->f_24.b.f_a = a;
    p->f_24.b.f_b = b;
}
