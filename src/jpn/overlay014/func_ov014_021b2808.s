; func_ov014_021b2808 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov014_021b4af8
        .extern data_ov014_021b4c48
        .extern data_ov014_021b4c54
        .extern data_ov014_021b4c60
        .extern data_ov014_021b4c6c
        .extern data_ov014_021b4c78
        .extern data_ov014_021b4c84
        .extern func_02005d90
        .extern func_02006190
        .extern func_0201e910
        .extern func_020943b0
        .extern Ov014_HitTestPrimary
        .extern func_ov014_021b3984
        .global func_ov014_021b2808
        .arm
func_ov014_021b2808:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x38
    ldr r1, _LIT0
    ldr r5, _LIT1
    ldrh r4, [r1, #0x8]
    ldrh r3, [r1, #0xa]
    add r2, sp, #0x28
    strh r4, [sp, #0x28]
    strh r3, [sp, #0x2a]
    ldrh r6, [r1, #0xc]
    ldrh r4, [r1, #0xe]
    ldr r1, _LIT2
    mov r3, #0x4
    strh r4, [sp, #0x2e]
    strh r6, [sp, #0x2c]
    mov r4, r0
    str r5, [sp]
    bl func_ov014_021b3984
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldrh r2, [r1]
    ldr r0, [r0, #0x4]
    ldrh r1, [r1, #0x2]
    mov r3, r2, lsl #0xc
    mov r0, r0, lsl #0x1d
    mov r2, r1, lsl #0xc
    mov r1, r0, lsr #0x1c
    str r3, [sp, #0x30]
    str r2, [sp, #0x34]
    ldr r0, [r4, #0x4]
    add r5, r1, #0x7
    cmp r0, #0x0
    ldr r6, _LIT5
    bne .L_9c
    mov r0, r4
    mov r1, r6
    bl Ov014_HitTestPrimary
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_9c:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r0, [r6, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r6, [r6, #0x6]
    mov r0, #0x2
    str r6, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r5, lsl #0x3
    bl func_0201e910
    ldr r5, _LIT6
    mov r6, #0x3
    ldrh r1, [r5]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_124
    mov r0, r4
    mov r1, r5
    bl Ov014_HitTestPrimary
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_124:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e910
    ldr r5, _LIT7
    mov r6, #0x5
    ldrh r1, [r5]
    ldrh r0, [r5, #0x2]
    sub r1, r1, #0x1d
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_1b0
    mov r0, r4
    mov r1, r5
    bl Ov014_HitTestPrimary
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_1b0:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e910
    ldr r5, _LIT8
    mov r6, #0x3
    ldrh r1, [r5]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_238
    mov r0, r4
    mov r1, r5
    bl Ov014_HitTestPrimary
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_238:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e910
    ldr r5, _LIT9
    mov r6, #0x5
    ldrh r1, [r5]
    ldrh r0, [r5, #0x2]
    sub r1, r1, #0x1d
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_2c4
    mov r0, r4
    mov r1, r5
    bl Ov014_HitTestPrimary
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_2c4:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e910
    ldr r5, _LIT10
    mov r6, #0x0
    ldrh r1, [r5]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x30]
    str r0, [sp, #0x34]
    ldrsb r0, [r4, #0xc]
    cmp r0, #0x0
    moveq r6, #0x2
    beq .L_35c
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_35c
    mov r0, r4
    mov r1, r5
    bl Ov014_HitTestPrimary
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_35c:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r0, [r5, #0x8]
    mov r1, #0x3c00
    add r2, sp, #0x30
    str r0, [sp, #0x8]
    ldrh r5, [r5, #0x6]
    mov r0, #0x2
    str r5, [sp, #0xc]
    str r1, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x40]
    ldr r1, [r1, #0x2c]
    add r1, r1, r6, lsl #0x3
    bl func_0201e910
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_5ac
    bl func_02006190
    cmp r0, #0x0
    bne .L_5ac
    ldr r0, [r4, #0x34]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_5ac
    b .L_3dc
    b .L_460
    b .L_4c8
    b .L_530
.L_3dc:
    mov r7, #0x0
    ldr sl, _LIT5
    mov r8, r7
    mov r9, r7
    mov r6, #0x2
    mov r5, r7
    add r4, sp, #0x20
    mov fp, #0x6
.L_3fc:
    ldrh r1, [sl]
    ldrh r0, [sl, #0x2]
    orr r2, r9, #0x800
    sub r1, r1, #0x3
    sub r0, r0, #0x3
    add r1, r1, r8
    and r0, r0, #0xff
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, r6
    mov r1, r5
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005d90
    mov r1, r0
    mov r0, r4
    mov r2, fp
    bl func_020943b0
    add r7, r7, #0x1
    cmp r7, #0x2
    add r8, r8, #0x40
    add r9, r9, #0x10
    blt .L_3fc
    b .L_5ac
.L_460:
    ldr r6, [r4, #0x30]
    mov r2, #0x820
    add r1, r6, #0x1
    mov r0, #0xc
    mul r3, r1, r0
    ldr r1, _LIT5
    mov r0, #0x2
    ldrh r4, [r1, r3]
    add r5, r1, r3
    ldrh r3, [r5, #0x2]
    sub r4, r4, #0x3
    sub r4, r4, r6
    sub r3, r3, #0x3
    and r3, r3, #0xff
    mov r4, r4, lsl #0x17
    orr r3, r3, #-1073741824
    orr r3, r3, r4, lsr #0x7
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020943b0
    b .L_5ac
.L_4c8:
    ldr r6, [r4, #0x30]
    mov r2, #0x820
    add r1, r6, #0x3
    mov r0, #0xc
    mul r3, r1, r0
    ldr r1, _LIT5
    mov r0, #0x2
    ldrh r4, [r1, r3]
    add r5, r1, r3
    ldrh r3, [r5, #0x2]
    sub r4, r4, #0x3
    sub r4, r4, r6
    sub r3, r3, #0x3
    and r3, r3, #0xff
    mov r4, r4, lsl #0x17
    orr r3, r3, #-1073741824
    orr r3, r3, r4, lsr #0x7
    mov r1, #0x0
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x20
    mov r2, #0x6
    bl func_020943b0
    b .L_5ac
.L_530:
    mov r7, #0x0
    ldr sl, _LIT10
    mov r8, r7
    mov r9, #0x30
    mov r6, #0x2
    mov r5, r7
    add r4, sp, #0x20
    mov fp, #0x6
.L_550:
    ldrh r0, [sl, #0x2]
    ldrh r1, [sl]
    orr r2, r9, #0x800
    sub r0, r0, #0x3
    add r1, r1, r8
    and r0, r0, #0xff
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, r6
    mov r1, r5
    str r3, [sp, #0x20]
    strh r2, [sp, #0x24]
    bl func_02005d90
    mov r1, r0
    mov r0, r4
    mov r2, fp
    bl func_020943b0
    add r7, r7, #0x1
    cmp r7, #0x3
    add r8, r8, #0x40
    add r9, r9, #0x10
    blt .L_550
.L_5ac:
    mov r0, #0x1
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov014_021b4af8
_LIT1: .word 0x00600100
_LIT2: .word 0x05000618
_LIT3: .word data_ov014_021b4c48
_LIT4: .word data_02104e6c
_LIT5: .word data_ov014_021b4c48
_LIT6: .word data_ov014_021b4c54
_LIT7: .word data_ov014_021b4c60
_LIT8: .word data_ov014_021b4c6c
_LIT9: .word data_ov014_021b4c78
_LIT10: .word data_ov014_021b4c84
