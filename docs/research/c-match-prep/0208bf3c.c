/* CAMPAIGN-PREP candidate for func_0208bf3c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     early-return guard + MMIO/global stores + tail call
 *   risk:       stack frame (sub sp,#4 with bare lr) may not regen; store order of the two globals could schedule differently
 *   confidence: low
 */
/* func_0208bf3c: early-return guard, then set MMIO flag + two struct
 * fields, then tail-call func_0208be70.
 *
 *     cmp r0,#0; <=0 -> return 0;
 *     *(u16*)0x040002b0 = 1;
 *     ((int*)0x040002b8)[0] = 0;
 *     ((int*)0x040002b8)[1] = r0;
 *     return func_0208be70();
 */

extern int func_0208be70(void);

struct ctrl_040002b8 {
    int enabled;   /* +0x0 */
    int value;     /* +0x4 */
};

int func_0208bf3c(int a) {
    if (a <= 0) {
        return 0;
    }
    *(volatile unsigned short *)0x040002b0 = 1;
    ((struct ctrl_040002b8 *)0x040002b8)->enabled = 0;
    ((struct ctrl_040002b8 *)0x040002b8)->value = a;
    return func_0208be70();
}
