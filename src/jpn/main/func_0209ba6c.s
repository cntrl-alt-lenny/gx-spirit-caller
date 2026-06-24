; func_0209ba6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8358
        .extern func_0209b440
        .extern func_0209b458
        .extern func_0209bab0
        .global func_0209ba6c
        .arm
func_0209ba6c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r2, #0x0
    bl func_0209bab0
    ldr r1, _LIT1
    cmp r0, #0x0
    str r0, [r1, #0x20]
    bne .L_62c
    bl func_0209b440
.L_62c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x20]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word func_0209b458
_LIT1: .word data_021a8358
