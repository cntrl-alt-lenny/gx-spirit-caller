/* CAMPAIGN-PREP candidate for func_021ef7b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: reload obj+2 each owner use; 6-bit kind ==0x23 early-out; pass-through side/state params
 *   risk:       orig RELOADS ldrh [r6,#2] before the 021bc618 and !=side tests (separate derefs, as written); the first kind/owner pair reuse ONE load. If mwcc caches obj+2 in a reg, 2 ldrh diverge. reshape-able (keep separate *(u16*)(obj+2) reads).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ef7b4 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   Repeated obj+2 bitfield extracts (orig RELOADS ldrh [r6,#2] before each of 3 uses), 3 calls,
 *   branchy. 021bc8c8 here keeps side/state in r1/r2 (params never clobbered) so only r0=owner is set.
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern int func_ov002_021bc288(int side, int state);
extern int func_ov002_021bc618(int owner);
extern int func_ov002_021bc8c8(int owner, int side, int state);

int func_ov002_021ef7b4(void *obj, int side, int state)
{
    u16 flags;
    int owner;

    flags = *(u16 *)((u8 *)obj + 2);
    if ((int)(((u32)flags << 20) >> 26) == 0x23)   /* bits[6..11], 6-bit kind */
        return 1;

    owner = (int)(((u32)flags << 31) >> 31);
    if (func_ov002_021bc8c8(owner, side, state) == 0)
        return 0;

    if (func_ov002_021bc618((int)(((u32)*(u16 *)((u8 *)obj + 2) << 31) >> 31)) != 0)
        return 1;
    if ((int)(((u32)*(u16 *)((u8 *)obj + 2) << 31) >> 31) != side)
        return 0;
    if (func_ov002_021bc288(side, state) == 0)
        return 0;
    return 1;
}
