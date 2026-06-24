; func_0205bc98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205bc98
        .arm
func_0205bc98:
    ldr r0, [r0]
    ldr r3, [r0, #0x424]
    cmp r3, #0x0
    beq .L_38
.L_10:
    ldr r0, [r3, #0x18]
    cmp r0, r2
    bne .L_2c
    cmp r1, #0x0
    strne r3, [r1]
    mov r0, #0x1
    bx lr
.L_2c:
    ldr r3, [r3, #0x20]
    cmp r3, #0x0
    bne .L_10
.L_38:
    cmp r1, #0x0
    movne r0, #0x0
    strne r0, [r1]
    mov r0, #0x0
    bx lr
