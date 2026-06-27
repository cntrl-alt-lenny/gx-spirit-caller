/* CAMPAIGN-PREP candidate for func_02005ec4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear calls + guard branch; stack-scratch buffer by address
 *   risk:       buf size/alignment guessed (8B); if real arg is a typed struct the add sp/frame layout could shift.
 *   confidence: high
 */
/* func_02005ec4: init a struct, run two calls, then branch on a probe.
 *   func_02094410(0, data_02103c94, 0x2c)
 *   func_0209a3b0()
 *   if (func_0209a304(&buf)) func_0209a1bc(&buf); else func_02093b08();
 * stack is sub sp,#8 -> one 8-byte scratch buffer passed by address.
 */

extern char data_02103c94[];
extern void func_02094410(int a, void *b, int c);
extern void func_0209a3b0(void);
extern int  func_0209a304(void *p);
extern void func_0209a1bc(void *p);
extern void func_02093b08(void);

void func_02005ec4(void) {
    char buf[8];
    func_02094410(0, data_02103c94, 0x2c);
    func_0209a3b0();
    if (func_0209a304(buf) != 0) {
        func_0209a1bc(buf);
    } else {
        func_02093b08();
    }
}
