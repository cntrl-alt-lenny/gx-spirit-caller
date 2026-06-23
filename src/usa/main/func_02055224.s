; func_02055224 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3560
        .global func_02055224
        .arm
func_02055224:
    ldrsb r3, [r0]
    mov r2, r0
    cmp r3, #0x0
    beq .L_2a0
    ldr r1, _LIT0
.L_27c:
    cmp r3, #0x0
    blt .L_290
    cmp r3, #0x80
    bge .L_290
    ldrb r3, [r1, r3]
.L_290:
    strb r3, [r0]
    ldrsb r3, [r0, #0x1]!
    cmp r3, #0x0
    bne .L_27c
.L_2a0:
    mov r0, r2
    bx lr
_LIT0: .word data_020c3560
