/* CAMPAIGN-PREP candidate for func_020897b0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init + store + delegate + boolean-normalise (!=0 => movne1/moveq0)
 *   risk:       store p->heap may schedule after the mov r0,p arg-setup; f4 offset forced by asm
 *   confidence: med
 */
/* func_020897b0 — init sub-object at +0x4 (cap 0xc), store ctx at +0x0,
 * delegate to func_02089768, normalise to bool.
 * Order per asm: init(+4) first, then p->heap = v, then the call.
 * 3 callee regs pushed (odd) => sub sp,#4 align pad. */

typedef struct {
    void *heap;   /* 0x00 */
    int   f4;     /* 0x04 */
} T_020897b0;

extern void func_0207d1b8(void *obj, int cap);
extern int  func_02089768(T_020897b0 *p);

int func_020897b0(T_020897b0 *p, void *v) {
    func_0207d1b8(&p->f4, 0xc);
    p->heap = v;
    return func_02089768(p) != 0;
}
