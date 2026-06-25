/* CAMPAIGN-PREP candidate for func_0221209c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested counted loop; eor global^j; guard-then-call; bind base reload field
 *   risk:       mwcc may hoist the d016c.fcec load out of the j-loop (orig reloads inside); if so add a barrier/volatile-shaped read
 *   confidence: med
 */
/* func_ov002_0221209c: nested loop j in [0,2), i in [0,10]; t = d016c.fcec ^ j;
 * guard func_0225764c(self,t,i) then func_021d63fc(self,t,i,1). Returns 0.
 *
 *   d016c base bound in r6 across both loops; [r6,#0xcec] reloaded per outer iter.
 */
extern char data_ov002_022d016c[];
extern int  func_ov002_0225764c(void *self, int a, int b);
extern void func_ov002_021d63fc(void *self, int a, int b, int c);

int func_ov002_0221209c(void *self) {
    int j, i, t;
    for (j = 0; j < 2; j++) {
        t = *(int *)(data_ov002_022d016c + 0xcec) ^ j;
        for (i = 0; i <= 10; i++) {
            if (func_ov002_0225764c(self, t, i)) {
                func_ov002_021d63fc(self, t, i, 1);
            }
        }
    }
    return 0;
}
