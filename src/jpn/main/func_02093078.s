; func_02093078 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a65e4
        .extern data_021a65e8
        .extern func_020905a8
        .extern func_02093078
        .global func_02093078
        .arm
func_02093078:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr ip, [r2]
    mov r0, #0x1
    ldr r3, [r2, #0x4]
    adds ip, ip, r0
    ldr r0, [r1]
    adc r3, r3, #0x0
    str ip, [r2]
    str r3, [r2, #0x4]
    cmp r0, #0x0
    mov r3, #0x0
    beq .L_108
    ldr r2, _LIT2
    ldr r0, _LIT3
    strh r3, [r2]
    strh r3, [r0]
    mov r0, #0xc1
    strh r0, [r2]
    str r3, [r1]
.L_108:
    mov r0, #0x0
    ldr r1, _LIT4
    mov r2, r0
    bl func_020905a8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a65e8
_LIT1: .word data_021a65e4
_LIT2: .word 0x04000102
_LIT3: .word 0x04000100
_LIT4: .word func_02093078
