; func_020a6a08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a6a08
        .arm
func_020a6a08:
    ldrsb r2, [r1]
    mov r3, r0
    cmp r2, #0x0
    beq .L_f8
.L_e4:
    ldrsb r2, [r1]
    strb r2, [r0], #0x1
    ldrsb r2, [r1, #0x1]!
    cmp r2, #0x0
    bne .L_e4
.L_f8:
    mov r1, #0x0
    strb r1, [r0]
    mov r0, r3
    bx lr
