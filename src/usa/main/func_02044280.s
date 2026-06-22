; func_02044280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02044280
        .arm
func_02044280:
    mov r2, #0x0
.L_85c:
    ldrb r1, [r0, r2]
    cmp r1, #0x0
    movne r0, #0x1
    bxne lr
    add r2, r2, #0x1
    cmp r2, #0x20
    blt .L_85c
    mov r0, #0x0
    bx lr
