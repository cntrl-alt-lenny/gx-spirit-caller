; func_0207280c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63d0
        .extern func_020919d8
        .extern func_02094688
        .global func_0207280c
        .arm
func_0207280c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r8, r0
    ldr r2, [r1, #0x8]
    cmp r2, #0x0
    beq .L_104
.L_28:
    ldr r4, [r2, #0xa4]
    cmp r4, #0x0
    beq .L_f8
    ldr r3, [r4]
    cmp r3, #0x0
    beq .L_f8
    ldrb r0, [r4, #0x8]
    cmp r0, #0xb
    bne .L_f8
    ldrh r1, [r6, #0x4]
    mov r0, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, r1
    bne .L_f8
    ldrh r1, [r4, #0xa]
    ldrh r0, [r6, #0x6]
    cmp r1, r0
    bne .L_f8
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    bne .L_f8
    ldrh ip, [r7, #0xc]
    ldrh r1, [r7, #0xe]
    ldr r0, [r4, #0x1c]
    mov r3, ip, asr #0x8
    orr r3, r3, ip, lsl #0x8
    mov r3, r3, lsl #0x10
    mov ip, r1, asr #0x8
    mov r3, r3, lsr #0x10
    orr r1, ip, r1, lsl #0x8
    mov r3, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r3, r1, lsr #0x10
    cmp r0, r1
    bne .L_f8
    ldr r1, [r4, #0x3c]
    sub r0, r5, #0x8
    cmp r0, r1
    strhi r1, [r4, #0x44]
    strls r0, [r4, #0x44]
    ldr r1, [r4, #0x40]
    ldr r2, [r4, #0x44]
    add r0, r6, #0x8
    bl func_02094688
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    bne .L_104
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldr r0, [r4]
    bl func_020919d8
    b .L_104
.L_f8:
    ldr r2, [r2, #0x68]
    cmp r2, #0x0
    bne .L_28
.L_104:
    mov r0, r8
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a63d0
