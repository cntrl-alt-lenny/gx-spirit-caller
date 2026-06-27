/* CAMPAIGN-PREP candidate for func_021b718c (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     subs-flag reuse for if(t<0) cond store; signed /2; *0x97 literal mul; bind MMIO ptr; store-order
 *   risk:       reshape-able: orig reuses the `subs` flags (movmi/strmi) for the negative clamp; if mwcc emits a separate cmp, keep `t=A[6]-delta; A[6]=t; if(t<0)` adjacent (already done) so the sub sets the condition.
 *   confidence: med
 */
/* func_ov010_021b718c (ov010, class D): decrement a countdown A[0x18] by delta;
 * if it goes negative, clamp B[0xc] to 0 (the timer keeps its negative value).
 * Then compute q = func_020b3870(B[0xc]*0x97, B[0x8]) / 2 (signed), and write
 * two MMIO halfwords at 0x04001040 (const 0x4e4) and 0x04001044 (packed). If
 * B[0xc]==0 clear B[0x8] and return 1, else return 0. Store order preserved.
 *
 * A=021b9884, B=021b9890. *0x97 is a literal multiply (not magic-divide). The
 * 0x04001040 base is held across both stores -> bind one volatile pointer. */

extern int data_ov010_021b9884[];   /* A */
extern int data_ov010_021b9890[];   /* B */
extern int func_020b3870(int a, int b);

int func_ov010_021b718c(int delta) {
    volatile unsigned short *reg = (volatile unsigned short *)0x04001040;
    int t;
    int q;
    int lo, hi;

    t = data_ov010_021b9884[6] - delta;        /* A[0x18] */
    data_ov010_021b9884[6] = t;
    if (t < 0)
        data_ov010_021b9890[3] = 0;            /* B[0xc] */

    q = func_020b3870(data_ov010_021b9890[3] * 0x97,
                      data_ov010_021b9890[2]) / 2;   /* B[0x8] = B[2] */
    lo = (0x6f - q) << 8;
    hi = q + 0x6f;

    reg[0] = 0x4e4;                                   /* *0x04001040 */
    reg[2] = (unsigned short)((lo & 0xff00) | (hi & 0xff)); /* *0x04001044 */

    if (data_ov010_021b9890[3] == 0) {
        data_ov010_021b9890[2] = 0;
        return 1;
    }
    return 0;
}
