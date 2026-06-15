; func_02091c44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern data_021a63c8
        .extern func_02091be4
        .global func_02091c44
        .arm
func_02091c44:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r1, [r1]
    ldr r3, [r1]
    ldr r2, [r3, #0xb4]
    cmp r2, #0x0
    beq .L_118
    mov r1, #0x0
    str r1, [r3, #0xb4]
    blx r2
    bl OS_DisableIrq
.L_118:
    bl func_02091be4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a63c8
