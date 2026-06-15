; func_ov005_021aa4d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_020b3870
        .global func_ov005_021aa4d0
        .arm
func_ov005_021aa4d0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r7, r0
    bl func_02006194
    cmp r0, #0x0
    bne .L_2c
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2c:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r0, [r7, #0x14]
    cmp r0, #0x0
    bne .L_3b4
    bl func_02006164
    cmp r0, #0x0
    beq .L_3c8
    ldr r6, [r7]
    mov r5, #0x0
    cmp r6, #0x0
    bne .L_150
    ldrsh r9, [r7, #0x4c]
    ldr r1, [sp, #0x4]
    mov r4, r5
    mov r2, r5
    cmp r1, r9
    blt .L_84
    ldrsh r0, [r7, #0x50]
    cmp r1, r0
    movle r2, #0x1
.L_84:
    cmp r2, #0x0
    beq .L_e0
    cmp r6, #0x0
    bne .L_b8
    ldrsh r8, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r8
    mul r0, r2, r0
    bl func_020b3870
    add r1, r8, r0
    b .L_d4
.L_b8:
    ldrsh r0, [r7, #0x54]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r9
    mul r0, r2, r0
    bl func_020b3870
    add r1, r9, r0
.L_d4:
    ldr r0, [sp]
    cmp r0, r1
    movge r4, #0x1
.L_e0:
    cmp r4, #0x0
    beq .L_23c
    cmp r6, #0x0
    bne .L_114
    ldrsh r4, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r4
    mul r0, r2, r0
    bl func_020b3870
    add r3, r4, r0
    b .L_130
.L_114:
    ldrsh r0, [r7, #0x54]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r9
    mul r0, r2, r0
    bl func_020b3870
    add r3, r9, r0
.L_130:
    ldrsh r1, [r7, #0x52]
    ldrsh r0, [r7, #0x4e]
    ldr r2, [sp]
    add r1, r1, r3
    sub r0, r1, r0
    cmp r2, r0
    movle r5, #0x1
    b .L_23c
.L_150:
    ldrsh r9, [r7, #0x4e]
    ldr r1, [sp]
    mov r4, r5
    mov r2, r5
    cmp r1, r9
    blt .L_174
    ldrsh r0, [r7, #0x52]
    cmp r1, r0
    movle r2, #0x1
.L_174:
    cmp r2, #0x0
    beq .L_1d0
    cmp r6, #0x0
    bne .L_1a4
    ldrsh r0, [r7, #0x56]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r9
    mul r0, r2, r0
    bl func_020b3870
    add r1, r9, r0
    b .L_1c4
.L_1a4:
    ldrsh r8, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r8
    mul r0, r2, r0
    bl func_020b3870
    add r1, r8, r0
.L_1c4:
    ldr r0, [sp, #0x4]
    cmp r0, r1
    movge r4, #0x1
.L_1d0:
    cmp r4, #0x0
    beq .L_23c
    cmp r6, #0x0
    bne .L_200
    ldrsh r0, [r7, #0x56]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r9
    mul r0, r2, r0
    bl func_020b3870
    add r3, r9, r0
    b .L_220
.L_200:
    ldrsh r4, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r4
    mul r0, r2, r0
    bl func_020b3870
    add r3, r4, r0
.L_220:
    ldrsh r1, [r7, #0x50]
    ldrsh r0, [r7, #0x4c]
    ldr r2, [sp, #0x4]
    add r1, r1, r3
    sub r0, r1, r0
    cmp r2, r0
    movle r5, #0x1
.L_23c:
    cmp r5, #0x0
    beq .L_278
    mov r0, #0x1
    str r0, [r7, #0x18]
    ldr r0, [sp, #0x4]
    str r0, [r7, #0x20]
    ldr r0, [sp]
    str r0, [r7, #0x24]
    ldr r0, [r7, #0x10]
    str r0, [r7, #0x28]
    ldr r0, [r7, #0x4]
    str r0, [r7, #0x2c]
    ldr r0, [r7, #0x4]
    str r0, [r7, #0x30]
    b .L_394
.L_278:
    ldrsh r0, [r7, #0x3c]
    ldr r5, [sp, #0x4]
    cmp r5, r0
    blt .L_2b8
    ldrsh r0, [r7, #0x40]
    cmp r5, r0
    bgt .L_2b8
    ldrsh r0, [r7, #0x3e]
    ldr r1, [sp]
    cmp r1, r0
    blt .L_2b8
    ldrsh r0, [r7, #0x42]
    cmp r1, r0
    movle r0, #0x2
    strle r0, [r7, #0x18]
    ble .L_394
.L_2b8:
    ldrsh r0, [r7, #0x44]
    cmp r5, r0
    blt .L_2f4
    ldrsh r0, [r7, #0x48]
    cmp r5, r0
    bgt .L_2f4
    ldrsh r0, [r7, #0x46]
    ldr r1, [sp]
    cmp r1, r0
    blt .L_2f4
    ldrsh r0, [r7, #0x4a]
    cmp r1, r0
    movle r0, #0x3
    strle r0, [r7, #0x18]
    ble .L_394
.L_2f4:
    ldrsh r0, [r7, #0x34]
    cmp r5, r0
    blt .L_38c
    ldrsh r0, [r7, #0x38]
    cmp r5, r0
    bgt .L_38c
    ldrsh r0, [r7, #0x36]
    ldr r8, [sp]
    cmp r8, r0
    blt .L_38c
    ldrsh r0, [r7, #0x3a]
    cmp r8, r0
    bgt .L_38c
    cmp r6, #0x0
    bne .L_350
    ldrsh r4, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r4
    mul r0, r2, r0
    bl func_020b3870
    b .L_36c
.L_350:
    ldrsh r4, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    ldr r2, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r4
    mul r0, r2, r0
    bl func_020b3870
.L_36c:
    cmp r6, #0x0
    add r0, r4, r0
    movne r8, r5
    cmp r8, r0
    movlt r0, #0x4
    movge r0, #0x5
    str r0, [r7, #0x18]
    b .L_394
.L_38c:
    mov r0, #0x0
    str r0, [r7, #0x18]
.L_394:
    ldr r0, [r7, #0x18]
    cmp r0, #0x0
    beq .L_3c8
    mov r0, #0x1
    str r0, [r7, #0x14]
    mov r0, #0x0
    str r0, [r7, #0x1c]
    b .L_3c8
.L_3b4:
    bl func_02006194
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r7, #0x18]
    streq r0, [r7, #0x14]
.L_3c8:
    ldr r0, [r7, #0x14]
    cmp r0, #0x0
    beq .L_9cc
    ldr r0, [r7, #0x18]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_9cc
    b .L_9cc
    b .L_3fc
    b .L_5d4
    b .L_660
    b .L_6f0
    b .L_848
.L_3fc:
    ldr r9, [r7]
    cmp r9, #0x0
    ldreq r1, [sp]
    ldreq r0, [r7, #0x24]
    ldrne r1, [sp, #0x4]
    ldrne r0, [r7, #0x20]
    cmp r9, #0x0
    sub r5, r1, r0
    ldreqsh r1, [r7, #0x56]
    ldreqsh r0, [r7, #0x4e]
    ldrnesh r1, [r7, #0x54]
    ldrnesh r0, [r7, #0x4c]
    cmp r9, #0x0
    sub r6, r1, r0
    bne .L_45c
    ldrsh r8, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    ldr r1, [r7, #0x2c]
    ldr r4, [r7, #0x8]
    sub r0, r0, r8
    mul r0, r1, r0
    mov r1, r4
    bl func_020b3870
    b .L_47c
.L_45c:
    ldrsh r8, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    ldr r1, [r7, #0x2c]
    ldr r4, [r7, #0x8]
    sub r0, r0, r8
    mul r0, r1, r0
    mov r1, r4
    bl func_020b3870
.L_47c:
    cmp r9, #0x0
    ldreqsh r1, [r7, #0x4e]
    add r8, r8, r0
    add r0, r8, r5
    ldrnesh r1, [r7, #0x4c]
    cmp r0, r1
    bge .L_4a8
    cmp r9, #0x0
    ldreqsh r0, [r7, #0x4e]
    ldrnesh r0, [r7, #0x4c]
    sub r5, r0, r8
.L_4a8:
    cmp r9, #0x0
    bne .L_4cc
    ldrsh sl, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    mov r1, r4
    sub r0, r0, sl
    mul r0, r4, r0
    bl func_020b3870
    b .L_4e4
.L_4cc:
    ldrsh sl, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    mov r1, r4
    sub r0, r0, sl
    mul r0, r4, r0
    bl func_020b3870
.L_4e4:
    add r1, sl, r0
    add r0, r8, r5
    cmp r0, r1
    ble .L_538
    cmp r9, #0x0
    bne .L_518
    ldrsh r5, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    mov r1, r4
    sub r0, r0, r5
    mul r0, r4, r0
    bl func_020b3870
    b .L_530
.L_518:
    ldrsh r5, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    mov r1, r4
    sub r0, r0, r5
    mul r0, r4, r0
    bl func_020b3870
.L_530:
    add r0, r5, r0
    sub r5, r0, r8
.L_538:
    cmp r9, #0x0
    bne .L_558
    ldrsh sl, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    mov r1, r4
    sub r0, r0, sl
    bl func_020b3870
    b .L_56c
.L_558:
    ldrsh sl, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    mov r1, r4
    sub r0, r0, sl
    bl func_020b3870
.L_56c:
    cmp r9, #0x0
    ldreqsh r1, [r7, #0x4e]
    add r0, sl, r0
    add r2, r8, r5
    ldrnesh r1, [r7, #0x4c]
    cmp r9, #0x0
    sub r0, r0, r1
    ldreqsh r1, [r7, #0x4e]
    add r0, r0, r0, lsr #0x1f
    add r0, r2, r0, asr #0x1
    ldrnesh r1, [r7, #0x4c]
    sub r0, r0, r1
    mul r0, r4, r0
    mov r1, r6
    bl func_020b3870
    ldr r1, [r7, #0x30]
    cmp r0, r1
    beq .L_9cc
    str r0, [r7, #0x30]
    str r0, [r7, #0x4]
    ldr r1, [r7, #0x2c]
    ldr r2, [r7, #0x28]
    sub r0, r0, r1
    sub r0, r2, r0
    str r0, [r7, #0x10]
    b .L_9cc
.L_5d4:
    ldrsh r0, [r7, #0x3c]
    ldr r1, [sp, #0x4]
    cmp r1, r0
    blt .L_9cc
    ldrsh r0, [r7, #0x40]
    cmp r1, r0
    bgt .L_9cc
    ldrsh r0, [r7, #0x3e]
    ldr r1, [sp]
    cmp r1, r0
    blt .L_9cc
    ldrsh r0, [r7, #0x42]
    cmp r1, r0
    bgt .L_9cc
    ldr r0, [r7, #0x1c]
    cmp r0, #0x0
    cmpne r0, #0x14
    bne .L_63c
    ldr r0, [r7, #0x4]
    cmp r0, #0x0
    ble .L_63c
    sub r0, r0, #0x1
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x10]
    add r0, r0, #0x1
    str r0, [r7, #0x10]
.L_63c:
    ldr r0, [r7, #0x1c]
    add r0, r0, #0x1
    str r0, [r7, #0x1c]
    cmp r0, #0x14
    ble .L_9cc
    ldr r0, [r7, #0x1c]
    sub r0, r0, #0x3
    str r0, [r7, #0x1c]
    b .L_9cc
.L_660:
    ldrsh r0, [r7, #0x44]
    ldr r1, [sp, #0x4]
    cmp r1, r0
    blt .L_9cc
    ldrsh r0, [r7, #0x48]
    cmp r1, r0
    bgt .L_9cc
    ldrsh r0, [r7, #0x46]
    ldr r1, [sp]
    cmp r1, r0
    blt .L_9cc
    ldrsh r0, [r7, #0x4a]
    cmp r1, r0
    bgt .L_9cc
    ldr r0, [r7, #0x1c]
    cmp r0, #0x0
    cmpne r0, #0x14
    bne .L_6cc
    ldr r1, [r7, #0x4]
    ldr r0, [r7, #0x8]
    cmp r1, r0
    bge .L_6cc
    add r0, r1, #0x1
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x10]
    sub r0, r0, #0x1
    str r0, [r7, #0x10]
.L_6cc:
    ldr r0, [r7, #0x1c]
    add r0, r0, #0x1
    str r0, [r7, #0x1c]
    cmp r0, #0x14
    ble .L_9cc
    ldr r0, [r7, #0x1c]
    sub r0, r0, #0x3
    str r0, [r7, #0x1c]
    b .L_9cc
.L_6f0:
    ldrsh r0, [r7, #0x34]
    ldr r5, [sp, #0x4]
    cmp r5, r0
    blt .L_9cc
    ldrsh r0, [r7, #0x38]
    cmp r5, r0
    bgt .L_9cc
    ldrsh r0, [r7, #0x36]
    ldr r6, [sp]
    cmp r6, r0
    blt .L_9cc
    ldrsh r0, [r7, #0x3a]
    cmp r6, r0
    bgt .L_9cc
    ldr r0, [r7]
    cmp r0, #0x0
    bne .L_788
    bne .L_758
    ldrsh r5, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    ldr r4, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r5
    mul r0, r4, r0
    bl func_020b3870
    b .L_774
.L_758:
    ldrsh r5, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    ldr r4, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r5
    mul r0, r4, r0
    bl func_020b3870
.L_774:
    add r0, r5, r0
    cmp r6, r0
    movlt r0, #0x1
    movge r0, #0x0
    b .L_7d8
.L_788:
    bne .L_7ac
    ldrsh r6, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    ldr r4, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r6
    mul r0, r4, r0
    bl func_020b3870
    b .L_7c8
.L_7ac:
    ldrsh r6, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    ldr r4, [r7, #0x4]
    ldr r1, [r7, #0x8]
    sub r0, r0, r6
    mul r0, r4, r0
    bl func_020b3870
.L_7c8:
    add r0, r6, r0
    cmp r5, r0
    movlt r0, #0x1
    movge r0, #0x0
.L_7d8:
    cmp r0, #0x0
    beq .L_9cc
    ldr r0, [r7, #0x1c]
    cmp r0, #0x0
    cmpne r0, #0x14
    bne .L_824
    cmp r4, #0x0
    ble .L_824
    ldr r1, [r7, #0x4]
    ldr r0, [r7, #0xc]
    subs r0, r1, r0
    str r0, [r7, #0x4]
    movmi r0, #0x0
    strmi r0, [r7, #0x4]
    ldr r0, [r7, #0x4]
    ldr r1, [r7, #0x10]
    sub r0, r0, r4
    sub r0, r1, r0
    str r0, [r7, #0x10]
.L_824:
    ldr r0, [r7, #0x1c]
    add r0, r0, #0x1
    str r0, [r7, #0x1c]
    cmp r0, #0x14
    ble .L_9cc
    ldr r0, [r7, #0x1c]
    sub r0, r0, #0x3
    str r0, [r7, #0x1c]
    b .L_9cc
.L_848:
    ldrsh r0, [r7, #0x34]
    ldr r6, [sp, #0x4]
    cmp r6, r0
    blt .L_9cc
    ldrsh r0, [r7, #0x38]
    cmp r6, r0
    bgt .L_9cc
    ldrsh r0, [r7, #0x36]
    ldr r8, [sp]
    cmp r8, r0
    blt .L_9cc
    ldrsh r0, [r7, #0x3a]
    cmp r8, r0
    bgt .L_9cc
    ldr r0, [r7]
    cmp r0, #0x0
    bne .L_8f8
    bne .L_8b4
    ldrsh r6, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    ldr r5, [r7, #0x4]
    ldr r4, [r7, #0x8]
    sub r0, r0, r6
    mul r0, r5, r0
    mov r1, r4
    bl func_020b3870
    b .L_8d4
.L_8b4:
    ldrsh r6, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    ldr r5, [r7, #0x4]
    ldr r4, [r7, #0x8]
    sub r0, r0, r6
    mul r0, r5, r0
    mov r1, r4
    bl func_020b3870
.L_8d4:
    ldrsh r1, [r7, #0x52]
    add r2, r6, r0
    ldrsh r0, [r7, #0x4e]
    add r1, r1, r2
    sub r0, r1, r0
    cmp r8, r0
    movgt r0, #0x1
    movle r0, #0x0
    b .L_960
.L_8f8:
    bne .L_920
    ldrsh r8, [r7, #0x4e]
    ldrsh r0, [r7, #0x56]
    ldr r5, [r7, #0x4]
    ldr r4, [r7, #0x8]
    sub r0, r0, r8
    mul r0, r5, r0
    mov r1, r4
    bl func_020b3870
    b .L_940
.L_920:
    ldrsh r8, [r7, #0x4c]
    ldrsh r0, [r7, #0x54]
    ldr r5, [r7, #0x4]
    ldr r4, [r7, #0x8]
    sub r0, r0, r8
    mul r0, r5, r0
    mov r1, r4
    bl func_020b3870
.L_940:
    ldrsh r1, [r7, #0x50]
    add r2, r8, r0
    ldrsh r0, [r7, #0x4c]
    add r1, r1, r2
    sub r0, r1, r0
    cmp r6, r0
    movgt r0, #0x1
    movle r0, #0x0
.L_960:
    cmp r0, #0x0
    beq .L_9cc
    ldr r0, [r7, #0x1c]
    cmp r0, #0x0
    cmpne r0, #0x14
    bne .L_9b0
    cmp r5, r4
    bge .L_9b0
    ldr r1, [r7, #0x4]
    ldr r0, [r7, #0xc]
    add r1, r1, r0
    str r1, [r7, #0x4]
    ldr r0, [r7, #0x8]
    cmp r1, r0
    strge r0, [r7, #0x4]
    ldr r0, [r7, #0x4]
    ldr r1, [r7, #0x10]
    sub r0, r0, r5
    sub r0, r1, r0
    str r0, [r7, #0x10]
.L_9b0:
    ldr r0, [r7, #0x1c]
    add r0, r0, #0x1
    str r0, [r7, #0x1c]
    cmp r0, #0x14
    ldrgt r0, [r7, #0x1c]
    subgt r0, r0, #0x3
    strgt r0, [r7, #0x1c]
.L_9cc:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
