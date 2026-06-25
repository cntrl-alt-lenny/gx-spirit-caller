/* CAMPAIGN-PREP candidate for func_02244e24 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     high-byte narrow (lsl16;lsr16;asr8;and); neighbor n-1/n+1 compare
 *   risk:       the n-1/n+1 neighbor test maps to 'sub;cmp;addne;cmpne;bne'. mwcc may compute n-1 and n+1 in different regs or reorder the OR-of-equals short-circuit. reshape-able (split the two compares / reorder). n in r1 held across (and r1,r0,#0xff).
 *   confidence: med
 */
// func_ov002_02244e24  ov002  shift/asr narrowing + neighbor compare

typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

extern int func_ov002_0223de94(void *obj, int z);
extern int func_ov002_021bc55c(int r5, int r4);

int func_ov002_02244e24(void *r0, int r5, int r4)
{
    int t = func_ov002_0223de94(r0, 0);
    int n = ((int)((unsigned)(t << 0x10) >> 0x10) >> 8) & 0xff;  // high byte of u16
    if (r4 > 4)
        return 0;
    if (r4 == n - 1 || r4 == n + 1) {
        if (func_ov002_021bc55c(r5, r4) == 0)
            return 0;
        return 1;
    }
    return 0;
}
