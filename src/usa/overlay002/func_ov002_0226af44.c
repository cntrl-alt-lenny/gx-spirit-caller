/* CAMPAIGN-PREP candidate for func_0226b034 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16-zext two-arg tail-call shim, sel=0xa
 *   risk:       Same two-store ordering risk as af38; 0xa encodes as a single mov immediate.
 *   confidence: high
 */
/* func_ov002_0226af44: u16-zext two-arg tail-call shim, selector 0xa.
 * Same shape as af38 (mov r1,#0xa).
 * func_ov002_0226ac08(arg0, 0xa, (u16)arg1, (u16)arg2). */

typedef unsigned short u16;

extern void func_ov002_0226ac08(int a, int sel, u16 c, u16 d);

void func_ov002_0226af44(int arg0, int arg1, int arg2) {
    func_ov002_0226ac08(arg0, 0xa, (u16)arg1, (u16)arg2);
}
