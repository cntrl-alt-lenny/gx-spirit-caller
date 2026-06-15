; func_020a6afc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a6afc
        .arm
func_020a6afc:
    ldrsb r2, [r1]
    mov r3, r0
    cmp r2, #0x0
    beq .L_120
.L_10c:
    ldrsb r2, [r1]
    strb r2, [r0], #0x1
    ldrsb r2, [r1, #0x1]!
    cmp r2, #0x0
    bne .L_10c
.L_120:
    mov r1, #0x0
    strb r1, [r0]
    mov r0, r3
    bx lr
