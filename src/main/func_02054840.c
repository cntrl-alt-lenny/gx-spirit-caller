/* func_02054840: forwards to func_02054700, inserting a constant `4`
 * as the 3rd argument and shifting the remaining args down. Ships as
 * asm -- natural C reached 60% (same total stack usage, 16 bytes) but
 * mwcc chose a different spill strategy for the 4th incoming register
 * arg (push+reuse vs orig's direct store to the outgoing stack slot).
 */

extern void func_02054700(int a0, int a1, int a2, int a3, int a4, int a5);

asm void func_02054840(void) {
    nofralloc
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr ip, [sp, #0x10]
    str r3, [sp, #0x0]
    mov r3, r2
    mov r2, #0x4
    str ip, [sp, #0x4]
    bl func_02054700
    add sp, sp, #0xc
    ldmfd sp!, {pc}
}
