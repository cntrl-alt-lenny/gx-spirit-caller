; func_0209a884 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209a884
        .arm
func_0209a884:
    cmp r0, #0x0
    bxeq lr
    ldr r3, [r0]
    mov r2, r3
    cmp r3, #0x0
    bxeq lr
.L_18:
    cmp r3, r1
    bne .L_38
    cmp r3, r2
    ldreq r1, [r3, #0x8]
    streq r1, [r0]
    ldrne r0, [r3, #0x8]
    strne r0, [r2, #0x8]
    bx lr
.L_38:
    mov r2, r3
    ldr r3, [r3, #0x8]
    cmp r3, #0x0
    bne .L_18
    bx lr
