; func_0205272c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa98
        .extern func_02094688
        .extern func_020a7440
        .global func_0205272c
        .arm
func_0205272c:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    add r1, sp, #0x0
    mov r2, #0x8
    bl func_02094688
    ldr r1, _LIT0
    add r0, sp, #0x6
    mov r2, #0x2
    bl func_020a7440
    cmp r0, #0x0
    ldreqh r0, [sp, #0x4]
    movne r0, #0x0
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_020ffa98
