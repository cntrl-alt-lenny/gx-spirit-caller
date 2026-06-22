; func_0201eebc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0201eebc
        .arm
func_0201eebc:
    cmp r0, #0x4
    beq .L_108
    cmp r0, #0x9
    beq .L_110
    b .L_118
.L_108:
    mov r0, #0x1
    bx lr
.L_110:
    mov r0, #0x2
    bx lr
.L_118:
    mov r0, #0x3
    bx lr
