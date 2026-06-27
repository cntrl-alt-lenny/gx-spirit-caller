/* CAMPAIGN-PREP candidate for func_02207e18 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     idx and (1-idx)&1 struct-array reads (mul stride 0x868), const 0x1b58 add, <=
 *   risk:       constant 0x1b58 must split into add #0x358 + add #0x1800 (mwcc usually does); and the (1-i)&1 redundant mask must survive. Both reshape-able; struct-guessed stride 0x868/f0=u32.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct { u16 _0; u16 sel : 1; u16 _2r : 15; } Arg;
typedef struct { u32 f0; u8 pad[0x868 - 4]; } Entry;   /* data_022cf16c[] */

extern Entry data_ov002_022cf16c[2];

int func_ov002_02207e18(Arg *p)
{
    int i = p->sel & 1;
    if (data_ov002_022cf16c[i].f0 + 0x1b58 <= data_ov002_022cf16c[(1 - i) & 1].f0)
        return 1;
    return 0;
}
