; func_020a2690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern AutoloadCallback
        .extern data_02102604
        .extern data_02102608
        .extern func_0209281c
        .extern func_02094688
        .extern func_020976cc
        .extern func_02097db0
        .extern func_02097e1c
        .extern func_02097efc
        .extern func_02098010
        .extern func_02098294
        .extern func_020a25fc
        .extern func_020a54ec
        .extern func_020a5560
        .global func_020a2690
        .arm
func_020a2690:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x6c
    str r2, [sp, #0x4]
    cmp r2, #0x164
    mov r2, #0x0
    mov sl, r0
    mov r9, r1
    str r2, [sp, #0x8]
    bcc .L_444
    ldr r8, [sp, #0x4]
    mov r7, r9
    str r2, [sp, #0xc]
    mov r6, r2
    mov r5, r2
    cmp sl, #0x0
    add r7, r7, #0x160
    sub r8, r8, #0x160
    beq .L_74
    ldr r4, [sl, #0x2c]
    ldr r3, [sl, #0x24]
    mov r2, #0x160
    sub fp, r4, r3
    bl func_02097e1c
    cmp r0, #0x160
    ldr r4, [r9, #0x80]
    movlt r8, r5
    cmp r4, #0x0
    moveq r4, #0x1000000
    b .L_ec
.L_74:
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r4, [r0, #0x80]
    add r0, sp, #0x20
    cmp r4, #0x0
    moveq r4, #0x1000000
    str r1, [sp, #0xc]
    bl func_02098294
    ldr r0, _LIT1
    mov r1, #0x3
    bl func_020976cc
    mov r1, r0
    mvn r0, #0x0
    str r0, [sp]
    add r0, sp, #0x20
    mov r2, #0x0
    add r3, r4, #0x88
    bl func_02098010
    ldr r2, [sp, #0x4c]
    ldr r1, [sp, #0x44]
    ldr r0, _LIT0
    sub fp, r2, r1
    mov r1, r9
    mov r2, #0x160
    add sl, sp, #0x20
    bl func_02094688
    ldr r1, [r9, #0x60]
    ldr r0, _LIT2
    orr r0, r1, r0
    str r0, [r9, #0x60]
.L_ec:
    cmp r8, #0x88
    movcc r8, #0x0
    bcc .L_120
    mov r0, sl
    add r1, fp, r4
    mov r2, #0x0
    bl func_02097db0
    mov r0, sl
    mov r1, r7
    mov r2, #0x88
    bl func_02097e1c
    add r7, r7, #0x88
    sub r8, r8, #0x88
.L_120:
    cmp r8, #0x70
    bcc .L_190
    mov r0, r7
    mov r6, r7
    bl func_020a5560
    add r7, r7, #0x70
    sub r8, r8, #0x70
    mov r0, #0x3
    str r0, [sp]
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x160
    mov r3, r9
    bl func_020a54ec
    ldr r0, [sl, #0x8]
    mov r4, #0x0
    b .L_168
.L_164:
    add r4, r4, #0x1
.L_168:
    cmp r4, #0x3
    bge .L_17c
    ldrsb r1, [r0, r4]
    cmp r1, #0x0
    bne .L_164
.L_17c:
    mov r2, r4
    add r1, r6, #0x10
    bl func_02094688
    str r4, [r6, #0x14]
    b .L_194
.L_190:
    mov r8, #0x0
.L_194:
    cmp r8, #0x10
    movcc r8, #0x0
    bcc .L_1dc
    mov r0, #0x0
    str r0, [r7]
    ldr r0, [sl, #0x24]
    ldr r1, [r9, #0x20]
    add r0, fp, r0
    add r0, r1, r0
    str r0, [r7, #0x4]
    ldr r0, [sl, #0x24]
    ldr r1, [r9, #0x30]
    add r0, fp, r0
    add r0, r1, r0
    mov r5, r7
    str r0, [r7, #0x8]
    add r7, r7, #0x10
    sub r8, r8, #0x10
.L_1dc:
    ldr r1, [r9, #0x2c]
    ldr r0, [r9, #0x3c]
    add r0, r1, r0
    cmp r8, r0
    bcc .L_288
    ldr r4, [sl, #0x24]
    ldr r1, [r5, #0x4]
    mov r0, sl
    sub r1, r1, r4
    mov r2, #0x0
    bl func_02097db0
    ldr r2, [r9, #0x2c]
    mov r0, sl
    mov r1, r7
    bl func_02097e1c
    mov r0, #0x3
    str r0, [sp]
    ldr r1, [r5, #0x4]
    ldr r2, [r9, #0x2c]
    mov r0, r6
    mov r3, r7
    bl func_020a54ec
    ldr r1, [r9, #0x2c]
    mov r0, sl
    add r7, r7, r1
    ldr r1, [r5, #0x8]
    mov r2, #0x0
    sub r1, r1, r4
    bl func_02097db0
    ldr r2, [r9, #0x3c]
    mov r0, sl
    mov r1, r7
    bl func_02097e1c
    mov r0, #0x3
    str r0, [sp]
    ldr r1, [r5, #0x8]
    ldr r2, [r9, #0x3c]
    mov r3, r7
    mov r0, r6
    bl func_020a54ec
    mov r0, #0x1
    str r0, [sp, #0x8]
    b .L_35c
.L_288:
    cmp r8, #0xcc00
    bcc .L_35c
    ldr r4, [sl, #0x24]
    ldr r5, [r5, #0x4]
    mov r0, sl
    sub r1, r5, r4
    mov r2, #0x0
    bl func_02097db0
    mov r0, sl
    mov r1, r7
    mov r2, #0x4400
    bl func_02097e1c
    mov r0, #0x3
    str r0, [sp]
    mov r0, r6
    mov r1, r5
    mov r2, #0x4400
    mov r3, r7
    bl func_020a54ec
    add r1, r5, #0x4400
    mov r0, sl
    sub r1, r1, r4
    mov r2, #0x0
    bl func_02097db0
    mov r0, sl
    add r1, r7, #0x4400
    mov r2, #0x4400
    bl func_02097e1c
    mov r0, #0x2
    str r0, [sp]
    mov r0, r6
    add r1, r5, #0x4400
    mov r2, #0x4400
    add r3, r7, #0x4400
    bl func_020a54ec
    add r1, r5, #0x8800
    mov r0, sl
    sub r1, r1, r4
    mov r2, #0x0
    bl func_02097db0
    mov r0, sl
    add r1, r7, #0x8800
    mov r2, #0x4400
    bl func_02097e1c
    mov r0, #0x2
    str r0, [sp]
    add r1, r5, #0x8800
    add r3, r7, #0x8800
    mov r0, r6
    mov r2, #0x4400
    bl func_020a54ec
    mov r0, #0x1
    str r0, [sp, #0x8]
.L_35c:
    mov r0, sl
    mov r1, fp
    mov r2, #0x0
    bl func_02097db0
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_42c
    add r0, sp, #0x20
    bl func_02097efc
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_42c
    ldr r1, [r9, #0x20]
    ldr r0, _LIT3
    str r1, [sp, #0x10]
    ldr r2, [r9, #0x28]
    ldr r1, [r9, #0x20]
    ldr r4, [r0]
    sub r0, r2, r1
    str r0, [sp, #0x14]
    ldr r2, [r6, #0x48]
    ldr r1, [r9, #0x20]
    add r0, sp, #0x10
    sub r1, r2, r1
    str r1, [sp, #0x18]
    ldr r1, [sp, #0x4]
    mov r2, #0x8000
    str r1, [sp, #0x1c]
    mov r1, #0x4000
    mov r3, #0x1
    bl func_020a25fc
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_414
    add r7, sp, #0x10
    mov r5, #0x0
.L_3ec:
    ldr r1, [r4]
    ldr r2, [r4, #0x4]
    mov r0, r7
    mov r3, r5
    add r2, r1, r2
    bl func_020a25fc
    add r4, r4, #0x8
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne .L_3ec
.L_414:
    ldr r1, [r9, #0x28]
    ldr r2, _LIT4
    ldr r3, [r6, #0x48]
    ldr r0, _LIT5
    sub r1, r2, r1
    str r0, [r3, r1]
.L_42c:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_444
    ldr r1, [sp, #0x4]
    mov r0, r9
    bl func_0209281c
.L_444:
    ldr r0, [sp, #0x8]
    add sp, sp, #0x6c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x027ffe00
_LIT1: .word data_02102608
_LIT2: .word 0x00406000
_LIT3: .word data_02102604
_LIT4: .word AutoloadCallback
_LIT5: .word 0xe12fff1e
