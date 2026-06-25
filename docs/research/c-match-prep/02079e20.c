/* CAMPAIGN-PREP candidate for func_02079e20 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     trailing-zero scan from top, return last-nonzero count
 *   risk:       the pre-loop `b` into the test (do-nothing-first) shape may differ from a plain while; index temp may reorder
 *   confidence: high
 */
/* func_02079e20: shrink `len` while the top limb (arr[len-1]) is zero;
 * return the resulting length (index past the most-significant non-zero
 * u16, i.e. the normalized limb count).
 *
 *   while (len != 0 && arr[len-1] == 0) len--;
 *   return len;
 */

int func_02079e20(const unsigned short *arr, int len) {
    while (len != 0 && arr[len - 1] == 0) {
        len--;
    }
    return len;
}
