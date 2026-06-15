; func_0208d0bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6304
        .extern func_0208dce4
        .global func_0208d0bc
        .arm
func_0208d0bc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0x14]
    ldrh r3, [r1]
    cmp r0, #0x0
    strh r0, [r1, #0x14]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    beq .L_1a8
    cmp r0, #0x8
    beq .L_19c
    cmp r0, #0x100
    ldreq r0, _LIT1
    moveq r1, #0x82
    streqb r1, [r0]
    b .L_1a8
.L_19c:
    ldr r0, _LIT2
    mov r1, #0x84
    strb r1, [r0]
.L_1a8:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dce4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6304
_LIT1: .word 0x04000249
_LIT2: .word 0x04000243
