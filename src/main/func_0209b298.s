; func_0209b298 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83d0
        .extern data_021a83d4
        .extern data_021a83e4
        .extern data_021a840c
        .extern data_021a8410
        .extern func_0209b448
        .global func_0209b298
        .arm
func_0209b298:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r2, #0x0
    beq .L_1c8
    mov r0, #0x2
    bl func_0209b448
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_1c8:
    and r0, r1, #0x7f00
    mov r0, r0, lsl #0x8
    and r1, r1, #0xff
    mov r2, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    cmp r2, #0x70
    mov r0, r0, lsr #0x10
    bcc .L_228
    cmp r2, #0x74
    bhi .L_228
    ldr r1, _LIT0
    sub r2, r2, #0x70
    and r0, r0, #0xff
    ldr r1, [r1, r2, lsl #0x3]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r1, #0x0
    strneh r0, [r1]
    mov r1, r2, lsl #0x3
    ldr r0, _LIT1
    mov r2, #0x1
    strh r2, [r0, r1]
    mov r0, #0x0
    b .L_26c
.L_228:
    cmp r2, #0x60
    ldreq r1, _LIT2
    moveq r2, #0x1
    streq r2, [r1]
    beq .L_26c
    cmp r2, #0x62
    ldreq r1, _LIT3
    moveq r2, #0x1
    streq r2, [r1]
    beq .L_26c
    cmp r2, #0x67
    bne .L_26c
    ldr r1, _LIT4
    ldr r1, [r1, #0xc]
    cmp r1, #0x0
    strne r0, [r1]
    mov r0, #0x0
.L_26c:
    bl func_0209b448
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a8410
_LIT1: .word data_021a840c
_LIT2: .word data_021a83d0
_LIT3: .word data_021a83d4
_LIT4: .word data_021a83e4
