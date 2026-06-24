; func_0208d7d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d7d8
        .arm
func_0208d7d8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0x4]
    ldrh r3, [r1]
    cmp r0, #0x30
    strh r0, [r1, #0x4]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    bgt .L_70
    cmp r0, #0x30
    bge .L_ec
    cmp r0, #0x10
    bgt .L_64
    cmp r0, #0x10
    bge .L_f8
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_13c
    b .L_13c
    b .L_c0
    b .L_d0
    b .L_b4
.L_64:
    cmp r0, #0x20
    beq .L_130
    b .L_13c
.L_70:
    cmp r0, #0x50
    bgt .L_94
    cmp r0, #0x50
    bge .L_108
    cmp r0, #0x40
    ldreq r0, _LIT1
    moveq r1, #0x82
    streqb r1, [r0]
    b .L_13c
.L_94:
    cmp r0, #0x60
    bgt .L_a8
    cmp r0, #0x60
    beq .L_124
    b .L_13c
.L_a8:
    cmp r0, #0x70
    beq .L_e0
    b .L_13c
.L_b4:
    ldr r0, _LIT2
    mov r1, #0x8a
    strb r1, [r0]
.L_c0:
    ldr r0, _LIT3
    mov r1, #0x82
    strb r1, [r0]
    b .L_13c
.L_d0:
    ldr r0, _LIT2
    mov r1, #0x82
    strb r1, [r0]
    b .L_13c
.L_e0:
    ldr r0, _LIT1
    mov r1, #0x9a
    strb r1, [r0]
.L_ec:
    ldr r0, _LIT4
    mov r1, #0x92
    strb r1, [r0]
.L_f8:
    ldr r0, _LIT5
    mov r1, #0x82
    strb r1, [r0]
    b .L_13c
.L_108:
    ldr r1, _LIT1
    mov r2, #0x92
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x82
    strb r1, [r0]
    b .L_13c
.L_124:
    ldr r0, _LIT1
    mov r1, #0x8a
    strb r1, [r0]
.L_130:
    ldr r0, _LIT4
    mov r1, #0x82
    strb r1, [r0]
.L_13c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dbfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000246
_LIT2: .word 0x04000241
_LIT3: .word 0x04000240
_LIT4: .word 0x04000245
_LIT5: .word 0x04000244
