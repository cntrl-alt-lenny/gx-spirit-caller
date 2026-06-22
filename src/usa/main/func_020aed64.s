; func_020aed64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aed64
        .arm
func_020aed64:
    mov r3, r0
.L_4:
    ldrh r2, [r1], #0x2
    mov ip, r3
    strh r2, [r3], #0x2
    ldrh r2, [ip]
    cmp r2, #0x0
    bne .L_4
    bx lr
