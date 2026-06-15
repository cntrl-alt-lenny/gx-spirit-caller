; func_0208d204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6304
        .extern func_0208dce4
        .global func_0208d204
        .arm
func_0208d204:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0x6]
    ldrh r3, [r1]
    cmp r0, #0x8
    strh r0, [r1, #0x6]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    bgt .L_64
    cmp r0, #0x8
    bge .L_88
    cmp r0, #0x4
    bgt .L_94
    cmp r0, #0x0
    blt .L_94
    cmp r0, #0x0
    beq .L_94
    cmp r0, #0x4
    ldreq r0, _LIT1
    moveq r1, #0x82
    streqb r1, [r0]
    b .L_94
.L_64:
    cmp r0, #0xc
    bne .L_94
    ldr r1, _LIT2
    mov r2, #0x8a
    strb r2, [r1]
    ldr r0, _LIT1
    mov r1, #0x82
    strb r1, [r0]
    b .L_94
.L_88:
    ldr r0, _LIT2
    mov r1, #0x82
    strb r1, [r0]
.L_94:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dce4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6304
_LIT1: .word 0x04000242
_LIT2: .word 0x04000243
