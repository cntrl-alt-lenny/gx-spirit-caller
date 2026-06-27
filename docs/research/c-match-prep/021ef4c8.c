/* CAMPAIGN-PREP candidate for func_021ef4c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: owner :1 via lsl31/lsr31; :13 guard; cd3f4 &&-compare; reuse params r0-r2
 *   risk:       orig calls 021c1ef0 with NO arg-setup (params still live in r0-r2 across the cd3f4 compares); if mwcc spills obj/side/state to stack/regs and reloads, the leading movs diverge. permuter-class (param-liveness scheduling).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ef4c8 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   Bitfield guard chain + a two-field global compare (cd3f4) then two tail calls.
 *   021c1ef0/021c1e44 both take (obj,side,state); orig keeps obj/side/state live in r0-r2
 *   for the first call (no movs) and restores from r6/r5/r4 for the second.
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern u8  data_ov002_022cf16c[];
extern u8  data_ov002_022cf1a4[];
extern u8  data_ov002_022cd3f4[];   /* +0x00 = side, +0x1c = state */
extern int func_ov002_021c1ef0(void *obj, int side, int state);
extern int func_ov002_021c1e44(void *obj, int side, int state);

struct flags30 { u32 f13 : 13; u32 hi : 19; };

int func_ov002_021ef4c8(void *obj, int side, int state)
{
    int base, off;

    if (side == (int)(((u32)*(u16 *)((u8 *)obj + 2) << 31) >> 31))
        return 0;
    if (state >= 5)
        return 0;

    base = (side & 1) * 0x868;
    off  = state * 0x14;

    if (((struct flags30 *)(data_ov002_022cf16c + base + off + 0x30))->f13 == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + base + off) == 0)
        return 0;

    if (!(*(int *)(data_ov002_022cd3f4) == side &&
          *(int *)(data_ov002_022cd3f4 + 0x1c) == state))
        return 0;

    if (func_ov002_021c1ef0(obj, side, state) == 0)
        return 0;
    return func_ov002_021c1e44(obj, side, state) == 0 ? 1 : 0;
}
