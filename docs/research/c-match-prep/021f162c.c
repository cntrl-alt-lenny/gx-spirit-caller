/* CAMPAIGN-PREP candidate for func_021f162c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Nested mla (parity base then row) without 0x30-bind; :1 parity compare; 3-call guard chain
 *   risk:       orig nests mla ip,r5,_LIT0,_LIT1 then mla r3,r4,#0x14,r6 (base built before +0x30 fold into ldr); mwcc may instead mul+add or fold differently, shifting the two mla into mul/add. reshape-able (don't pre-add 0x30; keep a2*0x14 inline).
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern int func_ov002_021c1e44(int a, int b, int c);
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c2084(int a, int b, int c, int d);

struct S162c { u32 _0; u16 _2; };

int func_ov002_021f162c(struct S162c *a0, int a1, int a2)
{
    if (((*(u32 *)(data_ov002_022cf16c + (a1 & 1) * 0x868 + a2 * 0x14 + 0x30) << 0x13) >> 0x13) == 0)
        return 0;
    if (a1 != (int)((*(u16 *)((char *)a0 + 2) << 0x1f) >> 0x1f))
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (func_ov002_021c1e44((int)a0, a1, a2) != 0)
        return 0;
    if (func_ov002_021c2084((int)a0, a1, a2, 1) != 0)
        return 1;
    return 0;
}
