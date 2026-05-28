/* func_02087200: stmfd-only prologue + if-else 2 helpers.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     cmp r0, #0; beq L_zero
 *     mov r0, #0x40; bl func_02094dac(0x40)
 *     add sp, sp, #4; ldmia sp!, {pc}
 *     L_zero: bl func_02094d80()
 *     add sp, sp, #4; ldmia sp!, {pc}
 */
extern void func_02094dac(int n);
extern void func_02094d80(void);

void func_02087200(int n) {
    if (n != 0) {
        func_02094dac(0x40);
    } else {
        func_02094d80();
    }
}
