/* CAMPAIGN-PREP candidate for func_021f16d4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Same nested-mla base+row as 162c; :1 parity compare; 2-call guard, inverted bool tail
 *   risk:       identical mla nesting to 021f162c (mla ip then mla r3,#0x14); same fold-vs-mul-add codegen risk on the index, plus tail moveq1/movne0 polarity. reshape-able (mirror 162c shape; verify last-call return-order).
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c1e44(int a, int b, int c);
extern int func_ov002_021c1ef0(void);

struct S16d4 { u32 _0; u16 _2; };

int func_ov002_021f16d4(struct S16d4 *a0, int a1, int a2)
{
    if (((*(u32 *)(data_ov002_022cf16c + (a1 & 1) * 0x868 + a2 * 0x14 + 0x30) << 0x13) >> 0x13) == 0)
        return 0;
    if (a1 != (int)((*(u16 *)((char *)a0 + 2) << 0x1f) >> 0x1f))
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (func_ov002_021c1e44((int)a0, a1, a2) == 0)
        return 1;
    return 0;
}
