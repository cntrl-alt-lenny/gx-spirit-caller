/* CAMPAIGN-PREP candidate for func_021f30a8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two signed %5 (smull 0x66666667 magic) chains; branch on (h&1)==p; extract (h<<26>>27) inlined per branch; dual-bitfield
 *   risk:       two independent int%5 magic divides + finalize adds; mwcc's scheduler interleaves the 2 smull chains and may CSE-hoist the (h<<26>>27) extract above the branch (orig duplicates it). permuter-class
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];

int func_ov002_021f30a8(void *a, int p, int s)
{
    u32 v;
    u16 h;

    v = *(u32 *)(&data_ov002_022cf16c[(p & 1) * 0x868 + s * 0x14 + 0x30]);
    if (((v << 0x13) >> 0x13) == 0)
        return 0;
    if (s >= 0xa)
        return 0;
    h = ((u16 *)a)[2];
    if ((((v << 2) >> 0x18) << 1) + ((v << 0x12) >> 0x1f) == ((u32)(h << 0x11) >> 0x17))
        return 0;
    h = ((u16 *)a)[1];
    if (p == ((u32)(h << 0x1f) >> 0x1f)) {
        if (s % 5 == (int)((u32)(h << 0x1a) >> 0x1b) % 5)
            return 1;
        return 0;
    }
    if (s % 5 == 4 - (int)((u32)(h << 0x1a) >> 0x1b) % 5)
        return 1;
    return 0;
}
