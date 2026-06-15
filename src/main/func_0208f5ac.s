; func_0208f5ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a632c
        .extern data_021a6330
        .extern data_021a6334
        .extern func_0208cf20
        .global func_0208f5ac
        .arm
func_0208f5ac:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0208cf20
    ldr r1, _LIT0
    cmp r0, #0x20
    str r0, [r1]
    bgt .L_270
    cmp r0, #0x20
    bge .L_2e8
    cmp r0, #0x0
    bgt .L_25c
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_25c:
    cmp r0, #0x10
    beq .L_2a0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_270:
    cmp r0, #0x40
    bgt .L_28c
    cmp r0, #0x40
    beq .L_2c4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_28c:
    cmp r0, #0x60
    beq .L_2e8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_2a0:
    ldr r3, _LIT1
    ldr r1, _LIT2
    ldr r0, _LIT3
    mov r2, #0x0
    str r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_2c4:
    ldr r3, _LIT4
    ldr r1, _LIT2
    ldr r0, _LIT3
    mov r2, #0x4000
    str r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_2e8:
    ldr r3, _LIT5
    ldr r1, _LIT2
    ldr r0, _LIT3
    mov r2, #0x0
    str r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6334
_LIT1: .word 0x06880000
_LIT2: .word data_021a6330
_LIT3: .word data_021a632c
_LIT4: .word 0x06894000
_LIT5: .word 0x06890000
