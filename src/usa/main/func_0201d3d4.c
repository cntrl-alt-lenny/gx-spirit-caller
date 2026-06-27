/* CAMPAIGN-PREP candidate for func_0201d3d4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear init calls + guard returns + do/while wait loop (==3)
 *   risk:       data_0218fddc[+0x14] store and do/while shape are clean; func_02005820(0) int-vs-ptr arg harmless.
 *   confidence: high
 */
/* func_0201d3d4: linear call sequence + wait loop.
 *   func_020203e8(0); func_02005820(0);
 *   if (func_0201cf34() == 0) return;
 *   *(int*)(data_0218fddc + 0x14) = 1;
 *   func_0201d0fc();
 *   if (func_02020418() != 3) return;
 *   do { func_0209372c(); } while (func_02020418() == 3);
 */

extern int data_0218fddc[];
extern void func_020203e8(int x);
extern void func_02005820(int x);
extern int func_0201cf34(void);
extern void func_0201d0fc(void);
extern int func_02020418(void);
extern void func_0209372c(void);

void func_0201d3d4(void) {
    func_020203e8(0);
    func_02005820(0);
    if (func_0201cf34() == 0) {
        return;
    }
    data_0218fddc[0x14 / 4] = 1;
    func_0201d0fc();
    if (func_02020418() != 3) {
        return;
    }
    do {
        func_0209372c();
    } while (func_02020418() == 3);
}
