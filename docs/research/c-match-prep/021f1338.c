/* CAMPAIGN-PREP candidate for func_021f1338 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shared off temps; field load BEFORE s>=5; 1-(h&1) parity; nested a4/a2 (bne) check; :13 shift
 *   risk:       orig loads field v before the s>=5 early-return; mwcc may hoist the return ahead of the side-effect-free load, flipping order. reshape-able (keep load above guard / read v lazily)
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a2[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021c1e44(void *a, int p, int s);

int func_ov002_021f1338(void *a, int p, int s)
{
    int off_parity;
    int off_slot;
    u32 v;
    u16 h;

    off_parity = (p & 1) * 0x868;
    off_slot = s * 0x14;
    v = *(u32 *)(&data_ov002_022cf16c[off_parity + off_slot + 0x30]);
    if (s >= 5)
        return 0;
    h = ((u16 *)a)[1];
    if (p != 1 - ((u32)(h << 0x1f) >> 0x1f))
        return 0;
    if (((v << 0x13) >> 0x13) == 0)
        return 0;
    if (*(u16 *)(&data_ov002_022cf1a4[off_parity + off_slot]) == 0) {
        if (*(u16 *)(&data_ov002_022cf1a2[off_parity + off_slot]) != 0)
            return 0;
    }
    if (func_ov002_021c1e44(a, p, s) != 0)
        return 0;
    return 1;
}
