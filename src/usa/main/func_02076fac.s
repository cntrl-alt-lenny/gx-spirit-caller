; func_02076fac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02076fac
        .arm
func_02076fac:
    mov r2, r0
    b .L_c
.L_8:
    add r0, r0, #0x1
.L_c:
    ldrsb r1, [r0]
    cmp r1, #0x2e
    beq .L_20
    cmp r1, #0x0
    bne .L_8
.L_20:
    sub r0, r0, r2
    bx lr
