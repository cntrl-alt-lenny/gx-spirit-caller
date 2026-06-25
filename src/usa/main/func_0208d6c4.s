; func_0208d6c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d6c4
        .arm
func_0208d6c4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0xe]
    ldrh r3, [r1]
    cmp r0, #0x20
    strh r0, [r1, #0xe]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    bgt .L_64
    cmp r0, #0x20
    bge .L_d0
    cmp r0, #0x0
    bgt .L_58
    cmp r0, #0x0
    moveq r1, #0x4000000
    ldreq r0, [r1]
    biceq r0, r0, #0x40000000
    streq r0, [r1]
    b .L_ec
.L_58:
    cmp r0, #0x10
    beq .L_84
    b .L_ec
.L_64:
    cmp r0, #0x40
    bgt .L_78
    cmp r0, #0x40
    beq .L_a4
    b .L_ec
.L_78:
    cmp r0, #0x60
    beq .L_c4
    b .L_ec
.L_84:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, _LIT1
    orr r1, r1, #0x40000000
    str r1, [r2]
    mov r1, #0x84
    strb r1, [r0]
    b .L_ec
.L_a4:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, _LIT2
    orr r1, r1, #0x40000000
    str r1, [r2]
    mov r1, #0x8c
    strb r1, [r0]
    b .L_ec
.L_c4:
    ldr r0, _LIT2
    mov r1, #0x8c
    strb r1, [r0]
.L_d0:
    ldr r0, _LIT3
    mov r1, #0x84
    strb r1, [r0]
    mov r1, #0x4000000
    ldr r0, [r1]
    orr r0, r0, #0x40000000
    str r0, [r1]
.L_ec:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dbfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000244
_LIT2: .word 0x04000246
_LIT3: .word 0x04000245
