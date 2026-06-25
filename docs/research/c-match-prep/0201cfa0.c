/* CAMPAIGN-PREP candidate for func_0201cfa0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard chain + compare-to-bool (>=1 via movge/movlt)
 *   risk:       The >=1 must lower to cmp#1/movge/movlt not a branch; structurally clean otherwise.
 *   confidence: high
 */
/* func_0201cfa0: nested predicate returning 0/1.
 *   if (func_0202046c() != 4) return 0;
 *   if (func_0201cfe0() == 0) return 1;
 *   return func_0201cff8() >= 1;   (cmp #1; movge 1; movlt 0)
 */

extern int func_0202046c(void);
extern int func_0201cfe0(void);
extern int func_0201cff8(void);

int func_0201cfa0(void) {
    if (func_0202046c() != 4) {
        return 0;
    }
    if (func_0201cfe0() == 0) {
        return 1;
    }
    return func_0201cff8() >= 1;
}
