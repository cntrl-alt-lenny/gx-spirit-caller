/* CAMPAIGN-PREP candidate for func_0204b130 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD-chain of call+cmp(-1) early-returns + nested re-call + tail
 *   risk:       the nested data_ff9ac re-call branch structure; -1 vs 0 sentinels
 *   confidence: high
 */
/* func_0204b130: sequential func_020689ac(self, key, flags) probes; each
 * -1 result early-returns 0. The 4th key (data_ff9ac) special-cases: if the
 * -1 probe misses, re-probe with flags 0 and return 0 on a 0 result. Final
 * probe value (data_ff980, flags 0) is the tail return. */

extern char data_020ff8a0[];
extern char data_020ff8a8[];
extern char data_020ff8b4[];
extern char data_020ff8c0[];
extern char data_020ff8cc[];
extern char data_020ff8d8[];
extern int func_020689ac(void *self, void *key, int flags);

int func_0204b130(void *self) {
    if (func_020689ac(self, data_020ff8a8, -1) == -1) return 0;
    if (func_020689ac(self, data_020ff8b4, -1) == -1) return 0;
    if (func_020689ac(self, data_020ff8c0, -1) == -1) return 0;
    if (func_020689ac(self, data_020ff8cc, -1) == -1) {
        if (func_020689ac(self, data_020ff8cc, 0) == 0) return 0;
    }
    if (func_020689ac(self, data_020ff8d8, -1) == -1) return 0;
    return func_020689ac(self, data_020ff8a0, 0);
}
