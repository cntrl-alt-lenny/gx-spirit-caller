; func_02093110 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a65e0
        .extern data_021a65e4
        .extern data_021a65e8
        .extern func_0209053c
        .extern func_020906cc
        .extern func_02092f9c
        .extern func_02093078
        .global func_02093110
        .arm
func_02093110:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldrh r0, [r1]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    mov r2, #0x1
    mov r0, #0x0
    strh r2, [r1]
    bl func_02092f9c
    ldr r0, _LIT1
    mov r2, #0x0
    str r2, [r0]
    ldr r3, _LIT2
    str r2, [r0, #0x4]
    ldr r0, _LIT3
    strh r2, [r3]
    ldr r1, _LIT4
    strh r2, [r0]
    mov r2, #0xc1
    mov r0, #0x8
    strh r2, [r3]
    bl func_020906cc
    mov r0, #0x8
    bl func_0209053c
    ldr r0, _LIT5
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a65e0
_LIT1: .word data_021a65e8
_LIT2: .word 0x04000102
_LIT3: .word 0x04000100
_LIT4: .word func_02093078
_LIT5: .word data_021a65e4
