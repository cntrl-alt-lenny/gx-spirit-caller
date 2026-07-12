; func_ov000_021ab7d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ab7d4
        .arm
func_ov000_021ab7d4:
    cmp r0, #0x0
    beq .L_1dc
    cmp r0, #0x1
    beq .L_1f0
    bx lr
.L_1dc:
    ldr r1, _LIT0
    ldrh r0, [r1]
    bic r0, r0, #0xc0
    strh r0, [r1]
    bx lr
.L_1f0:
    ldr r1, _LIT1
    ldrh r0, [r1]
    bic r0, r0, #0xc0
    strh r0, [r1]
    bx lr
_LIT0: .word 0x04000050
_LIT1: .word 0x04001050
