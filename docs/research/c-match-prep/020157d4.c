/* CAMPAIGN-PREP candidate for func_020157d4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x8d8/0x8e0 :1 bitfield guards; 0x920 cmp-chain + state-3 0x924 jump-table(cmp#5); ldreq/streq o[8]; bit1 gates 0x924--; (x&~1)|1
 *   risk:       struct-guessed: asm TRUNCATED in .L_1e50 — the bit1-predicated 0x924-- tail and _LIT consts reconstructed; verify vs full .s. case-5 jump-table is cmp #5 (six entries); ldreq/streq stores must stay predicated (movge-style if), not branch.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020157d4 (main, class D, MED tier) — prep batch p_0147.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/main/, run ninja + objdiff, then apply the risk note below.
 *   recipe: :1 bitfield guard (0x8d8 bit0) + 0x920 cmp-chain (1/2/3); state-3 0x924 addls jump-table
 *           (cmp #5, 0..5; case0 sets 924=5 falls into case5); ldreq/streq predicated o[8] stores;
 *           bit1 :1 bitfield test gates streq 0x924-- ; (x&~1)|1 for bic;orr; orr #0x1000000 RMW.
 * NOTE: JSON asm TRUNCATED in .L_1e50 (after `ldreq r0,[r4,#0x924]`). The .L_1e50 tail (the bit1
 * predicated 0x924--) and literal pool are reconstructed in-idiom — VERIFY against the full .s.
 */
extern char *GetSystemWork(void);
extern int  func_020139c4(void);
extern void func_02018a38(int);
extern void func_02018a64(void);
extern int  func_020190ec(void);
extern void func_020195ec(void);
extern int  func_02019640(int);
extern int  func_0201969c(void);
extern void func_0201b7b4(void);

struct Flag { unsigned int b0 : 1; unsigned int b1 : 1; };

void func_020157d4(void *o) {
    char *w = GetSystemWork();
    if (((struct Flag *)(w + 0x8d8))->b0 == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_020190ec() == 0) return;
        if (func_020139c4() == 5)
            *(int *)((char *)o + 8) = 0x00100100;
        return;
    case 2:
        *(int *)((char *)o + 8) = 0x00100101;
        func_02018a38(0x13);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 3:
        switch (*(int *)(w + 0x924)) {
        case 0:
            *(int *)(w + 0x924) = 5;
            /* fallthrough */
        case 5:
            if (func_0201969c() == 0xf)
                *(int *)((char *)o + 8) = 0x00100102;
            return;
        case 3:
            *(int *)((char *)o + 8) = 0x00100103;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 2:
            if (((struct Flag *)(w + 0x8e0))->b0) return;
            if (func_02019640(0) != 0) {
                *(int *)((char *)o + 8) = 0x00100105;
                return;
            }
            *(int *)((char *)o + 8) = 0x00100104;
            if (((struct Flag *)(w + 0x8e0))->b1 == 0)
                *(int *)(w + 0x924) = *(int *)(w + 0x924) - 1;
            func_0201b7b4();
            return;
        }
        return;
    }
}
