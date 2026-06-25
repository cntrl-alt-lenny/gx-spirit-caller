/* CAMPAIGN-PREP candidate for func_0201ac1c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard early-return + linear-search loop, movne index return
 *   risk:       Loop-vs-tail register placement of i (r4) may flip; bge-to-shared-exit scheduling could reorder.
 *   confidence: high
 */
/* func_0201ac1c: linear search returning index or 0.
 *   r4 = n; GetSystemWork() (discarded);
 *   if (n >= 8) return 0;
 *   for (i = n; i < 8; i++) if (func_0201abfc(i)) return i;
 *   return 0;
 */

extern char *GetSystemWork(void);
extern int func_0201abfc(int i);

int func_0201ac1c(int n) {
    int i;
    GetSystemWork();
    if (n >= 8) {
        return 0;
    }
    for (i = n; i < 8; i++) {
        if (func_0201abfc(i) != 0) {
            return i;
        }
    }
    return 0;
}
