; func_020a690c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a690c
        .arm
func_020a690c:
    ldrsb r1, [r0]
    mov r2, #0x0
    cmp r1, #0x0
    beq .L_20
.L_10:
    add r2, r2, #0x1
    ldrsb r1, [r0, r2]
    cmp r1, #0x0
    bne .L_10
.L_20:
    mov r0, r2
    bx lr
