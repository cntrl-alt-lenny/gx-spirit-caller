; func_020920bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a63d0
        .global func_020920bc
        .arm
func_020920bc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov ip, #0x0
    ldr r3, [r1, #0x8]
    mov lr, r3
    b .L_3bc
.L_3b4:
    mov ip, lr
    ldr lr, [lr, #0x68]
.L_3bc:
    cmp lr, #0x0
    beq .L_3d4
    ldr r2, [lr, #0x70]
    ldr r1, [r0, #0x70]
    cmp r2, r1
    bcc .L_3b4
.L_3d4:
    cmp ip, #0x0
    ldreq r1, _LIT0
    streq r3, [r0, #0x68]
    streq r0, [r1, #0x8]
    ldrne r1, [ip, #0x68]
    strne r1, [r0, #0x68]
    strne r0, [ip, #0x68]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a63d0
