/* func_ov002_021ae320: guarded event-trigger hub (64 band-callers).
 * If the per-slot done-flag data_ov002_022cd664[a] is unset, dispatch
 * event 0x31 (payload b) through the central event dispatcher
 * func_ov002_0229acd0; otherwise no-op. Sibling func_ov002_021ae3a4 is
 * the unguarded form (dispatch(0x31, 1, x, 0)); this one gates on the
 * done-flag array and passes code-2 = 0.
 *
 *     push  {r3, lr}
 *     ldr   r3, =data_ov002_022cd664
 *     mov   r2, r1
 *     ldr   r0, [r3, r0, lsl #2]
 *     cmp   r0, #0
 *     popne {r3, pc}            ; if (flag != 0) return;
 *     mov   r1, #0 ; mov r3, r1 ; mov r0, #0x31
 *     bl    func_ov002_0229acd0
 *     pop   {r3, pc}
 */

extern int func_ov002_0229acd0(int a, int b, int c, int d);
extern int data_ov002_022cd664[];

void func_ov002_021ae320(int a, int b) {
    if (data_ov002_022cd664[a] != 0) return;
    func_ov002_0229acd0(0x31, 0, b, 0);
}
