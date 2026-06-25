; func_02025a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_020c67ec
        .extern data_0219a80c
        .extern func_020231f0
        .extern func_0208b0a8
        .extern func_0208b0c4
        .extern func_0208b0e0
        .extern func_0208e300
        .extern func_0208e31c
        .global func_02025a2c
        .arm
func_02025a2c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    mov r4, r0
    ldr r5, [r4, #0x6c]
    ldr r6, [r4, #0x70]
    ldr r2, _LIT0
    mov r7, #0x0
    str r7, [r2]
    ldr r8, [r4, #0xac]
    ldr r3, [r4, #0xdc]
    ldr r1, [r4, #0xb4]
    ldr r0, [r4, #0xe4]
    add r3, r8, r3
    ldr sl, [r4, #0xb0]
    ldr r9, [r4, #0xe0]
    add r0, r1, r0
    str r3, [r2, #0x2c]
    add r3, sl, r9
    str r3, [r2, #0x2c]
    str r0, [r2, #0x2c]
    ldr r0, [r4, #0xb8]
    ldr r8, _LIT1
    cmp r0, #0x0
    ldreq r0, [r4, #0xbc]
    cmpeq r0, #0x0
    ldreq r0, [r4, #0xc0]
    cmpeq r0, #0x0
    beq .L_130
    ldr r0, [r4, #0xc0]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x10
    beq .L_b0
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, _LIT2
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r0]
    add r0, sp, #0x30
    bl func_0208b0e0
    add r0, sp, #0x30
    bl func_0208e300
.L_b0:
    ldr r0, [r4, #0xbc]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x10
    beq .L_f0
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, _LIT2
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r0]
    add r0, sp, #0x30
    bl func_0208b0c4
    add r0, sp, #0x30
    bl func_0208e300
.L_f0:
    ldr r0, [r4, #0xb8]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x10
    beq .L_130
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, _LIT2
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r0]
    add r0, sp, #0x30
    bl func_0208b0a8
    add r0, sp, #0x30
    bl func_0208e300
.L_130:
    ldr r3, [r4, #0xc4]
    cmp r3, #0x1000
    ldreq r0, [r4, #0xc8]
    cmpeq r0, #0x1000
    ldreq r0, [r4, #0xcc]
    cmpeq r0, #0x1000
    beq .L_164
    ldr r2, [r4, #0xcc]
    ldr r1, [r4, #0xc8]
    ldr r0, _LIT3
    str r3, [r0]
    str r1, [r0]
    str r2, [r0]
.L_164:
    add r0, r4, #0x100
    ldrh r0, [r0, #0x6a]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    beq .L_188
    add r0, sp, #0x0
    bl func_020231f0
    add r0, sp, #0x0
    bl func_0208e31c
.L_188:
    ldr r2, _LIT4
    ldr r1, _LIT5
    ldr r0, _LIT6
    str r2, [r1]
    str r0, [r1, #0x4]
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    ldrne r0, [r4, #0x70]
    cmpne r0, #0x0
    beq .L_220
    ldrb r1, [r4, #0x7b]
    ldr r2, [r4, #0x7c]
    ldrb r3, [r4, #0x79]
    tst r1, #0x1
    ldrb r1, [r4, #0x78]
    mov r0, #0x0
    ldrb r9, [r4, #0x7a]
    mov r1, r1, lsl #0x1a
    orr r1, r1, r2, lsr #0x3
    orr r1, r1, #0x40000000
    orr r2, r1, r3, lsl #0x14
    movne r0, #0x1
    orr r2, r2, r9, lsl #0x17
    ldr r1, _LIT7
    orr r0, r2, r0, lsl #0x1d
    str r0, [r1]
    ldr r1, [r4, #0x80]
    ldrb r0, [r4, #0x78]
    cmp r1, #0x0
    movlt r1, #0x0
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    rsb r0, r0, #0x4
    mov r1, r1, lsr r0
    ldr r0, _LIT8
    str r1, [r0]
    b .L_22c
.L_220:
    ldr r0, _LIT7
    mov r1, #0x0
    str r1, [r0]
.L_22c:
    add r0, r4, #0x100
    ldrsh r1, [r0, #0x62]
    cmp r1, #0x0
    beq .L_280
    cmp r1, #0x1
    beq .L_258
    cmp r1, #0x2
    ldreqsh r1, [r8, #0x30]
    ldreqsh r0, [r0, #0x64]
    addeq r7, r1, r0
    b .L_280
.L_258:
    ldrsh r2, [r8, #0x34]
    ldrsh r3, [r8, #0x2c]
    ldrsh r0, [r8, #0x2e]
    add r1, r2, #0x1
    strh r1, [r8, #0x34]
    ldrsh r1, [r8, #0x34]
    add r7, r3, r2
    cmp r1, r0
    movge r0, #0x0
    strgeh r0, [r8, #0x34]
.L_280:
    add r0, r4, #0x100
    ldrh r0, [r0, #0x6a]
    mov r1, r0, lsl #0x18
    movs r1, r1, lsr #0x1f
    bne .L_2a0
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_2a8
.L_2a0:
    mov r0, #0x800
    b .L_2ac
.L_2a8:
    mov r0, #0x0
.L_2ac:
    ldr r1, [r4, #0xd0]
    orr r0, r0, #0x81
    mov r1, r1, asr #0x4
    orr r0, r0, r7, lsl #0x18
    ldr r2, _LIT9
    orr r0, r0, r1, lsl #0x10
    str r0, [r2]
    ldrsh r1, [r4, #0x68]
    mov r0, #0x10000
    str r1, [r2, #0x5c]
    str r0, [r2, #-32]
    ldrsh r0, [r4, #0x68]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_430
    b .L_2f8
    b .L_364
    b .L_430
    b .L_430
.L_2f8:
    ldrsh r0, [r4, #0x6a]
    mov r1, #0x0
    cmp r0, #0x0
    ble .L_430
    mov r3, r1
    sub r7, r2, #0x18
    mov r0, r1
    mov r6, #0x6
.L_318:
    mov r2, r0
.L_31c:
    add r8, r2, r3
    mul r9, r8, r6
    add sl, r5, r9
    ldrh r9, [r5, r9]
    ldrh r8, [sl, #0x2]
    ldrh sl, [sl, #0x4]
    add r2, r2, #0x1
    orr r8, r9, r8, lsl #0x10
    str r8, [r7]
    str sl, [r7]
    cmp r2, #0x3
    blt .L_31c
    ldrsh r2, [r4, #0x6a]
    add r1, r1, #0x1
    add r3, r3, #0x3
    cmp r1, r2
    blt .L_318
    b .L_430
.L_364:
    ldrsh r0, [r4, #0x6a]
    mov r2, #0x0
    cmp r0, #0x0
    ble .L_430
    mov r0, r2
.L_378:
    ldr fp, _LIT10
    ldr lr, _LIT11
    mov r3, #0x0
    mov ip, #0x6
.L_388:
    ldr r7, [r4, #0x74]
    add r1, r3, r0
    cmp r7, #0x0
    ldrne r7, [r4, #0x70]
    cmpne r7, #0x0
    beq .L_3f0
    ldrb r8, [r4, #0x7a]
    add r7, r6, r1, lsl #0x2
    ldrb sl, [r4, #0x79]
    mov r9, r1, lsl #0x2
    ldrsh r9, [r6, r9]
    ldr sl, [fp, sl, lsl #0x2]
    ldr r8, [fp, r8, lsl #0x2]
    mul r9, sl, r9
    ldrsh r7, [r7, #0x2]
    mov r9, r9, lsl #0x8
    mov r9, r9, asr #0x10
    mul r7, r8, r7
    mov r7, r7, lsl #0x8
    mov r7, r7, asr #0x10
    mov r7, r7, lsl #0x10
    mov r8, r7, lsr #0x10
    mov r7, r9, lsl #0x10
    mov r8, r8, lsl #0x10
    orr r7, r8, r7, lsr #0x10
    str r7, [lr]
.L_3f0:
    mul r7, r1, ip
    add r8, r5, r7
    ldrh r7, [r5, r7]
    ldrh r1, [r8, #0x2]
    ldrh r8, [r8, #0x4]
    add r3, r3, #0x1
    orr r1, r7, r1, lsl #0x10
    str r1, [lr, #0x4]
    str r8, [lr, #0x4]
    cmp r3, #0x4
    blt .L_388
    ldrsh r1, [r4, #0x6a]
    add r2, r2, #0x1
    add r0, r0, #0x4
    cmp r2, r1
    blt .L_378
.L_430:
    ldr r1, _LIT12
    mov r0, #0x0
    str r0, [r1]
    mov r0, #0x1
    str r0, [r1, #-188]
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04000444
_LIT1: .word data_0219a80c
_LIT2: .word data_020bee8c
_LIT3: .word 0x0400046c
_LIT4: .word 0x7fff7fff
_LIT5: .word 0x040004c0
_LIT6: .word 0x00004210
_LIT7: .word 0x040004a8
_LIT8: .word 0x040004ac
_LIT9: .word 0x040004a4
_LIT10: .word data_020c67ec
_LIT11: .word 0x04000488
_LIT12: .word 0x04000504
