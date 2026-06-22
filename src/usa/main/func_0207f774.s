; func_0207f774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207f774
        .arm
func_0207f774:
    mov r3, #0x0
    mvn r2, #0x0
.L_8:
    add r1, r0, r3, lsl #0x2
    add r3, r3, #0x1
    str r2, [r1, #0x8]
    cmp r3, #0x3
    blt .L_8
    bx lr
