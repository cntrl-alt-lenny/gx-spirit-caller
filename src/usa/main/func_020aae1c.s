; func_020aae1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aae1c
        .arm
func_020aae1c:
    mov r3, r0
.L_11c:
    ldrsb r2, [r3], #0x1
    cmp r2, #0x0
    bne .L_11c
    sub r3, r3, #0x1
.L_12c:
    ldrsb r2, [r1], #0x1
    mov ip, r3
    strb r2, [r3], #0x1
    ldrsb r2, [ip]
    cmp r2, #0x0
    bne .L_12c
    bx lr
