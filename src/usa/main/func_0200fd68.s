; func_0200fd68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218dae8
        .global func_0200fd68
        .arm
func_0200fd68:
    ldr r1, _LIT0
    ldr r1, [r1, #0x910]
    cmp r1, #0x0
    beq .L_29c
    ldr r2, [r0]
.L_280:
    ldr r0, [r1, #0x8]
    cmp r0, r2
    moveq r0, r1
    bxeq lr
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_280
.L_29c:
    mov r0, #0x0
    bx lr
_LIT0: .word data_0218dae8
