; func_0200fda4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218dae8
        .global func_0200fda4
        .arm
func_0200fda4:
    ldr r1, _LIT0
    ldr r1, [r1, #0x910]
    cmp r1, #0x0
    beq .L_2d8
    ldr r2, [r0, #0x8]
.L_2bc:
    ldr r0, [r1, #0xc]
    cmp r2, r0, lsr #0xc
    moveq r0, r1
    bxeq lr
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_2bc
.L_2d8:
    mov r0, #0x0
    bx lr
_LIT0: .word data_0218dae8
