; func_0208d050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d050
        .arm
func_0208d050:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0x12]
    ldrh r3, [r1]
    cmp r0, #0x80
    strh r0, [r1, #0x12]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    bgt .L_64
    cmp r0, #0x80
    bge .L_78
    cmp r0, #0x4
    bgt .L_84
    cmp r0, #0x0
    blt .L_84
    cmp r0, #0x0
    beq .L_84
    cmp r0, #0x4
    ldreq r0, _LIT1
    moveq r1, #0x84
    streqb r1, [r0]
    b .L_84
.L_64:
    cmp r0, #0x180
    bne .L_84
    ldr r0, _LIT2
    mov r1, #0x81
    strb r1, [r0]
.L_78:
    ldr r0, _LIT3
    mov r1, #0x81
    strb r1, [r0]
.L_84:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dbfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000242
_LIT2: .word 0x04000249
_LIT3: .word 0x04000248
