/* CAMPAIGN-PREP candidate for func_0203ef68 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Two-call guard returning constants; void setup call on success path
 *   risk:       func_020433d0==0 -> 0xe; else func_0203c85c(3) then return 0x11; sub sp #4 stub frame
 *   confidence: high
 */
/* func_0203ef68: setup, guarded-call, return constants.
 *  func_0203c900(8);
 *  if(func_020433d0()==0) return 0xe;
 *  func_0203c85c(3);
 *  return 0x11;
 */
extern void func_0203c900(int arg);
extern int func_020433d0(void);
extern void func_0203c85c(int arg);

int func_0203ef68(void) {
    func_0203c900(8);
    if (func_020433d0() == 0) return 0xe;
    func_0203c85c(3);
    return 0x11;
}
