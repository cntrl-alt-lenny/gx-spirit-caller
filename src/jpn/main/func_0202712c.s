; func_0202712c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_02021c84
        .extern func_0202223c
        .extern func_0202246c
        .extern func_020225f0
        .extern func_020228b8
        .extern func_02022d00
        .extern func_02027888
        .extern func_02027d88
        .extern func_02027df0
        .extern func_02027e90
        .extern func_02027fd0
        .extern func_020280e8
        .extern func_020281e4
        .extern func_02094398
        .global func_0202712c
        .arm
func_0202712c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    mov r9, r0
    ldr r0, [r9]
    mov r6, #0x0
    str r0, [sp, #0x4]
    add r5, r9, #0xc0
    add r7, r9, #0xb4
    b .L_558
.L_24:
    ldr r0, [r9]
    ldr r2, [r0]
    mov r1, r2, lsr #0x18
    cmp r1, #0x4e
    bhi .L_40
    beq .L_310
    b .L_544
.L_40:
    sub r1, r1, #0x6b
    cmp r1, #0xd
    addls pc, pc, r1, lsl #0x2
    b .L_544
    b .L_3b8
    b .L_3c4
    b .L_4c4
    b .L_52c
    b .L_544
    b .L_88
    b .L_cc
    b .L_154
    b .L_198
    b .L_1d8
    b .L_204
    b .L_250
    b .L_2c0
    b .L_2dc
.L_88:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    ldr r1, [r1, #0x4]
    add r4, r1, r0, lsl #0x5
    mov r0, r9
    mov r1, r4
    bl func_02027888
    str r4, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_544
.L_cc:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    add sl, sp, #0x1c
    ldr r4, [r1, #0x8]
    ldr r8, [r1, #0xc]
    ldr r1, [r1, #0x4]
    cmp r4, #-2147483648
    add fp, r1, r0, lsl #0x5
    str fp, [sp]
    ldmia fp!, {r0, r1, r2, r3}
    stmia sl!, {r0, r1, r2, r3}
    ldmia fp, {r0, r1, r2, r3}
    stmia sl, {r0, r1, r2, r3}
    ldrne r0, [sp, #0x24]
    add r1, sp, #0x1c
    addne r0, r0, r4
    strne r0, [sp, #0x24]
    cmp r8, #-2147483648
    ldrne r0, [sp, #0x28]
    addne r0, r0, r8
    strne r0, [sp, #0x28]
    mov r0, r9
    bl func_02027888
    ldr r0, [sp]
    str r0, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x10
    str r0, [r9]
    b .L_544
.L_154:
    ldmib r0, {r1, r2}
    cmp r1, #-2147483648
    beq .L_170
    ldr r0, [r9, #0x88]
    ldr r0, [r0, #0x8]
    add r0, r0, r1
    str r0, [r9, #0x70]
.L_170:
    cmp r2, #-2147483648
    beq .L_188
    ldr r0, [r9, #0x88]
    ldr r0, [r0, #0xc]
    add r0, r0, r2
    str r0, [r9, #0x74]
.L_188:
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_544
.L_198:
    ldrh r0, [r9, #0xde]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_1c0
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x18]
    add r0, sp, #0x10
    str r9, [sp, #0x14]
    bl func_02022d00
.L_1c0:
    mov r0, r9
    bl func_02027d88
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_544
.L_1d8:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    strh r0, [r9, #0xd4]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_544
.L_204:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldrh r1, [r9, #0xde]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x2
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1e
    strh r0, [r9, #0xde]
    mov r0, r9
    bl func_02027e90
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_544
.L_250:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7]
    ldr r2, [r9]
    mov r0, r9
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7, #0x4]
    ldmia r7, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_544
.L_2c0:
    mov r0, r9
    mov r1, r5
    mov r2, r7
    bl func_020225f0
    cmp r0, #0x0
    movne r6, #0x1
    b .L_544
.L_2dc:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    strh r0, [r9, #0xd6]
    mov r0, r9
    bl func_02027fd0
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_544
.L_310:
    mov r1, r2, lsr #0x10
    ands r1, r1, #0xf
    beq .L_330
    cmp r1, #0x1
    beq .L_348
    cmp r1, #0x2
    beq .L_380
    b .L_3ac
.L_330:
    ldr r0, [r0, #0x4]
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_3ac
.L_348:
    mov r0, r9
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [r9]
    ldr r1, [r1, #0x4]
    ldr r0, [r1, r0, lsl #0x2]
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_3ac
.L_380:
    mov r0, r9
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    bl func_0202223c
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
.L_3ac:
    mov r0, r9
    bl func_02027df0
    b .L_544
.L_3b8:
    add r0, r0, #0x10
    str r0, [r9]
    b .L_544
.L_3c4:
    ldrh r1, [r9, #0xde]
    mov r1, r1, lsl #0x1b
    movs r1, r1, lsr #0x1f
    movne r6, #0x1
    bne .L_544
    mov r1, r2, lsr #0x10
    ldr r2, [r9, #0x74]
    and r1, r1, #0xff
    str r2, [sp, #0x8]
    ldr r2, [r0, #0x4]
    ldr r8, [r0, #0x8]
    str r2, [sp, #0xc]
    ldr r2, [r0, #0xc]
    mov r0, r9
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    mov r4, r0
    ldr r1, [r2]
    ldr r2, [r2, #0xc]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    mov sl, r0
    ldr r1, [r2]
    ldr r2, [r2, #0x10]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov fp, r0
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    orr r1, r4, sl, lsl #0x5
    orr r1, r1, fp, lsl #0xa
    mov r1, r1, lsl #0x10
    mov r4, r0
    mov r0, r1, lsr #0x10
    mov r1, r4
    mov r2, r8
    bl func_02094398
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0xc]
    mov r3, r8
    add r2, r1, r0
    mov r0, r9
    mov r1, r4
    bl func_020280e8
    mov r0, r4
    bl Task_InvokeLocked
    ldr r0, [r9]
    add r0, r0, #0x14
    str r0, [r9]
    b .L_544
.L_4c4:
    mov r1, r2, lsr #0x14
    ldr r2, [r0, #0x4]
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    mov r4, r0
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r2, r0, asr #0x10
    mov r1, r4
    mov r0, r9
    bl func_020281e4
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_544
.L_52c:
    ldrh r1, [r9, #0xde]
    mov r1, r1, lsl #0x1b
    movs r1, r1, lsr #0x1f
    addeq r0, r0, #0x4
    movne r6, #0x1
    streq r0, [r9]
.L_544:
    ldr r1, [r9]
    ldr r0, [sp, #0x4]
    cmp r1, r0
    movne r0, #0x0
    strne r0, [r9, #0x4]
.L_558:
    cmp r6, #0x0
    bne .L_570
    mov r0, r9
    bl func_02021c84
    cmp r0, #0x0
    beq .L_24
.L_570:
    ldrh r0, [r9, #0xde]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_5a0
    ldrb r0, [r9, #0xcf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_5a0
    mov r0, r9
    add r1, r9, #0xc0
    add r2, r9, #0xb4
    bl func_020228b8
.L_5a0:
    ldr r1, [r9, #0x4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r9, #0x4]
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
