/* CAMPAIGN-PREP candidate for func_02227c4c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     symmetric shifts->:1/:5 bitfields; asym 9-bit raw (x<<17)>>23; player/row CSE both indexes
 *   risk:       reshape-able: if mwcc reloads cf16c base or fails to CSE player*0x868/row*0x14 across the two indexes, ldr/mul count diverges; declare player+row first (done) to hold them
 *   confidence: med
 */
/* func_ov002_02227c4c: cls D. self at r0. Validate the per-player slot record
 * (bit0 player + 5-bit row index a 0x868/0x14 strided slot in cf16c; compare
 * its packed word field vs self->f4 9-bit field) -> return 0 on mismatch. Then
 * gate on a per-player u16 in cf1a4 (==0 -> return 0); else call
 * 021d91e0(player, row, 1). Returns 0. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self {
    u16 f0;
    u16 b0 : 1;        /* +0x2 bit0  */
    u16 row : 5;       /* +0x2 bits1..5 */
    u16 f4;            /* +0x4 packed 9-bit field at bit6 */
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021d91e0(int player, int row, int flag);

int func_ov002_02227c4c(struct Self *self) {
    int player = self->b0 & 1;
    int row = self->row;
    unsigned int w = *(unsigned int *)(data_ov002_022cf16c +
                          player * 0x868 + row * 0x14 + 0x30);
    if ((unsigned)(self->f4 << 17) >> 23 !=
        (((w << 2) >> 24) << 1) + ((w << 18) >> 31))
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + player * 0x868 + row * 0x14) == 0)
        return 0;
    func_ov002_021d91e0(player, row, 1);
    return 0;
}
