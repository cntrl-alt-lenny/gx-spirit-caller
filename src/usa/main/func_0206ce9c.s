; func_0206ce9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206ce9c
        .arm
func_0206ce9c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, [r0, #0x64]
    ldr r5, [r0, #0xc4]
    ldr r4, [r0, #0xf8]
    ldr r0, [r5, #0x44]
    subs lr, r0, r4
    bmi .L_64
    ldrh ip, [r5, #0xa]
    ldr r0, [sp, #0x10]
    cmp lr, #0x0
    strh ip, [r2]
    ldrh r2, [r5, #0x18]
    strh r2, [r3]
    ldr r2, [r5, #0x1c]
    str r2, [r0]
    str lr, [r1]
    bne .L_7c
    ldrb r0, [r5, #0x8]
    cmp r0, #0x4
    beq .L_7c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_64:
    mvn r0, #0x0
    str r0, [r1]
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_7c:
    ldr r0, [r5, #0x40]
    add r0, r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
