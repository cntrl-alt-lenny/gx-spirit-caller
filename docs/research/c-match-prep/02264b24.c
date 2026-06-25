/* CAMPAIGN-PREP candidate for func_02264b24 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard then linear void-call sequence, shared magic 0x1a9d
 *   risk:       Scheduling/reg-alloc of the four back-to-back calls sharing the 0x1a9d pool word may reorder loads; arg orders assumed from r0-r3.
 *   confidence: med
 */
/* func_ov002_02264b24: if 021b3ecc(player,11,0x1a9d) fires, run the
 * 021df6d4 / 021d5b80 / 021df938 sequence (on player and 1-player) and
 * return 0; else return 1. */

extern int  func_ov002_021b3ecc(int player, int kind, int code);
extern void func_ov002_021df6d4(int player, int code);
extern int  func_ov002_021d5b80(int a, int b, int c, int d);
extern void func_ov002_021df938(int a, int b, int c, int d);

int func_ov002_02264b24(int player) {
    if (func_ov002_021b3ecc(player, 0xb, 0x1a9d) == 0)
        return 1;
    func_ov002_021df6d4(player, 0x1a9d);
    func_ov002_021d5b80(player, 0xb, 0x1a9d, 0);
    func_ov002_021df938(1 - player, 0x3e8, 1, 0x1a9d);
    return 0;
}
