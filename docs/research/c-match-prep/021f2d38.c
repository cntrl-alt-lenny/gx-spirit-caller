/* CAMPAIGN-PREP candidate for func_021f2d38 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r6=obj held; double mla (parity then slot) one base; parity guard first; add+cmp tail
 *   risk:       orig folds both indices via two mla (r1 then r0) into one address; if mwcc splits to mul+add, the +0x30 fold and single-base diverge. reshape-able via nested-mla operand order
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c23ac(int p, int s);
extern int func_ov002_021c84e0(int p, int s);

int func_ov002_021f2d38(void *a, int p, int s)
{
    u16 h;
    int r0;
    u16 hc;

    h = ((u16 *)a)[1];
    if (((u32)(h << 0x1f) >> 0x1f) != p)
        return 0;
    if (s >= 5)
        return 0;
    if (((*(u32 *)(&data_ov002_022cf16c[(p & 1) * 0x868 + s * 0x14 + 0x30]) << 0x13) >> 0x13) == 0)
        return 0;
    if (func_ov002_021c23ac(p, s) == 0)
        return 0;
    r0 = func_ov002_021c84e0(p, s);
    if (r0 == 0)
        return 0;
    hc = ((u16 *)a)[6];
    if (r0 + hc < 0xd)
        return 1;
    return 0;
}
