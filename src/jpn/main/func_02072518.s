; func_02072518 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .global func_02072518
        .arm
func_02072518:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    ldr r3, [r2, #0x8]
    cmp r3, #0x0
    beq .L_d0
.L_14:
    ldr ip, [r3, #0xa4]
    cmp ip, #0x0
    beq .L_c4
    ldr r2, [ip]
    cmp r2, #0x0
    beq .L_c4
    ldrb r2, [ip, #0x8]
    cmp r2, #0x1
    bne .L_c4
    ldrh r5, [r1, #0x2]
    ldrh r4, [ip, #0xa]
    mov r2, r5, asr #0x8
    orr r2, r2, r5, lsl #0x8
    mov r2, r2, lsl #0x10
    cmp r4, r2, lsr #0x10
    bne .L_c4
    ldrh r5, [ip, #0x18]
    cmp r5, #0x0
    beq .L_78
    ldrh r4, [r1]
    mov r2, r4, asr #0x8
    orr r2, r2, r4, lsl #0x8
    mov r2, r2, lsl #0x10
    cmp r5, r2, lsr #0x10
    bne .L_c4
.L_78:
    ldr r2, [ip, #0x1c]
    cmp r2, #0x0
    beq .L_b8
    ldrh r5, [r0, #0xc]
    ldrh r6, [r0, #0xe]
    mov r4, r5, asr #0x8
    orr r4, r4, r5, lsl #0x8
    mov lr, r4, lsl #0x10
    mov r4, r6, asr #0x8
    mov lr, lr, lsr #0x10
    orr r4, r4, r6, lsl #0x8
    mov r5, lr, lsl #0x10
    mov lr, r4, lsl #0x10
    orr r4, r5, lr, lsr #0x10
    cmp r2, r4
    bne .L_c4
.L_b8:
    mov r0, ip
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_c4:
    ldr r3, [r3, #0x68]
    cmp r3, #0x0
    bne .L_14
.L_d0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a62f0
