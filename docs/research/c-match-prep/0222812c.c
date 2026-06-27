/* CAMPAIGN-PREP candidate for func_0222812c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     contiguous switch 0x78..0x80 -> addls pc,pc jump table; per-arm bit0 reload; const returns
 *   risk:       struct-guessed AND incomplete: batch asm TRUNCATED at .L_100 (and .L_124/.L_140/.L_158/.L_11c arms missing); switch won't reproduce the full table until the rest of the .s is pulled
 *   confidence: low
 */
/* func_ov002_0222812c: cls D. self at r0. Scene-state dispatch on
 * *(int*)(ce288+0x5a8): k>0x64 uses a jump table over k=0x78..0x80
 * (addls pc,pc,k<<2); k==0x64 -> .L_140; else -> .L_158. player=self->bit0.
 * WARNING: batch asm TRUNCATED at line 90 (the .L_100 arm, plus .L_124/.L_140/
 * .L_158/.L_11c arms, and the literal pool, are NOT shown). This TU encodes the
 * fully-visible arms (0x80,0x7e,0x7d) and a partial 0x7d/.L_100; pull the full
 * .s before building. The jump-table arms are written as a contiguous switch so
 * mwcc emits the addls pc,pc table. */
typedef unsigned short u16;

struct Self {
    u16 f0;            /* +0x0 */
    u16 b0 : 1;        /* +0x2 bit0 */
};

extern char data_ov002_022ce288[];   /* +0x5a8 scene state */
extern void func_ov002_021ae400(int player, int kind);
extern void func_ov002_021af9d0(int player, int a, int b, int c);
extern int  func_ov002_021afb74(void);
extern int  func_ov002_021afba0(void);
extern void func_ov002_021d8288(int player, int a);
extern void func_ov002_021d7d0c(int a, int b, int c);
extern int  func_ov002_0225368c(int player, int a, int b);
extern int  func_ov002_0226b054(int a);

int func_ov002_0222812c(struct Self *self) {
    int k = *(int *)(data_ov002_022ce288 + 0x5a8);
    int player = self->b0 & 1;
    switch (k) {
    case 0x80: /* .L_54 */
        if (func_ov002_0225368c(player, self->f0, 0) == 0) {
            func_ov002_021ae400(self->b0 & 1, 0x15);
            return 0x78;
        }
        func_ov002_021ae400(self->b0 & 1, 0x37);
        return 0x7e;
    case 0x7e: /* .L_a8 */
        func_ov002_021af9d0(self->b0 & 1, 6, self->f0, 0);
        return 0x7d;
    case 0x7d: { /* .L_cc */
        int r = func_ov002_021afba0();
        if (r == 0xd) {            /* .L_e4 */
            func_ov002_021d8288(self->b0 & 1, func_ov002_021afb74());
        } else if (r == 0xe) {     /* .L_100 (TRUNCATED in batch) */
            func_ov002_021afb74();
            /* TRUNCATED: arm continues (mov r0,r4 ...) */
        }
        /* .L_11c (not shown) */
        return 0; /* placeholder; real return is in the truncated tail */
    }
    default:
        /* k==0x78 -> .L_124, k==0x64 -> .L_140, others -> .L_158: NOT shown */
        return 0;
    }
}
