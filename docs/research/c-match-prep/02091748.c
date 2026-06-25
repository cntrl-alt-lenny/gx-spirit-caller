/* CAMPAIGN-PREP candidate for func_02091748 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     clear-field + store-order + tail-call trampoline
 *   risk:       Tail-call may emit `bl;ldmia;pc` instead of `bx ip` if mwcc declines the tail-opt; field 0xb0 type/offset guessed. Med-high.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02091748 (main, class A).
 * recipe:  clear field + tail trampoline. obj = p->f0; p->f0 = 0;
 *          obj->f_b0 = 0; tail-call func_020919d8(obj) (orig `bx ip`).
 *          Store order: clear p[0] BEFORE clearing obj[0xb0] (matches asm).
 */
extern void func_020919d8(void *ctx);

void func_02091748(void **p) {
    void *obj = p[0];
    p[0] = 0;
    *(int *)((char *)obj + 0xb0) = 0;
    func_020919d8(obj);   /* tail call -> bx ip */
}
