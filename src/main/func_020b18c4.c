/* func_020b18c4: calls func_020b007c(a, b, &local), then
 * func_020b0138(a, b, local + c). Ships as asm -- natural C reached
 * only 21% (mwcc's register/stack allocation for the two-call
 * sequence diverged from the original).
 */

extern void func_020b007c(void);
extern void func_020b0138(void);

asm void func_020b18c4(void) {
    nofralloc
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r2
    add r2, sp, #0x0
    bl func_020b007c
    ldr r2, [sp]
    add r2, r2, r4
    str r2, [sp]
    bl func_020b0138
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
}
