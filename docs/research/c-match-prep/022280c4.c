/* CAMPAIGN-PREP candidate for func_022280c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 bitfield held in r0 across both index exprs; (1-player) rsb for cf17c, player word-index cd744
 *   risk:       reshape-able: orig keeps bit0 in r0 for cd744[player,lsl#2] AND derives rsb (1-player) for cf17c; if mwcc recomputes bit0 a 2nd ldrh/shift appears. Same-read steer is the lever
 *   confidence: med
 */
/* func_ov002_022280c4: cls D. self at r0. player = self->bit0. Gate on the
 * OTHER player's scalar in cf17c (==0 -> return 0), then on cd744[player]
 * (!=0 -> return 0); else post via 021af9d0(player, 5, self->f0, 0). Returns 0.
 * The (1-player)*0x868 byte stride and the cd744[player] word index both key
 * off the same bit0 read. */
typedef unsigned short u16;

struct Self {
    u16 f0;
    u16 b0 : 1;        /* +0x2 bit0 */
};

extern char data_ov002_022cf17c[];   /* per-player scalar, 0x868 stride */
extern int  data_ov002_022cd744[];   /* flag table indexed by player    */
extern int  func_ov002_021af9d0(int player, int a, int b, int c);

int func_ov002_022280c4(struct Self *self) {
    int player = self->b0 & 1;
    if (*(int *)(data_ov002_022cf17c + ((1 - player) & 1) * 0x868) == 0)
        return 0;
    if (data_ov002_022cd744[player] != 0)
        return 0;
    func_ov002_021af9d0(player, 5, self->f0, 0);
    return 0;
}
