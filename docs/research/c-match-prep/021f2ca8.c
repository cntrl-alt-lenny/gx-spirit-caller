/* CAMPAIGN-PREP candidate for func_021f2ca8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leading (h&1)!=p guard (h-first cmp, materialized); mla base; bind v; dual-bitfield; :13; 021c1e44 gate
 *   risk:       the dual-bitfield (v<<2>>24<<1)+(v<<18>>31) vs (h<<17>>23) is 3 hand shift chains; mwcc scheduling/reg choice across them may differ. permuter-class
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c1e44(void *a, int p, int s);

int func_ov002_021f2ca8(void *a, int p, int s)
{
    u32 v;
    u16 h;

    h = ((u16 *)a)[1];
    if (((u32)(h << 0x1f) >> 0x1f) != p)
        return 0;
    v = *(u32 *)(&data_ov002_022cf16c[(p & 1) * 0x868 + s * 0x14 + 0x30]);
    if (((v << 0x13) >> 0x13) == 0)
        return 0;
    h = ((u16 *)a)[2];
    if ((((v << 2) >> 0x18) << 1) + ((v << 0x12) >> 0x1f) == ((u32)(h << 0x11) >> 0x17))
        return 0;
    if (func_ov002_021c1e44(a, p, s) == 0)
        return 1;
    return 0;
}
