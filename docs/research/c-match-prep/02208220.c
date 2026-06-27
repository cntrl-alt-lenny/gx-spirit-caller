/* CAMPAIGN-PREP candidate for func_02208220 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     const-arg guard, 2-arg guard, (1-idx)&1 struct-array read, ternary 2:1
 *   risk:       ternary returning 2/1 should map to movne#2/moveq#1 (matches). (1-sel)&1 redundant mask must survive. Both reshape-able; struct-guessed stride 0x868/f0=u32 for data_022cf178.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct { u16 _0; u16 sel : 1; u16 _2r : 15; } Arg;
typedef struct { u32 f0; u8 pad[0x868 - 4]; } Entry;   /* data_022cf178[] */

extern Entry data_ov002_022cf178[2];
extern int func_ov002_021bb91c(int a);
extern int func_ov002_0220803c(Arg *p, int a);

int func_ov002_02208220(Arg *p, int a)
{
    if (func_ov002_021bb91c(0x175e) == 0)
        return 0;
    if (func_ov002_0220803c(p, a) == 0)
        return 0;
    return data_ov002_022cf178[(1 - p->sel) & 1].f0 != 0 ? 2 : 1;
}
