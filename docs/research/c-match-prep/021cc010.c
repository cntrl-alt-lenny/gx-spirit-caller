/* CAMPAIGN-PREP candidate for func_021cc010 (ov003, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: tile value (v+2) here (not 0xa-v); compute base pa before pb; tail if(>=0x40) for strge/movge.
 *   risk:       permuter-class: same inner-loop reg-rotation hazard as 021cbf08 (sl/r7/r8/lr/ip); the >=0x40 tail must fold to strge/movge — if mwcc emits a branch instead, that is reshape-able via the early if.
 *   confidence: low
 */
/* func_ov003_021cc010: clone-sibling of 021cbf08 with different reg-alloc AND tile value.
 * b=_e220()->r4, a=_e200()->r0. g->f_c += (g->f_c<0x40)?1:0.
 * Outer r 0x17..0 (row=0x17-r). Inner col 0..0x20: v=(g->f_c>>1)-row;
 * if 0<v<=8: buf_a[col]=(v+2)|0x2800; buf_b[col]=(v+2)|0x2000.
 * buf_a base = a4 + ((row<<5)<<1); buf_b base = r0 + ((0x2e0-r*0x20)<<1).
 * Tail uses strge/movge: if g->f_c>=0x40 { g->f_c=0; return 1 } else return 0. */
extern int func_0208e200(void);
extern int func_0208e220(void);

int func_ov003_021cc010(int *g) {
    int a4 = func_0208e220();
    int r0 = func_0208e200();
    int r;
    int off;
    g[3] = g[3] + ((g[3] < 0x40) ? 1 : 0);
    off = 0x2e0;
    for (r = 0x17; r >= 0; r--) {
        int row = 0x17 - r;
        int col;
        short *pa = (short *)(a4 + ((row << 5) << 1));
        short *pb = (short *)(r0 + (off << 1));
        for (col = 0; col < 0x20; col++) {
            int v = (g[3] >> 1) - row;
            if (v > 0 && v <= 8) {
                pa[col] = (short)((v + 2) | 0x2800);
            }
            if (v > 0 && v <= 8) {
                pb[col] = (short)((v + 2) | 0x2000);
            }
        }
        off -= 0x20;
    }
    if (g[3] >= 0x40) {
        g[3] = 0;
        return 1;
    }
    return 0;
}
