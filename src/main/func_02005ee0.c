/* CAMPAIGN-PREP candidate for func_02005ee0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear calls + guard branch; stack-scratch buffer by address
 *   risk:       buf size/alignment guessed (8B); if real arg is a typed struct the add sp/frame layout could shift.
 *   confidence: high
 */
/* func_02005ee0: init a struct, run two calls, then branch on a probe.
 *   func_02094504(0, data_02103d74, 0x2c)
 *   func_0209a4a4()
 *   if (func_0209a3f8(&buf)) func_0209a2b0(&buf); else func_02093bfc();
 * stack is sub sp,#8 -> one 8-byte scratch buffer passed by address.
 */

extern char data_02103d74[];
extern void func_02094504(int a, void *b, int c);
extern void func_0209a4a4(void);
extern int  func_0209a3f8(void *p);
extern void func_0209a2b0(void *p);
extern void func_02093bfc(void);

void func_02005ee0(void) {
    char buf[8];
    func_02094504(0, data_02103d74, 0x2c);
    func_0209a4a4();
    if (func_0209a3f8(buf) != 0) {
        func_0209a2b0(buf);
    } else {
        func_02093bfc();
    }
}
