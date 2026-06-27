/* CAMPAIGN-PREP candidate for func_02053b38 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     binary search; lo(r6)/hi(r5) decl-order; mid=(lo+hi)>>1 signed asr; mla mid*stride+base (operand mid-first); blx fn-ptr; leftmost on equal
 *   risk:       loop register allocation (lo/hi/mid live across the blx through a stack-passed fn ptr) is the classic reg-rotation wall. `mla r0,r4,r9,sl` = mid*stride+base operand order must hold. permuter-class (loop reg-alloc + caller-saved coin-flip around blx)
 *   confidence: low
 */
/* func_02053b38: binary search over base[mid*stride], comparator via fn ptr.
 * r0=key, r1=base, r2=count, r3=stride, arg5=cmp, arg6=found(out).
 * Returns &base[lo*stride]; *found=1 if an equal element was seen.
 * On cmp==0 it narrows left (hi=mid-1) -> leftmost insertion point.
 */

void *func_02053b38(void *key, char *base, int count, int stride,
                    int (*cmp)(void *elem, void *key), int *found) {
    int lo;
    int hi;
    int mid;
    int r;

    *found = 0;
    lo = 0;
    hi = count - 1;
    if (hi >= 0) {
        do {
            mid = (lo + hi) >> 1;
            r = cmp(base + mid * stride, key);
            if (r == 0)
                *found = 1;
            if (r < 0)
                lo = mid + 1;
            else
                hi = mid - 1;
        } while (lo <= hi);
    }
    return base + lo * stride;
}
