/* func_0204548c: blx-thunk through function pointer
 * data_0219dac8. 8 insns. sp3 signature (sub sp #4 + pop {pc}).
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r3, .L_020454a8
 *     ldr   r3, [r3, #0x0]
 *     blx   r3
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 *  .L_020454a8: .word data_0219dac8
 */

/* The function pointer call uses r3 in the target (not r0).
 * Declaring the callee as taking 3 int args reserves r0-r2 and
 * forces mwcc to pick r3 as the scratch for the indirect call. */
extern void (*data_0219dac8)(int, int, int);

void func_0204548c(int a, int b, int c) {
    data_0219dac8(a, b, c);
}
