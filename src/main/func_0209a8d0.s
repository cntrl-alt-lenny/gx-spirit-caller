; func_0209a8d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209a8d0
        .arm
func_0209a8d0:
    cmp r0, #0x0
    bxeq lr
    ldr r2, [r0]
    cmp r2, #0x0
    moveq r2, #0x0
    streq r2, [r1, #0x8]
    streq r1, [r0]
    bxeq lr
    ldr r0, [r2, #0x8]
    cmp r0, #0x0
    beq .L_88
.L_78:
    mov r2, r0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    bne .L_78
.L_88:
    str r0, [r1, #0x8]
    str r1, [r2, #0x8]
    bx lr
