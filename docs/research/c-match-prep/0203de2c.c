/* CAMPAIGN-PREP candidate for func_0203de2c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GE-ladder dispatch to tail calls; cached arg in callee-saved r4
 *   risk:       func_0203c848 return drives <4 / <5 / ==5 ladder; r4=func_0203c900 result passed to two tails
 *   confidence: high
 */
/* func_0203de2c: ge-ladder dispatch.
 *  h = func_0203c900(1);
 *  n = func_0203c848();
 *  if(n < 4)  func_0203dde8();
 *  else if(n < 5) func_0203dde0();
 *  else if(n == 5) func_0203ddc4(h);
 *  else func_0203dc94(h);
 * (r4 caches h across func_0203c848.)
 */
extern int func_0203c900(int arg);
extern int func_0203c848(void);
extern void func_0203dde8(void);
extern void func_0203dde0(void);
extern void func_0203ddc4(int h);
extern void func_0203dc94(int h);

void func_0203de2c(void) {
    int h = func_0203c900(1);
    int n = func_0203c848();
    if (n < 4) {
        func_0203dde8();
    } else if (n < 5) {
        func_0203dde0();
    } else if (n == 5) {
        func_0203ddc4(h);
    } else {
        func_0203dc94(h);
    }
}
