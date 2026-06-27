/* CAMPAIGN-PREP candidate for func_02015494 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x8d8 :1 bitfield guard; 0x920 jump-table(0..4) + state-3 nested 0x924 jump-table; unsigned ldmcc; orr #0x1000000; (x&~1)|1
 *   risk:       struct-guessed: asm TRUNCATED inside .L_1b1c — state-3 case2/3, state-4 arm and _LIT consts reconstructed; verify vs full .s. Two stacked addls jump-tables (0x920 then 0x924) may flip layout under mwcc (permuter-class fallback to .s).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02015494 (main, class D, MED tier) — prep batch p_0147.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/main/, run ninja + objdiff, then apply the risk note below.
 *   recipe: :1 bitfield guard (0x8d8 bit0) + 0x920 addls jump-table (0..4); state-2 nested 0x924
 *           addls jump-table; unsigned ldmcc early-returns; orr #0x1000000 RMW; (x&~1)|1; o[8] stores.
 * NOTE: JSON asm TRUNCATED inside .L_1b1c (state-2 case after the `orr r0,r0,#0x1` of the 0x8e0 RMW).
 * The remaining 0x924 arms and literal pool are reconstructed in-idiom — VERIFY against full .s.
 */
extern char *GetSystemWork(void);
extern int  func_020139b4(void);
extern int  func_020139c4(void);
extern void func_02018a38(int);
extern void func_02018a64(void);
extern int  func_02019034(void);
extern int  func_020190ec(void);
extern void func_020195ec(void);
extern int  func_02019664(void);
extern void func_0201b708(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

struct Flag { unsigned int b0 : 1; };

void func_02015494(void *o) {
    char *w = GetSystemWork();
    if (((struct Flag *)(w + 0x8d8))->b0 == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
        *(int *)((char *)o + 8) = 0x000e0100;
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 2:
        if (func_020139b4() != 2) return;
        if (func_0201b7e0(o) != 4) return;
        *(int *)((char *)o + 8) = 0x000e0101;
        func_0201b708(4);
        func_02018a38(0x13);
        return;
    case 3:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
            /* fallthrough */
        case 4:
            if (func_02019664() != 0x69) return;
            *(int *)((char *)o + 8) = 0x000e0102;
            func_02018a64();
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3: /* reconstructed */
            if (((struct Flag *)(w + 0x8e0))->b0) return;
            func_020195ec();
            return;
        case 2: /* reconstructed */
            *(int *)((char *)o + 8) = 0x000e0103;
            func_0201b7b4();
            return;
        }
        return;
    case 4: /* reconstructed: state-4 = .L_1b90 */
        func_02019034();
        return;
    }
}
