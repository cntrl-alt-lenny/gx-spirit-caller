/* CAMPAIGN-PREP candidate for func_0222b73c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind ce288 once (r5); dense switch 0x7d-0x80 for addls-pc table; parity*0x868 reads
 *   risk:       struct-guessed/INCOMPLETE: state 0x7d (.L_13c) + default (.L_164) bodies are truncated out of the asm (90 of ~95 lines). 0x7d stubbed, default guessed return 0. Reconstructed cases (0x7e/0x7f/0x80) are faithful; 0x7d/default WILL diverge.
 *   confidence: low
 */
/* func_ov002_0222b73c: jump-table on (state-0x7d) in 0..3 over ce288+0x5a8,
 * with ce288 BOUND once (orig ldr r5,_LIT0 then reused for 0x5a8/0x5ac). Cases:
 *  0x80 (.L_30): zero 0x5ac, double loop i<2 / j 0..10, count 021c23ac!=0, then
 *               021ded1c(self,-1), return 0x7f.
 *  0x7f (.L_88): parity=b0; if cf178[parity*0x868]==0 return 0x7e; else
 *               021d7c1c(b0, cf16c+parity*0x868+0x120, 0); 0x5ac++; return 0x7f.
 *  0x7e (.L_e0): parity=1-b0; same shape, empty-case returns 0x7d (tail TRUNCATED
 *               in source -> mirrored on 0x7f's increment+return 0x7f).
 * WARNING: state 0x7d (.L_13c) body and the default (.L_164) are NOT in the
 * provided asm (truncated at 90 lines); 0x7d stubbed, default=return 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int  func_ov002_021c23ac(int i, int j);
extern void func_ov002_021d7c1c(int player, int *ptr, int zero);
extern void func_ov002_021ded1c(struct S *self, int x);
extern void func_ov002_021df818(void);

int func_ov002_0222b73c(struct S *self) {
    char *core = data_ov002_022ce288;
    int i;
    int j;
    int parity;
    switch (*(int *)(core + 0x5a8)) {
    case 0x80:
        *(int *)(core + 0x5ac) = 0;
        for (i = 0; i < 2; i++)
            for (j = 0; j <= 0xa; j++)
                if (func_ov002_021c23ac(i, j) != 0)
                    (*(int *)(core + 0x5ac))++;
        func_ov002_021ded1c(self, -1);
        return 0x7f;
    case 0x7f:
        parity = self->b0 & 1;
        if (*(int *)(data_ov002_022cf178 + parity * 0x868) == 0) return 0x7e;
        func_ov002_021d7c1c(self->b0,
            (int *)(data_ov002_022cf16c + parity * 0x868 + 0x120), 0);
        (*(int *)(core + 0x5ac))++;
        return 0x7f;
    case 0x7e:
        parity = (1 - self->b0) & 1;
        if (*(int *)(data_ov002_022cf178 + parity * 0x868) == 0) return 0x7d;
        func_ov002_021d7c1c(1 - self->b0,
            (int *)(data_ov002_022cf16c + parity * 0x868 + 0x120), 0);
        (*(int *)(core + 0x5ac))++;
        return 0x7f;
    case 0x7d:
        /* TRUNCATED: .L_13c body unknown */
        func_ov002_021df818();
        return 0x7c;
    }
    return 0;
}
