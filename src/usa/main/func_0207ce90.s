; func_0207ce90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207ce90
        .arm
func_0207ce90:
    mov ip, #0x0
.L_39c:
    ldrb r3, [r0, ip]
    ldrb r2, [r1, ip]
    cmp r3, r2
    movne r0, #0x0
    bxne lr
    add ip, ip, #0x1
    cmp ip, #0x6
    blt .L_39c
    mov r0, #0x1
    bx lr
