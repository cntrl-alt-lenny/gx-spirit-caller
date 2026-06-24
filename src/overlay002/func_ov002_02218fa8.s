; func_ov002_02218fa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021afffc
        .extern func_ov002_021bb068
        .extern func_ov002_021bc6c4
        .extern func_ov002_021d59cc
        .extern func_ov002_021d6808
        .extern func_ov002_021d6c98
        .extern func_ov002_021d8840
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b1c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02202030
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_02244fe4
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0227ac64
        .global func_ov002_02218fa8
        .arm
func_ov002_02218fa8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r2, [r4, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT0
    ldr r3, [r2, #0x5a8]
    cmp r3, #0x64
    bgt .L_3c
    beq .L_4e0
    b .L_4fc
.L_3c:
    sub r3, r3, #0x6e
    cmp r3, #0x12
    addls pc, pc, r3, lsl #0x2
    b .L_4fc
    b .L_4c0
    b .L_4fc
    b .L_4fc
    b .L_4fc
    b .L_4fc
    b .L_4fc
    b .L_4fc
    b .L_4fc
    b .L_4fc
    b .L_4fc
    b .L_36c
    b .L_334
    b .L_2ec
    b .L_25c
    b .L_190
    b .L_168
    b .L_148
    b .L_4fc
    b .L_98
.L_98:
    bl func_ov002_02202030
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x2
    bge .L_10c
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x8
    mov r0, #0x6e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_10c:
    ldrh r2, [r4, #0x8]
    mov r0, r4
    mov r1, #0x0
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x17
    strh r2, [r4, #0x10]
    bl func_ov002_0223de94
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    strh r0, [r4, #0x8]
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_148:
    ldrh r0, [r4, #0x2]
    mov r1, #0x20
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x8
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_168:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0x8
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_190:
    ldrh r1, [r4, #0x2]
    ldrh r6, [r4, #0x8]
    mov r0, #0x14
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, _LIT1
    and r3, r3, #0x1
    mul r5, r3, r1
    ldr r3, _LIT2
    ldr r1, _LIT3
    mul r7, r6, r0
    add r3, r3, r5
    add r0, r1, r5
    ldrh r3, [r7, r3]
    ldrh r1, [r7, r0]
    ldr r0, _LIT4
    add r1, r3, r1, lsl #0x1
    str r1, [r2, #0x5b0]
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_22c
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4, #0x8]
    mov r3, #0x14
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, _LIT1
    ldr r5, _LIT3
    and r6, r1, #0x1
    mul r3, r2, r3
    mla r0, r6, r0, r5
    ldrh r0, [r3, r0]
    cmp r0, #0x0
    bne .L_244
    mov r3, #0x0
    mov r0, r4
    str r3, [sp]
    bl func_ov002_021d6808
    b .L_244
.L_22c:
    ldrh r1, [r4, #0x2]
    ldrh r2, [r4, #0x8]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d6c98
.L_244:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    add sp, sp, #0x8
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_25c:
    ldr r5, [r2, #0x5ac]
    cmp r5, #0x2
    bge .L_2d8
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc6c4
    mov r6, r0
    add r0, r5, #0x1
    bl func_ov002_021afffc
    mov r0, #0xf
    bl func_ov002_021e2b1c
    bl func_ov002_021afb74
    mov r2, #0x0
    str r2, [sp]
    mov r1, r0
    ldrh r0, [r4, #0x2]
    mov r3, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227ac64
    add r0, r5, #0x1
    add r0, r4, r0, lsl #0x1
    strh r6, [r0, #0x8]
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5ac]
    mov r0, #0x7b
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2d8:
    mov r0, #0x0
    str r0, [r2, #0x5ac]
    add sp, sp, #0x8
    mov r0, #0x7a
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2ec:
    mov r7, #0x0
    mov r6, r7
    mov r5, #0x1
.L_2f8:
    str r6, [sp]
    ldrh r2, [r4, #0x2]
    add r0, r4, r7, lsl #0x1
    ldrh r1, [r0, #0x8]
    mov r0, r2, lsl #0x1f
    ldrh r2, [r4]
    mov r3, r5
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d59cc
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_2f8
    add sp, sp, #0x8
    mov r0, #0x79
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_334:
    ldrh r0, [r4, #0xa]
    mov r3, #0x1
    ldrh r1, [r4, #0x8]
    mov r0, r3, lsl r0
    ldrh r5, [r4, #0x2]
    ldrh r2, [r4, #0xc]
    orr r0, r0, r3, lsl r1
    mov r4, r5, lsl #0x1f
    orr r1, r0, r3, lsl r2
    mov r0, r4, lsr #0x1f
    bl func_ov002_021d8840
    add sp, sp, #0x8
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_36c:
    bl func_ov002_021e2b3c
    mov r6, #0x200
    ldr r8, [sp, #0x4]
    ldr r9, _LIT5
    ldr r7, _LIT0
    ldr r5, _LIT1
    mov sl, #0x0
    rsb r6, r6, #0x0
    mov fp, #0x14
.L_390:
    ldrh r1, [r4, #0x2]
    add r0, r4, sl, lsl #0x1
    ldrh r0, [r0, #0x8]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    bic r2, r8, #0x200
    orr r2, r2, r1, lsl #0x9
    bic r3, r2, #0x3c00
    mla r2, r1, r5, r9
    mov r1, r0, lsl #0x1c
    orr r1, r3, r1, lsr #0x12
    mul r8, r0, fp
    bic r1, r1, #0x8000
    add r3, r8, r2
    add r0, r2, #0x30
    ldr r2, [r0, r8]
    ldrh r8, [r3, #0x38]
    ldrh r3, [r3, #0x36]
    mov r0, r2, lsl #0x12
    mov r8, r8, lsl #0x1f
    orr r1, r1, r8, lsr #0x10
    bic r8, r1, #0x4000
    mov r1, r3, lsl #0x1f
    orr r1, r8, r1, lsr #0x11
    and r1, r1, r6
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r0, r2, r0, lsr #0x1f
    and r0, r0, r6, lsr #0x17
    orr r0, r1, r0
    bic r0, r0, #0x10000
    bic r8, r0, #0x20000
    ldrh r0, [r4, #0x10]
    str r8, [sp, #0x4]
    mov r1, r8, lsl #0x17
    cmp r0, r1, lsr #0x17
    bne .L_488
    mov r0, r8, lsl #0x10
    mov r1, r8, lsl #0x11
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1f
    add r1, r0, r1, lsl #0x1
    ldr r2, [r7, #0x5b0]
    cmp r2, r1
    beq .L_494
    and r1, r2, #0x1
    cmp r0, r1
    mov r1, #0x0
    beq .L_468
    cmp r0, #0x0
    moveq r1, #0x9
    b .L_46c
.L_468:
    mov r1, #0xb
.L_46c:
    cmp r1, #0x0
    beq .L_494
    mov r0, r1, lsl #0x10
    ldr r1, [sp, #0x4]
    mov r0, r0, lsr #0x10
    bl func_ov002_02244fe4
    b .L_494
.L_488:
    mov r0, #0x8
    mov r1, r8
    bl func_ov002_02244fe4
.L_494:
    add sl, sl, #0x1
    cmp sl, #0x3
    blt .L_390
    bl func_ov002_021e2c5c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4c0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    add sp, sp, #0x8
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4e0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4fc:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
_LIT4: .word 0x0000135d
_LIT5: .word data_ov002_022cf16c
