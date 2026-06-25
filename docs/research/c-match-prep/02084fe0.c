/* CAMPAIGN-PREP candidate for func_02084fe0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD predicated-returns + tail call + reload-global
 *   risk:       Final store reloads data_021a4820 (separate ref kept) — must not bind p there; p+4 / n<<2 arg order assumed.
 *   confidence: med
 */
/* func_02084fe0: conditional init, then guarded DMA-ish call on a queue, then clear ptr.
 * data_021a4824 gate -> func_02084fc8; data_021a4820 holds a struct ptr with count at [0]. */
extern int data_021a4824;
extern int *data_021a4820;
extern void func_02084fc8(void);
extern void func_020944ec(void *dst, int src, int len);

void func_02084fe0(void) {
    if (data_021a4824 != 0)
        func_02084fc8();
    {
        int *p = data_021a4820;
        int n;
        if (p == 0)
            return;
        n = p[0];
        if (n == 0)
            return;
        func_020944ec((char *)p + 4, 0x04000400, n << 2);
        data_021a4820[0] = 0;
    }
}
