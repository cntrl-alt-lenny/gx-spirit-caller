; func_0201da1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_0201d910
        .extern func_02092904
        .extern func_020b3a7c
        .global func_0201da1c
        .arm
func_0201da1c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, r1
    ldr r1, [r9, #0xc]
    mov sl, r0
    add r8, r9, #0x1c
    cmp r1, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0x2000
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    ldrh r1, [sl, #0x14]
    mov r4, r0
    mov r0, r1, lsl #0x16
    movs r0, r0, lsr #0x1f
    movne r5, #0x9
    ldr r1, [r9, #0xc]
    mov r0, r8
    moveq r5, #0x5
    bl func_02092904
    ldrh r1, [sl, #0x14]
    ldr r0, [sl, #0xc]
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x1f
    add r1, r1, #0x1
    mov r1, r1, lsl #0x5
    bl func_020b3a7c
    ldr r1, [sl, #0x18]
    mov r1, r1, lsl #0x5
    movs r1, r1, lsr #0x1f
    beq .L_3b8
    ldrh r2, [sl, #0x16]
    mov r1, #0x0
    mov r3, r2, lsl #0x19
    mov r2, r2, lsl #0x12
    mov r3, r3, lsr #0x19
    mov r2, r2, lsr #0x19
    mul r2, r3, r2
    add r2, r2, #0x1
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    cmp r2, #0x0
    ble .L_3b0
    mov r2, r1
.L_354:
    mov r5, r2, lsl #0x1
    add r3, r8, r2, lsl #0x1
    ldrh r6, [r8, r5]
    ldrh r5, [r3, #0x2]
    mov r3, r1, lsl #0x1
    add r6, r0, r6
    add r5, r0, r5
    and r6, r6, #0xff
    and r5, r5, #0xff
    orr r5, r6, r5, lsl #0x8
    strh r5, [r4, r3]
    ldrh r3, [sl, #0x16]
    add r1, r1, #0x1
    add r2, r2, #0x2
    mov r5, r3, lsl #0x19
    mov r3, r3, lsl #0x12
    mov r5, r5, lsr #0x19
    mov r3, r3, lsr #0x19
    mul r3, r5, r3
    add r3, r3, #0x1
    add r3, r3, r3, lsr #0x1f
    cmp r1, r3, asr #0x1
    blt .L_354
.L_3b0:
    mov r8, r4
    b .L_4b8
.L_3b8:
    ldrb r1, [r9, #0xa]
    cmp r1, #0x4
    bne .L_444
    ldrh r1, [sl, #0x16]
    mov r2, #0x0
    mov r3, r1, lsl #0x19
    mov r1, r1, lsl #0x12
    mov r3, r3, lsr #0x19
    mov r1, r1, lsr #0x19
    mul r1, r3, r1
    cmp r1, #0x0
    ble .L_43c
    ldr r3, _LIT0
.L_3ec:
    ldr r6, [r8, r2, lsl #0x2]
    ldrsh r1, [sl, #0x10]
    add ip, r0, r6
    mov r6, r6, lsr #0x10
    mov r1, r1, asr r5
    mov r7, r2, lsl #0x1
    and ip, ip, r3
    mov r6, r6, lsl #0x10
    orr r6, ip, r6, lsr #0x10
    add r1, r6, r1, lsl #0xc
    strh r1, [r4, r7]
    ldrh r1, [sl, #0x16]
    add r2, r2, #0x1
    mov r6, r1, lsl #0x19
    mov r1, r1, lsl #0x12
    mov r6, r6, lsr #0x19
    mov r1, r1, lsr #0x19
    mul r1, r6, r1
    cmp r2, r1
    blt .L_3ec
.L_43c:
    mov r8, r4
    b .L_4b8
.L_444:
    ldrsh r1, [sl, #0x10]
    orrs r1, r0, r1
    beq .L_4b8
    ldrh r2, [sl, #0x16]
    mov r1, #0x0
    mov r3, r2, lsl #0x19
    mov r2, r2, lsl #0x12
    mov r3, r3, lsr #0x19
    mov r2, r2, lsr #0x19
    mul r2, r3, r2
    cmp r2, #0x0
    ble .L_4b4
.L_474:
    mov r6, r1, lsl #0x1
    ldrsh r2, [sl, #0x10]
    ldrh r3, [r8, r6]
    add r1, r1, #0x1
    mov r2, r2, asr r5
    add r3, r0, r3
    add r2, r3, r2, lsl #0xc
    strh r2, [r4, r6]
    ldrh r2, [sl, #0x16]
    mov r3, r2, lsl #0x19
    mov r2, r2, lsl #0x12
    mov r3, r3, lsr #0x19
    mov r2, r2, lsr #0x19
    mul r2, r3, r2
    cmp r1, r2
    blt .L_474
.L_4b4:
    mov r8, r4
.L_4b8:
    ldrh r0, [sl, #0x16]
    mov r1, r0, lsl #0x11
    movs r1, r1, lsr #0x1f
    bne .L_508
    ldrh r1, [sl, #0x26]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x19
    and r0, r0, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    strh r0, [sl, #0x26]
    ldrh r0, [sl, #0x16]
    ldrh r1, [sl, #0x26]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x19
    and r0, r0, #0xff
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r0, [sl, #0x26]
.L_508:
    ldrh r1, [sl, #0x16]
    mov r0, r1, lsl #0x19
    mov r2, r0, lsr #0x19
    cmp r2, #0x20
    bne .L_554
    mov r0, r1, lsl #0x11
    movs r0, r0, lsr #0x1f
    bne .L_554
    mov r0, r1, lsl #0x12
    mov r1, r0, lsr #0x19
    mov r0, r2, lsl #0x1
    ldrh r2, [sl, #0x14]
    mul r3, r1, r0
    mov r1, r2, lsl #0x1c
    ldr r2, [sl, #0x8]
    mov r0, r8
    mov r1, r1, lsr #0x1c
    bl func_0201d910
    b .L_624
.L_554:
    ldr r0, [sl, #0x18]
    mov r7, #0x2
    mov r0, r0, lsl #0x5
    movs r0, r0, lsr #0x1f
    mov r6, #0x20
    beq .L_57c
    ldr r0, [sl, #0x1c]
    mov r7, #0x1
    mov r0, r0, lsl #0x18
    mov r6, r0, lsr #0x18
.L_57c:
    ldrh r0, [sl, #0x24]
    ldrh r1, [sl, #0x26]
    mov r5, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x10
    rsb r1, r0, r1, lsr #0x18
    cmp r1, #0x0
    ble .L_624
.L_5a0:
    ldr ip, [sl, #0x18]
    ldrh lr, [r9, #0x10]
    mov r1, ip, lsl #0x12
    add r3, r5, r0
    add r2, r5, r1, lsr #0x19
    ldrh r1, [sl, #0x26]
    ldrh r0, [sl, #0x24]
    mul r3, lr, r3
    mov lr, r1, lsl #0x18
    mov r1, r0, lsl #0x18
    mov lr, lr, lsr #0x18
    add r0, r3, r1, lsr #0x18
    sub r3, lr, r1, lsr #0x18
    ldrh r1, [sl, #0x14]
    mul r2, r6, r2
    mov lr, ip, lsl #0x19
    mov ip, r1, lsl #0x1c
    ldr r1, [sl, #0x8]
    add r2, r2, lr, lsr #0x19
    mla r0, r7, r0, r8
    mla r2, r7, r2, r1
    mul r3, r7, r3
    mov r1, ip, lsr #0x1c
    bl func_0201d910
    ldrh r0, [sl, #0x24]
    ldrh r1, [sl, #0x26]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x10
    rsb r1, r0, r1, lsr #0x18
    cmp r5, r1
    blt .L_5a0
.L_624:
    mov r0, r4
    bl Task_InvokeLocked
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x000003ff
