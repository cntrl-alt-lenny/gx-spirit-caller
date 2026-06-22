; func_020726f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020726f4
        .arm
func_020726f4:
    cmp r0, #0x0
    beq .L_3c0
    mvn r2, #0x0
    cmp r0, r2
    beq .L_3c0
    cmp r1, #0x0
    beq .L_3c0
    cmp r1, r2
    movne r0, #0x1
    bxne lr
.L_3c0:
    mov r0, #0x0
    bx lr
