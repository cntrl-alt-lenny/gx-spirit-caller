/* CAMPAIGN-PREP candidate for func_02015190 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x8d8/0x8e0 :1 bitfield guards; 0x920 cmp-chain + state-1 0x924 jump-table; bcc>=[0x8dc]+3; bit1 gates reset; (x&~1)|1
 *   risk:       struct-guessed: asm TRUNCATED at .L_183c — state-2 arm and _LIT message consts reconstructed; verify vs full .s. Within case1 the func_02019034 cmp is unsigned (bcc) — keep operands so +3 ceiling matches; case-order must stay ascending for the jump-table.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02015190 (main, class D, MED tier) — prep batch p_0147.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/main/, run ninja + objdiff, then apply the risk note below.
 *   recipe: :1 bitfield guard (0x8d8 bit0) + 0x920 cmp-chain (1/2); state-1 0x924 addls jump-table;
 *           bcc on func_02019034 >= [0x8dc]+3; bit1 :1 bitfield test gates a 920/924 reset; (x&~1)|1.
 * NOTE: JSON asm TRUNCATED at .L_183c (state-2 body = `bl func_02019034` then cut). The state-2
 * arm and the literal pool are reconstructed in the sibling-family idiom — VERIFY against full .s.
 */
extern char *GetSystemWork(void);
extern int  func_02019034(void);
extern void func_020195ec(void);
extern int  func_02019664(void);
extern int  func_0201969c(void);
extern void func_0201abb0(int);
extern void func_0201abd4(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

struct Flag { unsigned int b0 : 1; unsigned int b1 : 1; };

void func_02015190(void *o) {
    char *w = GetSystemWork();
    if (((struct Flag *)(w + 0x8d8))->b0 == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        switch (*(int *)(w + 0x924)) {
        case 1:
            if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(w + 0x8dc) + 3))
                func_0201abb0(2);
            /* fallthrough */
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 2) return;
            func_0201abd4(2);
            *(int *)((char *)o + 8) = 0x000c0100;
            if (((struct Flag *)(w + 0x8e0))->b1 == 0) {
                *(int *)(w + 0x920) = 1;
                *(int *)(w + 0x924) = 4;
            }
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Flag *)(w + 0x8e0))->b0) return;
            if (func_02019664() == 0)
                *(int *)((char *)o + 8) = 0x000c0101;
            else
                *(int *)((char *)o + 8) = 0x000c0102;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x000c0103;
            func_0201b7b4();
            return;
        }
        return;
    case 2: /* reconstructed: tail truncated at `bl func_02019034` */
        func_02019034();
        func_020195ec();
        return;
    }
}
