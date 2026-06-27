/* CAMPAIGN-PREP candidate for func_02079bbc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: na/nb decl order = call order; n=max if-assign; combined while-cond (i<n || borrow); borrow=asr#16 (signed t>>16)
 *   risk:       Merged loop condition (`i<n` else `i<len&&borrow`) is split in asm as cmp ip,r4 / cmp ip,r5 / cmp r3,#0; mwcc may invert branch sense or duplicate the body header. permuter-class.
 *   confidence: low
 */
/* func_02079bbc — full big-integer subtract a-b with borrow over u16
 * limbs. Normalize both operand lengths (func_02079e20 trims trailing
 * zero limbs), iterate to max(la,lb)(+1 if < len), propagate borrow,
 * then zero-fill the remaining destination limbs.
 */

extern int func_02079e20(unsigned short *a, int len);
extern void func_020945f4(void *dst, int val, int nbytes);

void func_02079bbc(unsigned short *dst, unsigned short *a,
                   unsigned short *b, int len) {
    int na = func_02079e20(a, len);
    int nb = func_02079e20(b, len);
    int n;
    int borrow = 0;
    int i = 0;

    n = na;
    if (n < nb) n = nb;
    if (n != len) n++;

    while (i < n || (i < len && borrow != 0)) {
        int t = a[i] - b[i];
        i++;
        t = borrow + t;
        dst[i - 1] = (unsigned short)t;
        borrow = t >> 16;
    }
    if (dst == a) return;
    if (dst == b) return;
    func_020945f4(dst + i, 0, (len - i) << 1);
}
