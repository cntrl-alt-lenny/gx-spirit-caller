/* CAMPAIGN-PREP candidate for func_020461fc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain early-returns + void tail call; sp3 tier
 *   risk:       r1=second-arg assumption; if a/p arg roles swap, reg mismatch. Three reloads of field_4 must match.
 *   confidence: high
 */
/* func_020461fc: dispatch on (*arg).field_4 against three magic
 * constants; if any matches, early-return; else tail-call
 * func_0204653c(3). sp3 routing (push {lr} + sub sp,#4 + pop {pc}).
 *
 *     ldr r1, [r1, #0x4]
 *     cmp r1, 0x603 -> return
 *     cmp r1, 0x901 -> return
 *     cmp r1, 0xb01 -> return
 *     mov r0, #3 ; bl func_0204653c ; return
 *
 * arg0 (r0) is unused by the body; arg1 (r1) is the struct ptr whose
 * word at +0x4 is tested. The three equality early-returns are a
 * guard chain; the fall-through is a void tail call. */

typedef struct {
    char _pad0[0x4];
    int  field_4;       /* +0x4 */
} obj_020461fc_t;

extern void func_0204653c(int v);

void func_020461fc(int a, obj_020461fc_t *p) {
    (void)a;
    if (p->field_4 == 0x603) return;
    if (p->field_4 == 0x901) return;
    if (p->field_4 == 0xb01) return;
    func_0204653c(3);
}
