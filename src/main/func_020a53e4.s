; func_020a53e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021026ec
        .extern data_021026f0
        .extern data_021026f4
        .extern data_021026f8
        .extern func_0209e8d0
        .extern func_020a06b0
        .extern func_020a35dc
        .extern func_020a4b6c
        .global func_020a53e4
        .arm
func_020a53e4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    bl func_0209e8d0
    mov r1, r0
    mov r0, #0x80
    bl func_020a35dc
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldrh r3, [r0]
    ldr r2, _LIT3
    ldr r0, _LIT4
    str r3, [sp]
    ldrh r1, [r1]
    ldrh r2, [r2]
    ldrh r3, [r0]
    ldr r0, _LIT0
    bl func_020a06b0
    mov r1, r0
    mov r0, #0x1d
    bl func_020a35dc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word func_020a4b6c
_LIT1: .word data_021026f4
_LIT2: .word data_021026f8
_LIT3: .word data_021026f0
_LIT4: .word data_021026ec
