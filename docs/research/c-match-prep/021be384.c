/* CAMPAIGN-PREP candidate for func_021be384 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shared idx=(p&1)*0x868 + row=arg1*20; field aliases; k-dispatch; bit6 test; tail call
 *   risk:       orig holds r1=parity-mul and r2=arg1*20 across all field reads (cf1a4/cf1a2/cf1ac all [r2,base+r1]); if mwcc recomputes the muls per access, several mul/add diverge. reshape-able via the shared idx/row locals (declared first). field offsets struct-guessed.
 *   confidence: med
 */
/* func_ov002_021be384: precondition validator. Needs 021b9ecc!=0, the +0x38
 * u16 of slot[arg0&1][arg1] set, and the +0x36 u16 set; then dispatch on the
 * 021b9ecc result (0x12b4 / 0x1956) checking the +0x40 bit6, an extra
 * 021bbf50(1-arg0) gate; finally 021bdde0 must be clear and tail 021be4a0. */

extern unsigned short  data_ov002_022cf1a2[];
extern unsigned short  data_ov002_022cf1a4[];
extern unsigned int    data_ov002_022cf1ac[];
extern int  func_ov002_021b9ecc(int a, int b);
extern int  func_ov002_021bbf50(int a);
extern int  func_ov002_021bdde0(int a, int b);
extern int  func_ov002_021be4a0(int a, int b, int c);

int func_ov002_021be384(int arg0, int arg1, int arg2) {
    int idx = (arg0 & 1) * 0x868;
    int row = arg1 * 20;
    int k = func_ov002_021b9ecc(arg0, arg1);
    if (k == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + row + idx) == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a2 + row + idx) != 0) {
        if (k == 0x12b4) {
            if ((*(unsigned int *)((char *)data_ov002_022cf1ac + row + idx) >> 6) & 1)
                return 0;
        } else if (k == 0x1956) {
            if ((*(unsigned int *)((char *)data_ov002_022cf1ac + row + idx) >> 6) & 1)
                return 0;
            if (func_ov002_021bbf50(1 - arg0) != 0)
                return 0;
        } else {
            return 0;
        }
    }
    if (func_ov002_021bdde0(arg0, arg1) != 0)
        return 0;
    return func_ov002_021be4a0(arg0, arg1, arg2);
}
