; func_0208c8cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102498
        .extern data_021a6300
        .global func_0208c8cc
        .arm
func_0208c8cc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    mov lr, #0x4000000
    ldrh ip, [r3]
    ldr lr, [lr]
    ldr r3, _LIT1
    cmp ip, #0x0
    strh r0, [r3]
    ldr r3, _LIT2
    moveq r0, #0x0
    and r3, lr, r3
    orr r0, r3, r0, lsl #0x10
    orr r0, r1, r0
    orr r1, r0, r2, lsl #0x3
    mov ip, #0x4000000
    ldr r0, _LIT1
    str r1, [ip]
    ldrh r0, [r0]
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streqh r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_02102498
_LIT1: .word data_021a6300
_LIT2: .word 0xfff0fff0
