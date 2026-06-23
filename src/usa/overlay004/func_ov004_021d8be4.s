; func_ov004_021d8be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov004_021d8be4
        .arm
func_ov004_021d8be4:
    ldr r1, [r0, #0x18]
    and r1, r1, #0xf
    cmp r1, #0x1
    movne r1, #0x3
    strne r1, [r0]
    bxne lr
    mov r1, #0x0
    str r1, [r0]
    ldr r3, [r0, #0xc]
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r3, r1, r3, lsl #0x10
    str r3, [r2]
    ldr r0, [r0, #0xc]
    and r0, r1, r0, lsl #0x10
    str r0, [r2, #0x4]
    bx lr
_LIT0: .word 0x01ff0000
_LIT1: .word 0x04001010
