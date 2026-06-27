/* CAMPAIGN-PREP candidate for func_0226afd0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16-zext two-arg tail-call shim, sel=7
 *   risk:       Same two-store ordering risk as af38.
 *   confidence: high
 */
/* func_ov002_0226afd0: u16-zext two-arg tail-call shim, selector 7.
 * Same shape as af38 (mov r1,#7) but BOTH args zext'd (vs afb4's single).
 * func_ov002_0226acf8(arg0, 7, (u16)arg1, (u16)arg2). */

typedef unsigned short u16;

extern void func_ov002_0226acf8(int a, int sel, u16 c, u16 d);

void func_ov002_0226afd0(int arg0, int arg1, int arg2) {
    func_ov002_0226acf8(arg0, 7, (u16)arg1, (u16)arg2);
}
