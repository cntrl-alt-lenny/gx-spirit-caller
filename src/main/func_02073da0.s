; func_02073da0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02073da0
        .arm
func_02073da0:
    mov ip, #0x0
.L_428:
    ldrh r3, [r0], #0x2
    ldrh r2, [r1], #0x2
    cmp r3, r2
    movne r0, #0x1
    bxne lr
    add ip, ip, #0x1
    cmp ip, #0x3
    blt .L_428
    mov r0, #0x0
    bx lr
