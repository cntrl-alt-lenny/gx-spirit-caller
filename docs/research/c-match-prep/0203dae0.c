/* CAMPAIGN-PREP candidate for func_0203dae0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Two-helper-preamble then switch(==7/==8) dispatch; result in callee-saved
 *   risk:       func_0203c888 return cached in r4 then overwritten only in cases; default returns the c900 setup value
 *   confidence: high
 */
/* func_0203dae0: dispatch on func_0203c888() result.
 *  v = func_0203c888();
 *  func_0203c900(0x10);
 *  if(v==7) v = func_0203d9c4();
 *  else if(v==8) v = func_0203d888();
 *  return v;
 * (r4 holds v across the func_0203c900 call, reused for results.)
 */
extern int func_0203c888(void);
extern void func_0203c900(int arg);
extern int func_0203d9c4(void);
extern int func_0203d888(void);

int func_0203dae0(void) {
    int v = func_0203c888();
    func_0203c900(0x10);
    if (v == 7) {
        v = func_0203d9c4();
    } else if (v == 8) {
        v = func_0203d888();
    }
    return v;
}
