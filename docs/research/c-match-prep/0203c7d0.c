/* CAMPAIGN-PREP candidate for func_0203c7d0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two ordered calls; deref global as arg; literal-pool consts
 *   risk:       data_* element type (void* vs int) guessed; 0xd18 must land in a pool word; call order fixed by source
 *   confidence: high
 */
/* func_0203c7d0: two ordered dispatch calls with derefed globals.
 *   func_0203ca78(8,    *data_0219d9c4, 0xc)
 *   func_0203ca78(0x10, *data_0219d9b8, 0xd18)
 * sub sp,#4 + stmfd {lr} is the alignment-pad prologue for a leaf-ish
 * void function making calls.
 */

extern void *data_0219d9c4;
extern void *data_0219d9b8;
extern void  func_0203ca78(int a, void *b, int c);

void func_0203c7d0(void) {
    func_0203ca78(8, data_0219d9c4, 0xc);
    func_0203ca78(0x10, data_0219d9b8, 0xd18);
}
