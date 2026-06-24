; func_0202adc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c689c
        .extern data_020c68b0
        .extern data_020c68c4
        .extern data_020c68e0
        .extern data_020c68f4
        .extern data_020c6908
        .extern data_020c691c
        .extern data_020c6930
        .extern data_0219a85c
        .extern func_02006bf0
        .extern func_0202aeec
        .global func_0202adc8
        .arm
func_0202adc8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202aeec
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x30]
    ldr r0, _LIT2
    bl func_02006bf0
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x34]
    ldr r0, _LIT3
    bl func_02006bf0
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
    bl func_02006bf0
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x8]
    ldr r0, _LIT5
    bl func_02006bf0
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x4]
    ldr r0, _LIT6
    bl func_02006bf0
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0xc]
    ldr r0, _LIT7
    bl func_02006bf0
    ldr r2, _LIT1
    mov r1, #0x4
    ldr r3, [r2]
    mov r2, #0x0
    str r0, [r3, #0x10]
    ldr r0, _LIT8
    bl func_02006bf0
    ldr r1, _LIT1
    ldr r1, [r1]
    str r0, [r1, #0x14]
    ldmia sp!, {r4, pc}
_LIT0: .word data_020c689c
_LIT1: .word data_0219a85c
_LIT2: .word data_020c68b0
_LIT3: .word data_020c68c4
_LIT4: .word data_020c68e0
_LIT5: .word data_020c68f4
_LIT6: .word data_020c6908
_LIT7: .word data_020c691c
_LIT8: .word data_020c6930
