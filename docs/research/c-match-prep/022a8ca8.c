/* CAMPAIGN-PREP candidate for func_022a8ca8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Sequential-call dispatch, arg held in r4 across all calls
 *   risk:       Callee signatures guessed void(void*); if any returns/varies args r0 setup unchanged so still safe. Order is fixed.
 *   confidence: high
 */
/* func_ov002_022a8ca8: straight dispatch sequence. Saves arg in r4 and
 * calls 8 helpers in order, passing the same object pointer (r4) to each.
 * First call gets r0 already = arg (no reload), the rest get mov r0,r4.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_0229d258      ; r0 still = arg
 *     mov r0,r4 ; bl func_ov002_022a8cf0
 *     mov r0,r4 ; bl func_ov002_022a96a8
 *     mov r0,r4 ; bl func_ov002_022a8e40
 *     mov r0,r4 ; bl func_ov002_022a9144
 *     mov r0,r4 ; bl func_ov002_022a9b6c
 *     mov r0,r4 ; bl func_ov002_022a9cac
 *     mov r0,r4 ; bl func_ov002_022a9d9c
 *     ldmia sp!, {r4, pc}
 */

extern void func_ov002_0229d258(void *p);
extern void func_ov002_022a8cf0(void *p);
extern void func_ov002_022a96a8(void *p);
extern void func_ov002_022a8e40(void *p);
extern void func_ov002_022a9144(void *p);
extern void func_ov002_022a9b6c(void *p);
extern void func_ov002_022a9cac(void *p);
extern void func_ov002_022a9d9c(void *p);

void func_ov002_022a8ca8(void *p) {
    func_ov002_0229d258(p);
    func_ov002_022a8cf0(p);
    func_ov002_022a96a8(p);
    func_ov002_022a8e40(p);
    func_ov002_022a9144(p);
    func_ov002_022a9b6c(p);
    func_ov002_022a9cac(p);
    func_ov002_022a9d9c(p);
}
