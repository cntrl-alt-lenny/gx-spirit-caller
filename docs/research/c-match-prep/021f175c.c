/* CAMPAIGN-PREP candidate for func_021f175c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla-fold base (single &base[...] expr); bind v once; dual-bitfield compare (proven 021f17d4 shifts); :13
 *   risk:       the (v<<2>>24<<1)+(v<<18>>31) vs (h<<17>>23) compare is 3 hand-built shift chains; mwcc may schedule them in a different reg/order. permuter-class
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c1e44(void *a, int p, int s);

int func_ov002_021f175c(void *a, int p, int s)
{
    u32 v;
    u16 h;

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
