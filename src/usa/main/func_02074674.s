; func_02074674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020704ec
        .extern func_02075d0c
        .global func_02074674
        .arm
func_02074674:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r5, r0
    ldr r4, [r5, #0xc]
    ldrb r0, [r4, #0x455]
    cmp r0, #0x8
    bne .L_70
    mov ip, #0x0
    mov r6, #0x15
    mov lr, #0x3
    mov r3, #0x2
    mov r2, #0x1
    add r1, sp, #0x4
    mov r0, r4
    strb r6, [sp, #0x4]
    strb lr, [sp, #0x5]
    strb ip, [sp, #0x6]
    strb ip, [sp, #0x7]
    strb r3, [sp, #0x8]
    strb r2, [sp, #0x9]
    strb ip, [sp, #0xa]
    bl func_02075d0c
    mov r2, #0x0
    mov r1, r0
    add r0, sp, #0x4
    mov r3, r2
    str r5, [sp]
    bl func_020704ec
.L_70:
    mov r0, #0x0
    strb r0, [r4, #0x455]
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
