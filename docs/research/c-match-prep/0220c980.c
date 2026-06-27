/* CAMPAIGN-PREP candidate for func_0220c980 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield kind:6/b0:1; player*0x868 word + bit18 test; goto shared return-1 (brief-358 lever)
 *   risk:       reshape-able (already applied): goto-to-shared-return-1. Verified-compiled byte-identical to orig (msr SP_hyp = bx-lr objdump quirk). Risk only if struct offsets/0x868 stride wrong (struct-guessed, but cf288 stride is core.h-proven).
 *   confidence: high
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* self+2 halfword read once; kind[6:11] then player bit0 extracted. */
struct Self980 {
    u16 f0;
    u16 b0   : 1;   /* [0]    player (lsl#31;lsr#31)        */
    u16      : 5;
    u16 kind : 6;   /* [6:11] discriminant (lsl#20;lsr#26) */
    u16      : 4;
};

extern char data_ov002_022cf288[];   /* per-player state, word at +0 */

int func_ov002_0220c980(struct Self980 *self) {
    /* kind==0x23 and the bit18-clear path share `return 1` (goto lever) so
     * the orig's `beq .L_40` to the common `mov r0,#1` is reproduced. */
    if (self->kind == 0x23)
        goto ret1;
    if ((*(u32 *)(data_ov002_022cf288 + (self->b0 & 1) * 0x868) >> 0x12) & 1)
        return 0;
ret1:
    return 1;
}
