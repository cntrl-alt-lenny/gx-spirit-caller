; func_02082198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a18b8
        .extern data_021a1904
        .extern data_021a19b8
        .extern func_0208b54c
        .global func_02082198
        .arm
func_02082198:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0xfc]
    ands r0, r0, #0x8
    bne .L_94
    ldr r0, _LIT1
    ldr r1, _LIT2
    bl func_0208b54c
    ldr r0, _LIT0
    ldr r1, [r0, #0xfc]
    orr r1, r1, #0x8
    str r1, [r0, #0xfc]
.L_94:
    ldr r0, _LIT2
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_021a18b8
_LIT1: .word data_021a1904
_LIT2: .word data_021a19b8
