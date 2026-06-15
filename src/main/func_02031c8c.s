; func_02031c8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031c8c
        .arm
func_02031c8c:
    ldr r1, [r0, #0x2c]
    tst r1, #0x4
    bxeq lr
    bic r1, r1, #0x4
    str r1, [r0, #0x2c]
    tst r1, #0x2
    beq .L_148
    ldr r1, [r0, #0x20]
    ldr r2, [r0, #0x1c]
    cmp r1, #0x0
    str r1, [r2, #0x18]
    beq .L_138
    ldr r1, [r0, #0x20]
    str r2, [r1, #0x1c]
    ldr r1, [r0, #0x20]
    ldr r0, [r1, #0x2c]
    orr r0, r0, #0x2
    str r0, [r1, #0x2c]
    bx lr
.L_138:
    ldr r0, [r2, #0x2c]
    bic r0, r0, #0x1
    str r0, [r2, #0x2c]
    bx lr
.L_148:
    ldr r2, [r0, #0x20]
    ldr r1, [r0, #0x1c]
    str r2, [r1, #0x20]
    ldr r2, [r0, #0x1c]
    ldr r1, [r2, #0x20]
    cmp r1, #0x0
    ldrne r0, [r0, #0x20]
    strne r2, [r0, #0x1c]
    bx lr
