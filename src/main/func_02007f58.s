; func_02007f58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f3c
        .extern data_02104f4c
        .extern data_0210593c
        .extern data_02105f3c
        .extern func_02007278
        .extern func_02007e8c
        .extern func_02007f38
        .extern func_0200a26c
        .extern func_0200a454
        .extern func_020138b8
        .extern func_02018be8
        .extern func_020945f4
        .global func_02007f58
        .arm
func_02007f58:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r1, #0x0
    bl func_020945f4
    bl func_02018be8
    ldr r1, _LIT2
    mov r2, #0x1
    strh r2, [r1, #0x62]
    ldr r0, _LIT3
    strh r2, [r1, #0x68]
    mov r1, #0x1f4
    str r1, [r0, #0xa70]
    bl func_02007e8c
    ldr r1, _LIT3
    and r0, r0, #0x7
    ldr r2, [r1, #0x14]
    bic r2, r2, #0x7
    orr r0, r2, r0
    str r0, [r1, #0x14]
    bl func_02007278
    ldr r0, _LIT4
    mvn r1, #0x0
    str r1, [r0, #0x858]
    bl func_020138b8
    bl func_0200a454
    mov r0, #0x2
    bl func_0200a26c
    mov r0, #0x1
    bl func_0200a26c
    mov r0, #0x0
    bl func_0200a26c
    bl func_02007f38
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104f4c
_LIT1: .word 0x00001b0c
_LIT2: .word data_0210593c
_LIT3: .word data_02104f3c
_LIT4: .word data_02105f3c
