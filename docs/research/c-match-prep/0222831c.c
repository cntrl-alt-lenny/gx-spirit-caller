/* CAMPAIGN-PREP candidate for func_0222831c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     validate via bitfields+asym shift; RELOAD slot ptr after call (separate expr); if-chain kind, 1 stacked arg
 *   risk:       reshape-able: slot ptr is recomputed both times in the orig (mla after the call) - if mwcc CSEs the first slot addr across 02206780, an extra spill/reload diverges; two separate exprs (done) prevents it
 *   confidence: med
 */
/* func_ov002_0222831c: cls D. self at r0. Validate the per-player slot record
 * (bit0 player + 5-bit row -> cf16c slot; packed word field vs self->f4 9-bit)
 * -> return 0 on mismatch. Gate on 02206780() (==0 -> 0). kind = (self->f0 ==
 * 0x1472 || self->f0 == 0x1aca) ? 2 : 1. Recompute the slot ptr fresh and call
 * 0227ac64(player, slot, 1, kind, 1). Returns 0. The slot ptr is RELOADED (orig
 * does not keep it live across 02206780 + the f0 compare). */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self {
    u16 f0;
    u16 b0 : 1;        /* +0x2 bit0 */
    u16 row : 5;       /* +0x2 bits1..5 */
    u16 f4;            /* +0x4 packed 9-bit field at bit6 */
};

extern char data_ov002_022cf16c[];
extern int  func_ov002_02206780(void);
extern int  func_ov002_0227ac64(int player, char *slot, int a, int kind, int e);

int func_ov002_0222831c(struct Self *self) {
    int kind = 1;
    unsigned int w = *(unsigned int *)(data_ov002_022cf16c +
                          (self->b0 & 1) * 0x868 + self->row * 0x14 + 0x30);
    if ((unsigned)(self->f4 << 17) >> 23 !=
        (((w << 2) >> 24) << 1) + ((w << 18) >> 31))
        return 0;
    if (func_ov002_02206780() == 0)
        return 0;
    if (self->f0 == 0x1472)
        kind = 2;
    else if (self->f0 == 0x1aca)
        kind = 2;
    func_ov002_0227ac64(self->b0 & 1,
                        data_ov002_022cf16c + (self->b0 & 1) * 0x868 +
                            self->row * 0x14 + 0x30,
                        1, kind, 1);
    return 0;
}
