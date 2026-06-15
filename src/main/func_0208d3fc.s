; func_0208d3fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6304
        .extern func_0208dce4
        .global func_0208d3fc
        .arm
func_0208d3fc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0xa]
    ldrh r3, [r1]
    cmp r0, #0x30
    strh r0, [r1, #0xa]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    bgt .L_254
    cmp r0, #0x30
    bge .L_2ac
    cmp r0, #0x10
    bgt .L_248
    cmp r0, #0x10
    bge .L_2b8
    cmp r0, #0x0
    b .L_2c4
.L_248:
    cmp r0, #0x20
    beq .L_290
    b .L_2c4
.L_254:
    cmp r0, #0x60
    bgt .L_278
    cmp r0, #0x60
    bge .L_284
    cmp r0, #0x40
    ldreq r0, _LIT1
    moveq r1, #0x83
    streqb r1, [r0]
    b .L_2c4
.L_278:
    cmp r0, #0x70
    beq .L_2a0
    b .L_2c4
.L_284:
    ldr r0, _LIT1
    mov r1, #0x8b
    strb r1, [r0]
.L_290:
    ldr r0, _LIT2
    mov r1, #0x83
    strb r1, [r0]
    b .L_2c4
.L_2a0:
    ldr r0, _LIT1
    mov r1, #0x9b
    strb r1, [r0]
.L_2ac:
    ldr r0, _LIT2
    mov r1, #0x93
    strb r1, [r0]
.L_2b8:
    ldr r0, _LIT3
    mov r1, #0x83
    strb r1, [r0]
.L_2c4:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dce4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6304
_LIT1: .word 0x04000246
_LIT2: .word 0x04000245
_LIT3: .word 0x04000244
