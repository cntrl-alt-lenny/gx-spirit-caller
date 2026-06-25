/* CAMPAIGN-PREP candidate for func_02079b0c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     high-to-low unsigned compare returning 1/-1/0
 *   risk:       the two separate cmp/movhi then cmp/mvncc sequences may fold into one cmp with both cond-moves; loop index direction may reorder
 *   confidence: med
 */
/* func_02079b0c: compare two little-endian u16 limb arrays from the most
 * significant limb (index len-1) down to 0. Returns +1 if a>b, -1 if a<b,
 * 0 if equal. Comparison is unsigned (movhi / mvncc).
 *
 *   for (i = len-1; i >= 0; i--) {
 *       if (a[i] > b[i]) return 1;
 *       if (a[i] < b[i]) return -1;
 *   }
 *   return 0;
 */

int func_02079b0c(const unsigned short *a, const unsigned short *b, int len) {
    int i;
    for (i = len - 1; i >= 0; i--) {
        if (a[i] > b[i]) {
            return 1;
        }
        if (a[i] < b[i]) {
            return -1;
        }
    }
    return 0;
}
