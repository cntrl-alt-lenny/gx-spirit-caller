/* CAMPAIGN-PREP candidate for func_02224e14 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     double mla (sel&1)*STRIDE + b*0x14; (short) packed decode; strh store-order kept
 *   risk:       struct-guessed/reshape-able: .L_c0 tail truncated; the bic+orr packed-store order is fragile (must emit bic then orr) and the +0x30 bit13 stride is inferred -> wrong stride breaks index.
 *   confidence: low
 */
/* func_ov002_02224e14 : double mla index + packed-field store (class D) */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Entity { u16 f0; u16 f2; };

extern u8  data_ov002_022ce288[]; /* state @ +0x5a8; counter @ +0x5ac (LIT0) */
extern u8  data_ov002_022cf16c[]; /* table base (LIT1) */
#define STRIDE 0x868              /* LIT2 */

extern int func_ov002_021de910(void *, int, int);
extern int func_ov002_021ff46c(void *);
extern short func_ov002_0223de94(void *, int);
extern int func_ov002_0223df38(int, int, int);
extern int func_ov002_0225764c(void *, int, int);
extern int func_ov002_0226afb4(int, int, int);
extern int func_ov002_0227adb8(int, int, int);

int func_ov002_02224e14(struct Entity *e)
{
    int st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x80) {
        u32 a, b;
        short v;
        u8 *p;
        u32 bit;
        if (func_ov002_0223df38(0, 0, 0) == 0) return 0;
        v = func_ov002_0223de94(e, 0);
        a = v & 0xff;                       /* and r4,r0,#0xff */
        b = (v >> 8) & 0xff;                /* (short>>8)&0xff */
        if (func_ov002_0225764c(e, a, b) == 0) return 0;
        p = data_ov002_022cf16c + (a & 1) * STRIDE + b * 0x14;
        bit = (*(u32 *)(p + 0x30) << 0x12) >> 0x1f;   /* bit13 */
        *(u32 *)(data_ov002_022ce288 + 0x5ac) = bit;
        func_ov002_021de910(e, a, b);
        return 0x7f;
    }
    if (st == 0x7f) {                       /* .L_c0 */
        u32 sel = (e->f2 << 0x1f) >> 0x1f;
        u16 ne  = (sel != *(u32 *)(data_ov002_022ce288 + 0x5ac)) ? 1 : 0;
        u16 h   = e->f2;
        h = (h & ~0x4000u) | (((u32)ne << 0x1f) >> 0x11); /* set bit14 */
        e->f2 = h;                          /* strh store-order */
        if (func_ov002_021ff46c(e) == 0) {
            e->f2 = e->f2 & ~0x4000u;
            return 0;
        }
        e->f2 = e->f2 & ~0x4000u;
        /* tail truncated: reads [+0x5ac], e->f0 ... */
        return 0; /* placeholder */
    }
    if (st == 0x7e) return 0; /* .L_130 truncated */
    return 0;                 /* .L_16c */
}
