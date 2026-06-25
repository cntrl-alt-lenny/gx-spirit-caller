; func_02070bf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .global func_02070bf8
        .arm
func_02070bf8:
    ldr r2, _LIT0
    ldr r2, [r2, #0x4]
    ldr r3, [r2, #0xa4]
    cmp r3, #0x0
    beq .L_a4
    ldrb r2, [r3, #0x8]
    cmp r2, #0x4
    beq .L_84
    cmp r2, #0xa
    bne .L_a4
.L_84:
    cmp r0, #0x0
    ldrneh r2, [r3, #0x18]
    strneh r2, [r0]
    cmp r1, #0x0
    ldrne r0, [r3, #0x14]
    strne r0, [r1]
    ldr r0, [r3, #0x1c]
    bx lr
.L_a4:
    mov r0, #0x0
    bx lr
_LIT0: .word data_021a62f0
