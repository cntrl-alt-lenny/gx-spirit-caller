; func_02070a38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .extern func_02070ac0
        .extern func_02070b4c
        .extern func_02074b90
        .global func_02070a38
        .arm
func_02070a38:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r1, [r1, #0x4]
    ldr r1, [r1, #0xa4]
    cmp r1, #0x0
    beq .L_e38
    ldrb r2, [r1, #0x8]
    add r2, r2, #0xf6
    and r2, r2, #0xff
    cmp r2, #0x1
    bhi .L_e0c
    bl func_02070b4c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_e0c:
    ldrb r2, [r1, #0x9]
    cmp r2, #0x0
    beq .L_e28
    bl func_02074b90
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_e28:
    bl func_02070ac0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_e38:
    mov r1, #0x0
    str r1, [r0]
    mov r0, r1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a63d0
