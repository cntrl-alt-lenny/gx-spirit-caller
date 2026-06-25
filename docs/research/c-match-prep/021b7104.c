/* CAMPAIGN-PREP candidate for func_021b7104 (ov010, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Forwarder: move arg, load 2 lits, tail-call (add r0,#0 no-op)
 *   risk:       WALL per ov010_core.h: mwcc emits clean tail vs orig push;bl;`add r0,r0,#0`;pop; the no-op forwarder add is unsteerable
 *   confidence: low
 */
/* func_ov010_021b7104: forwarder. Original arg0 -> r2, two pooled pointers ->
 * r0/r1, then bl func_ov010_021b2924, with a leftover `add r0,r0,#0` no-op
 * before the pop. Documented WALL (ov010_core.h "tail-call bx vs
 * push;bl;add r0,r0,#0;pop no-op forwarder (021b7104)" — unsteerable).
 *
 *   stmdb sp!, {r3, lr}
 *   mov r2, r0
 *   ldr r0,=data_ov010_021b98f0
 *   ldr r1,=data_ov010_021b98a8
 *   bl func_ov010_021b2924
 *   add r0, r0, #0
 *   ldmia sp!, {r3, pc}
 */
extern char data_ov010_021b98f0[];
extern char data_ov010_021b98a8[];
extern int func_ov010_021b2924(void *a, void *b, int c);

int func_ov010_021b7104(int x) {
    return func_ov010_021b2924(data_ov010_021b98f0, data_ov010_021b98a8, x);
}
