/* CAMPAIGN-PREP candidate for func_0209db88 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D aliasing: &param-as-array, count is in-place decremented counter
 *   risk:       permuter-class/struct-guessed: mwcc may not emit the {r0-r3} arg home-spill nor keep `count` in its stack slot; taking &param past arg0 is UB-shaped. Likely ships as .s.
 *   confidence: low
 */
/* func_0209db88: early-out via predicate, else search the caller's spilled
 * argument list (treated as an int[] via &arg0) for a u16 pulled from a
 * global-derived pointer. Returns 3 on no-match, 0 on match.
 * class D / aliasing: stmdb {r0-r3} is the arg home-area; &count is bic#3
 * aligned then walked as arr[1..count]. count (arr[0]) is the live decremented
 * loop counter, stored back to its stack slot each pass.
 */

extern void *data_021a8d2c;          /* -> struct; [+4] = a pointer whose [0] is u16 */
extern void func_020928cc(void *p, int n);
extern int  func_0209dc8c(void);

int func_0209db88(int count, int a, int b, int c) {
    int r = func_0209dc8c();
    if (r != 0) return r;
    {
        void **g = (void **)data_021a8d2c;
        func_020928cc(((void **)g)[1], 2);
    }
    {
        void **g = (void **)data_021a8d2c;
        unsigned short *src = (unsigned short *)((void **)g)[1];
        unsigned short key = *src;
        int *arr = &count;          /* arr[0]=count, arr[1..]=a,b,c */
        int i;
        if (count == 0) return 3;
        for (i = 1; count != 0; i++, count--) {
            if (arr[i] == (int)key) return 0;
        }
        return 3;
    }
}
