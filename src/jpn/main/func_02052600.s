; func_02052600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e30c
        .extern func_02094500
        .global func_02052600
        .arm
func_02052600:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    ldr r2, _LIT1
    mov r1, #0x0
    str r0, [r3]
    bl func_02094500
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0]
    add r0, r0, #0x600
    strh r1, [r0, #0x10]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219e30c
_LIT1: .word 0x00000614
_LIT2: .word 0x000005b9
