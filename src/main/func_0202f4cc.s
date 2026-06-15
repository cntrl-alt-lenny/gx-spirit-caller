; func_0202f4cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f4cc
        .arm
func_0202f4cc:
    sub r0, r0, #0xaa
    sub r0, r0, #0x1a00
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_c8
    b .L_c0
    b .L_c0
    b .L_c0
    b .L_c0
.L_c0:
    mov r0, #0x1
    bx lr
.L_c8:
    mov r0, #0x0
    bx lr
