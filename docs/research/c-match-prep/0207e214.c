/* CAMPAIGN-PREP candidate for func_0207e214 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT/CLEAR store-order: cur=0 then end=base
 *   risk:       scheduler may emit base load after the cur store instead of hoisting it
 *   confidence: high
 */
/* func_0207e214: leaf allocator-reset -- clear cur, copy base->end.
 *
 *   ldr r0, =data_021a08e4
 *   mov r2, #0x0
 *   ldr r1, [r0, #0x8]   ; tmp = g.base
 *   str r2, [r0, #0x0]   ; g.cur = 0
 *   str r1, [r0, #0x4]   ; g.end = tmp
 *   bx  lr
 *
 * Store order is cur(+0) then end(+4); the base load is hoisted above
 * the first store by the scheduler.
 */

typedef struct {
    int cur;   /* +0x0 */
    int end;   /* +0x4 */
    int base;  /* +0x8 */
} Heap0207e214;

extern Heap0207e214 data_021a08e4;

void func_0207e214(void) {
    data_021a08e4.cur = 0;
    data_021a08e4.end = data_021a08e4.base;
}
