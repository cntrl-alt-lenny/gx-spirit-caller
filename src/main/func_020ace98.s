; func_020ace98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020ace98
        .arm
func_020ace98:
    cmp r2, #0x0
    beq .L_20
.L_8:
    ldrh r3, [r0]
    cmp r3, r1
    bxeq lr
    add r0, r0, #0x2
    subs r2, r2, #0x1
    bne .L_8
.L_20:
    mov r0, #0x0
    bx lr
