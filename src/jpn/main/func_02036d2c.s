; func_02036d2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b680
        .extern func_02034a34
        .extern func_0203537c
        .extern func_02035fa4
        .extern func_020361fc
        .extern func_02036660
        .extern func_020366cc
        .extern func_0203678c
        .extern func_020368fc
        .extern func_02036c18
        .extern func_02036c1c
        .extern func_02038498
        .extern func_02038770
        .extern func_02038908
        .extern func_0203a4d0
        .extern func_0203a528
        .extern func_0203a7fc
        .extern func_0203bbd8
        .global func_02036d2c
        .arm
func_02036d2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r4, _LIT0
    mov r6, r0
    ldrh r0, [r4, #0x12]
    mov fp, r1
    str r2, [sp, #0x4]
    tst r0, #0x4000
    mov r0, #0x1
    str r0, [sp, #0x10]
    mov r5, r3
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r4, #0x12]
    tst r0, #0x2000
    addne sp, sp, #0x18
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r4, #0x12]
    ldr r9, _LIT0
    tst r0, #0x1000
    mov r0, r6, lsl #0x10
    mov r4, r0, lsr #0x10
    ldr r1, [r9, #0x34]
    mov r0, #0xc
    orrne r5, r5, #0x80
    orrne r5, r5, #0x8000
    mla r7, r4, r0, r1
    mov r8, r4
    tst r6, #0x1000000
    beq .L_bc
    mov sl, r0
.L_84:
    ldrb r0, [r7, #0x9]
    mov r0, r0, asr #0x5
    cmp r0, #0x2
    blt .L_bc
    bl func_02038908
    add r0, r4, r0
    bl func_02034a34
    orr r6, r0, #0x1000000
    mov r0, r6, lsl #0x10
    ldr r1, [r9, #0x34]
    mov r4, r0, lsr #0x10
    mla r7, r4, sl, r1
    cmp r8, r0, lsr #0x10
    bne .L_84
.L_bc:
    mov r0, r6, lsr #0x14
    and sl, r0, #0xf
    ands r0, r6, #0x1000000
    str r0, [sp, #0xc]
    bne .L_f4
    cmp fp, #0x0
    blt .L_ec
    cmp fp, #0x8000
    addlt sp, sp, #0x18
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    and fp, fp, #0xf
.L_ec:
    cmp sl, #0x4
    mvneq fp, #0x0
.L_f4:
    ldrb r0, [r7, #0x8]
    ands r3, r5, #0x1f
    moveq r3, #0x1
    and r0, r0, #0xf
    add r1, r0, #0x1
    cmp r3, #0x1
    bne .L_120
    cmp r1, r3
    bicgt r0, r5, #0x1f
    movgt r3, r1
    orrgt r5, r0, r1
.L_120:
    and r2, r5, #0x1000
    str r2, [sp]
    mov r0, r6
    mov r1, r8
    mov r2, fp
    bl func_020368fc
    str r0, [sp, #0x8]
    cmp r0, #0x0
    addlt sp, sp, #0x18
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sp, #0x8]
    mov r0, r6
    bl func_02036660
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldr r0, [sp, #0x8]
    mov r1, #0x78
    mla r9, r0, r1, r2
    mov r0, r9
    mov r1, r6
    bl func_0203537c
    cmp r0, #0x0
    addne sp, sp, #0x18
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp sl, #0x4
    beq .L_1b4
    ldr r0, [r9, #0x34]
    cmp r0, r6
    bne .L_1b4
    ldrh r0, [r9, #0x68]
    tst r0, #0x2000
    beq .L_1d4
.L_1b4:
    ldrh r1, [r9, #0x68]
    mov r0, #0x0
    str r0, [sp, #0x10]
    tst r1, #0x2000
    bne .L_1d4
    ldr r1, [sp, #0x10]
    mov r0, r9
    bl func_020361fc
.L_1d4:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_214
    ldrh r0, [r9, #0x74]
    cmp r0, r8
    bne .L_214
    ldrsb r1, [r9, #0x2b]
    cmp r1, #0x0
    beq .L_214
    ldr r0, _LIT0
    ldrh r0, [r0, #0x6]
    sub r0, r1, r0
    cmp r0, #0x0
    addgt sp, sp, #0x18
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_214:
    cmp sl, #0x5
    addls pc, pc, sl, lsl #0x2
    b .L_40c
    b .L_40c
    b .L_238
    b .L_294
    b .L_2f0
    b .L_350
    b .L_40c
.L_238:
    mov r0, r6
    mov r1, r5
    bl func_0203a4d0
    movs sl, r0
    beq .L_288
    mov r0, r9
    mov r1, r6
    mov r2, r8
    bl func_020366cc
    ldr r0, [sp, #0x8]
    cmp r0, #0x4
    bge .L_26c
    bl func_02038770
.L_26c:
    str sl, [r9]
    ldr r0, [sp, #0x4]
    strb fp, [r9, #0x6d]
    strh r0, [r9, #0x1c]
    ldr r0, [sp, #0x8]
    strb r0, [r9, #0x6a]
    b .L_418
.L_288:
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_294:
    mov r0, r6
    mov r1, r5
    bl func_0203a4d0
    movs sl, r0
    mov r0, r9
    beq .L_2dc
    mov r1, r6
    mov r2, r8
    bl func_020366cc
    str sl, [r9]
    ldr r0, [sp, #0x4]
    strb fp, [r9, #0x6d]
    strh r0, [r9, #0x1c]
    ldr r0, [sp, #0x8]
    strb r0, [r9, #0x6a]
    mov r0, #0x0
    str r0, [sp, #0x10]
    b .L_418
.L_2dc:
    mov r1, #0x0
    bl func_020361fc
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f0:
    mov r0, r6
    mov r1, r5
    bl func_0203a4d0
    movs sl, r0
    bne .L_324
    mov r0, r6
    mov r1, r9
    bl func_0203678c
    cmp r0, #0x0
    bne .L_2f0
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_324:
    mov r0, r9
    mov r1, r6
    mov r2, r8
    bl func_020366cc
    str sl, [r9]
    ldr r0, [sp, #0x4]
    strb fp, [r9, #0x6d]
    strh r0, [r9, #0x1c]
    ldr r0, [sp, #0x8]
    strb r0, [r9, #0x6a]
    b .L_418
.L_350:
    ldr r0, [sp, #0x8]
    mov r1, r5
    sub sl, r0, #0x14
    mov r0, r6
    mov r2, sl
    bl func_0203a528
    str r0, [sp, #0x14]
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    mov r1, r6
    mov r2, r8
    bl func_020366cc
    ldr r0, [sp, #0x14]
    str r0, [r9]
    ldr r0, [sp, #0x4]
    strb fp, [r9, #0x6d]
    strh r0, [r9, #0x1c]
    ldr r0, [sp, #0x8]
    strb sl, [r9, #0x6c]
    strb r0, [r9, #0x6a]
    mov r0, #0x0
    str r0, [r9, #0x4]
    mov r8, r0
.L_3b8:
    mov r1, sl
    mov r2, r6
    mov r3, r8
    add r0, r9, #0x4
    bl func_0203bbd8
    cmp r0, #0x0
    bne .L_418
    ldr r0, [r9, #0x34]
    tst r0, #0x1000000
    beq .L_3f4
    mov r0, r6
    mov r1, r9
    bl func_0203678c
    cmp r0, #0x0
    bne .L_3b8
.L_3f4:
    mov r0, r9
    mov r1, #0x0
    bl func_020361fc
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_40c:
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_418:
    str r5, [r9, #0x3c]
    ldrb r1, [r7, #0x7]
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1b
    strb r0, [r9, #0x2b]
    beq .L_440
    mov r0, r9
    bl func_02035fa4
.L_440:
    mov r0, r9
    mov r1, #0x0
    bl func_02036c1c
    mov r0, r6
    mov r1, #0x1
    bl func_02038498
    cmp r0, #0x0
    ble .L_474
    orr r0, r4, #0x8c00000
    bl func_0203a7fc
    cmp r0, #0x0
    addne r0, r0, #0x20
    strne r0, [r9, #0x8]
.L_474:
    bl func_02036c18
    mov r0, r9
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_0219b680
