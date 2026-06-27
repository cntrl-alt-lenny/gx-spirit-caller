/* CAMPAIGN-PREP candidate for func_021f17d4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base+offset across calls; reload field twice; bitfield :13 via lsl/lsr
 *   risk:       the (v<<2>>24<<1)+(v<<18>>31) vs (h<<17>>23) compare is hand-built shifts; mwcc may schedule the 3 shift chains differently. permuter-class
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c1e44(void *a, int p, int s);
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c2084(void *a, int p, int s, int f);

struct Obj { u16 pad0; u16 f4_pad; u16 f4; };

int func_ov002_021f17d4(void *a, int p, int s)
{
    u8 *base;
    u32 *cell;
    u32 v;
    u16 h;

    base = &data_ov002_022cf16c[(p & 1) * 0x868 + 0x30];
    cell = (u32 *)(base + s * 0x14);
    if (((*cell << 0x13) >> 0x13) == 0)
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    v = *cell;
    h = ((u16 *)a)[2];
    if ((((v << 2) >> 0x18) << 1) + ((v << 0x12) >> 0x1f) == ((u32)(h << 0x11) >> 0x17))
        return 0;
    if (func_ov002_021c1e44(a, p, s) != 0)
        return 0;
    if (func_ov002_021c2084(a, p, s, 1) != 0)
        return 1;
    return 0;
}
