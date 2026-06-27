/* CAMPAIGN-PREP candidate for func_021f15a8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     no s>=5 guard; shared off temps; :13 shift; parity-equal returns 0; single a4 table; 021c1ef0 gate
 *   risk:       021c1ef0 sig inferred: orig leaves r0/r1/r2=a,p,s untouched before bl so args pass through with no setup -- could be 021c1ef0(void). struct-guessed (helper arity); harmless either way
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(void *a, int p, int s);

int func_ov002_021f15a8(void *a, int p, int s)
{
    int off_parity;
    int off_slot;
    u16 h;

    off_parity = (p & 1) * 0x868;
    off_slot = s * 0x14;
    if (((*(u32 *)(&data_ov002_022cf16c[off_parity + off_slot + 0x30]) << 0x13) >> 0x13) == 0)
        return 0;
    h = ((u16 *)a)[1];
    if (p == ((u32)(h << 0x1f) >> 0x1f))
        return 0;
    if (*(u16 *)(&data_ov002_022cf1a4[off_parity + off_slot]) != 0)
        return 0;
    if (func_ov002_021c1ef0(a, p, s) != 0)
        return 1;
    return 0;
}
