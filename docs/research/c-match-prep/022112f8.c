/* CAMPAIGN-PREP candidate for func_022112f8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls jump-table switch; parity index :6^:1; cases return const codes
 *   risk:       jump-table layout: matching addls pc,pc,r1,lsl#2 requires mwcc to emit the SAME dense table after sub#0x78 -- case ordering/holes must reproduce the b .L_734 padding. permuter-class / struct-guessed (asm truncated at .L_714; tails inferred).
 *   confidence: low
 */
/* func_ov002_022112f8 (ov002, cls D): switch on *(022ce288+0x5a8) (a phase var)
 * with cases 0x64(==)->.L724, and 0x78..0x80 via addls jump-table after sub#0x78.
 * r4 = parity (off2 :6 bit5 ^ :1 bit0) computed up-front. Each case calls a
 * different handler and returns a small constant code (0x78/0x7e/0x7d/0x64).
 * The jump table order (b .L_714,734,734,734,734,734,6fc,6dc,734,67c) maps
 * index 0->714,6->6fc,7->6dc,9->67c. Switch-body order follows source case order.
 * LIT0=022ce288, LIT1=data_022cf17c, LIT2=0x?(=_LIT2 word). NOTE asm truncated
 * after .L_714 -- .L724/.L734 tails reconstructed by intent. */
extern int   data_ov002_022ce288[];
extern int   data_ov002_022cf17c[];
extern int  func_ov002_021ae400(int a, int b);
extern int  func_ov002_021af9d0(int a, int b, int c, int d);
extern int  func_ov002_021afb74(void);
extern int  func_ov002_021d8288(int a, int b);
extern int  func_ov002_021e286c(void);
extern int  func_ov002_0223f6c4(void);
extern int  func_ov002_0225368c(int a, int b, int c);
extern int  func_ov002_0226b054(int a);
int func_ov002_022112f8(unsigned short *self) {
    unsigned short h = self[1];           /* off2 */
    int r4 = ((h << 0x1f) >> 0x1f) ^ ((h << 0x11) >> 0x1f);
    int phase = data_ov002_022ce288[0x5a8 / 4];
    switch (phase) {
    case 0x78: {                          /* .L_714 */
        func_ov002_0226b054(1 - r4);
        return 0x64;
    }
    case 0x7e: {                          /* .L_6fc */
        int t = func_ov002_021afb74();
        func_ov002_021d8288(r4, t);
        return 0x64;
    }
    case 0x7f: {                          /* .L_6dc */
        int t = func_ov002_0223f6c4();
        func_ov002_021af9d0(r4, 6, self[0], t);
        return 0x7d;
    }
    case 0x81: {                          /* .L_67c */
        int t = func_ov002_0223f6c4();
        if (((int *)data_ov002_022cf17c)[r4 & 1] == 0)
            return 0;
        if (func_ov002_0225368c(r4, self[0], t) != 0) {
            func_ov002_021ae400(r4, 0x33);
            return 0x7e;
        }
        func_ov002_021ae400(r4, 0x15);
        return 0x78;
    }
    case 0x64:                            /* .L_724 (truncated) */
    default:                              /* .L_734 (truncated) */
        return 0;
    }
}
