/* CAMPAIGN-PREP candidate for func_0201d428 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear init calls + guard returns + do/while wait loop (==3)
 *   risk:       data_0218febc[+0x14] store and do/while shape are clean; func_0200583c(0) int-vs-ptr arg harmless.
 *   confidence: high
 */
/* func_0201d428: linear call sequence + wait loop.
 *   func_0202043c(0); func_0200583c(0);
 *   if (func_0201cf88() == 0) return;
 *   *(int*)(data_0218febc + 0x14) = 1;
 *   func_0201d150();
 *   if (func_0202046c() != 3) return;
 *   do { func_02093820(); } while (func_0202046c() == 3);
 */

extern int data_0218febc[];
extern void func_0202043c(int x);
extern void func_0200583c(int x);
extern int func_0201cf88(void);
extern void func_0201d150(void);
extern int func_0202046c(void);
extern void func_02093820(void);

void func_0201d428(void) {
    func_0202043c(0);
    func_0200583c(0);
    if (func_0201cf88() == 0) {
        return;
    }
    data_0218febc[0x14 / 4] = 1;
    func_0201d150();
    if (func_0202046c() != 3) {
        return;
    }
    do {
        func_02093820();
    } while (func_0202046c() == 3);
}
