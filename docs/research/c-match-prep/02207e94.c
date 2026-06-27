/* CAMPAIGN-PREP candidate for func_02207e94 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     global guard !=2, :1 and :5 bitfields to 3-arg call, idx/(1-idx) struct-array compare
 *   risk:       call passes b0 twice (arg0==arg1, both = lsl#31;lsr#31 of field) — arg-list guessed; if real signature differs, the duplicated reg won't match. permuter-class if it is a reg-rotation, else reshape-able.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct { u16 _0; u16 b0 : 1; u16 b1 : 5; u16 _r : 10; } Arg;
typedef struct { u32 f0; u8 pad[0x868 - 4]; } Entry;   /* data_022cf16c[] */
typedef struct { u8 pad[0xcf8]; int mode; } Glob;       /* data_022d016c */

extern Glob data_ov002_022d016c;
extern Entry data_ov002_022cf16c[2];
extern int func_ov002_021bc8c8(int a, int b, int c);

int func_ov002_02207e94(Arg *p)
{
    int i;
    if (data_ov002_022d016c.mode != 2)
        return 0;
    if (func_ov002_021bc8c8(p->b0, p->b0, p->b1) == 0)
        return 0;
    i = p->b0 & 1;
    if (data_ov002_022cf16c[i].f0 > data_ov002_022cf16c[(1 - i) & 1].f0)
        return 1;
    return 0;
}
