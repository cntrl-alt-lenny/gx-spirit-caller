/* CAMPAIGN-PREP candidate for func_02020c40 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard call + dispatch; cmp==2/moveq early-return tail; literal-ptr arg
 *   risk:       data_02191e60 indexed as int[]; passing func ptr as int may warn but loads the literal. cmp/moveq tail should fold from the if-return.
 *   confidence: high
 */
/* func_02020c40: dispatch sequence with a mid early-return.
 *   if (data_02191e60[0x30/4] != 1) func_02093b08();
 *   func_0201f0e4(3);
 *   if (func_0209eef4((int)func_020203b0) == 2) return 1;   // moveq/ldmeqia
 *   func_0201f0e4(9);
 *   return 0;
 */

extern int  data_02191e60[];
extern void func_020203b0(void);
extern void func_02093b08(void);
extern void func_0201f0e4(int x);
extern int  func_0209eef4(int a0);

int func_02020c40(void) {
    if (data_02191e60[0x30 / 4] != 1) {
        func_02093b08();
    }
    func_0201f0e4(3);
    if (func_0209eef4((int)func_020203b0) == 2) {
        return 1;
    }
    func_0201f0e4(9);
    return 0;
}
