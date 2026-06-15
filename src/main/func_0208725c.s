; func_0208725c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a482c
        .extern data_021a4830
        .extern data_021a4834
        .extern data_021a4838
        .extern data_021a4844
        .extern func_02087168
        .extern func_02087174
        .extern func_020872fc
        .extern func_02087c34
        .extern func_02088d5c
        .extern func_020952f8
        .extern func_0209a824
        .extern func_0209a83c
        .global func_0208725c
        .arm
func_0208725c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    mov r1, #0x1
    str r1, [r0]
    bl func_020952f8
    ldr ip, _LIT1
    ldr r0, _LIT2
    mov r3, #0x0
    ldr r1, _LIT3
    ldr r2, _LIT4
    str ip, [r0]
    str r3, [r0, #0x4]
    str r2, [r1]
    str r3, [r1, #0x4]
    bl func_0209a83c
    ldr r0, _LIT3
    bl func_0209a824
    bl func_020872fc
    bl func_02088d5c
    bl func_02087c34
    ldr r1, _LIT5
    mvn r3, #0x0
    ldr r0, _LIT6
    mov r2, #0x1
    strb r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a4834
_LIT1: .word func_02087174
_LIT2: .word data_021a4838
_LIT3: .word data_021a4844
_LIT4: .word func_02087168
_LIT5: .word data_021a482c
_LIT6: .word data_021a4830
