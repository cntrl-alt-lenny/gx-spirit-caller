/* CAMPAIGN-PREP candidate for func_0203e870 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     4-bit upper bitfield ++ -> ldrb;lsl#24;lsr#28;add;and;bic;orr lsl#4;strb
 *   risk:       reshape-able: store order of d15 (before) vs d11 (after the call) is fixed by sequencing; the :4 field at bit4 should fold to bic#0xf0+orr lsl#4. Main risk is struct-guessed offsets (0xd0b/0xd11/0xd15).
 *   confidence: med
 */
/* func_0203e870 — increment a 4-bit bitfield (bits[7:4] of byte 0xd0b),
 * clear two flag bytes, set one, tail call, return 3.
 * Class D: :4 bitfield increment-insert (bic+orr lsl#4). */
extern void func_0203e254(void *);

typedef struct Ctx {
    unsigned char _p0[0xd0b];
    unsigned char f_lo : 4;        /* 0xd0b bits[3:0] preserved */
    unsigned char f_hi : 4;        /* 0xd0b bits[7:4] incremented */
    unsigned char _p1[0xd11 - 0xd0c];
    unsigned char f_d11;           /* 0xd11 */
    unsigned char _p2[0xd15 - 0xd12];
    unsigned char f_d15;           /* 0xd15 */
} Ctx;

int func_0203e870(void *ctx) {
    Ctx *c = (Ctx *)ctx;
    c->f_d15 = 0;
    c->f_hi = c->f_hi + 1;
    func_0203e254(c);
    c->f_d11 = 1;
    return 3;
}
