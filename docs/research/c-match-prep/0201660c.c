/* CAMPAIGN-PREP candidate for func_0201660c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Outer w[0x920] jump-table (no bit0 guard) with nested w[0x924] table in case4; unsigned bound returns; bic|orr set
 *   risk:       permuter-class: inner bit0 `and #1` wall (case3) + double jump-table register/scheduling; reshape-able: both case-0=return numbering and unsigned +1 bound polarity. Two tables raise reg-alloc coin-flip odds
 *   confidence: low
 */
/* func_0201660c (main, class D, MED) — GetSystemWork state machine.
 * w[0x8d8] is NOT guarded here; w[0x920] (0..4 jump table, case0=return) selects
 * the handler; case 4 contains a NESTED w[0x924] jump-table (0..4, case0=return).
 * o[8] message words 0x1b0100..0x1b0403. Modeled on src/main/func_0201660c.s. */
extern char *GetSystemWork(void);
extern int  func_020139c4(void);
extern int  func_02019034(void);
extern int  func_020190ec(void);
extern int  func_020195ec(void);
extern int  func_02019664(void);
extern void func_0201aabc(int);
extern void func_0201aaf4(int);
extern void func_0201b708(int);
extern void func_0201b730(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

void func_0201660c(void *o) {
    char *w = GetSystemWork();
    switch (*(int *)(w + 0x920)) {
    case 1:
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        *(int *)((char *)o + 8) = 0x001b0100;
        func_0201aabc(0x78);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 2:
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x78) return;
        *(int *)((char *)o + 8) = 0x001b0200;
        func_0201aaf4(0x78);
        func_0201b708(0xa);
        return;
    case 3:
        if (func_02019664() != 0x6f) return;
        *(int *)((char *)o + 8) = 0x001b0300;
        func_0201b7b4();
        *(int *)(w + 0x900) &= ~0x1000000;
        return;
    case 4:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
            /* fallthrough */
        case 4:
            if (func_02019664() != 0x6f) return;
            if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
            *(int *)((char *)o + 8) = 0x001b0400;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
            if (func_020195ec() == 0)
                *(int *)((char *)o + 8) = 0x001b0401;
            else
                *(int *)((char *)o + 8) = 0x001b0402;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x001b0403;
            func_0201b730(0xa);
            return;
        }
        return;
    }
}
