/* CAMPAIGN-PREP candidate for func_0224f024 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     identical to ef84; only the first predicate symbol differs (0202e2c8); :13 bitfield + reload
 *   risk:       same as ef84 (do/while loop-header shape). If ef84 matches byte-for-byte this clone will too. reshape-able.
 *   confidence: med
 */
/* func_ov002_0224f024: clone of 0224ef84 with a different first predicate
 * (func_0202e2c8). Same +0x418 array, :13 bitfield, count reload, kind 0xe. */
typedef unsigned int u32;

struct Slot13 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

extern int func_0202e2c8(int id);
extern int func_ov002_021c33e4(int player, int self, int idx);
extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224f024(int player) {
    char *base;
    struct Slot13 *p;
    int i;
    if (*(int *)(data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    p = (struct Slot13 *)(base + 0x418);
    i = 0;
    do {
        if (func_0202e2c8(p->id) != 0 &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 0xe, i);
        p++;
    } while (++i < *(int *)(base + 0x14));
}
