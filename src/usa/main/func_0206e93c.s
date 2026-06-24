; func_0206e93c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206e93c
        .arm
func_0206e93c:
    cmp r0, #0x0
    mvneq r0, #0x0
    bxeq lr
    cmp r1, #0x3
    beq .L_20
    cmp r1, #0x4
    beq .L_34
    b .L_48
.L_20:
    ldrsb r0, [r0, #0x72]
    cmp r0, #0x1
    moveq r0, #0x0
    movne r0, #0x4
    bx lr
.L_34:
    ands r1, r2, #0x4
    movne r1, #0x0
    strneb r1, [r0, #0x72]
    moveq r1, #0x1
    streqb r1, [r0, #0x72]
.L_48:
    mov r0, #0x0
    bx lr
