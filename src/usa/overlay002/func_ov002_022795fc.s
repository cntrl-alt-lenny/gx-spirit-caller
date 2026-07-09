; func_ov002_022795fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_020305b4
        .extern func_ov002_021ae558
        .extern func_ov002_021d46ac
        .extern func_ov002_021dea94
        .extern func_ov002_021e267c
        .extern func_ov002_021e277c
        .extern func_ov002_022767c4
        .extern func_ov002_02278690
        .extern func_ov002_022861bc
        .global func_ov002_022795fc
        .arm
func_ov002_022795fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    ldr r7, _LIT0
    ldr r0, [r7, #0x18]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_2f1c
    b .L_2b78
    b .L_2c20
    b .L_2dc0
    b .L_2f0c
    b .L_2f0c
    b .L_2f0c
    b .L_2f0c
    b .L_2f0c
.L_2b78:
    ldr r2, [r7]
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_2bf0
    mov r0, r2, lsl #0x1f
    ldr r1, _LIT1
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_2bdc
    add r1, r7, #0x10
    str r1, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    ldr r1, [r7]
    ldrb r3, [r7, #0x8]
    mov r4, r1, lsl #0x9
    mov r2, r1, lsl #0x1a
    mov r1, r4, lsr #0x11
    mov r2, r2, lsr #0x1f
    bl func_ov002_022861bc
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_2bf0
.L_2bdc:
    mov r0, r2, lsl #0x1a
    mov r1, r2, lsr #0x17
    mov r2, r0, lsr #0x1f
    mov r0, #0xf7
    bl func_ov002_021ae558
.L_2bf0:
    ldr r3, _LIT3
    add sp, sp, #0x8
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2c20:
    ldr r1, [r7]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_2c5c
    ldr r0, _LIT2
    bic r1, r1, #0xc0
    ldr r0, [r0, #0xd44]
    mov r0, r0, lsl #0x1e
    orr r1, r1, r0, lsr #0x18
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x1e
    str r1, [r7]
    orreq r0, r1, #0x20
    streq r0, [r7]
.L_2c5c:
    ldr r0, [r7]
    mov r1, r0, lsl #0x1a
    movs r1, r1, lsr #0x1f
    beq .L_2cb4
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, [r7]
    orr r3, r1, #0x60
    mov r1, r0, lsl #0x9
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x1e
    mov r0, r3, lsl #0x10
    mov r1, r1, lsr #0x11
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x6
    bl func_ov002_021d46ac
.L_2cb4:
    ldrb r0, [r7, #0x8]
    mov r8, #0x0
    mov r9, r8
    strb r8, [r7, #0x9]
    cmp r0, #0x0
    ble .L_2d44
    mov r5, r8
    mov r6, #0x8000
    mov r4, r8
.L_2cd8:
    add r0, r7, r9, lsl #0x1
    ldrh r1, [r0, #0x10]
    mov r2, r4
    mov r3, r4
    tst r1, #0xff
    movne r0, r6
    moveq r0, r5
    orr r0, r0, #0x4a
    mov r0, r0, lsl #0x10
    mov r1, r1, asr #0x8
    mov r0, r0, lsr #0x10
    and r1, r1, #0xff
    bl func_ov002_021d46ac
    cmp r9, #0x0
    beq .L_2d28
    add r0, r7, r9, lsl #0x1
    ldrh r1, [r0, #0x10]
    ldrh r0, [r0, #0xe]
    cmp r1, r0
    beq .L_2d34
.L_2d28:
    ldrb r0, [r7, #0x9]
    add r0, r0, #0x1
    strb r0, [r7, #0x9]
.L_2d34:
    ldrb r0, [r7, #0x8]
    add r9, r9, #0x1
    cmp r9, r0
    blt .L_2cd8
.L_2d44:
    cmp r0, #0x0
    mov r5, #0x0
    ble .L_2d7c
    mov r3, #0x1
.L_2d54:
    add r1, r7, r5, lsl #0x1
    ldrh r4, [r1, #0x10]
    add r5, r5, #0x1
    cmp r5, r0
    mov r1, r4, asr #0x8
    and r2, r1, #0xff
    and r1, r4, #0xff
    add r1, r2, r1, lsl #0x4
    orr r8, r8, r3, lsl r1
    blt .L_2d54
.L_2d7c:
    ldr r0, [r7]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021dea94
    ldr r3, _LIT3
    add sp, sp, #0x8
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2dc0:
    ldrh r1, [r7, #0x6]
    ldr r0, _LIT4
    cmp r1, r0
    ldrne r0, _LIT5
    cmpne r1, r0
    bne .L_2e20
    ldr r1, [r7]
    mov r2, #0x1
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x11
    mov r3, r1, lsl #0x1f
    mov r1, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021e267c
    ldr r1, [r7]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, #0x1
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    str r0, [r7]
.L_2e20:
    ldr r1, [r7]
    ldr r0, _LIT6
    mov r1, r1, lsl #0x9
    mov r1, r1, lsr #0x11
    cmp r1, r0
    mov r3, #0x0
    bne .L_2e60
    ldr r1, _LIT0
    mov r0, #0x2bc
    ldrh r2, [r1, #0x10]
    ldr r1, _LIT7
    mul r0, r2, r0
    cmp r0, r1
    movgt r0, r1
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
.L_2e60:
    ldr r8, [r7]
    mov r0, #0x2d
    mov r2, r8, lsl #0x1f
    mov r1, r8, lsl #0x1b
    mov r5, r2, lsr #0x1f
    mov r4, r1, lsr #0x1c
    mov r1, r8, lsl #0x1a
    mov r2, r8, lsl #0x18
    mov r6, r1, lsr #0x1f
    mov r1, r2, lsr #0x1e
    mov r2, r8, lsr #0x17
    mov r2, r2, lsl #0x10
    and r5, r5, #0x1
    mov r4, r4, lsl #0x1b
    orr r4, r5, r4, lsr #0x1a
    mov r5, r6, lsl #0x1f
    orr r4, r4, #0x40
    mov r6, r1, lsl #0x1f
    orr r1, r4, r5, lsr #0x11
    orr r1, r1, r6, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, [r7]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_020305b4
    cmp r0, #0x0
    beq .L_2eec
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    orr r1, r1, #0x3
    b .L_2efc
.L_2eec:
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    orr r1, r1, #0x8
.L_2efc:
    str r1, [r0, #0x18]
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2f0c:
    mov r0, #0x21
    bl func_ov002_022767c4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2f1c:
    bl func_ov002_02278690
    cmp r0, #0x0
    beq .L_2f98
    ldr r1, [r7]
    ldr r0, _LIT8
    mov r1, r1, lsl #0x9
    cmp r0, r1, lsr #0x11
    mov r1, r1, lsr #0x11
    bcc .L_2f58
    cmp r1, r0
    bcs .L_2f7c
    ldr r0, _LIT9
    cmp r1, r0
    beq .L_2f7c
    b .L_2f8c
.L_2f58:
    sub r0, r1, #0x6b
    sub r0, r0, #0x1900
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_2f8c
    b .L_2f7c
    b .L_2f7c
    b .L_2f7c
    b .L_2f7c
.L_2f7c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
.L_2f8c:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2f98:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cd238
_LIT4: .word 0x00001578
_LIT5: .word 0x00001a92
_LIT6: .word 0x000018b4
_LIT7: .word 0x0000ffff
_LIT8: .word 0x0000128c
_LIT9: .word 0x0000112e
