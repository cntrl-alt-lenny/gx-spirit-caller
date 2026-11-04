/* func_020453cc: 4-arg tail-call thunk into func_02045470.
 * Sibling of func_ov010_021b4750 cluster.
 *
 *     ldr ip, .L_020453e4
 *     mov r2, r1
 *     mov r1, r0
 *     mov r3, r2
 *     mov r0, #0x5
 *     bx  ip
 *  .L_020453e4: .word func_02045470
 */

extern void *func_02045470(int heap, void *p, int size, int d);

void *func_020453cc(void *p, int size) {
    return func_02045470(5, p, size, size);
}
