; func_0207c9f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a0890
        .extern data_021a0894
        .extern func_0207afbc
        .extern func_02091a0c
        .global func_0207c9f0
        .arm
func_0207c9f0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh r1, [r0]
    cmp r1, #0x12
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldrh r2, [r0, #0x2]
    ldr r1, _LIT0
    str r2, [r1, #0x24]
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    bne .L_38
    bl func_0207afbc
.L_38:
    ldr r0, _LIT1
    bl func_02091a0c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a0890
_LIT1: .word data_021a0894
