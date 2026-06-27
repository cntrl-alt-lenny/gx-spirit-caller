/* CAMPAIGN-PREP candidate for func_0226af94 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16-zext tail-call shim, sel=6
 *   risk:       Same two-store ordering risk as af38.
 *   confidence: high
 */
/* func_ov002_0226aea4: u16-zext two-arg tail-call shim, selector 6.
 * Same shape as af38 (mov r1,#6). func_ov002_0226ac08(r0,sel,u16 a,u16 b). */

typedef unsigned short u16;

extern void func_ov002_0226ac08(int a, int sel, u16 c, u16 d);

void func_ov002_0226aea4(int arg0, int arg1, int arg2) {
    func_ov002_0226ac08(arg0, 6, (u16)arg1, (u16)arg2);
}
