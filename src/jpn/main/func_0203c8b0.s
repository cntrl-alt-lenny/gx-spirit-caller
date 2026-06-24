; func_0203c8b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d8d8
        .extern data_0219d8dc
        .extern data_0219d8e0
        .extern data_0219d8e4
        .extern data_0219d8e8
        .global func_0203c8b0
        .arm
func_0203c8b0:
    ands r1, r0, #0x1
    ldrne r0, _LIT0
    ldrne r0, [r0]
    bxne lr
    ands r1, r0, #0x2
    ldrne r0, _LIT1
    ldrne r0, [r0]
    bxne lr
    ands r1, r0, #0x4
    ldrne r0, _LIT2
    ldrne r0, [r0]
    bxne lr
    ands r1, r0, #0x8
    ldrne r0, _LIT3
    ldrne r0, [r0]
    bxne lr
    ands r0, r0, #0x10
    ldrne r0, _LIT4
    ldrne r0, [r0]
    moveq r0, #0x0
    bx lr
_LIT0: .word data_0219d8e8
_LIT1: .word data_0219d8dc
_LIT2: .word data_0219d8e0
_LIT3: .word data_0219d8e4
_LIT4: .word data_0219d8d8
