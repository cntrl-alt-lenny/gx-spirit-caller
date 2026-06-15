; func_0202ae1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c697c
        .extern data_020c6990
        .extern data_020c69a4
        .extern data_020c69c0
        .extern data_020c69d4
        .extern data_020c69e8
        .extern data_020c69fc
        .extern data_020c6a10
        .extern data_0219a93c
        .extern func_02006c0c
        .extern func_0202af40
        .global func_0202ae1c
        .arm
func_0202ae1c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202af40
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x30]
    ldr r0, _LIT2
    bl func_02006c0c
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x34]
    ldr r0, _LIT3
    bl func_02006c0c
    ldr r1, _LIT1
    cmp r4, #0x0
    ldr r2, [r1]
    str r0, [r2, #0x2c]
    ldmltia sp!, {r4, pc}
    ldr r3, [r1]
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    str r4, [r3]
    bl func_02006c0c
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x8]
    ldr r0, _LIT5
    bl func_02006c0c
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x4]
    ldr r0, _LIT6
    bl func_02006c0c
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0xc]
    ldr r0, _LIT7
    bl func_02006c0c
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x10]
    ldr r0, _LIT8
    bl func_02006c0c
    ldr r1, _LIT1
    ldr r1, [r1]
    str r0, [r1, #0x14]
    ldmia sp!, {r4, pc}
_LIT0: .word data_020c697c
_LIT1: .word data_0219a93c
_LIT2: .word data_020c6990
_LIT3: .word data_020c69a4
_LIT4: .word data_020c69c0
_LIT5: .word data_020c69d4
_LIT6: .word data_020c69e8
_LIT7: .word data_020c69fc
_LIT8: .word data_020c6a10
