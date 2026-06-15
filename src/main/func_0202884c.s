; func_0202884c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .extern func_0202928c
        .extern func_02029458
        .extern func_02029624
        .extern func_020296cc
        .extern func_020298f8
        .extern func_020299c4
        .extern func_02029b6c
        .extern func_02029c30
        .extern func_02029c80
        .extern func_02029d40
        .extern func_0209448c
        .global func_0202884c
        .arm
func_0202884c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x7c
    mov r9, r0
    ldr r0, [r9]
    mov fp, #0x0
    str r0, [sp, #0xc]
    add r0, r9, #0x9a
    add r6, r0, #0x100
    add r0, r9, #0x178
    str r0, [sp, #0x14]
    mvn r0, #0x0
    add r7, r9, #0x16c
    add r4, r9, #0x100
    str r0, [sp, #0x10]
    b .L_974
.L_84:
    ldr r3, [r9]
    ldr r2, [r3]
    mov r0, r2, lsr #0x18
    cmp r0, #0x4e
    bhi .L_a0
    beq .L_71c
    b .L_960
.L_a0:
    sub r0, r0, #0x6b
    cmp r0, #0x25
    addls pc, pc, r0, lsl #0x2
    b .L_960
    b .L_7c4
    b .L_7d0
    b .L_8e0
    b .L_948
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_960
    b .L_148
    b .L_18c
    b .L_214
    b .L_260
    b .L_2f0
    b .L_344
    b .L_3cc
    b .L_424
    b .L_450
    b .L_494
    b .L_508
    b .L_524
    b .L_580
    b .L_5c4
    b .L_608
    b .L_690
    b .L_6f0
.L_148:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r9]
    ldr r1, [r1, #0x4]
    add r5, r1, r0, lsl #0x5
    mov r0, r9
    mov r1, r5
    bl func_0202928c
    str r5, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_960
.L_18c:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r9]
    add r5, sp, #0x5c
    ldr sl, [r1, #0x8]
    ldr ip, [r1, #0xc]
    ldr r1, [r1, #0x4]
    cmp sl, #-2147483648
    add r8, r1, r0, lsl #0x5
    str r8, [sp, #0x8]
    ldmia r8!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r8, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldrne r0, [sp, #0x64]
    add r1, sp, #0x5c
    addne r0, r0, sl
    strne r0, [sp, #0x64]
    cmp ip, #-2147483648
    ldrne r0, [sp, #0x68]
    addne r0, r0, ip
    strne r0, [sp, #0x68]
    mov r0, r9
    bl func_0202928c
    ldr r0, [sp, #0x8]
    str r0, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x10
    str r0, [r9]
    b .L_960
.L_214:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r9]
    ldr r2, [sp, #0x10]
    ldr r3, [r1, #0x4]
    mov r1, #0x2c
    mla r5, r0, r1, r3
    mov r0, r9
    mov r1, r5
    bl func_020296cc
    str r5, [r9, #0x94]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_960
.L_260:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r9]
    add r5, sp, #0x30
    ldmib r1, {r2, sl, ip}
    mov r1, #0x2c
    mla r8, r0, r1, r2
    str r8, [sp, #0x4]
    ldmia r8!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r8!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r8, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    cmp sl, #-2147483648
    ldrne r0, [sp, #0x44]
    ldr r2, [sp, #0x10]
    addne r0, r0, sl
    strne r0, [sp, #0x44]
    cmp ip, #-2147483648
    ldrne r0, [sp, #0x48]
    add r1, sp, #0x30
    addne r0, r0, ip
    strne r0, [sp, #0x48]
    mov r0, r9
    bl func_020296cc
    ldr r0, [sp, #0x4]
    str r0, [r9, #0x94]
    ldr r0, [r9]
    add r0, r0, #0x10
    str r0, [r9]
    b .L_960
.L_2f0:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r1, [r9]
    ldr r3, [r1, #0x4]
    ldr r2, [r1, #0x8]
    mov r1, #0x2c
    mla r5, r0, r1, r3
    mov r0, r2, lsl #0x10
    mov r2, r0, asr #0x10
    mov r0, r9
    mov r1, r5
    bl func_020296cc
    str r5, [r9, #0x94]
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_960
.L_344:
    ldrh r2, [r4, #0x9a]
    ldmib r3, {r0, r1}
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    beq .L_38c
    cmp r0, #-2147483648
    beq .L_370
    ldr r2, [r9, #0x88]
    ldr r2, [r2, #0x8]
    add r0, r2, r0
    str r0, [r9, #0x70]
.L_370:
    cmp r1, #-2147483648
    beq .L_3bc
    ldr r0, [r9, #0x88]
    ldr r0, [r0, #0xc]
    add r0, r0, r1
    str r0, [r9, #0x74]
    b .L_3bc
.L_38c:
    cmp r0, #-2147483648
    beq .L_3a4
    ldr r2, [r9, #0x94]
    ldr r2, [r2, #0x14]
    add r0, r2, r0
    str r0, [r9, #0x7c]
.L_3a4:
    cmp r1, #-2147483648
    beq .L_3bc
    ldr r0, [r9, #0x94]
    ldr r0, [r0, #0x18]
    add r0, r0, r1
    str r0, [r9, #0x80]
.L_3bc:
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_960
.L_3cc:
    ldrh r0, [r4, #0x9a]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    beq .L_3f4
    mov r0, #0x0
    str r0, [sp, #0x24]
    str r0, [sp, #0x2c]
    add r0, sp, #0x24
    str r9, [sp, #0x28]
    bl func_02022d54
.L_3f4:
    ldrh r0, [r4, #0x9a]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    mov r0, r9
    beq .L_410
    bl func_02029458
    b .L_414
.L_410:
    bl func_020298f8
.L_414:
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_960
.L_424:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r4, #0x8c]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_960
.L_450:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r6]
    bic r1, r1, #0x2
    orr r0, r1, r0, lsr #0x1e
    strh r0, [r6]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_960
.L_494:
    mov r0, r2, lsr #0x10
    ldr r2, [r3, #0x4]
    and r1, r0, #0xff
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
    ldr r3, [sp, #0x14]
    ldmia r7, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_960
.L_508:
    ldr r1, [sp, #0x14]
    mov r0, r9
    mov r2, r7
    bl func_02022644
    cmp r0, #0x0
    movne fp, #0x1
    b .L_960
.L_524:
    mov r0, r2, lsr #0x10
    ldr r2, [r3, #0x4]
    and r1, r0, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r9]
    mov r5, r0
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r5, [r4, #0x8e]
    strh r0, [r4, #0x90]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_960
.L_580:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r6]
    bic r1, r1, #0x8
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r6]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_960
.L_5c4:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldrh r1, [r6]
    bic r1, r1, #0x20
    orr r0, r1, r0, lsr #0x1a
    strh r0, [r6]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_960
.L_608:
    mov r0, r2, lsr #0x14
    and r1, r0, #0xf
    ldr r2, [r3, #0x8]
    mov r0, r9
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r5, r0, asr #0x10
    ldr r2, [r9]
    mov r0, r9
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r3, r5
    ldr r1, [r9]
    ldr r2, [r1, #0x4]
    str r0, [sp]
    mov r0, r9
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_02029b6c
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_960
.L_690:
    mov r1, r2, lsr #0x14
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r9]
    mov r0, r0, lsl #0x10
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r5, r0, asr #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r2, r0
    mov r1, r5
    mov r0, r9
    bl func_02029c30
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_960
.L_6f0:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r9, #0x8c]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_960
.L_71c:
    mov r0, r2, lsr #0x10
    ands r0, r0, #0xf
    beq .L_73c
    cmp r0, #0x1
    beq .L_754
    cmp r0, #0x2
    beq .L_78c
    b .L_7b8
.L_73c:
    ldr r0, [r3, #0x4]
    str r0, [r9, #0x68]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_7b8
.L_754:
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
    b .L_7b8
.L_78c:
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
.L_7b8:
    mov r0, r9
    bl func_02029624
    b .L_960
.L_7c4:
    add r0, r3, #0x10
    str r0, [r9]
    b .L_960
.L_7d0:
    ldrh r0, [r4, #0x9a]
    mov r1, r0, lsl #0x19
    movs r1, r1, lsr #0x1f
    movne fp, #0x1
    bne .L_960
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    mov r0, r2, lsr #0x10
    and r1, r0, #0xff
    ldr r0, [r3, #0x4]
    ldr r2, [r3, #0x8]
    str r0, [sp, #0x18]
    ldr r0, [r3, #0xc]
    ldrne sl, [r9, #0x74]
    mov r0, r0, lsl #0x10
    mov r8, r2, lsl #0x1
    mov r2, r0, lsr #0x10
    mov r0, r9
    ldreq sl, [r9, #0x80]
    bl func_020224c0
    ldr r2, [r9]
    mov r5, r0
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
    str r0, [sp, #0x1c]
    ldr r1, [r2]
    ldr r2, [r2, #0x10]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    str r0, [sp, #0x20]
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    ldr r1, [sp, #0x1c]
    orr r2, r5, r1, lsl #0x5
    ldr r1, [sp, #0x20]
    mov r5, r0
    orr r1, r2, r1, lsl #0xa
    mov r1, r1, lsl #0x10
    mov r0, r1, lsr #0x10
    mov r1, r5
    mov r2, r8
    bl func_0209448c
    ldr r0, [sp, #0x18]
    mov r3, r8
    add r2, sl, r0
    mov r0, r9
    mov r1, r5
    bl func_02029c80
    mov r0, r5
    bl Task_InvokeLocked
    ldr r0, [r9]
    add r0, r0, #0x14
    str r0, [r9]
    b .L_960
.L_8e0:
    mov r0, r2, lsr #0x14
    ldr r2, [r3, #0x4]
    and r1, r0, #0xf
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r9]
    mov r5, r0
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
    mov r1, r5
    mov r0, r9
    bl func_02029d40
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_960
.L_948:
    ldrh r0, [r4, #0x9a]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    addeq r0, r3, #0x4
    movne fp, #0x1
    streq r0, [r9]
.L_960:
    ldr r1, [r9]
    ldr r0, [sp, #0xc]
    cmp r1, r0
    movne r0, #0x0
    strne r0, [r9, #0x4]
.L_974:
    cmp fp, #0x0
    bne .L_98c
    mov r0, r9
    bl func_02021cd8
    cmp r0, #0x0
    beq .L_84
.L_98c:
    add r0, r9, #0x100
    ldrh r0, [r0, #0x9a]
    mov r1, r0, lsl #0x1f
    movs r1, r1, lsr #0x1f
    beq .L_9b4
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    bne .L_9b4
    mov r0, r9
    bl func_020299c4
.L_9b4:
    add r0, r9, #0x100
    ldrh r0, [r0, #0x9a]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_9e8
    ldrb r0, [r9, #0x187]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_9e8
    mov r0, r9
    add r1, r9, #0x178
    add r2, r9, #0x16c
    bl func_0202290c
.L_9e8:
    ldr r1, [r9, #0x4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r9, #0x4]
    add sp, sp, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
