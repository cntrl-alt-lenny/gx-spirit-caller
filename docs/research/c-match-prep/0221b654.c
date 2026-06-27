/* CAMPAIGN-PREP candidate for func_0221b654 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield b0:1+row:5 read-once via mla base; raw asymmetric shifts; packed-cmp hi8*2+bit13 order
 *   risk:       orig uses `mla r3,player,0x868,cf16c` to fold base; mwcc emits `mla` for `cf16c+player*0x868` only if it fuses the +0x30/+row*20 the same way — decl-order of player/row before `word` should steer it. reshape-able (decl-order).
 *   confidence: med
 */
/* func_ov002_0221b654 (cls D): the cf16c (player,row) row validate (NO cf1a4
 * gate here); on pass call 021e2d94(player, row, 5, 1). Returns 0. Clean leaf. */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 row : 5; u16 _r : 10; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_021e2d94(int a, int b, int c, int d);

int func_ov002_0221b654(struct Self *self) {
    int player = self->b0 & 1;
    int row = self->row;
    int word = *(int *)(data_ov002_022cf16c + player * 0x868 + row * 0x14 + 0x30);
    if ((unsigned)(*(u16 *)((char *)self + 4) << 17) >> 23 !=
        (((unsigned)(word << 2) >> 24) << 1) + ((unsigned)(word << 18) >> 31))
        return 0;
    func_ov002_021e2d94(player, row, 5, 1);
    return 0;
}
