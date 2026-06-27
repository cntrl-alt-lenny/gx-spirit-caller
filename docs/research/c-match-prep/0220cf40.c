/* CAMPAIGN-PREP candidate for func_0220cf40 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind:6 bitfield; 1-self->b0 -> rsb; unsigned `<2` -> movcc; duplicate non-pure call kept (no CSE)
 *   risk:       reshape-able (applied): unsigned cmp gives movcc; (1-b0) gives rsb; twin 021bbf50 calls not CSE'd. Verified-compiled byte-identical. Residual: cd3f4+0 / w14 at +0x14 offsets struct-guessed.
 *   confidence: high
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* self: +2 halfword (player bit0, kind[6:11]); +0x14 a word. */
struct SelfCf40 {
    u16 f0;
    u16 b0   : 1;   /* +2 [0]    player (lsl#31;lsr#31)        */
    u16      : 5;
    u16 kind : 6;   /* +2 [6:11] discriminant (lsl#20;lsr#26) */
    u16      : 4;
    u16 pad[8];     /* +4 .. +0x13 */
    u32 w14;        /* +0x14 */
};

extern char data_ov002_022cd3f4[];   /* word at +0 [_LIT0] */
extern char data_ov002_022cf17c[];   /* per-player int table, 0x868 byte stride [_LIT2] */

extern int func_ov002_021bbf50(int player);
extern int func_ov002_022577dc(struct SelfCf40 *self);

int func_ov002_0220cf40(struct SelfCf40 *self) {
    int r5;
    if (self->kind != 0x12)
        return 0;
    if (self->w14 == 0)
        return 0;
    if (*(int *)data_ov002_022cd3f4 != 1 - self->b0)
        return 0;
    if ((u32)*(int *)(data_ov002_022cf17c + (self->b0 & 1) * 0x868) < 2)
        return 0;
    if (func_ov002_021bbf50(self->b0) == 0)
        return 0;
    r5 = func_ov002_021bbf50(self->b0);
    if (r5 == func_ov002_022577dc(self))
        return 2;
    return 0;
}
