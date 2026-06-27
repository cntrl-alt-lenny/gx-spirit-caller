/* CAMPAIGN-PREP candidate for func_020152ec (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x8d8/0x8e0 :1 bitfield guards; 0x920 cmp-chain + state-1 0x924 jump-table; bit1 gates streq 0x924--; (x&~1)|1
 *   risk:       struct-guessed: asm TRUNCATED inside .L_1978 — that arm, the state-2 arm and _LIT consts are reconstructed; verify vs full .s. The bit1==0 predicated `0x924--` (ldreq/subeq/streq) must stay an if-guarded single decrement, not a branch.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020152ec (main, class D, MED tier) — prep batch p_0147.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/main/, run ninja + objdiff, then apply the risk note below.
 *   recipe: :1 bitfield guard (0x8d8 bit0) + 0x920 cmp-chain (1/2); state-1 0x924 addls jump-table;
 *           bit1 :1 bitfield test gates a streq 0x924-- ; (x&~1)|1 for bic;orr; o[8] message stores.
 * NOTE: JSON asm TRUNCATED inside .L_1978 (state-2 case after `mov r0,#0x5`). The .L_1978 body and
 * literal pool are reconstructed in the sibling-family idiom — VERIFY against the full .s.
 */
extern char *GetSystemWork(void);
extern int  func_02019034(void);
extern void func_020190c0(void);
extern void func_020190ec(void);
extern int  func_020195ec(void);
extern int  func_02019640(int);
extern int  func_02019664(void);
extern int  func_0201969c(void);
extern void func_0201abd4(int);
extern void func_0201b7b4(void);

struct Flag { unsigned int b0 : 1; unsigned int b1 : 1; };

void func_020152ec(void *o) {
    char *w = GetSystemWork();
    if (((struct Flag *)(w + 0x8d8))->b0 == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
            /* fallthrough */
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 1) return;
            *(int *)((char *)o + 8) = 0x000d0100;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Flag *)(w + 0x8e0))->b0) return;
            if (func_020195ec() != 0) {
                *(int *)((char *)o + 8) = 0x000d0102;
                return;
            }
            *(int *)((char *)o + 8) = 0x000d0101;
            if (((struct Flag *)(w + 0x8e0))->b1 == 0)
                *(int *)(w + 0x924) = *(int *)(w + 0x924) - 1;
            func_0201b7b4();
            func_0201abd4(1);
            return;
        case 2: /* .L_1978, reconstructed: tail truncated after mov r0,#0x5 */
            *(int *)((char *)o + 8) = 0x000d0103;
            if (((struct Flag *)(w + 0x8e0))->b1 == 0) {
                *(int *)(w + 0x920) = 1;
                *(int *)(w + 0x924) = 5;
            }
            return;
        }
        return;
    case 2: /* reconstructed */
        func_02019034();
        return;
    }
}
