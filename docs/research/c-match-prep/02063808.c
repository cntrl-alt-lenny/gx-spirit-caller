/* CAMPAIGN-PREP candidate for func_02063808 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     selector branch, nested-call arg threading, bool-normalize tail
 *   risk:       non-eq path passes raw (p,b,c) intact; func_020644a4 2nd arg 0; reg-alloc r4=p
 *   confidence: med
 */
/* func_02063808: if (c == 2) return func_0206429c(p, func_020644a4(b, 0)) ?1:0;
 * else return func_020643d8(p, b, c) ? 1 : 0.
 * On the non-equal path r0..r2 still hold p,b,c (only mov r4,r0 ran). */

extern int func_020643d8(void *p, int b, int c);
extern int func_020644a4(int b, int z);
extern int func_0206429c(void *p, int t);

int func_02063808(void *p, int b, int c) {
    if (c == 2) {
        int t = func_020644a4(b, 0);
        return func_0206429c(p, t) ? 1 : 0;
    }
    return func_020643d8(p, b, c) ? 1 : 0;
}
