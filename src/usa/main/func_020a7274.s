; func_020a7274 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a7274
        .arm
func_020a7274:
    mov ip, r0
    cmp r2, #0x0
    bxeq lr
.L_10c:
    ldrsb r3, [r1], #0x1
    subs r2, r2, #0x1
    strb r3, [ip], #0x1
    bne .L_10c
    bx lr
