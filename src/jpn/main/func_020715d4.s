; func_020715d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a62f0
        .extern func_02073e40
        .extern func_020918f0
        .extern func_02094688
        .global func_020715d4
        .arm
func_020715d4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r1
    ldrh r1, [r6, #0x6]
    mov r7, r0
    mov r5, r2
    cmp r1, #0x0
    beq .L_548
    mov r0, r6
    mov r1, r5
    mov r2, r7
    mov r3, #0x11
    bl func_02073e40
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
.L_548:
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r8, r0
    ldr r2, [r1, #0x8]
    cmp r2, #0x0
    beq .L_714
    mvn ip, #0x0
.L_564:
    ldr r4, [r2, #0xa4]
    cmp r4, #0x0
    beq .L_708
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_708
    ldrb r0, [r4, #0x8]
    cmp r0, #0xa
    bne .L_708
    ldrh r3, [r6, #0x2]
    ldrh r1, [r4, #0xa]
    mov r0, r3, asr #0x8
    orr r0, r0, r3, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x10
    bne .L_708
    ldrh r3, [r4, #0x18]
    cmp r3, #0x0
    beq .L_5c8
    ldrh r1, [r6]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r3, r0, lsr #0x10
    bne .L_708
.L_5c8:
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    beq .L_610
    cmp r1, ip
    beq .L_610
    ldrh lr, [r7, #0xc]
    ldrh r0, [r7, #0xe]
    mov r3, lr, asr #0x8
    orr r3, r3, lr, lsl #0x8
    mov r3, r3, lsl #0x10
    mov lr, r0, asr #0x8
    mov r3, r3, lsr #0x10
    orr r0, lr, r0, lsl #0x8
    mov r3, r3, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    cmp r1, r0
    bne .L_708
.L_610:
    ldrh r1, [r7, #0x10]
    ldrh r3, [r7, #0x12]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r3, asr #0x8
    mov r2, r0, lsr #0x10
    orr r0, r1, r3, lsl #0x8
    mov r1, r2, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    bne .L_68c
    ldrh r1, [r7, #0xc]
    ldrh r3, [r7, #0xe]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r3, asr #0x8
    mov r2, r0, lsr #0x10
    orr r0, r1, r3, lsl #0x8
    mov r1, r2, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x1c]
    ldrh r1, [r6]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    strh r0, [r4, #0x18]
.L_68c:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    bne .L_714
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
    bne .L_6dc
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldr r0, [r4]
    bl func_020918f0
    b .L_714
.L_6dc:
    ldr r3, [r4, #0x38]
    cmp r3, #0x0
    beq .L_714
    ldr r0, [r4, #0x40]
    ldr r1, [r4, #0x44]
    mov r2, r4
    blx r3
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x44]
    b .L_714
.L_708:
    ldr r2, [r2, #0x68]
    cmp r2, #0x0
    bne .L_564
.L_714:
    mov r0, r8
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a62f0
