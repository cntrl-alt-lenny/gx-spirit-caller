; func_0208cc7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a621c
        .extern func_02093950
        .global func_0208cc7c
        .arm
func_0208cc7c:
    stmdb sp!, {r4, lr}
    ldrh r4, [r0]
    mov r1, #0x0
    strh r1, [r0]
    ands r0, r4, #0x1
    ldrne r0, _LIT0
    strneb r1, [r0]
    ands r0, r4, #0x2
    ldrne r0, _LIT1
    movne r1, #0x0
    strneb r1, [r0]
    ands r0, r4, #0x4
    ldrne r0, _LIT2
    movne r1, #0x0
    strneb r1, [r0]
    ands r0, r4, #0x8
    ldrne r0, _LIT3
    movne r1, #0x0
    strneb r1, [r0]
    ands r0, r4, #0x10
    ldrne r0, _LIT4
    movne r1, #0x0
    strneb r1, [r0]
    ands r0, r4, #0x20
    ldrne r0, _LIT5
    movne r1, #0x0
    strneb r1, [r0]
    ands r0, r4, #0x40
    ldrne r0, _LIT6
    movne r1, #0x0
    strneb r1, [r0]
    ands r0, r4, #0x80
    ldrne r0, _LIT7
    movne r1, #0x0
    strneb r1, [r0]
    ands r0, r4, #0x100
    ldrne r0, _LIT8
    movne r1, #0x0
    strneb r1, [r0]
    ldr r1, _LIT9
    mov r0, r4, lsl #0x10
    ldrh r1, [r1]
    mov r0, r0, lsr #0x10
    bl func_02093950
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x04000240
_LIT1: .word 0x04000241
_LIT2: .word 0x04000242
_LIT3: .word 0x04000243
_LIT4: .word 0x04000244
_LIT5: .word 0x04000245
_LIT6: .word 0x04000246
_LIT7: .word 0x04000248
_LIT8: .word 0x04000249
_LIT9: .word data_021a621c
