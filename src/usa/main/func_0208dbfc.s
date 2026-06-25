; func_0208dbfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208dbfc
        .arm
func_0208dbfc:
    ands r1, r0, #0x1
    ldrne r1, _LIT0
    movne r2, #0x80
    strneb r2, [r1]
    ands r1, r0, #0x2
    ldrne r1, _LIT1
    movne r2, #0x80
    strneb r2, [r1]
    ands r1, r0, #0x4
    ldrne r1, _LIT2
    movne r2, #0x80
    strneb r2, [r1]
    ands r1, r0, #0x8
    ldrne r1, _LIT3
    movne r2, #0x80
    strneb r2, [r1]
    ands r1, r0, #0x10
    ldrne r1, _LIT4
    movne r2, #0x80
    strneb r2, [r1]
    ands r1, r0, #0x20
    ldrne r1, _LIT5
    movne r2, #0x80
    strneb r2, [r1]
    ands r1, r0, #0x40
    ldrne r1, _LIT6
    movne r2, #0x80
    strneb r2, [r1]
    ands r1, r0, #0x80
    ldrne r1, _LIT7
    movne r2, #0x80
    strneb r2, [r1]
    ands r0, r0, #0x100
    ldrne r0, _LIT8
    movne r1, #0x80
    strneb r1, [r0]
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
