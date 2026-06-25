/* CAMPAIGN-PREP candidate for func_02079c74 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     NOT-each-u16 loop then tail call func_02079cc0(p,p,1)
 *   risk:       ble-vs-blt guard form (`r1<=0` skip) and index temp reg may flip; tail-call arg setup (r1=p, r2=1) should match
 *   confidence: med
 */
/* func_02079c74: bitwise-complement each u16 of an array of `len` limbs,
 * then tail-call func_02079cc0(arr, arr, 1).
 *
 *   for (i = 0; i < len; i++) arr[i] = ~arr[i];
 *   return func_02079cc0(arr, arr, 1);
 *
 * The loop guard is `if (len > 0)` (ble skip), index counts up to len.
 */

extern int func_02079cc0(unsigned short *dst, unsigned short *src, int n);

int func_02079c74(unsigned short *arr, int len) {
    int i;
    for (i = 0; i < len; i++) {
        arr[i] = ~arr[i];
    }
    return func_02079cc0(arr, arr, 1);
}
