; func_020070c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020070c0
        .arm
func_020070c0:
    ldrsb r1, [r0], #0x1
    mov r2, #0x0
    cmp r1, #0x0
    beq .L_2d4
.L_2c4:
    ldrsb r1, [r0], #0x1
    add r2, r2, #0x1
    cmp r1, #0x0
    bne .L_2c4
.L_2d4:
    mov r0, r2
    bx lr
