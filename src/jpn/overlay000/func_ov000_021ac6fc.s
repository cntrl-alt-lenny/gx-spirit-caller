; func_ov000_021ac6fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ac6fc
        .arm
func_ov000_021ac6fc:
    mov r2, #0x0
    cmp r0, #0x0
    moveq r0, r2
    bxeq lr
    ldrsb r1, [r0], #0x1
    cmp r1, #0x0
    beq .L_2c
.L_1c:
    ldrsb r1, [r0], #0x1
    add r2, r2, #0x1
    cmp r1, #0x0
    bne .L_1c
.L_2c:
    mov r0, r2
    bx lr
