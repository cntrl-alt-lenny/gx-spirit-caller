; func_02027180 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_02021cd8
        .extern func_02022290
        .extern func_020224c0
        .extern func_02022644
        .extern func_0202290c
        .extern func_02022d54
        .extern func_020278dc
        .extern func_02027ddc
        .extern func_02027e44
        .extern func_02027ee4
        .extern func_02028024
        .extern func_0202813c
        .extern func_02028238
        .extern func_0209448c
        .global func_02027180
        .arm
func_02027180:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    mov r9, r0
    ldr r0, [r9]
    mov r6, #0x0
    str r0, [sp, #0x4]
    add r5, r9, #0xc0
    add r7, r9, #0xb4
    b .L_594
.L_60:
    ldr r0, [r9]
    ldr r2, [r0]
    mov r1, r2, lsr #0x18
    cmp r1, #0x4e
    bhi .L_7c
    beq .L_34c
    b .L_580
.L_7c:
    sub r1, r1, #0x6b
    cmp r1, #0xd
    addls pc, pc, r1, lsl #0x2
    b .L_580
    b .L_3f4
    b .L_400
    b .L_500
    b .L_568
    b .L_580
    b .L_c4
    b .L_108
    b .L_190
    b .L_1d4
    b .L_214
    b .L_240
    b .L_28c
    b .L_2fc
    b .L_318
.L_c4:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r9]
    ldr r1, [r1, #0x4]
    add r4, r1, r0, lsl #0x5
    mov r0, r9
    mov r1, r4
    bl func_020278dc
    str r4, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_580
.L_108:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
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
    bl func_020278dc
    ldr r0, [sp]
    str r0, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x10
    str r0, [r9]
    b .L_580
.L_190:
    ldmib r0, {r1, r2}
    cmp r1, #-2147483648
    beq .L_1ac
    ldr r0, [r9, #0x88]
    ldr r0, [r0, #0x8]
    add r0, r0, r1
    str r0, [r9, #0x70]
.L_1ac:
    cmp r2, #-2147483648
    beq .L_1c4
    ldr r0, [r9, #0x88]
    ldr r0, [r0, #0xc]
    add r0, r0, r2
    str r0, [r9, #0x74]
.L_1c4:
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_580
.L_1d4:
    ldrh r0, [r9, #0xde]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_1fc
    mov r0, #0x0
    str r0, [sp, #0x10]
    str r0, [sp, #0x18]
    add r0, sp, #0x10
    str r9, [sp, #0x14]
    bl func_02022d54
.L_1fc:
    mov r0, r9
    bl func_02027ddc
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_580
.L_214:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r9, #0xd4]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_580
.L_240:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldrh r1, [r9, #0xde]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x2
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1e
    strh r0, [r9, #0xde]
    mov r0, r9
    bl func_02027ee4
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_580
.L_28c:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_020224c0
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
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7, #0x4]
    ldmia r7, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_580
.L_2fc:
    mov r0, r9
    mov r1, r5
    mov r2, r7
    bl func_02022644
    cmp r0, #0x0
    movne r6, #0x1
    b .L_580
.L_318:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r9, #0xd6]
    mov r0, r9
    bl func_02028024
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_580
.L_34c:
    mov r1, r2, lsr #0x10
    ands r1, r1, #0xf
    beq .L_36c
    cmp r1, #0x1
    beq .L_384
    cmp r1, #0x2
    beq .L_3bc
    b .L_3e8
.L_36c:
    ldr r0, [r0, #0x4]
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_3e8
.L_384:
    mov r0, r9
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r9]
    ldr r1, [r1, #0x4]
    ldr r0, [r1, r0, lsl #0x2]
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_3e8
.L_3bc:
    mov r0, r9
    mov r1, r2, lsr #0x14
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    bl func_02022290
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
.L_3e8:
    mov r0, r9
    bl func_02027e44
    b .L_580
.L_3f4:
    add r0, r0, #0x10
    str r0, [r9]
    b .L_580
.L_400:
    ldrh r1, [r9, #0xde]
    mov r1, r1, lsl #0x1b
    movs r1, r1, lsr #0x1f
    movne r6, #0x1
    bne .L_580
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
    bl func_020224c0
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
    bl func_020224c0
    ldr r2, [r9]
    mov sl, r0
    ldr r1, [r2]
    ldr r2, [r2, #0x10]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
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
    bl func_0209448c
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0xc]
    mov r3, r8
    add r2, r1, r0
    mov r0, r9
    mov r1, r4
    bl func_0202813c
    mov r0, r4
    bl Task_InvokeLocked
    ldr r0, [r9]
    add r0, r0, #0x14
    str r0, [r9]
    b .L_580
.L_500:
    mov r1, r2, lsr #0x14
    ldr r2, [r0, #0x4]
    and r1, r1, #0xf
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r9]
    mov r4, r0
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r2, r0, asr #0x10
    mov r1, r4
    mov r0, r9
    bl func_02028238
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_580
.L_568:
    ldrh r1, [r9, #0xde]
    mov r1, r1, lsl #0x1b
    movs r1, r1, lsr #0x1f
    addeq r0, r0, #0x4
    movne r6, #0x1
    streq r0, [r9]
.L_580:
    ldr r1, [r9]
    ldr r0, [sp, #0x4]
    cmp r1, r0
    movne r0, #0x0
    strne r0, [r9, #0x4]
.L_594:
    cmp r6, #0x0
    bne .L_5ac
    mov r0, r9
    bl func_02021cd8
    cmp r0, #0x0
    beq .L_60
.L_5ac:
    ldrh r0, [r9, #0xde]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_5dc
    ldrb r0, [r9, #0xcf]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_5dc
    mov r0, r9
    add r1, r9, #0xc0
    add r2, r9, #0xb4
    bl func_0202290c
.L_5dc:
    ldr r1, [r9, #0x4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r9, #0x4]
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
