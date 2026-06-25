; func_020373c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b264
        .extern data_0219b680
        .extern func_02034a34
        .extern func_020361fc
        .extern func_020366cc
        .extern func_02036c18
        .extern func_02036d2c
        .extern func_020371fc
        .extern func_020372d8
        .global func_020373c4
        .arm
func_020373c4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    ldr r5, _LIT0
    mov r4, r0
    mov r0, #0x0
    strh r0, [r5, #0xc]
    ldrh r5, [r5, #0x12]
    str r1, [sp]
    ldr r1, [sp, #0x40]
    str r2, [sp, #0x4]
    mov sl, r3
    tst r5, #0x4000
    str r1, [sp, #0x40]
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r1
    ands r0, r0, #0x20
    str r0, [sp, #0x8]
    ldrne r0, [sp]
    mov r5, r4
    orrne r0, r0, #0x600
    strne r0, [sp]
    cmp r4, #0x0
    rsblt r4, r4, #0x0
    mov r0, r4
    bl func_02034a34
    mov r4, r0
    cmp sl, #0x0
    ldr r0, [sp, #0x4]
    movlt sl, #0x1e
    cmp r0, #0x0
    bge .L_9c
    ldr r1, _LIT0
    mov r0, #0x1e
    str r0, [sp, #0x4]
    ldrsh r0, [r1, #0x4]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [sp, #0x4]
.L_9c:
    bl func_020371fc
    ldr r0, [sp]
    bic r8, r4, #0x1000000
    and r0, r0, #0x800
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x40]
    and r0, r0, #0x80
    str r0, [sp, #0xc]
    mov r0, #0x0
    str r0, [sp, #0x14]
.L_c4:
    ldr lr, _LIT1
    mvn r3, #0x0
    mov r7, #0x0
    ldr r1, _LIT2
    str r3, [sp, #0x18]
    mov fp, r3
    mov r6, r7
    mov r2, r7
    mov r9, #0x1
    sub r4, lr, #0x2400
.L_ec:
    ldr r0, [r1, r2, lsl #0x2]
    cmp r0, #0x0
    moveq fp, r2
    beq .L_150
    ldr ip, [r0, #0x34]
    cmp ip, r8
    bne .L_130
    ldrh ip, [r0, #0x68]
    tst ip, lr
    bne .L_130
    cmp r5, #0x0
    blt .L_130
    ldr r1, _LIT0
    mov r2, #0x80
    strh r2, [r1, #0xc]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_130:
    ldrh r0, [r0, #0x68]
    tst r0, #0x2000
    movne r3, r2
    bne .L_150
    tst r0, r4
    orreq r6, r6, r9, lsl r2
    streq r2, [sp, #0x18]
    addeq r7, r7, #0x1
.L_150:
    add r2, r2, #0x1
    cmp r2, #0x4
    blt .L_ec
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_170
    cmp r3, #0x0
    movge fp, r3
.L_170:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    bne .L_1e8
    cmp r6, #0x0
    beq .L_1e8
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    ldreq r0, [sp, #0xc]
    cmpeq r0, #0x0
    bne .L_1e8
    tst r6, #0xf
    mov r9, #0x0
    beq .L_1d8
    ldr r4, _LIT2
.L_1a8:
    tst r6, #0x1
    beq .L_1c8
    ldr r0, [r4, r9, lsl #0x2]
    mov r1, sl
    bl func_020361fc
    ldr r0, [r4, r9, lsl #0x2]
    cmp r0, #0x0
    orreq r6, r6, #0x8000
.L_1c8:
    add r9, r9, #0x1
    mov r6, r6, asr #0x1
    tst r6, #0xf
    bne .L_1a8
.L_1d8:
    cmp r6, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x14]
    bne .L_c4
.L_1e8:
    cmp r7, #0x2
    ldrge r0, _LIT0
    ldrgesh r0, [r0, #0x4]
    strge r0, [sp, #0x18]
    ldr r0, [sp, #0x40]
    tst r0, #0x40
    beq .L_20c
    cmp fp, #0x0
    bge .L_260
.L_20c:
    cmp fp, #0x0
    blt .L_220
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    blt .L_2e8
.L_220:
    ldr r0, _LIT0
    ldrsh r0, [r0, #0x4]
    cmp r0, #0x0
    movlt fp, #0x0
    blt .L_260
    ldr r0, [sp]
    tst r0, #0x2000
    beq .L_250
    cmp fp, #0x0
    bge .L_2e8
    bic r0, r0, #0x2000
    str r0, [sp]
.L_250:
    cmp fp, #0x0
    addlt sp, sp, #0x1c
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_260:
    ldr r0, [sp, #0x40]
    tst r0, #0x1
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT3
    mov r0, #0x78
    mla r4, fp, r0, r1
    mov r0, r4
    mov r1, r8
    mov r2, r8
    bl func_020366cc
    mov r3, #0x2000
    ldr r1, _LIT0
    ldr r2, _LIT2
    mov r0, fp, lsl #0x18
    strh r3, [r4, #0x68]
    mov r3, r0, asr #0x18
    ldr r0, [sp, #0x4]
    strb r3, [r4, #0x6d]
    strh r0, [r4, #0x1c]
    ldr r0, [sp]
    strh fp, [r1, #0x4]
    str r0, [r4, #0x3c]
    strb fp, [r4, #0x6c]
    strb r3, [r4, #0x6a]
    str r4, [r2, fp, lsl #0x2]
    bl func_02036c18
    ldr r1, _LIT0
    mov r2, #0x2
    strh r2, [r1, #0xc]
    add sp, sp, #0x1c
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e8:
    ldr r2, [sp, #0x4]
    ldr r3, [sp]
    mov r0, r8
    orr r1, fp, #0x8000
    bl func_02036d2c
    cmp r0, #0x0
    bne .L_33c
    ldr r0, [sp]
    tst r0, #0x800
    bne .L_330
    mov r0, #0x0
    bl func_020372d8
    cmp r0, #0x0
    beq .L_330
    ldr r0, [sp]
    bic r0, r0, #0x2000
    str r0, [sp]
    b .L_220
.L_330:
    add sp, sp, #0x1c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_33c:
    ldr r1, _LIT0
    ldr r2, _LIT2
    strh fp, [r1, #0x4]
    str r0, [r2, fp, lsl #0x2]
    mov r2, #0x1
    strh r2, [r1, #0xc]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b200
_LIT1: .word 0x00003403
_LIT2: .word data_0219b264
_LIT3: .word data_0219b680
