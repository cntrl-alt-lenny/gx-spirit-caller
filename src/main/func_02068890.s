; func_02068890 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ecc4
        .global func_02068890
        .arm
func_02068890:
    cmp r0, #0x0
    ldrne r2, _LIT0
    strne r0, [r2]
    ldr r2, _LIT0
    ldr r0, [r2]
    b .L_2ec
.L_2e0:
    ldr r3, [r2]
    add r3, r3, #0x1
    str r3, [r2]
.L_2ec:
    ldr ip, [r2]
    ldrsb r3, [ip]
    cmp r3, #0x0
    beq .L_304
    cmp r3, r1
    bne .L_2e0
.L_304:
    cmp ip, r0
    moveq r0, #0x0
    cmp r3, #0x0
    bxeq lr
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r3, [r1]
    add r3, r3, #0x1
    str r3, [r1]
    strb r2, [ip]
    bx lr
_LIT0: .word data_0219ecc4
