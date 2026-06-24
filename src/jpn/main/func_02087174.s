; func_02087174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a474c
        .extern data_021a4750
        .extern data_021a4754
        .extern data_021a4758
        .extern data_021a4764
        .extern func_02087080
        .extern func_0208708c
        .extern func_02087214
        .extern func_02087b4c
        .extern func_02088c74
        .extern func_02095204
        .extern func_0209a730
        .extern func_0209a748
        .global func_02087174
        .arm
func_02087174:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    mov r1, #0x1
    str r1, [r0]
    bl func_02095204
    ldr ip, _LIT1
    ldr r0, _LIT2
    mov r3, #0x0
    ldr r1, _LIT3
    ldr r2, _LIT4
    str ip, [r0]
    str r3, [r0, #0x4]
    str r2, [r1]
    str r3, [r1, #0x4]
    bl func_0209a748
    ldr r0, _LIT3
    bl func_0209a730
    bl func_02087214
    bl func_02088c74
    bl func_02087b4c
    ldr r1, _LIT5
    mvn r3, #0x0
    ldr r0, _LIT6
    mov r2, #0x1
    strb r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a4754
_LIT1: .word func_0208708c
_LIT2: .word data_021a4758
_LIT3: .word data_021a4764
_LIT4: .word func_02087080
_LIT5: .word data_021a474c
_LIT6: .word data_021a4750
