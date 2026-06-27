/* CAMPAIGN-PREP candidate for func_02275860 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: slot.id :13 bitfield; CSE sum*20 to two bases; id live r0
 *   risk:       reshape-able: orig CSEs sum*20 in one reg added to BOTH cf16c and cf1a4 bases (mul once, two adds), and keeps slot.id in r0 across the cf1a4 read for func_0202b878(id). Risk: mwcc may reload/recompute sum*20 per-base or spill id — keep row as the only product local (not off+row fused).
 *   confidence: med
 */
/* func_ov002_02275860: per-player 0x868 sub-row validator. Reads slot.id
 * (:13 @ row+0x30), keeps it live in r0 for func_0202b878(id)==0x17 gate,
 * then routes sum<5 -> 021b8fcc else 021c23ac; hit returns 0x800.          */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cd300[];
extern char data_ov002_022cf16c[];   /* row table, +0x30 sub-row (slot.id) */
extern unsigned short data_ov002_022cf1a4[]; /* parallel u16 table */
extern int func_0202b878(int id);
extern int func_ov002_021b8fcc(int player, int sum);
extern int func_ov002_021c23ac(int player, int sum);
struct CD300 { unsigned bit0:1; unsigned rest:31; };
int func_ov002_02275860(int player, int a, int b) {
    int sum = a + b;
    int off = (player & 1) * 0x868;
    int row = sum * 20;
    int id;
    if (player != (int)((struct CD300 *)data_ov002_022cd300)->bit0) return 0;
    if (sum > 10) return 0;
    id = ((struct Ov002Slot *)(data_ov002_022cf16c + off + row + 0x30))->id;
    if (id == 0) return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + off + row) == 0) return 0;
    if (func_0202b878(id) != 0x17) return 0;
    if (sum < 5) {
        if (func_ov002_021b8fcc(player, sum) == 0) return 0;
    }
    if (func_ov002_021c23ac(player, sum) != 0) return 0x800;
    return 0;
}
