; func_0208d60c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d60c
        .arm
func_0208d60c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0x10]
    ldrh r3, [r1]
    cmp r0, #0x0
    strh r0, [r1, #0x10]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    beq .L_574
    cmp r0, #0x20
    beq .L_534
    cmp r0, #0x40
    beq .L_554
    b .L_584
.L_534:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, _LIT1
    orr r1, r1, #-2147483648
    str r1, [r2]
    mov r1, #0x85
    strb r1, [r0]
    b .L_584
.L_554:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, _LIT2
    orr r1, r1, #-2147483648
    str r1, [r2]
    mov r1, #0x85
    strb r1, [r0]
    b .L_584
.L_574:
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #-2147483648
    str r0, [r1]
.L_584:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dbfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000245
_LIT2: .word 0x04000246
