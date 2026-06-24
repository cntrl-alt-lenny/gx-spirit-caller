; func_020552bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffaf8
        .extern data_020ffb18
        .extern func_02092fc8
        .extern func_02093100
        .extern func_020a6c60
        .extern func_020b3714
        .global func_020552bc
        .arm
func_020552bc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02093100
    cmp r0, #0x1
    beq .L_28
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
.L_28:
    bl func_02092fc8
    mov r1, r1, lsl #0x6
    orr r1, r1, r0, lsr #0x1a
    ldr r2, _LIT3
    mov r0, r0, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffaf8
_LIT1: .word data_020ffb18
_LIT2: .word 0x00000109
_LIT3: .word 0x000082ea
