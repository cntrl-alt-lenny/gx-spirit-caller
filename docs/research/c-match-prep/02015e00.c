/* CAMPAIGN-PREP candidate for func_02015e00 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 guard + w[0x920] if-chain then w[0x924] jump-table; signed `<5` blt with mov #5 hoisted; bic|orr set
 *   risk:       permuter-class: bit-guards `and #1` wall + the `mov r0,#5` hoisted ABOVE the blt branch (cmp result feeds both branches) is scheduling-fragile; reshape-able part is the signed func_020139c4()<5 polarity
 *   confidence: low
 */
/* func_02015e00 (main, class D, MED) — GetSystemWork state machine.
 * w[0x8d8]:bit0 guard; w[0x920]: 1 -> substate dispatch, 2 -> set o[8]=0x160200.
 * Substate = w[0x924] (0..4 jump table, case0 = return). Modeled on
 * src/main/func_02015e00.s (already shipped .s). bit reads kept as shift form. */
extern char *GetSystemWork(void);
extern void func_0200a26c(int);
extern int  func_020139c4(void);
extern int  func_02019034(void);
extern int  func_020195ec(void);
extern int  func_02019664(void);
extern int  func_0201969c(void);
extern void func_0201abb0(int);
extern void func_0201abd4(int);
extern void func_0201b7b4(void);

void func_02015e00(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f)) return;
    if (*(int *)(w + 0x920) != 1) {
        if (*(int *)(w + 0x920) == 2)
            *(int *)((char *)o + 8) = 0x00160200;
        return;
    }
    switch (*(int *)(w + 0x924)) {
    case 1:
        *(int *)(w + 0x924) = 4;
        /* fallthrough */
    case 4:
        if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(w + 0x8dc) + 2)) {
            if (func_020139c4() < 5)
                func_0201abd4(5);
            else
                func_0201abb0(5);
            if (!((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f))
                func_0200a26c(9);
        }
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 5) return;
        *(int *)((char *)o + 8) = 0x00160100;
        *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
        return;
    case 2:
        if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
        if (func_020195ec() != 0) {
            *(int *)((char *)o + 8) = 0x00160102;
            return;
        }
        *(int *)((char *)o + 8) = 0x00160104;
        if (!((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f))
            *(int *)(w + 0x924) = *(int *)(w + 0x924) - 1;
        func_0201b7b4();
        func_0201abd4(5);
        return;
    case 3:
        *(int *)((char *)o + 8) = 0x00160103;
        if (!((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f)) {
            *(int *)(w + 0x920) = 1;
            *(int *)(w + 0x924) = 5;
        }
        return;
    }
}
