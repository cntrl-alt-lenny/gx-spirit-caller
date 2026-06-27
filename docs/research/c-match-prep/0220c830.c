/* CAMPAIGN-PREP candidate for func_0220c830 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield self+2 (kind:6,b0:1); bind w14; b0-on-right cmp fold; unsigned-cast mask -> lsr
 *   risk:       permuter-class: r1<->r2 register mirror. Verified-compiled identical EXCEPT orig holds halfword in r2 / w14 in r1; mwcc picks the opposite 2-coloring. Reg coin-flip, not C-reshapeable.
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* self: u16 at +2 holds bit0 "player" + a 6-bit kind at [6:11], read once;
 * word at +0x14 holds packed sub-fields read once into r1. */
struct Self830 {
    u16 f0;
    u16 b0   : 1;   /* [0]    player flag  (lsl#31;lsr#31) */
    u16      : 5;
    u16 kind : 6;   /* [6:11] discriminant (lsl#20;lsr#26) */
    u16      : 4;
    u16 pad[8];     /* +4 .. +0x13 */
    u32 w14;        /* +0x14 packed word */
};

extern char data_ov002_022d0250[];   /* halfword table, byte-strided index */
extern int  func_0202e234(int id);

int func_ov002_0220c830(struct Self830 *self) {
    u32 w;
    if (self->kind != 0x16)
        return 0;
    w = self->w14;
    if (((w << 0x16) >> 0x1f) != self->b0)        /* w bit[9] vs player */
        return 0;
    if (((w << 0x9) >> 0x1c) != 0xe)              /* w bits[19:22] == 14 */
        return 0;
    /* asymmetric shift -> byte offset into the stride-4 halfword table;
     * result masked :13 then handed to the predicate. */
    return func_0202e234(
        (u32)(*(u16 *)(data_ov002_022d0250 + ((w << 0x17) >> 0x15)) << 0x13) >> 0x13)
        ? 1 : 0;
}
