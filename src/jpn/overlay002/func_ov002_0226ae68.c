/* CAMPAIGN-PREP candidate for func_0226af58 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16-zext tail-call shim, sel=4
 *   risk:       Same two-store ordering risk as af38; selector immediate must encode as mov #4.
 *   confidence: high
 */
/* func_ov002_0226ae68: u16-zext two-arg tail-call shim, selector 4.
 * Identical shape to af38; only the selector constant differs (mov r1,#4).
 * Callee func_ov002_0226ac08(int r0, int sel, u16 a, u16 b) per acf8.s. */

typedef unsigned short u16;

extern void func_ov002_0226ac08(int a, int sel, u16 c, u16 d);

void func_ov002_0226ae68(int arg0, int arg1, int arg2) {
    func_ov002_0226ac08(arg0, 4, (u16)arg1, (u16)arg2);
}
