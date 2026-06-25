/* CAMPAIGN-PREP candidate for func_0202b6e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted scan/insert loop, early-return guards, single call
 *   risk:       loop reg-alloc (id in r4, idx in r5) may shift; cmp operand order target-first preserved
 *   confidence: med
 */
/* func_0202b6e4: scan id in [0xfa6, 0x1b80); when func_0202b6cc(id)==target
 * append id to out[] (capacity count). Early -1 if count==0 or overflow.
 * Tail: if room left, null-terminate out[idx]=0. Returns idx. */

extern int func_0202b6cc(int id);

int func_0202b6e4(int target, int *out, int count) {
    int idx = 0;
    int id;
    if (count == 0) return -1;
    for (id = 0xfa6; id < 0x1b80; id++) {
        if (target == func_0202b6cc(id)) {
            if (idx == count) return -1;
            out[idx++] = id;
        }
    }
    if (idx < count) out[idx] = 0;
    return idx;
}
