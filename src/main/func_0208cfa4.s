; func_0208cfa4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6304
        .extern func_0208dce4
        .global func_0208cfa4
        .arm
func_0208cfa4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0x18]
    ldrh r3, [r1]
    cmp r0, #0x0
    strh r0, [r1, #0x18]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    beq .L_90
    cmp r0, #0x100
    bne .L_a0
    ldr r3, _LIT1
    ldr r0, _LIT2
    ldr r2, [r3]
    mov r1, #0x83
    orr r2, r2, #-2147483648
    str r2, [r3]
    strb r1, [r0]
    b .L_a0
.L_90:
    ldr r1, _LIT1
    ldr r0, [r1]
    bic r0, r0, #-2147483648
    str r0, [r1]
.L_a0:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dce4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6304
_LIT1: .word 0x04001000
_LIT2: .word 0x04000249
