/* func_0204545c: identical shape to func_0204543c — blx-thunk
 * through function pointer data_0219d9ec. 8 insns. sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r3, .L_020454c8
 *     ldr   r3, [r3, #0x0]
 *     blx   r3
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 *  .L_020454c8: .word data_0219d9ec
 */

extern void (*data_0219d9ec)(int, int, int);

void func_0204545c(int a, int b, int c) {
    data_0219d9ec(a, b, c);
}
