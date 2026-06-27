/* CAMPAIGN-PREP candidate for func_020111e4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Q20.12 (a*b)>>12 via long-long smull; dst-aliases-src->stack-temp guard; unrolled concat
 *   risk:       struct-guessed + permuter-class: ASM IS TRUNCATED (~half body) so term layout past out[3] is guessed; smull-reg-pairing/accumulation scheduling is a coin-flip. Needs full .s; likely hand-.s escape
 *   confidence: low
 */
/* func_020111e4 @ 0x020111e4 (main, class D, size 964)
 * Fixed-point matrix concat (Q20.12). Each output element accumulates terms of
 * the form  (a*b) >> 12  computed from a 64-bit smull then recombined as
 * (lo >> 12) | (hi << 20). A leading alias check selects a stack scratch buffer
 * for the destination when dst == a or dst == b, copying out at the end.
 *
 *   r0 = a (src1), r1 = b (src2), r2 = dst.
 *
 * NOTE: the provided asm is TRUNCATED (~half the body). The element/term
 * layout below is the NitroSDK-style 3x3 concat reconstructed from the visible
 * terms: out is filled column-dot-row with a accessed column-major (stride 3)
 * and b row-major. The full term set past out[3] is NOT in the asm, so the tail
 * rows are extrapolated from the established pattern and MUST be re-derived from
 * the complete .s before trusting byte output.
 *
 * Per-element fixed-point multiply helper expressed inline so mwcc emits
 * smull; mov lo,lsr#12; orr lo,lo,hi,lsl#20 (the (lo>>12)|(hi<<20) idiom):
 *   q = (int)(((long long)x * (long long)y) >> 12);
 */

typedef struct { int m[9]; } Mtx33;

void func_020111e4(const Mtx33 *a, const Mtx33 *b, Mtx33 *dst)
{
    Mtx33  tmp;
    Mtx33 *o;
    const int *A;
    const int *B;

    /* alias guard: addeq ip,sp,#0 / movne ip,dst */
    if (dst == (const Mtx33 *)a || dst == (const Mtx33 *)b) {
        o = &tmp;
    } else {
        o = dst;
    }

    A = a->m;
    B = b->m;

    o->m[0] = (int)(((long long)A[0] * B[0]) >> 12)
            + (int)(((long long)A[3] * B[4]) >> 12)
            + (int)(((long long)A[6] * B[8]) >> 12);
    o->m[1] = (int)(((long long)A[1] * B[0]) >> 12)
            + (int)(((long long)A[4] * B[4]) >> 12)
            + (int)(((long long)A[7] * B[8]) >> 12);
    o->m[2] = (int)(((long long)A[2] * B[0]) >> 12)
            + (int)(((long long)A[5] * B[4]) >> 12)
            + (int)(((long long)A[8] * B[8]) >> 12);
    o->m[3] = (int)(((long long)A[6] * B[5]) >> 12)
            + (int)(((long long)A[0] * B[3]) >> 12)
            + (int)(((long long)A[3] * B[4]) >> 12);
    o->m[4] = (int)(((long long)A[7] * B[5]) >> 12)
            + (int)(((long long)A[1] * B[3]) >> 12)
            + (int)(((long long)A[4] * B[4]) >> 12);
    o->m[5] = (int)(((long long)A[8] * B[5]) >> 12)
            + (int)(((long long)A[2] * B[3]) >> 12)
            + (int)(((long long)A[5] * B[4]) >> 12);
    o->m[6] = (int)(((long long)A[6] * B[8]) >> 12)
            + (int)(((long long)A[0] * B[6]) >> 12)
            + (int)(((long long)A[3] * B[7]) >> 12);
    o->m[7] = (int)(((long long)A[7] * B[8]) >> 12)
            + (int)(((long long)A[1] * B[6]) >> 12)
            + (int)(((long long)A[4] * B[7]) >> 12);
    o->m[8] = (int)(((long long)A[8] * B[8]) >> 12)
            + (int)(((long long)A[2] * B[6]) >> 12)
            + (int)(((long long)A[5] * B[7]) >> 12);

    if (o == &tmp) {
        *dst = tmp;
    }
}
