; func_02055330 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffbd8
        .extern data_020ffbf8
        .extern func_020930b0
        .extern func_020931e8
        .extern func_020a6d54
        .extern func_020b3808
        .global func_02055330
        .arm
func_02055330:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_020931e8
    cmp r0, #0x1
    beq .L_28
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_28:
    bl func_020930b0
    mov r1, r1, lsl #0x6
    orr r1, r1, r0, lsr #0x1a
    ldr r2, _LIT3
    mov r0, r0, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffbd8
_LIT1: .word data_020ffbf8
_LIT2: .word 0x00000109
_LIT3: .word 0x000082ea
