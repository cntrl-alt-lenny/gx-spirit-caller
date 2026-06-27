/* CAMPAIGN-PREP candidate for func_02207a70 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two :6/:4 bitfield guards, :9 bitfield scaled*4 into stride-4 array, 13-bit mask
 *   risk:       the '(field9)*4' fusion (lsl#23;lsr#21) only emits if mwcc treats idx9 as a :9 bitfield scaled by struct stride 4; if it splits to and+lsl it diverges. struct-guessed (Pair stride, +0x14 layout).
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

/* u16 at +2: bits[6:11] is a :6 field; u32 at +0x14 has :9 idx and :4 at [19] */
typedef struct {
    u16 _0;
    u16 a : 6;
    u16 b6 : 6;
    u16 c : 4;
    u8  pad[0x14 - 4];
    u32 idx9 : 9;
    u32 m9 : 10;
    u32 f4 : 4;
    u32 hi : 9;
} Obj;

typedef struct { u16 h; u16 _2; } Pair;                 /* data_022d0250[] stride 4 */
extern Pair data_ov002_022d0250[];
extern int func_0202e234(u32 v);

int func_ov002_02207a70(Obj *p)
{
    u32 w;
    if (p->b6 != 0x16)
        return 0;
    w = *(u32 *)((u8 *)p + 0x14);
    if (((Obj *)0, ((w >> 19) & 0xf)) != 0xe) /* unused */ ;
    if (p->f4 != 0xe)
        return 0;
    return func_0202e234(data_ov002_022d0250[p->idx9].h & 0x1fff) != 0;
}
