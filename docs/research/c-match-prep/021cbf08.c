/* CAMPAIGN-PREP candidate for func_021cbf08 (ov003, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: reload g[3] inside inner loop (asm re-ldrs); two if-blocks (not merged); off counts down.
 *   risk:       permuter-class: inner loop register allocation (ip/r7/r8/lr juggling, two strh with col<<1 index) is scheduling/reg-rotation sensitive; decl-order helps but a coin-flip on temp regs likely remains.
 *   confidence: low
 */
/* func_ov003_021cbf08: nested tile-fill into two engine buffers. b=_e220(), a=_e200().
 * If g->f_c==0 call _36590(0x8f00000,0x20). g->f_c += (g->f_c<0x40)?1:0.
 * Outer r over 0x17..0 (rsb row=0x17-r). Inner col 0..0x20: v=(g->f_c>>1)-row;
 * if 0<v<=8: buf_b[col] = (0xa-v)|0x2800; buf_a[col] = (0xa-v)|0x2000.
 * buf_b base = b + ((0x2e0 - r*0x20)<<1); buf_a base = a + ((row<<5)<<1).
 * If g->f_c<0x40 return 0; else _94504(0,b,0x800); _94504(0,a,0x800); g->f_c=0; return 1. */
extern void func_02036590(int, int);
extern int func_0208e200(void);
extern int func_0208e220(void);
extern void func_02094504(int, int, int);

int func_ov003_021cbf08(int *g) {
    int b = func_0208e220();
    int a = func_0208e200();
    int r;
    int off;
    if (g[3] == 0) {
        func_02036590(0x8f00000, 0x20);
    }
    g[3] = g[3] + ((g[3] < 0x40) ? 1 : 0);
    off = 0x2e0;
    for (r = 0x17; r >= 0; r--) {
        int row = 0x17 - r;
        int col;
        short *pb = (short *)(b + (off << 1));
        short *pa = (short *)(a + ((row << 5) << 1));
        for (col = 0; col < 0x20; col++) {
            int v = (g[3] >> 1) - row;
            if (v > 0 && v <= 8) {
                pb[col] = (short)((0xa - v) | 0x2800);
            }
            if (v > 0 && v <= 8) {
                pa[col] = (short)((0xa - v) | 0x2000);
            }
        }
        off -= 0x20;
    }
    if (g[3] < 0x40) return 0;
    func_02094504(0, b, 0x800);
    func_02094504(0, a, 0x800);
    g[3] = 0;
    return 1;
}
