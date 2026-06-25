/* CAMPAIGN-PREP candidate for func_0205d688 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     cache field + guard early-return + field-load tail call
 *   risk:       the early-return uses predicated ldmeq; mwcc may emit a branch-to-epilogue instead, perturbing bytes
 *   confidence: med
 */
/* func_0205d688: cache (*r0)=>r4, call func_0205d6bc(r0, arg1, &out); if it
 * returns 0 just return, else tail-call func_020544c8(r4->_0x428, out).
 *
 *   stmdb sp!, {r4, lr}; sub sp,#8; add r2,sp,#0
 *   r4=[r0]; bl func_0205d6bc
 *   cmp r0,#0; (eq) add sp,#8; ldmia sp!, {r4, pc}
 *   ldr r0,[r4,#0x428]; ldr r1,[sp]; bl func_020544c8
 *   add sp,#8; ldmia sp!, {r4, pc}
 */
typedef struct {
    char  _pad_00[0x428];
    void *handler;     /* +0x428 */
} obj_t;

extern int  func_0205d6bc(obj_t **pp, void *arg1, void **out);
extern void func_020544c8(void *handler, void *out);

void func_0205d688(obj_t **pp, void *arg1) {
    void *out;
    obj_t *o = *pp;

    if (func_0205d6bc(pp, arg1, &out) == 0) return;
    func_020544c8(o->handler, out);
}
