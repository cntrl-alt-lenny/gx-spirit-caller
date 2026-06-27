/* CAMPAIGN-PREP candidate for func_02084e0c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: reload pool each use (no bind); count+1+n guard; n<<2; post-inc copy
 *   risk:       reshape-able/permuter: the asm reloads data_021a4820 three times (never binds across blx) and uses `ldr r1,[r2],#4` post-inc for `&pool[1+pool[0]]`; if mwcc binds the base or skips post-inc the ldr stream diverges. Reload-style is the lever.
 *   confidence: low
 */
/* func_02084e0c: command-queue push. data_021a4820 = pointer to an int pool
 * whose [0] is a live count; entries follow. Fast path (pool && enabled &&
 * count+1+n <= 0xc0): bump count, store cmd at pool[count+1], then if n!=0
 * copy n words via func_02094550 and add n to pool[0]. Slow/overflow paths
 * flush via func_02084fe0/func_02084fc8 then submit through func_020944ec
 * with MMIO 0x04000400 latched to cmd. */

extern int  *data_021a4820;
extern int   data_021a4824;
extern void  func_02084fc8(void);
extern void  func_02084fe0(void);
extern void  func_020944ec(int a, int *b, int n);
extern void  func_02094550(int a, int *b, int n);

void func_02084e0c(int cmd, int *src, int n)
{
    int *pool = data_021a4820;

    if (pool != 0) {
        if (data_021a4824 != 0) {
            int count = pool[0];
            if (count + 1 + n <= 0xc0) {
                pool[0] = count + 1;
                data_021a4820[count + 1] = cmd;
                if (n == 0)
                    return;
                func_02094550(src, data_021a4820 + 1 + data_021a4820[0],
                              n << 2);
                data_021a4820[0] += n;
                return;
            }
        }
        if (pool[0] != 0)
            func_02084fe0();
        else if (data_021a4824 != 0)
            func_02084fc8();
    } else if (data_021a4824 != 0) {
        func_02084fc8();
    }

    *(int **)0x04000400 = (int *)cmd;
    func_020944ec(src, 0, n << 2);
}
