/* CAMPAIGN-PREP candidate for func_02089768 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc-guard early-return + side-effect call + register; bool
 *   risk:       f4 offset/arg-order forced by asm; func_020897ec return-discard assumed void; arg-setup order may reorder
 *   confidence: high
 */
/* func_02089768 — allocate-or-fail then init-and-register; bool result.
 * func_0207dab4(p->heap, 20, 4) allocates a node; on NULL return 0;
 * else side-effect call + register node into &p->f4, return 1.
 * 3 callee regs pushed (odd) => mwcc emits the sub sp,#4 align pad. */

typedef struct {
    void *heap;   /* 0x00 — passed as allocator context */
    int   f4;     /* 0x04 — &p->f4 passed to register fn */
} T_02089768;

extern void *func_0207dab4(void *heap, int size, int align);
extern void  func_020897ec(void);
extern void  func_0207d12c(void *dst, void *node);

int func_02089768(T_02089768 *p) {
    void *node = func_0207dab4(p->heap, 0x14, 0x4);
    if (node == 0) return 0;
    func_020897ec();
    func_0207d12c(&p->f4, node);
    return 1;
}
