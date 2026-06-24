; func_020658c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014f8
        .extern data_0219e354
        .extern func_02065900
        .extern func_020a9670
        .global func_020658c0
        .arm
func_020658c0:
    stmfd sp!, {lr}
    sub sp, sp, #0x84
    cmp r0, #0x0
    bne .L_1a0
    ldr r2, _LIT0
    str r1, [sp]
    ldr r3, _LIT1
    add r0, sp, #0x4
    mov r1, #0x80
    bl func_020a9670
    add r0, sp, #0x4
.L_1a0:
    bl func_02065900
    add sp, sp, #0x84
    ldmfd sp!, {pc}
_LIT0: .word data_021014f8
_LIT1: .word data_0219e354
