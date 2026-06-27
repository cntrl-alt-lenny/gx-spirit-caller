/* CAMPAIGN-PREP candidate for func_0220ca40 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield-arg b0 passed per call (orig reloads ldrh, no CSE); tail-call sink; 0x868-strided cf17c gate
 *   risk:       reshape-able (applied): bitfield-as-arg forces per-call reload. Verified-compiled byte-identical (each call re-emits ldrh[r5,#2];lsl;lsr; no CSE). Only residual risk: func_021ca698/021c2f24 signatures inferred (struct-guessed).
 *   confidence: high
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* self+2 halfword: bit0 player, bits[6:11] kind. The player flag is
 * RE-READ from self+2 before every call (orig reloads, never binds). */
struct SelfCa40 {
    u16 f0;
    u16 b0   : 1;   /* [0]    player (lsl#31;lsr#31)        */
    u16      : 5;
    u16 kind : 6;   /* [6:11] discriminant (lsl#20;lsr#26) */
    u16      : 4;
};

extern char data_ov002_022cf17c[];   /* per-player count table (0x868 byte stride) */

extern int func_ov002_021ca698(int player, int b);
extern int func_ov002_021c2f24(int player, int key);
extern int func_ov002_021ff3bc(struct SelfCa40 *self, int arg1);

int func_ov002_0220ca40(struct SelfCa40 *self, int arg1) {
    if (self->kind != 0x23) {
        if (func_ov002_021ca698(self->b0, self->b0) == 0)
            return 0;
        if (func_ov002_021c2f24(self->b0, 0x1a0f) == 0)
            return 0;
        if (func_ov002_021c2f24(self->b0, 0x1a10) == 0)
            return 0;
        if (func_ov002_021c2f24(self->b0, 0x1a11) == 0)
            return 0;
        if (func_ov002_021c2f24(self->b0, 0x1a12) == 0)
            return 0;
    }
    if (*(int *)(data_ov002_022cf17c + (self->b0 & 1) * 0x868) == 0)
        return 0;
    return func_ov002_021ff3bc(self, arg1);
}
