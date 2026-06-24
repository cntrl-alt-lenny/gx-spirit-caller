; func_0205c780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205c780
        .arm
func_0205c780:
    ldr r0, [r0]
    ldr r0, [r0, #0x434]
    cmp r0, #0x0
    beq .L_34
.L_10:
    ldr r2, [r0, #0xc]
    cmp r2, r1
    bne .L_28
    ldr r2, [r0]
    cmp r2, #0x69
    bxeq lr
.L_28:
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    bne .L_10
.L_34:
    mov r0, #0x0
    bx lr
