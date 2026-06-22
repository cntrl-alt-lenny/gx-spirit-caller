; func_020aed48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aed48
        .arm
func_020aed48:
    mvn r2, #0x0
.L_1fa8:
    ldrh r1, [r0], #0x2
    add r2, r2, #0x1
    cmp r1, #0x0
    bne .L_1fa8
    mov r0, r2
    bx lr
