; func_02055888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02055888
        .arm
func_02055888:
    cmp r0, #0x0
    beq .L_5e0
    ldr r2, [r0]
    cmp r2, #0x0
    bne .L_5e8
.L_5e0:
    mov r0, #0x2
    bx lr
.L_5e8:
    ldr r0, [r2, #0x108]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r1]
    ldreq r2, [r2, #0x430]
    moveq r0, #0x0
    streq r2, [r1]
    bx lr
