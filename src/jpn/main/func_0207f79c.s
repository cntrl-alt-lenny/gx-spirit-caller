; func_0207f79c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207f79c
        .arm
func_0207f79c:
    mov r2, #0x0
    mvn r1, #0x0
.L_8:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x3
    blt .L_8
    bx lr
