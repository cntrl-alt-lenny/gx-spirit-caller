/* CAMPAIGN-PREP candidate for func_020169d0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Outer w[0x920] (cmp#6) jump-table, nested w[0x924] table in case5; case1 uses ldrcs/strcs cond store (>= bound); bic|orr
 *   risk:       permuter-class: inner bit0 `and #1` wall + two jump tables. Reshape-able: case1 `>= bound` must stay strcs (write as if(cmp>=)store), and the two case-0=return numberings on cmp#6/cmp#4
 *   confidence: low
 */
/* func_020169d0 (main, class D, MED) — GetSystemWork dispatcher.
 * w[0x8d8] NOT guarded; w[0x920] (0..6 jump table, case0=return) selects handler;
 * case 4 has a NESTED w[0x924] jump-table (0..4, case0=return); case 6 is a tail
 * call. o[8] words 0x1d0100..0x1d0600. Modeled on src/main/func_020169d0.s. */
extern char *GetSystemWork(void);
extern int  func_020139b4(void);
extern int  func_020139c4(void);
extern int  func_02019034(void);
extern int  func_020190ec(void);
extern int  func_020195ec(void);
extern int  func_02019664(void);
extern void func_0201aabc(int);
extern void func_0201b7b4(void);

void func_020169d0(void *o) {
    char *w = GetSystemWork();
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(w + 0x8dc) + 1))
            *(int *)((char *)o + 8) = 0x001d0100;
        return;
    case 2:
        if (func_02019664() != 0x6a) return;
        if (func_020139b4() != 2) return;
        *(int *)((char *)o + 8) = 0x001d0200;
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 3:
        *(int *)((char *)o + 8) = 0x001d0300;
        return;
    case 4:
        *(int *)((char *)o + 8) = 0x001d0400;
        return;
    case 5:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
            /* fallthrough */
        case 4:
            *(int *)((char *)o + 8) = 0x001d0500;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
            if (func_020195ec() == 0)
                *(int *)((char *)o + 8) = 0x001d0501;
            else
                *(int *)((char *)o + 8) = 0x001d0502;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x001d0503;
            *(int *)(w + 0x900) &= ~0x1000000;
            func_0201b7b4();
            return;
        }
        return;
    case 6:
        *(int *)((char *)o + 8) = 0x001d0600;
        func_0201aabc(0x7a);
        return;
    }
}
