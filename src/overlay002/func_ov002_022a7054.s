; func_ov002_022a7054 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022cd73c
        .extern func_ov002_0229da1c
        .extern func_ov002_0229dd0c
        .extern func_ov002_022a82d4
        .global func_ov002_022a7054
        .arm
func_ov002_022a7054:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r8, r1
    mov r7, r2
    add r9, r4, #0x3e0
    mov r5, #0x0
.L_1c:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_0229dd0c
    movs r6, r0
    bmi .L_d4
    add r1, r4, #0x3e0
    mov r0, #0xcc
    mla r0, r5, r0, r1
    mov r1, r6
    bl func_ov002_0229da1c
    cmp r0, #0x0
    beq .L_5c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022a82d4
.L_5c:
    ldrh r1, [sp, #0x8]
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    orr r1, r1, #0x16
    strh r1, [sp, #0x8]
    ldrh r2, [sp, #0x8]
    mov r0, r0, lsl #0x18
    add r1, r4, #0x500
    bic r2, r2, #0x3fc0
    orr r0, r2, r0, lsr #0x12
    strh r0, [sp, #0x8]
    ldrh r2, [sp, #0x8]
    mov r0, #0x1
    orr r2, r2, #0x4000
    strh r2, [sp, #0x8]
    ldrh r2, [sp, #0x8]
    bic r2, r2, #0x8000
    strh r2, [sp, #0x8]
    ldrh r2, [sp, #0x8]
    add sp, sp, #0xc
    strh r2, [r1, #0x90]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_d4:
    add r5, r5, #0x1
    cmp r5, #0x2
    add r9, r9, #0xcc
    blt .L_1c
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x4]
    ldr r2, [r1, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    tst r0, #0x1
    addne r8, r8, #0x18
    tst r0, #0x2
    addne r7, r7, #0x10
    cmp r7, #0x68
    rsblt r8, r8, #0x118
    sub r1, r8, #0x46
    mvn r0, #0x17
    eorlt r2, r2, #0x1
    rsblt r7, r7, #0xd0
    cmp r1, r0
    blt .L_470
    cmp r1, #0x0
    bge .L_1c4
    subs r3, r7, #0x69
    bmi .L_470
    cmp r3, #0x3a
    bge .L_470
    ldrh r1, [sp, #0x6]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x6]
    cmp r3, #0x1d
    movlt r0, #0xa
    movge r0, #0xc
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    add r1, r4, #0x500
    mov r0, #0x1
    bic r2, r2, #0x3fc0
    strh r2, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    orr r2, r2, #0x4000
    strh r2, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    bic r2, r2, #0x8000
    strh r2, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    add sp, sp, #0xc
    strh r2, [r1, #0x90]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1c4:
    cmp r1, #0x8c
    bge .L_2c4
    ldr r5, _LIT2
    mov r8, r1, lsr #0x1f
    smull r0, ip, r5, r1
    add ip, r1, ip
    smull r0, r3, r5, r1
    add r3, r1, r3
    add ip, r8, ip, asr #0x4
    mov r6, #0x1c
    smull r5, r0, r6, ip
    add r3, r8, r3, asr #0x4
    sub r0, r7, #0x69
    subs ip, r1, r5
    beq .L_224
    ldr r6, _LIT3
    mov r1, r0, lsr #0x1f
    smull r5, r7, r6, r0
    add r7, r0, r7
    add r7, r1, r7, asr #0x4
    mov r6, #0x1d
    smull r1, r5, r6, r7
    subs r7, r0, r1
    bne .L_230
.L_224:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_230:
    cmp r0, #0x0
    blt .L_470
    cmp r0, #0x3a
    bge .L_470
    ldrh r5, [sp, #0x4]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r0, #0x1d
    movlt r0, #0x0
    movge r0, #0x5
    add r0, r3, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r5, #0x1
    and r1, r1, #0x1
    orr r1, r2, r1
    strh r1, [sp, #0x4]
    ldrh r1, [sp, #0x4]
    mov r0, r0, lsl #0x1b
    bic r1, r1, #0x3e
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    add r1, r4, #0x500
    mov r0, #0x1
    bic r2, r2, #0x3fc0
    strh r2, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    orr r2, r2, #0x4000
    strh r2, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    bic r2, r2, #0x8000
    strh r2, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    add sp, sp, #0xc
    strh r2, [r1, #0x90]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_2c4:
    cmp r1, #0xa4
    bge .L_3b4
    ldr r5, _LIT2
    mov r0, r1, lsr #0x1f
    smull r3, r6, r5, r1
    add r6, r1, r6
    add r6, r0, r6, asr #0x4
    mov r5, #0x1c
    smull r3, r0, r5, r6
    sub r0, r7, #0x69
    subs r6, r1, r3
    beq .L_318
    ldr r5, _LIT3
    mov r1, r0, lsr #0x1f
    smull r3, r6, r5, r0
    add r6, r0, r6
    add r6, r1, r6, asr #0x4
    mov r5, #0x1d
    smull r1, r3, r5, r6
    subs r6, r0, r1
    bne .L_324
.L_318:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_324:
    cmp r0, #0x0
    blt .L_470
    cmp r0, #0x3a
    bge .L_470
    ldrh r3, [sp, #0x2]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r3, #0x1
    and r1, r1, #0x1
    orr r1, r2, r1
    cmp r0, #0x1d
    movlt r0, #0xe
    strh r1, [sp, #0x2]
    movge r0, #0xd
    ldrh r1, [sp, #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    add r1, r4, #0x500
    mov r0, #0x1
    bic r2, r2, #0x3fc0
    strh r2, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    orr r2, r2, #0x4000
    strh r2, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    bic r2, r2, #0x8000
    strh r2, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    add sp, sp, #0xc
    strh r2, [r1, #0x90]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_3b4:
    cmp r1, #0xbb
    bge .L_470
    cmp r1, #0xa4
    sub r6, r7, #0x69
    beq .L_3ec
    ldr r3, _LIT3
    mov r0, r6, lsr #0x1f
    smull r1, r5, r3, r6
    add r5, r6, r5
    add r5, r0, r5, asr #0x4
    mov r3, #0x1d
    smull r0, r1, r3, r5
    subs r5, r6, r0
    bne .L_3f8
.L_3ec:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_3f8:
    cmp r6, #0x0
    blt .L_470
    cmp r6, #0x1d
    bge .L_470
    ldrh r1, [sp]
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp]
    ldrh r2, [sp]
    add r1, r4, #0x500
    mov r0, #0x1
    bic r2, r2, #0x3e
    orr r2, r2, #0x1e
    strh r2, [sp]
    ldrh r2, [sp]
    bic r2, r2, #0x3fc0
    strh r2, [sp]
    ldrh r2, [sp]
    orr r2, r2, #0x4000
    strh r2, [sp]
    ldrh r2, [sp]
    bic r2, r2, #0x8000
    strh r2, [sp]
    ldrh r2, [sp]
    add sp, sp, #0xc
    strh r2, [r1, #0x90]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_470:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov002_022cd73c
_LIT2: .word 0x92492493
_LIT3: .word 0x8d3dcb09
