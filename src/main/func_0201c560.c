/* CAMPAIGN-PREP candidate for func_0201c560 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard return + counted loop with (==a||==b) skip + early-return + tail call
 *   risk:       cmp;cmpne fusion for (i==0x16||i==0x17) and r4=1 hoist depend on mwcc; otherwise structurally tight.
 *   confidence: med
 */
/* func_0201c560: guarded double-counted scan.
 *   if (func_020097a4(9) != 0) return;
 *   for (i = 0; i < 0x20; i++) {
 *       if (i == 0x16 || i == 0x17) continue;
 *       if (func_02008d1c(1, i) == 0) return;
 *   }
 *   func_02009758(9);
 * (r4 = constant 1 first arg, hoisted out of loop.)
 */

extern int func_020097a4(int x);
extern int func_02008d1c(int a, int b);
extern void func_02009758(int x);

void func_0201c560(void) {
    int i;
    if (func_020097a4(9) != 0) {
        return;
    }
    for (i = 0; i < 0x20; i++) {
        if (i == 0x16 || i == 0x17) {
            continue;
        }
        if (func_02008d1c(1, i) == 0) {
            return;
        }
    }
    func_02009758(9);
}
