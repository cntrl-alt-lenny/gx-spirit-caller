/* CAMPAIGN-PREP candidate for func_02015974 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     GetSystemWork bit0 guard + w[0x924] jump-table (case0=return); bic|orr field set, bit1 conditional dec
 *   risk:       permuter-class: (x<<31)>>31 bit-guards peephole to `and #1` (020186b0 wall, same as 02016b60 which shipped .s); also case-0=bare-return numbering must hold cmp #5
 *   confidence: low
 */
/* func_02015974 (main, class D, MED) — GetSystemWork state machine.
 * w[0x8d8]:bit0 enable guard; require w[0x920]==1; dispatch on w[0x924] (0..5
 * jump table, case0 = bare return). o[8] = action-id message word.
 * Modeled byte-for-byte on src/main/func_02015974.s (already shipped .s).
 * NOTE: bit0/bit1 reads use the (x<<31)>>31 / (x<<30)>>31 shift form on
 * purpose; mwcc 2.0 peepholes these to `and` (the 020186b0 wall). */
extern char *GetSystemWork(void);
extern int  func_020139b4(void);
extern int  func_02019034(void);
extern int  func_020195ec(void);
extern void func_02019640(int);
extern int  func_02019664(void);
extern int  func_0201969c(void);
extern void func_0201abb0(int);
extern void func_0201abd4(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

void func_02015974(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f)) return;
    if (*(int *)(w + 0x920) != 1) return;
    switch (*(int *)(w + 0x924)) {
    case 1:
        *(int *)(w + 0x924) = 5;
        /* fallthrough */
    case 5:
        if (func_0201b7e0(o) != 4) return;
        if (func_020139b4() != 2) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 2)) return;
        *(int *)((char *)o + 8) = 0x00140100;
        func_0201abb0(5);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 2:
        *(int *)((char *)o + 8) = 0x00140103;
        if (!((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f)) {
            *(int *)(w + 0x920) = 1;
            *(int *)(w + 0x924) = 5;
        }
        if (((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f)) return;
        func_02019640(0);
        return;
    case 3:
        if (((*(unsigned int *)(w + 0x8e0) << 0x1f) >> 0x1f)) return;
        if (func_020195ec() != 0) {
            *(int *)((char *)o + 8) = 0x00140102;
            return;
        }
        *(int *)((char *)o + 8) = 0x00140104;
        if (!((*(unsigned int *)(w + 0x8e0) << 0x1e) >> 0x1f))
            *(int *)(w + 0x924) = *(int *)(w + 0x924) - 1;
        func_0201b7b4();
        func_0201abd4(5);
        *(int *)(w + 0x900) &= ~0x1000000;
        return;
    case 4:
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 5) return;
        *(int *)((char *)o + 8) = 0x00140101;
        *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
        return;
    }
}
