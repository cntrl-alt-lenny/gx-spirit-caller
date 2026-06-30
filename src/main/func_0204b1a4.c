/* CAMPAIGN-PREP candidate for func_0204b1a4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD-chain of call+cmp(-1) early-returns + nested re-call + tail
 *   risk:       the nested data_ff9ac re-call branch structure; -1 vs 0 sentinels
 *   confidence: high
 */
/* func_0204b1a4: sequential func_02068a20(self, key, flags) probes; each
 * -1 result early-returns 0. The 4th key (data_ff9ac) special-cases: if the
 * -1 probe misses, re-probe with flags 0 and return 0 on a 0 result. Final
 * probe value (data_ff980, flags 0) is the tail return. */

extern char data_020ff980[];
extern char data_020ff988[];
extern char data_020ff994[];
extern char data_020ff9a0[];
extern char data_020ff9ac[];
extern char data_020ff9b8[];
extern int func_02068a20(void *self, void *key, int flags);

int func_0204b1a4(void *self) {
    if (func_02068a20(self, data_020ff988, -1) == -1) return 0;
    if (func_02068a20(self, data_020ff994, -1) == -1) return 0;
    if (func_02068a20(self, data_020ff9a0, -1) == -1) return 0;
    if (func_02068a20(self, data_020ff9ac, -1) == -1) {
        if (func_02068a20(self, data_020ff9ac, 0) == 0) return 0;
    }
    if (func_02068a20(self, data_020ff9b8, -1) == -1) return 0;
    return func_02068a20(self, data_020ff980, 0);
}
