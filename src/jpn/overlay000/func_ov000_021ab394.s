; func_ov000_021ab394 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ab394
        .arm
func_ov000_021ab394:
    cmp r0, #0x0
    beq .L_230
    cmp r0, #0x1
    beq .L_248
    bx lr
.L_230:
    mov r2, #0x4000000
    ldr r0, [r2]
    bic r0, r0, #0xe000
    orr r0, r0, r1, lsl #0xd
    str r0, [r2]
    bx lr
.L_248:
    ldr r2, _LIT0
    ldr r0, [r2]
    bic r0, r0, #0xe000
    orr r0, r0, r1, lsl #0xd
    str r0, [r2]
    bx lr
_LIT0: .word 0x04001000
