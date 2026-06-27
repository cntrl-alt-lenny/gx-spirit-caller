/* CAMPAIGN-PREP candidate for func_0222483c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sub-then-switch for addls jump-table; rsb as 1-(bit0); operand-order accumulator-first
 *   risk:       reshape-able: asm body truncated after .L_534, so cases 1/2-tail are stubbed; also the guard '!=0 || call' short-circuit order vs mwcc's bne/beq may need branch-swap.
 *   confidence: low
 */
/* func_ov002_0222483c : jump-table dispatch + and-mul table index (class D) */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Entity { u16 f0; u16 f2; };

extern u8  data_ov002_022ce288[]; /* state obj; state byte @ +0x5a8 */
extern u8  data_ov002_022cf178[]; /* table base, stride 0x868 (LIT2) */
extern u8  data_ov002_022d0e6c[]; /* mode var @ +0xb0 */
#define STRIDE 0x868              /* LIT1 */

extern int func_ov002_021ae430(int, int);
extern int func_ov002_021bbf50(void);
extern int func_ov002_021de4b0(int, int, int);
extern int func_ov002_021f4260(u16, u16);
extern int func_ov002_0226af38(int, int, int);
extern int func_ov002_0226b034(int, int, int);
extern int func_ov002_0226b094(int, int);

int func_ov002_0222483c(struct Entity *e)
{
    u32 st = *(u32 *)(data_ov002_022ce288 + 0x5a8) - 0x7d;
    switch (st) {                          /* 0..3 jump table */
    case 0: {                              /* .L_468 */
        u32 sel = 1 - ((e->f2 << 0x1f) >> 0x1f);
        if (*(u32 *)(data_ov002_022cf178 + (sel & 1) * STRIDE) != 0
            || func_ov002_021bbf50()) {
            func_ov002_0226b094(1 - ((e->f2 << 0x1f) >> 0x1f), e->f0);
            return 0x7f;
        }
        return 0;
    }
    case 3: {                              /* .L_4c8 */
        int r = func_ov002_021f4260(e->f0, *(u16 *)(data_ov002_022d0e6c + 0xb0));
        func_ov002_021ae430(1 - ((e->f2 << 0x1f) >> 0x1f), r);
        return 0x7e;
    }
    case 2: {                              /* .L_4f4 */
        u16 m = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        if (m == 0) {                      /* .L_510 */
            func_ov002_0226af38(1 - ((e->f2 << 0x1f) >> 0x1f), 1, 1);
            return 0;
        } else if (m == 1) {               /* .L_534 (truncated body) */
            func_ov002_0226b034(1 - ((e->f2 << 0x1f) >> 0x1f), e->f0, 0);
            return 0;
        }
        return 0;                          /* .L_550 */
    }
    case 1:                                /* .L_558 (truncated) */
    default:                               /* .L_578 */
        return 0;
    }
}
