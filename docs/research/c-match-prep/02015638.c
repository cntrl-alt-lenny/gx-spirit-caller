/* CAMPAIGN-PREP candidate for func_02015638 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x8d8/0x8e0 :1 bitfield guards; 0x920==1 gate; 0x924 jump-table; signed blt AND-chain abb0/abd4 split; bit1 test; (x&~1)|1
 *   risk:       struct-guessed: asm TRUNCATED at .L_1cc4 — the load-done arm and _LIT consts reconstructed; verify vs full .s. The 4-term `blt` guard chain is signed-AND; keep as one if() so the short-circuit branches collapse, else the abb0/abd4 split diverges (reshape-able).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02015638 (main, class D, MED tier) — prep batch p_0147.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/main/, run ninja + objdiff, then apply the risk note below.
 *   recipe: :1 bitfield guard (0x8d8 bit0) + 0x920==1 gate + 0x924 addls jump-table; long signed
 *           guard-AND chain (blt) → func_0201abb0/0201abd4 split; bit1 :1 bitfield test; (x&~1)|1.
 * NOTE: JSON asm TRUNCATED at .L_1cc4 (after `bne .L_1d10`). The .L_1cc4 load-done arm and the
 * literal pool are reconstructed in the sibling-family idiom — VERIFY against the full .s.
 */
extern char *GetSystemWork(void);
extern void func_0200a26c(int);
extern int  func_020139c4(void);
extern int  func_020190ec(void);
extern int  func_020191cc(void);
extern int  func_020195b8(int, int);
extern int  func_020195ec(void);
extern int  func_02019640(int);
extern int  func_02019664(void);
extern int  func_0201969c(void);
extern void func_0201abb0(int);
extern void func_0201abd4(int);
extern void func_0201b7b4(void);

struct Flag { unsigned int b0 : 1; unsigned int b1 : 1; };

void func_02015638(void *o) {
    char *w = GetSystemWork();
    if (((struct Flag *)(w + 0x8d8))->b0 == 0) return;
    if (*(int *)(w + 0x920) != 1) return;
    switch (*(int *)(w + 0x924)) {
    case 1:
        *(int *)(w + 0x924) = 4;
        /* fallthrough */
    case 4:
        if (func_020191cc() >= 0xb &&
            func_020195b8(0xf, 0) >= 1 &&
            func_020190ec() != 0 &&
            func_020139c4() >= 5) {
            func_0201abb0(7);
            if (((struct Flag *)(w + 0x8e0))->b1 == 0)
                func_0200a26c(8);
        } else {
            func_0201abd4(7);
        }
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 7) return;
        *(int *)((char *)o + 8) = 0x000f0100;
        *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
        return;
    case 3:
        if (((struct Flag *)(w + 0x8e0))->b0) return;
        if (func_020195ec() != 0) {
            *(int *)((char *)o + 8) = 0x000f0102;
            return;
        }
        *(int *)((char *)o + 8) = 0x000f0101;
        func_0201b7b4();
        return;
    case 2:
        *(int *)((char *)o + 8) = 0x000f0103;
        func_02019640(0);
        return;
    }
}
