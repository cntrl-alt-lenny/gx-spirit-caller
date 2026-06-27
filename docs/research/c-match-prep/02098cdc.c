/* CAMPAIGN-PREP candidate for func_02098cdc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bitfield test (flags&1) selecting a :24 field (lsl#8;lsr#8) vs a plain word; ternary -> ldrne/ldreq
 *   risk:       reshape-able/struct-guessed: the lsl#8;lsr#8 demands a `unsigned f1c:24` bitfield (a plain &0xffffff yields bic). flags byte@0x1f is the top byte of the same word@0x1c; keep them as separate u8 + :24 members. Ternary gives the conditional loads.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02098cdc (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: (flags&1) ? (24-bit field, lsl#8;lsr#8 bitfield :24) : word@0x08; ternary -> ldrne/ldreq.
 *   risk:   reshape-able/struct-guessed: :24 bitfield needed for lsl;lsr (mask gives bic); offsets guessed.
 *   confidence: med
 */
/* func_02098cdc: if (p->f1f & 1) return low-24-bits of the word at +0x1c
 * (whose top byte IS the flags byte at +0x1f); else return the word at +0x08. */

typedef struct {
    unsigned char  _p00[8];
    unsigned int   f08;          /* +0x08 */
    unsigned char  _p0c[0x10];
    unsigned int   f1c : 24;     /* +0x1c ldr,lsl#8,lsr#8 */
    unsigned char  f1f;          /* +0x1f flags (top byte of the +0x1c word) */
} Obj;

unsigned int func_02098cdc(Obj *p) {
    return (p->f1f & 1) ? p->f1c : p->f08;
}
