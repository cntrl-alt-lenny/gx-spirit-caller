; func_ov006_021bd8ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cc0dc
        .extern data_ov006_021cc0f4
        .extern data_ov006_021cc3a0
        .extern data_ov006_021cc40c
        .extern data_ov006_021cc478
        .extern data_ov006_021cc588
        .extern data_ov006_0224f448
        .extern data_ov006_0225df3c
        .extern func_0202bbdc
        .extern func_0202de9c
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b6f50
        .extern func_ov006_021b7cac
        .extern func_ov006_021b8e4c
        .extern func_ov006_021b8f7c
        .extern func_ov006_021bd6bc
        .extern func_ov006_021c7964
        .extern func_ov006_021c7edc
        .extern func_ov006_021c7f5c
        .extern func_ov006_021c8174
        .extern func_ov006_021c8184
        .extern func_ov006_021c8194
        .extern func_ov006_021c81a4
        .global func_ov006_021bd8ac
        .arm
func_ov006_021bd8ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r1, [r5, #0x50]
    add r3, r5, #0xa0
    mov r0, #0x24
    ldr r2, [r5, #0x40]
    mla r6, r1, r0, r3
    cmp r2, #0x0
    beq .L_38
    cmp r2, #0x2
    beq .L_54
    cmp r2, #0x3
    bne .L_70
.L_38:
    ldr r2, [r5, #0x4c]
    ldr r3, _LIT0
    mov r0, #0xc
    mla r7, r2, r0, r3
    ldr r0, _LIT1
    mov r3, #0x9
    b .L_88
.L_54:
    ldr r2, [r5, #0x4c]
    ldr r3, _LIT2
    mov r0, #0xc
    mla r7, r2, r0, r3
    ldr r0, _LIT3
    mov r3, #0x9
    b .L_88
.L_70:
    ldr r2, [r5, #0x4c]
    ldr r3, _LIT4
    mov r0, #0xc
    mla r7, r2, r0, r3
    ldr r0, _LIT5
    mov r3, #0x2
.L_88:
    ldr r2, [r5, #0x48]
    cmp r2, #0x0
    bne .L_18c
    mov r9, #0x0
    cmp r3, #0x0
    mov r4, r9
    ble .L_cc
    ldr sl, [r7, #0x8]
.L_a8:
    ldr r2, [r0, #0x8]
    mov r8, r0
    cmp r2, sl
    moveq r9, #0x1
    beq .L_cc
    add r0, r0, #0xc
    add r4, r4, #0x1
    cmp r4, r3
    blt .L_a8
.L_cc:
    ldr r0, [r7, #0x8]
    cmp r0, #0x4
    bne .L_168
    ldr r0, _LIT6
    bl func_ov006_021b7cac
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_15c
    b .L_114
    b .L_11c
    b .L_124
    b .L_124
    b .L_134
    b .L_13c
    b .L_12c
    b .L_144
    b .L_14c
    b .L_154
.L_114:
    mov r4, #0x15
    b .L_16c
.L_11c:
    mov r4, #0x16
    b .L_16c
.L_124:
    mov r4, #0x17
    b .L_16c
.L_12c:
    mov r4, #0x18
    b .L_16c
.L_134:
    mov r4, #0x19
    b .L_16c
.L_13c:
    mov r4, #0x1a
    b .L_16c
.L_144:
    mov r4, #0x1b
    b .L_16c
.L_14c:
    mov r4, #0x1c
    b .L_16c
.L_154:
    mov r4, #0x1d
    b .L_16c
.L_15c:
    mvn r4, #0x0
    mov r9, #0x0
    b .L_16c
.L_168:
    ldr r4, [r8, #0x4]
.L_16c:
    cmp r9, #0x0
    ldrsh r9, [r8]
    ldrsh r8, [r8, #0x2]
    mov sl, #0x0
    bne .L_350
    add sp, sp, #0x10
    mov r0, sl
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18c:
    mov r0, r5
    bl func_ov006_021bd6bc
    movs r2, r0
    addmi sp, sp, #0x10
    movmi r0, #0x0
    ldmmiia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r6, #0x20]
    ldr r1, [r5, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT6
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov fp, r0
    ldr r1, [r5, #0x50]
    ldr r0, _LIT6
    mov r2, fp
    bl func_ov006_021b6f50
    ldr r1, [r5, #0x40]
    mov r8, r0
    cmp r1, #0x0
    ldreq r0, [r5, #0x50]
    cmpeq r0, #0x0
    beq .L_1f8
    cmp r8, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f8:
    mov r0, fp
    bl func_0202de9c
    ldr r2, [r5, #0x50]
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_294
    b .L_224
    b .L_24c
    b .L_26c
    b .L_280
    b .L_288
.L_224:
    ldr r1, [r5, #0x40]
    cmp r1, #0x2
    moveq r4, #0xb
    beq .L_240
    cmp r0, #0x3
    moveq r4, #0x2
    movne r4, #0x1
.L_240:
    cmp r8, #0x0
    moveq r4, #0x3
    b .L_294
.L_24c:
    ldr r0, [r5, #0x40]
    cmp r0, #0x1
    moveq r4, #0x9
    beq .L_294
    cmp r0, #0x2
    moveq r4, #0xc
    movne r4, #0x4
    b .L_294
.L_26c:
    ldr r0, [r5, #0x40]
    cmp r0, #0x1
    moveq r4, #0xa
    movne r4, #0x5
    b .L_294
.L_280:
    mov r4, #0x6
    b .L_294
.L_288:
    cmp r0, #0x3
    moveq r4, #0x8
    movne r4, #0x7
.L_294:
    ldr r1, [r6]
    mov r0, #0x17
    cmp r2, #0x4
    mul r2, r1, r0
    bne .L_2bc
    ldr r0, [r6, #0x4]
    add r9, r2, #0x4
    mov r0, r0, lsl #0x5
    add r8, r0, #0x34
    b .L_2cc
.L_2bc:
    ldr r0, [r6, #0x4]
    add r9, r2, #0x4
    mov r0, r0, lsl #0x5
    add r8, r0, #0x14
.L_2cc:
    ldr r0, [r5, #0x40]
    mov sl, #0x1
    cmp r0, #0x0
    bne .L_334
    ldr r0, _LIT6
    mov r1, fp
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov006_021b8e4c
    ldr r0, [r5, #0x40]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x8]
    movne r0, #0x0
    strne r0, [sp, #0x8]
    ldr r0, _LIT6
    bl func_ov006_021b8f7c
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x4]
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    mov r0, fp
    bl func_0202bbdc
    str r0, [sp, #0xc]
    b .L_350
.L_334:
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r1, [sp, #0x8]
    mov r0, fp
    str r1, [sp, #0x4]
    bl func_0202bbdc
    str r0, [sp, #0xc]
.L_350:
    ldr r1, _LIT7
    ldr r0, _LIT8
    mov r2, #0xd
    bl func_ov006_021c8174
    ldr r0, _LIT8
    mov r1, #0x2
    mov r2, #0xe
    bl func_ov006_021c8184
    ldr r1, [r6, #0x20]
    ldr r0, _LIT8
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, [r5, #0x50]
    bl func_ov006_021c8194
    cmp sl, #0x0
    beq .L_3ac
    ldr r0, _LIT8
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0x4]
    ldr r6, [sp, #0xc]
    mov r1, fp
    str r6, [sp]
    bl func_ov006_021c81a4
.L_3ac:
    ldr r0, _LIT8
    mov r1, r4
    mov r3, r9
    str r8, [sp]
    mvn r2, #0x0
    bl func_ov006_021c7964
    ldr r0, [r5, #0x48]
    cmp r0, #0x0
    ldreq r0, [r7, #0x8]
    cmpeq r0, #0x3
    bne .L_400
    ldr r1, [r5, #0x50]
    ldr r0, _LIT6
    bl func_ov006_021b7cac
    mov r2, r0
    ldr r0, _LIT8
    mov r1, #0x1
    bl func_ov006_021c7f5c
    mov r1, r0
    ldr r0, _LIT8
    bl func_ov006_021c7edc
.L_400:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_021cc588
_LIT1: .word data_ov006_021cc3a0
_LIT2: .word data_ov006_021cc478
_LIT3: .word data_ov006_021cc40c
_LIT4: .word data_ov006_021cc0f4
_LIT5: .word data_ov006_021cc0dc
_LIT6: .word data_ov006_0224f448
_LIT7: .word 0x00000322
_LIT8: .word data_ov006_0225df3c
