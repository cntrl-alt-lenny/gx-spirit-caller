/* CAMPAIGN-PREP candidate for func_0205d6bc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     deref+field, call with stack out-arg, cond-store, bool-ize
 *   risk:       the 0x20 frame is larger than the single out word used; mwcc may size the frame differently
 *   confidence: med
 */
/* func_0205d6bc: spill arg1 to the stack, fetch (*r0)->_0x428, call
 * func_0205442c(handler, &spill); if r2 (out) non-null store the result
 * there; return (result != 0).
 *
 *   stmdb sp!, {r4, lr}; sub sp,#0x20
 *   r0=[r0]; r4=r2; str r1,[sp]; r0=[r0,#0x428]; add r1,sp,#0
 *   bl func_0205442c
 *   cmp r4,#0; strne r0,[r4]; cmp r0,#0; movne r0,#1; moveq r0,#0
 */
typedef struct {
    char  _pad_00[0x428];
    void *handler;     /* +0x428 */
} obj_t;

extern int func_0205442c(void *handler, void *spill);

int func_0205d6bc(obj_t **pp, void *arg1, int *out) {
    void *spill = arg1;
    int   r = func_0205442c((*pp)->handler, &spill);

    if (out != 0) *out = r;
    return r != 0;
}
