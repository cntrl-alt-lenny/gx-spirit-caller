/* func_ov006_021b9cec: arg-shuffling thunk — discards arg0,
 * passes arg1 as r0, sets r1 to global. Returns 1.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r0, r1
 *     ldr   r1, .L_021b9e04            ; data_ov006_021cbe04
 *     bl    func_02091554
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern int func_02091554(int x, void *y);
extern void *data_ov006_021cbe04;

int func_ov006_021b9cec(int unused, int x) {
    func_02091554(x, &data_ov006_021cbe04);
    return 1;
}
