; func_02093544 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a65f0
        .extern data_021a65f4
        .extern func_020904f4
        .extern func_02092f9c
        .global func_02093544
        .arm
func_02093544:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldrh r0, [r1]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    mov r0, #0x1
    strh r0, [r1]
    bl func_02092f9c
    ldr r1, _LIT1
    mov r2, #0x0
    mov r0, #0x10
    str r2, [r1]
    str r2, [r1, #0x4]
    bl func_020904f4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a65f0
_LIT1: .word data_021a65f4
