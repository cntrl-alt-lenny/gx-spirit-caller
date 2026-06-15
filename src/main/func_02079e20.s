; func_02079e20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02079e20
        .arm
func_02079e20:
    b .L_f20
.L_f1c:
    sub r1, r1, #0x1
.L_f20:
    cmp r1, #0x0
    beq .L_f3c
    sub r2, r1, #0x1
    mov r2, r2, lsl #0x1
    ldrh r2, [r0, r2]
    cmp r2, #0x0
    beq .L_f1c
.L_f3c:
    mov r0, r1
    bx lr
