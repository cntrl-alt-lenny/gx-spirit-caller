/* CAMPAIGN-PREP candidate for func_021ef6f4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D/C: bind kind in callee-saved; owner :1 reloaded per test; cf1a4 u16 final guard
 *   risk:       orig passes kind to 0202e5ac in r0 left over from 021b9ecc (no mov r0,r6) while kind stays live in r6 for the ==0x158c test; mwcc will likely add mov r0,r6. permuter-class (return-value vs callee-saved scheduling).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ef6f4 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   Call-result guard + owner-bit branch; final branch reads cf1a4 halfword. branchy liveness:
 *   side->r5,state->r4,obj->r7 callee-saved; kind(021b9ecc)->r6; obj+2 reloaded for the 2nd test.
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern u8  data_ov002_022cf1a4[];
extern int func_0202e5ac(int kind);
extern int func_ov002_021b9ecc(int side, int state);
extern int func_ov002_021bc8c8(int owner, int side, int state);

int func_ov002_021ef6f4(void *obj, int side, int state)
{
    int kind;
    int owner;

    kind = func_ov002_021b9ecc(side, state);
    if (state > 4)
        return 0;
    if (func_0202e5ac(kind) == 0)
        return 0;
    if (kind == 0x158c)
        return 0;

    owner = (int)(((u32)*(u16 *)((u8 *)obj + 2) << 31) >> 31);
    if (func_ov002_021bc8c8(owner, side, state) == 0)
        return 0;

    if ((int)(((u32)*(u16 *)((u8 *)obj + 2) << 31) >> 31) == side)
        return 1;
    if (*(u16 *)(data_ov002_022cf1a4 + (side & 1) * 0x868 + state * 0x14) == 0)
        return 0;
    return 1;
}
