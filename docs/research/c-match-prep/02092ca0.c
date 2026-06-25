/* CAMPAIGN-PREP candidate for func_02092ca0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call sequence threading results + global guard + and/cmp early-return
 *   risk:       guard reads func_02092368 r0 return; !=1 path must lower to conditional ldmne/bxne tail
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02092ca0 (main, class A->B) - p_0035.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     fixed call sequence (results threaded as args) + global guard + and/cmp early-return
 *   risk:       guard uses func_02092368's r0 return; (& 3)!=1 early-return must lower to addne/ldmne/bxne tail
 *   confidence: med
 */
/* func_02092ca0: four init calls with arg #2, threading prior results:
 *   r1=func_02092b48(2); func_02092a48(2, r1)
 *   func_02092a5c(2) -> r1; func_02092a34(2, r1)
 * Then if *data_021a662c != 0: if (func_02092368() & 3) != 1 return early.
 * Otherwise (the global was 0, OR guard==1): func_02092e80(0x0200002b);
 * func_02092e88(0x023e0021). func_02092368 returns its stored constant in r0.
 */
extern int  data_021a662c;
extern int  func_02092b48(int sel);
extern void func_02092a48(int sel, int v);
extern int  func_02092a5c(int sel);
extern void func_02092a34(int sel, int v);
extern int  func_02092368(void);
extern void func_02092e80(int addr);
extern void func_02092e88(int addr);

void func_02092ca0(void)
{
    int r;
    r = func_02092b48(2);
    func_02092a48(2, r);
    r = func_02092a5c(2);
    func_02092a34(2, r);

    if (data_021a662c != 0) {
        if ((func_02092368() & 3) != 1)
            return;
    }
    func_02092e80(0x0200002b);
    func_02092e88(0x023e0021);
}
