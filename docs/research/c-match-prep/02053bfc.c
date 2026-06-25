/* CAMPAIGN-PREP candidate for func_02053bfc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     decrementing for-loop calling helper; signed >=0 exit
 *   risk:       reg-alloc-walled per .s header: r4/r5 counter-vs-self assignment may rotate; loop epilogue dup may differ
 *   confidence: low
 */
/* func_02053bfc: count then iterate downward calling a helper.
 *   n = func_02054140(self);
 *   for (i = n - 1; i >= 0; i--) func_02053e58(self, i);
 * subs r4,r0,#1 / addmi+ldmmiia = early-exit when n-1 < 0; bpl loop.
 * r5 holds self, r4 holds i across the loop.
 * (Flagged reg-alloc-walled in ship-as-.s; best-effort reshape.) */

extern int  func_02054140(void *self);
extern void func_02053e58(void *self, int i);

void func_02053bfc(void *self) {
    int i;
    for (i = func_02054140(self) - 1; i >= 0; i--) {
        func_02053e58(self, i);
    }
}
