/* CAMPAIGN-PREP candidate for func_0220d1c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind w14 (7 raw asym/bit extracts); goto-shared-fail x8; b0-on-right cmp fold; unsigned mask -> lsr
 *   risk:       reshape-able (applied): goto-fail + unsigned-cast mask + b0-fold. Verified-compiled byte-identical (8 guards branch .L_100; bit cmps fold r2,lsr#31; lsrs for movs bits; lsr mask). Residual: d0250 table + +0x14 field bits struct-guessed.
 *   confidence: high
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* self: +0 f0, +2 halfword (player bit0, kind[6:11]), +0x14 packed word
 * (bound once, 7 fields extracted from the single load). */
struct SelfD1c4 {
    u16 f0;
    u16 b0   : 1;   /* +2 [0]    player (lsl#31;lsr#31)        */
    u16      : 5;
    u16 kind : 6;   /* +2 [6:11] discriminant (lsl#20;lsr#26) */
    u16      : 4;
    u16 pad[8];     /* +4 .. +0x13 */
    u32 w14;        /* +0x14 */
};

extern char data_ov002_022d0250[];   /* halfword table, byte-strided index */

extern int func_0202ed90(int x);
extern int func_ov002_022536e8(int player, int f0, int c);
extern int func_ov002_021bc618(int player);
extern int func_ov002_021ca2b8(int player);

int func_ov002_0220d1c4(struct SelfD1c4 *self) {
    u32 w;                          /* self->w14 held in r1 across all uses */
    /* All 8 guard failures branch to a single shared `return 0` (goto lever,
     * brief 358) so mwcc emits `bne/bhi/beq .L_100` not inlined predication. */
    if (self->kind != 0x1b) goto fail;
    w = self->w14;
    /* b0 on the RIGHT folds as the shifted cmp operand (brief-350 lever). */
    if (((w << 0x16) >> 0x1f) != self->b0) goto fail;  /* bit[9] == player */
    if (((w << 0x12) >> 0x1c) > 4)         goto fail;  /* bits[10:13] <= 4 */
    if (((w << 0xd)  >> 0x1f) == self->b0) goto fail;  /* bit[18] != player */
    if (((w << 0xf)  >> 0x1f) != 0)        goto fail;  /* bit[16] == 0      */
    if (((w << 0x10) >> 0x1f) == 0)        goto fail;  /* bit[15] == 1      */
    if (((w << 0x9)  >> 0x1c) != 0xe)      goto fail;  /* bits[19:22] == 14 */
    if (func_0202ed90((u32)(*(u16 *)(data_ov002_022d0250 + ((w << 0x17) >> 0x15))
                            << 0x13) >> 0x13) == 0)
        goto fail;
    if (func_ov002_022536e8(self->b0, self->f0, 0) == 0)
        goto fail;
    if (func_ov002_021bc618(self->b0) == 0)
        goto fail;
    return func_ov002_021ca2b8(self->b0) ? 1 : 0;
fail:
    return 0;
}
