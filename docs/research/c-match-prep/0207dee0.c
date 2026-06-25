/* CAMPAIGN-PREP candidate for func_0207dee0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     TAIL-CALL thunk: load fields, pass-through r1, return callee
 *   risk:       tail-call lowering / scratch-reg (mov r2,r0) choice; field offsets guessed from asm
 *   confidence: high
 */
/* func_0207dee0: thunk loading two fields then tail-jumping.
 *
 *   ldr ip, =func_0207d494
 *   mov r2, r0          ; save p
 *   ldr r0, [r2, #0x4]  ; ctx = p->ctx
 *   ldr r2, [r2, #0x8]  ; b   = p->b
 *   bx  ip              ; tail: func_0207d494(ctx, a, b)
 *
 * r1 (a) passes through untouched. Signature of the callee is taken
 * from the func_0207d494 sibling in Task_PostLocked.c:
 *   int func_0207d494(void *ctx, void *a, int b).
 */

typedef struct {
    char  _pad00[0x4];
    void *ctx;   /* +0x4 -> outgoing r0 */
    int   b;     /* +0x8 -> outgoing r2 */
} S0207dee0;

extern int func_0207d494(void *ctx, void *a, int b);

int func_0207dee0(S0207dee0 *p, void *a) {
    return func_0207d494(p->ctx, a, p->b);
}
