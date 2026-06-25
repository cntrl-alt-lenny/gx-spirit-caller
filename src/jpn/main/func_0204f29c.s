; func_0204f29c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff894
        .extern data_020ff8a0
        .extern data_020ff8c0
        .extern data_020ff8cc
        .extern data_020ff8d8
        .extern func_0204987c
        .extern func_0204f34c
        .extern func_020677dc
        .global func_0204f29c
        .arm
func_0204f29c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r0, #0x0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0204f34c
    bl func_0204987c
    strb r7, [r0, #0x15]
    bl func_0204987c
    strb r6, [r0, #0x16]
    bl func_0204987c
    str r5, [r0, #0x45c]
    bl func_0204987c
    str r4, [r0, #0x460]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x175]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x2c8]
    mov r0, #0x32
    ldr r1, _LIT0
    bl func_020677dc
    mov r0, #0x33
    ldr r1, _LIT1
    bl func_020677dc
    mov r0, #0x34
    ldr r1, _LIT2
    bl func_020677dc
    mov r0, #0x35
    ldr r1, _LIT3
    bl func_020677dc
    mov r0, #0x36
    ldr r1, _LIT4
    bl func_020677dc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff8a0
_LIT1: .word data_020ff8c0
_LIT2: .word data_020ff8cc
_LIT3: .word data_020ff8d8
_LIT4: .word data_020ff894
