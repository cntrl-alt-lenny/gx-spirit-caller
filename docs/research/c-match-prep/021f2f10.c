/* CAMPAIGN-PREP candidate for func_021f2f10 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Ov002Slot.id bitfield (lsl19/lsr19); per-player 0x868 stride; cf16c base bound once
 *   risk:       orig holds (player&1)*0x868 product in one reg reused for both cf16c and cf1a4 bases (add lr,lr,r3); if mwcc recomputes the &1*0x868 twice, 1-2 extra mul/and diverge. reshape-able (compute idx0=(player&1)*0x868 once, index both)
 *   confidence: med
 */
/* func_ov002_021f2f10: per-player slot guard chain then 6 OR-ed predicate
 * calls. self=arg0 (r0, never clobbered, fed to 021c1e44), player=arg1,
 * idx=arg2. Returns 1 if any of the 6 sibling predicates is true, else 0. */
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021c1e44(void *self, int player, int idx);
extern int  func_ov002_021b9e00(int player, int idx);
extern int  func_ov002_021b9e48(int player, int idx);
extern int  func_ov002_021b9e90(int player, int idx);
extern int  func_ov002_021b9ea4(int player, int idx);
extern int  func_ov002_021b9eb8(int player, int idx);

struct Ov002Slot { u32 id : 13; };

int func_ov002_021f2f10(void *self, int player, int idx) {
    char *base = data_ov002_022cf16c + (player & 1) * 0x868;
    if (((struct Ov002Slot *)(base + idx * 20 + 48))->id == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (func_ov002_021b9e00(player, idx) != 0)
        return 1;
    if (func_ov002_021b9e48(player, idx) != 0)
        return 1;
    if (func_ov002_021b9e90(player, idx) != 0)
        return 1;
    if (func_ov002_021b9ea4(player, idx) != 0)
        return 1;
    if (func_ov002_021b9eb8(player, idx) != 0)
        return 1;
    return 0;
}
