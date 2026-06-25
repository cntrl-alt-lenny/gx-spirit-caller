/* CAMPAIGN-PREP candidate for func_02264da0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + bind call-result temp (021b4120) reused as arg, shared 0x18fe
 *   risk:       021b4120 result bound to r4 then fed to 021df938 as arg1; reg-alloc of that temp vs player (r5) may flip; call order scheduling.
 *   confidence: med
 */
/* func_ov002_02264da0: if 021b3ecc(player,11,0x18fe), capture
 * 021b4120(player,11,0x18fe) into a temp, run 021df6d4, pass the temp to
 * 021df938, then 021d5b80; return 0. Else return 1. */

extern int  func_ov002_021b3ecc(int player, int kind, int code);
extern int  func_ov002_021b4120(int player, int kind, int code);
extern void func_ov002_021df6d4(int player, int code);
extern void func_ov002_021df938(int a, int b, int c, int d);
extern int  func_ov002_021d5b80(int a, int b, int c, int d);

int func_ov002_02264da0(int player) {
    int v;
    if (func_ov002_021b3ecc(player, 0xb, 0x18fe) == 0)
        return 1;
    v = func_ov002_021b4120(player, 0xb, 0x18fe);
    func_ov002_021df6d4(player, 0x18fe);
    func_ov002_021df938(player, v, 0, 0x18fe);
    func_ov002_021d5b80(player, 0xb, 0x18fe, 0);
    return 0;
}
