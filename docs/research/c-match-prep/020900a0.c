/* CAMPAIGN-PREP candidate for func_020900a0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind 2 globals; handle!=-1 guard -> 6-arg call (2 stack zeros) vs Copy32; hoisted base+off add
 *   risk:       data_021a6340 base bound (held in reg, matches); two [sp]/[sp,#4] zeros from a single shared 0; ip reg-alloc may flip
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020900a0 (main, class B) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: bind two globals, handle!=-1 guard -> 6-arg call (2 stack zeros) vs Copy32; base+a precompute
 */
/* func_020900a0: precompute dst = data_021a6340 + off, load the handle
 * once; valid handle -> func_02093e38 with two trailing zero stack args,
 * else Copy32. The base add is hoisted before the branch (free add). */

extern void Copy32(void *dst, void *src, int n);
extern void func_02093e38(int handle, void *src, void *dst, int n, int e, int f);
extern int data_0210249c;
extern int data_021a6340;

void func_020900a0(void *src, int off, int n) {
    int handle = data_0210249c;
    char *dst = (char *)data_021a6340 + off;
    if (handle != -1)
        func_02093e38(handle, src, dst, n, 0, 0);
    else
        Copy32(src, dst, n);
}
