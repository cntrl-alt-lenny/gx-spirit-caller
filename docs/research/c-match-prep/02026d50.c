/* CAMPAIGN-PREP candidate for func_02026d50 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: base=obj+0x94; idx=(s8)arg1 held; +0x16 :1 tests; signed dispatch; tst mask&1/&4 conditional clear; final guarded clear
 *   risk:       permuter-class: idx (signed char) must stay callee-saved across 3+ calls; the addge/ldrge vs ldrlt signed-index dispatch and the predicated tst-ldrne-ldrne-cmpne chains are coin-flip on which reg survives. The +0x16 byte is re-read at the tail (don't bind across calls). struct-guessed: +0x10/+0x14/+0x80/+0x88/+0x98 offsets inferred.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02026d50 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D: base=obj+0x94; idx=(signed char)arg1 held; flags byte +0x16 :1 tests; signed-index dispatch ldr +4/+0/+0x98; tst arg2 &1/&4 conditional clear; final guarded clear.
 */
extern int  func_0202162c(void);
extern int  func_02021660(int a, int b);
extern void func_0200af08(void);
extern void func_0200afc8(void);
extern void func_02006e1c(void);

int func_02026d50(int obj, int sel, int mask) {
    char *base = (char *)obj + 0x94;               /* add r4, r0, #0x94 */
    unsigned char flags = *(unsigned char *)(base + 0x16);  /* ldrb [r4,#0x16] */
    int idx = (signed char)sel;                    /* lsl24/asr24 sign-extend */
    int r;

    if (flags & 1) {                               /* lsl31/lsr31 bit0 */
        int h;
        func_0202162c();
        h = *(short *)(base + 0x14);                /* ldrsh [r4,#0x14] */
        r = func_02021660(h, 3);                   /* r1=#3 */
        r = *(int *)((char *)r + idx * 4 + 0x98);  /* add r0,idx<<2; ldr [+0x98] */
    } else {
        if (idx >= 0)                              /* cmp #0; addge */
            r = *(int *)(base + idx * 4 + 0x4);    /* ldrge [+0x4] */
        else
            r = *(int *)base;                      /* ldrlt [r4] */
    }

    if (r == 0)                                    /* cmp #0; moveq r0,#1; early ret */
        return 1;

    if ((mask & 1) && *(int *)(*(int *)(base + 0x10) + 0x80) != 0) {  /* tst #1 */
        func_0200af08();
        *(int *)(*(int *)(base + 0x10) + 0x80) = 0;
    }
    if ((mask & 4) && *(int *)(*(int *)(base + 0x10) + 0x88) != 0) {  /* tst #4 */
        func_0200afc8();
        *(int *)(*(int *)(base + 0x10) + 0x88) = 0;
    }

    flags = *(unsigned char *)(base + 0x16);       /* re-read byte */
    if ((flags & 1) == 0 && idx >= 0) {            /* bne skip; cmp #0; blt */
        int *slot = (int *)(base + idx * 4 + 0x4);
        if (*slot != 0) {                          /* cmp #0; beq */
            func_02006e1c();
            *slot = 0;                             /* str #0 */
        }
    }
    return 1;
}
