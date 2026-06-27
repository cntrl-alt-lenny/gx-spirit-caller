/* CAMPAIGN-PREP candidate for func_0221a858 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 gate; addls-pc jump-table on (state-0x7d); 0226b0f0(player,id,a,b) per case; case 0x7d loop reconstructed
 *   risk:       permuter-class + ASM-TRUNCATED: the 0x7d case body is cut off in the batch (only the loop header is given) so that arm is a STUB. The 10-callee-saved + sp-spilled self/loop-var = a confirmed reg-alloc wall (function already ships .s). Needs the full .s; escape-to-.s expected.
 *   confidence: low
 */
typedef unsigned short u16;

struct Self0221a858 {
    u16 id;                 /* +0 */
    u16 b0 : 1; u16 : 15;   /* +2 */
    u16 : 2; u16 b2 : 1;    /* +4 bit2 */
};

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern int  func_0202b830(int a);
extern void func_ov002_021ae430(int player, int v);
extern void func_ov002_0226b0f0(int player, int id, int a, int b);

int func_ov002_0221a858(struct Self0221a858 *self) {
    int state;
    if (self->b2) return 0;
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    switch (state) {
    case 0x7d: {
        /* ASM TRUNCATED past the loop header (only .L_dc/.L_f0/.L_110 prologue
         * is in the batch). Reconstructed best-effort: iterate n=d0e6c+0xb2,
         * carry a stack flag (str r6,[sp,#4]); the per-iter body is unknown. */
        int n = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        int flag = 0;
        int i;
        for (i = 0; i < n; i++) {
            int sel;
            if (flag) sel = self->b0; else sel = 1 - self->b0;
            (void)sel;
        }
        return 0x7d;
    }
    case 0x7e: {
        int r = func_0202b830(*(u16 *)(data_ov002_022d0e6c + 0xb2));
        func_ov002_021ae430(self->b0, r);
        return 0x7d;
    }
    case 0x7f:
        func_ov002_0226b0f0(1 - self->b0, self->id, 1,
                            *(u16 *)(data_ov002_022d0e6c + 0xb0));
        return 0x7e;
    case 0x80:
        func_ov002_0226b0f0(self->b0, self->id, 2, 0xff);
        return 0x7f;
    }
    return 0;
}
