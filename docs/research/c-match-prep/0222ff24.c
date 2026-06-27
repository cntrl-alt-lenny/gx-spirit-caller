/* CAMPAIGN-PREP candidate for func_0222ff24 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     same coord-decode as fea4; second per-player table cf1a4 reuses (player&1)*0x868 + idx*20; pass -1 (sub 0x14-0x15)
 *   risk:       orig CSEs the player byte-offset r2=(player&1)*0x868 across both the cf16c row load and the cf1a4 check, and reuses r3=idx*20; mwcc likely recomputes the offset for the 2nd table -> reg-alloc/CSE, permuter-class; cf1a4 indexing struct-guessed
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;
struct self_t { u16 f0; u16 player : 1; u16 idx : 5; u16 f4; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021d93e0(int player, int idx, int c);
int func_ov002_0222ff24(struct self_t *self) {
    int player = self->player;
    int idx = self->idx;
    char *base = data_ov002_022cf16c + (player & 1) * 0x868;
    u32 row = *(u32 *)(base + idx * 20 + 48);
    int lhs = (u32)((u16)self->f4 << 17) >> 23;
    int rhs = (int)(((u32)(row << 2) >> 24) << 1) + (int)((u32)(row << 18) >> 31);
    if (lhs != rhs) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    func_ov002_021d93e0(player, idx, -1);
    return 0;
}
