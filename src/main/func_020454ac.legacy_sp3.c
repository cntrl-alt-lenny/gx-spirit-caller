/* func_020454ac: identical shape to func_0204548c — blx-thunk
 * through function pointer data_0219dacc. 8 insns. sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r3, .L_020454c8
 *     ldr   r3, [r3, #0x0]
 *     blx   r3
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 *  .L_020454c8: .word data_0219dacc
 */

extern void (*data_0219dacc)(int, int, int);

void func_020454ac(int a, int b, int c) {
    data_0219dacc(a, b, c);
}
