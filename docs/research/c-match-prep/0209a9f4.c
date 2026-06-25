/* CAMPAIGN-PREP candidate for func_0209a9f4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return; commutative orr operand-order (masked first); store-order
 *   risk:       orr operand order must keep (a0&0xff) first for r0 dest; literal-pool order of 0x03006600 vs data_021a83e4 may swap.
 *   confidence: med
 */
/* func_0209a9f4: guard-call then field stores + masked command dispatch.
 * Same gate as func_0209a968. Stores a1,a2 into data_021a83e4 (+4,+8) and
 * dispatches command (a0 & 0xff) | 0x03006600 -- the masked operand is
 * written first so the orr picks r0 as dest. Returns 0 on success.
 */

typedef struct {
    int _r00;
    int f04;   /* +0x4 */
    int f08;   /* +0x8 */
} cmd_block_t;

extern cmd_block_t data_021a83e4;
extern int  func_0209b4e4(void);
extern void func_0209adb4(int cmd);

int func_0209a9f4(int a0, int a1, int a2) {
    if (func_0209b4e4() == 0) return 1;
    data_021a83e4.f04 = a1;
    data_021a83e4.f08 = a2;
    func_0209adb4((a0 & 0xff) | 0x03006600);
    return 0;
}
