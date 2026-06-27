/* CAMPAIGN-PREP candidate for func_022079e4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 bitfield+&1 index, struct-array (mul/mla stride 0x868), reload field, 13-bit mask
 *   risk:       redundant 'and #1' after lsl#31;lsr#31 may be folded away by mwcc; reshape-able by keeping explicit '& 1' on the :1 field. Also struct-guessed offsets +0xf8/0x868.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct { u16 _0; u16 sel : 1; u16 _2r : 15; } Arg;

typedef struct { u16 f0; u8 pad[0x868 - 2]; } EntryH;          /* data_022cf26c[] */
typedef struct { u8 p0[0xf8]; u32 f_f8; u8 p1[0x868 - 0xfc]; } EntryW; /* data_022cf16c[] */

extern EntryH data_ov002_022cf26c[2];
extern EntryW data_ov002_022cf16c[2];
extern int func_ov002_021c23ac(int a, int b);
extern int func_0202df78(u32 v, int k);

int func_ov002_022079e4(Arg *p)
{
    u16 v;
    v = data_ov002_022cf26c[p->sel & 1].f0;
    if (v == 0)
        return 0;
    if (func_ov002_021c23ac(v, 0xa) == 0)
        return 0;
    return func_0202df78(data_ov002_022cf16c[p->sel & 1].f_f8 & 0x1fff, 0x10f4);
}
