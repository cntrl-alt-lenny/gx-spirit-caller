/* CAMPAIGN-PREP candidate for func_0226af78 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single u16-zext tail-call, value->arg d, sel=5
 *   risk:       Order of mov r2,#0 vs selector could differ; proven last-position in b204/afb4 but unverified for d-slot variant.
 *   confidence: high
 */
/* func_ov002_0226ae88: single u16-zext tail-call shim, selector 5.
 *   mov r1,r1,lsl#16 ; mov r3,r1,lsr#16 ; mov r1,#5 ; mov r2,#0 ; bx ip
 * Only one value arg; it lands in callee arg d (r3), with arg c (r2)=0:
 *   func_ov002_0226ac08(arg0, 5, 0, (u16)arg1).
 * Zero-arg emitted last (after the selector), matching shipped b204.c. */

typedef unsigned short u16;

extern void func_ov002_0226ac08(int a, int sel, u16 c, u16 d);

void func_ov002_0226ae88(int arg0, int arg1) {
    func_ov002_0226ac08(arg0, 5, 0, (u16)arg1);
}
