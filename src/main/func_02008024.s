; func_02008024 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020c3f94
        .extern data_02104f3c
        .extern func_02007230
        .extern func_02007240
        .extern func_02020ff8
        .extern func_02090868
        .extern func_020908c0
        .extern func_020945f4
        .extern func_0209bfd4
        .extern func_0209bfe4
        .extern func_0209c0cc
        .extern func_0209c680
        .extern func_0209c7dc
        .extern func_020aaec0
        .extern func_020ab054
        .global func_02008024
        .arm
func_02008024:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x8]
    sub r1, r1, #0x1
    str r1, [r0, #0xc]
    bl func_0209c0cc
    cmp r0, #0x0
    beq .L_4e4
    bl func_02090868
    mvn r1, #0x2
    str r0, [sp, #0x14]
    cmp r0, r1
    beq .L_4e4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bfe4
    ldr r0, _LIT1
    bl func_0209c680
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    mov r1, #0x6
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    add r1, sp, #0x28
    mov r3, r0
    mov r2, #0xc
    str r0, [sp, #0x10]
    bl func_0209c7dc
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_4c4
    ldr r1, _LIT2
    add r0, sp, #0x28
    mov r2, #0x8
    bl func_020ab054
    cmp r0, #0x0
    bne .L_3cc
    ldrh r0, [sp, #0x30]
    and r0, r0, #0xf0
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    cmp r0, #0x2
    bne .L_3cc
    ldr r5, _LIT0
    mov r8, #0x0
    mov r0, #0x1
    mov r7, r8
    str r0, [r5, #0x8]
    mov sl, #0x20000
    mov fp, #0x6
    mov r6, r8
    ldr r4, _LIT3
    b .L_22c
.L_f8:
    mov r0, #0x0
    str r0, [sp]
    stmib sp, {r0, fp}
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x0
    str r0, [sp, #0x10]
    mov r0, sl
    add r1, sp, #0x18
    mov r2, #0x10
    mov r3, #0x0
    bl func_0209c7dc
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r5, #0x4]
    movne r1, #0x0
    orr r0, r0, r1
    str r0, [r5, #0x4]
    ldr r1, [sp, #0x18]
    ldr r0, _LIT4
    cmp r1, r0
    bne .L_224
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_214
    ldr r0, [sp, #0x20]
    cmp r0, r4
    bhi .L_214
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r6, [sp]
    mov r9, r0
    str r6, [sp, #0x4]
    mov r1, #0x6
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    str r6, [sp, #0x10]
    ldr r2, [sp, #0x20]
    add r0, sl, #0x10
    mov r1, r9
    mov r3, r6
    bl func_0209c7dc
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r5, #0x4]
    movne r1, #0x0
    orr r0, r0, r1
    str r0, [r5, #0x4]
    ldr r1, [sp, #0x20]
    cmp r1, r4
    bne .L_1e8
    mov r0, r9
    bl func_02007240
    ldr r1, [sp, #0x24]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r5, #0x8]
    b .L_20c
.L_1e8:
    ldr r0, [r9]
    cmp r4, r0, lsr #0x8
    bne .L_20c
    mov r0, r9
    bl func_02007240
    ldr r1, [sp, #0x24]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r5, #0x8]
.L_20c:
    mov r0, r9
    bl Task_InvokeLocked
.L_214:
    ldr r0, [sp, #0x1c]
    cmp r8, r0
    movls r8, r0
    strls r7, [r5, #0xc]
.L_224:
    add sl, sl, #0x4000
    add r7, r7, #0x1
.L_22c:
    cmp r7, #0x8
    bge .L_240
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_f8
.L_240:
    ldr r3, _LIT0
    ldr r0, [r3, #0xc]
    cmp r0, #0x0
    blt .L_3bc
    ldr r0, [r3, #0x8]
    cmp r0, #0x0
    beq .L_3bc
    mvn r4, #0x0
    add r0, sp, #0x18
    mov r1, #0x0
    mov r2, #0x10
    str r4, [r3, #0xc]
    bl func_020945f4
    ldr r4, _LIT0
    mov sl, #0x0
    mov r8, #0x20000
    add r9, sp, #0x18
    mov fp, sl
    ldr r0, [r4, #0x4]
    mov r7, #0x7
    mov r6, #0xa
    mov r5, #0x2
    b .L_2e4
.L_29c:
    str fp, [sp]
    str fp, [sp, #0x4]
    str r7, [sp, #0x8]
    str r6, [sp, #0xc]
    mov r0, r9
    mov r1, r8
    str r5, [sp, #0x10]
    mov r2, #0x10
    mov r3, fp
    bl func_0209c7dc
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r4, #0x4]
    movne r1, #0x0
    orr r0, r0, r1
    add r8, r8, #0x4000
    str r0, [r4, #0x4]
    add sl, sl, #0x1
.L_2e4:
    cmp sl, #0x8
    bge .L_2f4
    cmp r0, #0x0
    beq .L_29c
.L_2f4:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r1, #0xa
    str r1, [sp, #0xc]
    mov r4, #0x2
    mov r0, r9
    mov r1, #0x8000
    mov r2, #0x4
    str r4, [sp, #0x10]
    bl func_0209c7dc
    cmp r0, #0x0
    ldr r4, _LIT0
    moveq r1, #0x1
    mov sl, #0x0
    ldr r0, [r4, #0x4]
    movne r1, #0x0
    orr r0, r0, r1
    mov r8, #0x10000
    str r0, [r4, #0x4]
    mov fp, sl
    mov r7, #0x7
    mov r6, #0xa
    mov r5, #0x2
    b .L_3a8
.L_360:
    str fp, [sp]
    str fp, [sp, #0x4]
    str r7, [sp, #0x8]
    str r6, [sp, #0xc]
    mov r0, r9
    mov r1, r8
    str r5, [sp, #0x10]
    mov r2, #0x4
    mov r3, fp
    bl func_0209c7dc
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r4, #0x4]
    movne r1, #0x0
    orr r0, r0, r1
    add r8, r8, #0x200
    str r0, [r4, #0x4]
    add sl, sl, #0x1
.L_3a8:
    cmp sl, #0x32
    bge .L_4c4
    cmp r0, #0x0
    beq .L_360
    b .L_4c4
.L_3bc:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x8]
    b .L_4c4
.L_3cc:
    ldr r1, _LIT2
    add r0, sp, #0x28
    mov r2, #0x8
    bl func_020aaec0
    mov r0, #0x20
    mov r1, #0x0
    strh r0, [sp, #0x30]
    str r1, [sp]
    str r1, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r2, #0xa
    str r2, [sp, #0xc]
    mov r4, #0x2
    add r0, sp, #0x28
    mov r3, r1
    mov r2, #0xc
    str r4, [sp, #0x10]
    bl func_0209c7dc
    cmp r0, #0x0
    ldr r3, _LIT0
    moveq r4, #0x1
    ldr r2, [r3, #0x4]
    movne r4, #0x0
    orr r4, r2, r4
    add r0, sp, #0x18
    mov r1, #0x0
    mov r2, #0x10
    str r4, [r3, #0x4]
    bl func_020945f4
    ldr r4, _LIT0
    mov sl, #0x0
    mov r8, #0x20000
    add r9, sp, #0x18
    mov fp, sl
    ldr r0, [r4, #0x4]
    mov r7, #0x7
    mov r6, #0xa
    mov r5, #0x2
    b .L_4b4
.L_46c:
    str fp, [sp]
    str fp, [sp, #0x4]
    str r7, [sp, #0x8]
    str r6, [sp, #0xc]
    mov r0, r9
    mov r1, r8
    str r5, [sp, #0x10]
    mov r2, #0x10
    mov r3, fp
    bl func_0209c7dc
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r4, #0x4]
    movne r1, #0x0
    orr r0, r0, r1
    add r8, r8, #0x4000
    str r0, [r4, #0x4]
    add sl, sl, #0x1
.L_4b4:
    cmp sl, #0x8
    bge .L_4c4
    cmp r0, #0x0
    beq .L_46c
.L_4c4:
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bfd4
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020908c0
.L_4e4:
    bl func_02007230
    cmp r0, #0x0
    beq .L_4f4
    bl func_02020ff8
.L_4f4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f3c
_LIT1: .word 0x00001202
_LIT2: .word data_020c3f94
_LIT3: .word 0x00001b0c
_LIT4: .word 0x59474454
