; func_02067a4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02067a4c
        .arm
func_02067a4c:
    mov r1, #0x1
    strb r1, [r0, #0x100]
    mov r1, #0x3
    strb r1, [r0, #0x101]
    mov r1, #0x5
    strb r1, [r0, #0x102]
    mov r1, #0x7
    strb r1, [r0, #0x103]
    mov r1, #0xb
    strb r1, [r0, #0x104]
    mov r2, #0x0
    mov r1, #0xff
.L_20c:
    strb r1, [r0, r2]
    add r2, r2, #0x1
    cmp r2, #0x100
    sub r1, r1, #0x1
    blt .L_20c
    bx lr
