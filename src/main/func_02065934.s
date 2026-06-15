; func_02065934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021015d8
        .extern data_0219e434
        .extern func_02065974
        .extern func_020a9764
        .global func_02065934
        .arm
func_02065934:
    stmfd sp!, {lr}
    sub sp, sp, #0x84
    cmp r0, #0x0
    bne .L_bb0
    ldr r2, _LIT0
    str r1, [sp]
    ldr r3, _LIT1
    add r0, sp, #0x4
    mov r1, #0x80
    bl func_020a9764
    add r0, sp, #0x4
.L_bb0:
    bl func_02065974
    add sp, sp, #0x84
    ldmfd sp!, {pc}
_LIT0: .word data_021015d8
_LIT1: .word data_0219e434
