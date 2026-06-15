; func_0205d4c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205d4c0
        .arm
func_0205d4c0:
    cmp r0, #0x0
    beq .L_d08
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    bne .L_d08
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_d08
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    bne .L_d08
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    moveq r0, #0x1
    bxeq lr
.L_d08:
    mov r0, #0x0
    bx lr
