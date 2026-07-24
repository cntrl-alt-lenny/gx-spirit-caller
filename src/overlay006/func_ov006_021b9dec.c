/* func_ov006_021b9dec: arg-shuffling thunk — discards arg0,
 * passes arg1 as r0, sets r1 to global. Returns 1.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r0, r1
 *     ldr   r1, .L_021b9e04            ; data_ov006_021cbf24
 *     bl    OS_SPrintf
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern int OS_SPrintf(int x, void *y);
extern void *data_ov006_021cbf24;

int func_ov006_021b9dec(int unused, int x) {
    OS_SPrintf(x, &data_ov006_021cbf24);
    return 1;
}
