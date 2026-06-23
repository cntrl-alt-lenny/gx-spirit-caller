; func_ov006_021bd758 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021bd758
        .arm
func_ov006_021bd758:
    ldr r1, [r0, #0x40]
    mov r2, #0x0
    cmp r1, #0x0
    cmpne r1, #0x3
    moveq r3, #0x1
    moveq ip, #0x3
    ldr r1, [r0, #0x4c]
    movne r3, r2
    movne ip, #0x2
    cmp r1, r3
    strlt r3, [r0, #0x4c]
    movlt r2, #0x1
    blt .L_36a0
    cmp r1, ip
    strgt ip, [r0, #0x4c]
    movgt r2, #0x1
.L_36a0:
    mov r0, r2
    bx lr
