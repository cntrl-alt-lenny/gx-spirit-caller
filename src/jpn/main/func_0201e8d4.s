; func_0201e8d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0201e8d4
        .arm
func_0201e8d4:
    cmp r0, #0x1
    beq .L_124
    cmp r0, #0x2
    beq .L_12c
    b .L_134
.L_124:
    mov r0, #0x4
    bx lr
.L_12c:
    mov r0, #0x9
    bx lr
.L_134:
    mov r0, #0x0
    bx lr
