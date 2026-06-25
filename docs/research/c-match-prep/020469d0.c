/* CAMPAIGN-PREP candidate for func_020469d0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-ptr null guard, 1<<key bit-test (field-first ands), tail call
 *   risk:       g bound once (r2) then reloaded as +0x644 base; field & (1<<key) needs field as first ands operand; data_0219daec typed void* (struct ptr); 0x644 offset.
 *   confidence: high
 */
/* func_020469d0: guard on global ptr data_0219daec; then on bit `key`
 * of the bitmask at g+0x644; if set, tail-call func_02046718(key).
 */
extern void *data_0219daec;
extern int func_02046718(int key);

int func_020469d0(int key)
{
    void *g = data_0219daec;
    if (g == 0) return 0;
    if ((*(int *)((char *)g + 0x644) & (1 << key)) == 0) return 0;
    return func_02046718(key);
}
