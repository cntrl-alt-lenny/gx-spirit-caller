; func_ov002_022bda08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022bda08
        .arm
func_ov002_022bda08:
    mov r2, #0x0
    mov r3, r0
    mov r1, r2
.L_c:
    str r1, [r3]
    add r2, r2, #0x1
    str r1, [r3, #0x4]
    cmp r2, #0x10
    add r3, r3, #0x8
    blt .L_c
    str r1, [r0, #0x80]
    bx lr
