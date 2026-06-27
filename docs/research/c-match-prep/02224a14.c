/* CAMPAIGN-PREP candidate for func_02224a14 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain mirrors cmp order (0x80,0x7f,...); rsb as 1-bit0; bit13 via signed shift-pair
 *   risk:       reshape-able: asm truncated after .L_108; the cmp ladder ordering (bgt/bge tree) may compile differently from a flat if-chain -> may need nested if to recreate the bgt .L_44/bge .L_ac split.
 *   confidence: low
 */
/* func_ov002_02224a14 : nested cmp dispatch + and-mul index (class D) */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Entity { u16 f0; u16 f2; };

extern u8  data_ov002_022ce288[]; /* state @ +0x5a8 */
extern u8  data_ov002_022cf178[]; /* table base, stride 0x868 (LIT1) */
extern u8  data_ov002_022d0e6c[]; /* mode var @ +0xb0 */
#define STRIDE 0x868

extern int func_ov002_021ae400(int, int);
extern int func_ov002_021c3bdc(void);
extern u8 *func_ov002_021c93f0(int, int, int);
extern int func_ov002_021d71e0(int, int, int);
extern int func_ov002_021e27c0(int, int);
extern int func_ov002_021e286c(int);
extern int func_ov002_0226af94(int, int, int);

int func_ov002_02224a14(struct Entity *e)
{
    int st = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (st == 0x80) {                                /* .L_44 */
        u32 sel = 1 - ((e->f2 << 0x1f) >> 0x1f);
        if (*(u32 *)(data_ov002_022cf178 + (sel & 1) * STRIDE) == 0) return 0;
        if (func_ov002_021c3bdc() == 0) return 0x64;
        func_ov002_0226af94(1 - ((e->f2 << 0x1f) >> 0x1f), e->f0, 1);
        return 0x7f;
    }
    if (st == 0x7f) {                                /* .L_ac */
        u16 m = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        u8 *p = func_ov002_021c93f0(1 - ((e->f2 << 0x1f) >> 0x1f), 0xb, m);
        u32 word = *(u32 *)p;
        int bit = (word << 0x12) >> 0x1f;            /* bit13 */
        func_ov002_021d71e0(1 - ((e->f2 << 0x1f) >> 0x1f), m, 1);
        func_ov002_021e286c(bit);
        return 0;
    }
    if (st == 0x64) {                                /* .L_108 */
        func_ov002_021e27c0(1 - ((e->f2 << 0x1f) >> 0x1f), 1);
        return 0;                                    /* truncated */
    }
    if (st == 0x63) return 0; /* .L_128 truncated */
    if (st == 0x62) return 0; /* .L_144 truncated */
    return 0;                 /* .L_164 default */
}
