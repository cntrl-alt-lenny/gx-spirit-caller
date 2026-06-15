; func_020459c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020459c4
        .arm
func_020459c4:
    ldrh r1, [r0]
    mov r2, #0x0
    cmp r1, #0x0
    beq .L_24
.L_10:
    add r2, r2, #0x1
    mov r1, r2, lsl #0x1
    ldrh r1, [r0, r1]
    cmp r1, #0x0
    bne .L_10
.L_24:
    mov r0, r2
    bx lr
