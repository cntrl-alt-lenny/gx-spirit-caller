; func_02082208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a17d8
        .extern func_02084d24
        .global func_02082208
        .arm
func_02082208:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r2, #0x3e
    ldr r0, [r1], #0x4
    bl func_02084d24
    ldr r0, _LIT0
    ldr r1, [r0, #0xfc]
    bic r1, r1, #0x1
    str r1, [r0, #0xfc]
    bic r1, r1, #0x2
    str r1, [r0, #0xfc]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a17d8
