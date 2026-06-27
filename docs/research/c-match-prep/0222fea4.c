/* CAMPAIGN-PREP candidate for func_0222fea4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     player/idx as :1/:5 bitfields; asymmetric raw shifts for f4 9-bit, row f8/bit13; mla base; r0 reused as player
 *   risk:       orig REUSES r0 as `player` after computing it (mov r0,lsl31;lsr31) so de480 gets r0=player; the row decode reconstruction `(f8<<1)+bit13` is scheduling-sensitive and the (player&1) mla may double-extract -> permuter-class (instruction order)
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;
struct self_t { u16 f0; u16 player : 1; u16 idx : 5; u16 f4; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_021de480(int player, int idx, int c, int d);
int func_ov002_0222fea4(struct self_t *self) {
    int player = self->player;
    int idx = self->idx;
    char *base = data_ov002_022cf16c + (player & 1) * 0x868;
    u32 row = *(u32 *)(base + idx * 20 + 48);
    int lhs = (u32)((u16)self->f4 << 17) >> 23;
    int rhs = (int)(((u32)(row << 2) >> 24) << 1) + (int)((u32)(row << 18) >> 31);
    if (lhs != rhs) return 0;
    func_ov002_021de480(player, idx, 0, 0);
    return 0;
}
