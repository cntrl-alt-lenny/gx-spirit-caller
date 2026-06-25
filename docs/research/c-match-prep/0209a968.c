/* CAMPAIGN-PREP candidate for func_0209a968 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return (==0->1); store-order recipe; constant command arg
 *   risk:       literal-pool ordering of data_021a83e4 vs 0x03006700 may swap; struct field offsets (+4/+8/+0xc) assume this layout.
 *   confidence: med
 */
/* func_0209a968: guard-call then field stores + command dispatch.
 * func_0209b4e4() gate: returns 0 -> bail with 1. Otherwise stash the three
 * args into data_021a83e4 (+4,+8,+0xc in that order) and fire command word
 * 0x03006700 through func_0209adb4. Returns 0 on success.
 */

typedef struct {
    int _r00;
    int f04;   /* +0x4 */
    int f08;   /* +0x8 */
    int f0c;   /* +0xc */
} cmd_block_t;

extern cmd_block_t data_021a83e4;
extern int  func_0209b4e4(void);
extern void func_0209adb4(int cmd);

int func_0209a968(int a0, int a1, int a2) {
    if (func_0209b4e4() == 0) return 1;
    data_021a83e4.f04 = a1;
    data_021a83e4.f08 = a2;
    data_021a83e4.f0c = a0;
    func_0209adb4(0x03006700);
    return 0;
}
