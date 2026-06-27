/* CAMPAIGN-PREP candidate for func_022869d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 bitfield bit0; player=(1-b0) gives rsb#1;and#1; (int)h16 SIGNED cmp (movge); h14>=h16 UNSIGNED cmp (movcs/movcc)
 *   risk:       VERIFIED EXACT mwcc 2.0/sp1p5 (byte-identical modulo cf16c pool reloc; the `msr SP_hyp` lines ARE bxge/bx lr per objdump quirk). Signed-vs-unsigned cast split is load-bearing. struct-guessed: +0x14/+0x16 field offsets.
 *   confidence: high
 */
typedef unsigned short u16;
/* arg0 = self: bit0 at +2 (lsl#31;lsr#31 => :1); u16@+0x14; u16@+0x16. */
struct self_t { char _p0[2]; u16 b0 : 1; u16 _r : 15; char _p4[0x10]; u16 h14; u16 h16; };
extern char data_ov002_022cf16c[];

int func_ov002_022869d0(struct self_t *self) {
    int player = 1 - self->b0;
    int limit = *(int *)(data_ov002_022cf16c + (player & 1) * 0x868);
    if ((int)self->h16 >= limit)
        return 1;
    return self->h14 >= self->h16;
}
