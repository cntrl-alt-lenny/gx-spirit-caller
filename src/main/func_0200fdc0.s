; func_0200fdc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218dbc8
        .global func_0200fdc0
        .arm
func_0200fdc0:
    ldr r1, _LIT0
    ldr r1, [r1, #0x910]
    cmp r1, #0x0
    beq .L_30
    ldr r2, [r0, #0x8]
.L_14:
    ldr r0, [r1, #0xc]
    cmp r2, r0, lsr #0xc
    moveq r0, r1
    bxeq lr
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_14
.L_30:
    mov r0, #0x0
    bx lr
_LIT0: .word data_0218dbc8
