; func_02007f3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e5c
        .extern data_02104e6c
        .extern data_0210585c
        .extern data_02105e5c
        .extern func_0200725c
        .extern func_02007e70
        .extern func_02007f1c
        .extern func_0200a250
        .extern func_0200a438
        .extern func_02013884
        .extern func_02018bb4
        .extern func_02094500
        .global func_02007f3c
        .arm
func_02007f3c:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r1, #0x0
    bl func_02094500
    bl func_02018bb4
    ldr r1, _LIT2
    mov r2, #0x1
    strh r2, [r1, #0x62]
    ldr r0, _LIT3
    strh r2, [r1, #0x68]
    mov r1, #0x1f4
    str r1, [r0, #0xa70]
    bl func_02007e70
    ldr r1, _LIT3
    and r0, r0, #0x7
    ldr r2, [r1, #0x14]
    bic r2, r2, #0x7
    orr r0, r2, r0
    str r0, [r1, #0x14]
    bl func_0200725c
    ldr r0, _LIT4
    mvn r1, #0x0
    str r1, [r0, #0x858]
    bl func_02013884
    bl func_0200a438
    mov r0, #0x2
    bl func_0200a250
    mov r0, #0x1
    bl func_0200a250
    mov r0, #0x0
    bl func_0200a250
    bl func_02007f1c
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104e6c
_LIT1: .word 0x00001b0c
_LIT2: .word data_0210585c
_LIT3: .word data_02104e5c
_LIT4: .word data_02105e5c
