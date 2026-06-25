/* CAMPAIGN-PREP candidate for func_021f1898 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single nested mla (parity then slot) into one base; field read once; :13 bitfield
 *   risk:       orig nests two mla (ip then r3) folding parity*0x868+base then slot*0x14+ip; if mwcc emits mul+add instead of mla, addressing diverges. reshape-able via operand order
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c1e44(void *a, int p, int s);
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c2084(void *a, int p, int s, int f);

int func_ov002_021f1898(void *a, int p, int s)
{
    u32 v;

    v = *(u32 *)(&data_ov002_022cf16c[(p & 1) * 0x868 + s * 0x14 + 0x30]);
    if (((v << 0x13) >> 0x13) == 0)
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (func_ov002_021c1e44(a, p, s) != 0)
        return 0;
    if (func_ov002_021c2084(a, p, s, 1) != 0)
        return 1;
    return 0;
}
