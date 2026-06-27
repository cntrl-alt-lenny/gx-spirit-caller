/* CAMPAIGN-PREP candidate for func_021f3238 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     share (player&1)*0x868 in r5 and idx*20 in r4 across cf16c/cf1a4/cf1a2; Slot.id bitfield
 *   risk:       orig precomputes r5=(player&1)*0x868 and r4=idx*0x14 ONCE and reuses both for all three tables (ldrh [r4,r0]); if mwcc re-derives the stride/index per table access several mul/and diverge. reshape-able via two explicit locals stride=(player&1)*0x868, off=idx*20 used in all three
 *   confidence: med
 */
/* func_ov002_021f3238: self=arg0 (r8), player=arg1 (r7), idx=arg2 (r6).
 * idx<5 guard, Ov002Slot.id!=0 guard, 021c1e44 self-check, then
 * 021c2084(self,player,idx,0); if true, check two halfword field tables
 * (cf1a4 -> low, cf1a2 -> high) at idx*20 and a 021b90a8(player,idx) probe.
 * Returns 1 unless the final 021b90a8 probe is true (then 0). */
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern int  func_ov002_021b90a8(int player, int idx);
extern int  func_ov002_021c1e44(void *self, int player, int idx);
extern int  func_ov002_021c2084(void *self, int player, int idx, int d);

struct Ov002Slot { u32 id : 13; };

int func_ov002_021f3238(void *self, int player, int idx) {
    char *base;
    if (idx >= 5)
        return 0;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    if (((struct Ov002Slot *)(base + idx * 20 + 48))->id == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (func_ov002_021c2084(self, player, idx, 0) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) != 0 &&
        *(u16 *)(data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 20) == 0) {
        if (func_ov002_021b90a8(player, idx) != 0)
            return 0;
    }
    return 1;
}
