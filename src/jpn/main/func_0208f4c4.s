; func_0208f4c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a624c
        .extern data_021a6250
        .extern data_021a6254
        .extern func_0208ce38
        .global func_0208f4c4
        .arm
func_0208f4c4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0208ce38
    ldr r1, _LIT0
    cmp r0, #0x20
    str r0, [r1]
    bgt .L_50
    cmp r0, #0x20
    bge .L_c8
    cmp r0, #0x0
    bgt .L_3c
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_3c:
    cmp r0, #0x10
    beq .L_80
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_50:
    cmp r0, #0x40
    bgt .L_6c
    cmp r0, #0x40
    beq .L_a4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_6c:
    cmp r0, #0x60
    beq .L_c8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_80:
    ldr r3, _LIT1
    ldr r1, _LIT2
    ldr r0, _LIT3
    mov r2, #0x0
    str r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_a4:
    ldr r3, _LIT4
    ldr r1, _LIT2
    ldr r0, _LIT3
    mov r2, #0x4000
    str r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_c8:
    ldr r3, _LIT5
    ldr r1, _LIT2
    ldr r0, _LIT3
    mov r2, #0x0
    str r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6254
_LIT1: .word 0x06880000
_LIT2: .word data_021a6250
_LIT3: .word data_021a624c
_LIT4: .word 0x06894000
_LIT5: .word 0x06890000
