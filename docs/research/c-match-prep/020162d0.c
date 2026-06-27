/* CAMPAIGN-PREP candidate for func_020162d0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 guard + nested w[0x924] jump-table; ldreq/ldrne pair for !=0 if/else o[8]; SECOND GetSystemWork (w2) not CSE'd
 *   risk:       permuter-class: bit0 `and #1` wall + whether mwcc re-emits the 2 inner GetSystemWork calls vs CSE-ing into r4 base (reshape-able: forced fresh `w2` locals as written); inner-table case numbering
 *   confidence: low
 */
/* func_020162d0 (main, class D, MED) — GetSystemWork dispatcher.
 * w[0x8d8]:bit0 guard; w[0x920]: 1 -> w[0x924] jump-table (0..4, case0=return);
 * 2 -> teardown handler. Note TWO extra GetSystemWork() calls (cases 0/3 of the
 * inner table) that must NOT be CSE'd with the r4 base. Modeled on
 * src/main/func_020162d0.s. */
extern char *GetSystemWork(void);
extern int  func_020139b4(void);
extern int  func_020195ec(void);
extern int  func_0201969c(void);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

void func_020162d0(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f)) return;
    if (*(int *)(w + 0x920) == 1) {
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
            /* fallthrough */
        case 4:
            if (func_0201969c() != 1) return;
            if (func_020139b4() != 2) return;
            *(int *)((char *)o + 8) = 0x00190100;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            {
                char *w2 = GetSystemWork();
                *(int *)(w2 + 0x8f8) |= 0x1000;
            }
            return;
        case 3:
            if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
            if (func_020195ec() == 0)
                *(int *)((char *)o + 8) = 0x00190101;
            else
                *(int *)((char *)o + 8) = 0x00190102;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x00190103;
            {
                char *w2 = GetSystemWork();
                *(int *)(w2 + 0x8f8) &= ~0x1000;
            }
            return;
        }
        return;
    }
    if (*(int *)(w + 0x920) == 2) {
        if (func_0201b7e0(o) != 4) return;
        *(int *)((char *)o + 8) = 0x00190104;
        *(int *)(w + 0x900) &= ~0x1000000;
        func_0201b7b4();
    }
}
