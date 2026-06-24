; func_020a52f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210260c
        .extern data_02102610
        .extern data_02102614
        .extern data_02102618
        .extern func_0209e7dc
        .extern func_020a05bc
        .extern func_020a34e8
        .extern func_020a4a78
        .global func_020a52f0
        .arm
func_020a52f0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    bl func_0209e7dc
    mov r1, r0
    mov r0, #0x80
    bl func_020a34e8
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
    bl func_020a05bc
    mov r1, r0
    mov r0, #0x1d
    bl func_020a34e8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word func_020a4a78
_LIT1: .word data_02102614
_LIT2: .word data_02102618
_LIT3: .word data_02102610
_LIT4: .word data_0210260c
