/* CAMPAIGN-PREP candidate for func_021ab4f4 (ov018, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: emit each ldrh/bic/orr/strh halfword pair in asm sequence; bind both MMIO bank bases; mvn for -1 compare
 *   risk:       _LIT1 base (g) held in r4 across whole fn then reused at .L_100; if mwcc reloads it the tail ldr diverges (reshape-able: bind to one local). Struct offsets 0x50/0x54/0xc guessed (struct-guessed).
 *   confidence: med
 */
/* ov018 021ab4f4 — class D: MMIO bic/orr store-order block (store-order recipe) */

extern unsigned char data_ov018_021ad860[];
extern unsigned char data_ov018_021ad8a8[];
extern int func_020373cc(int a, int b, int c, int d);
extern int func_020379f8(int a);
extern int func_02037b34(void);
extern int func_0208c884(int a, int b);
extern int func_0208c940(void);
extern int func_020b3870(int a);

struct GfxState {
    /* fields probed from _LIT1 base (r4) at +0x8 / +0xc */
    int pad0[2];      /* 0x0, 0x4 */
    int field8;       /* 0x8 */
    int fieldC;       /* 0xc */
};

struct Sched {
    int pad0[20];     /* up to 0x50 */
    int field50;      /* 0x50 */
    int field54;      /* 0x54 */
};

extern struct Sched data_LIT0;   /* _LIT0 */
extern struct GfxState data_LIT1; /* _LIT1 (held in r4 across, used at .L_100) */
extern volatile unsigned short data_LIT2[]; /* _LIT2 second halfword bank */
extern volatile unsigned int data_LIT3;     /* _LIT3 */

int func_ov018_021ab4f4(void) {
    struct Sched *s = &data_LIT0;
    struct GfxState *g = &data_LIT1;
    int r5;

    if (s->field54 == s->field50) {
        volatile unsigned int *regA;
        volatile unsigned int *regB;
        volatile unsigned short *bankA;
        volatile unsigned short *bankB;

        if (func_02037b34() == -1) {
            func_020379f8(0);
            func_020373cc(0x30, 1, 0, -1);
        }

        regA = (volatile unsigned int *)0x4000000;
        regB = (volatile unsigned int *)0x4001000;
        *regA = (*regA & ~0x1f00) | 0x800;
        *regB = (*regB & ~0x1f00) | 0x800;

        bankA = (volatile unsigned short *)0x4000000;
        bankA[4] = (bankA[4] & ~0x3);
        bankA[5] = (bankA[5] & ~0x3) | 0x1;
        bankA[6] = (bankA[6] & ~0x3) | 0x2;
        bankA[7] = (bankA[7] & ~0x3) | 0x3;

        bankB = data_LIT2;
        bankB[0] = (bankB[0] & ~0x3);
        bankB[1] = (bankB[1] & ~0x3) | 0x1;
        bankB[2] = (bankB[2] & ~0x3) | 0x2;
        bankB[3] = (bankB[3] & ~0x3) | 0x3;

        func_0208c940();
        data_LIT3 = data_LIT3 | 0x10000;
    }

    {
        int v = g->fieldC - 0x1000;
        g->fieldC = v;
        if (v < 0) { v = 0; g->fieldC = 0; }
        r5 = func_020b3870(-(g->fieldC << 4));
    }
    return r5;
}
