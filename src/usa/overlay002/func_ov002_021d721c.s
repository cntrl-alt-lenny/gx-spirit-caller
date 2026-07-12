; func_ov002_021d721c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b824
        .extern func_ov002_021b3ef8
        .extern func_ov002_021babc8
        .extern func_ov002_021ca4dc
        .extern func_ov002_021d46ac
        .extern func_ov002_021df53c
        .extern func_ov002_021df5e4
        .extern func_ov002_021df848
        .extern func_ov002_021e267c
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .extern func_ov002_022537d4
        .extern func_ov002_02253a10
        .extern func_ov002_02254b7c
        .global func_ov002_021d721c
        .arm
func_ov002_021d721c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r5, r2
    and r2, r5, #0x1
    cmp r2, #0x0
    movgt r4, #0x1
    ldr r7, [sp, #0x30]
    movle r4, #0x0
    mov r9, r1
    mov sl, r0
    cmp r7, #0x0
    movne r0, #0x1d
    strne r0, [sp]
    moveq r0, #0x1e
    streq r0, [sp]
    mov r8, r3
    add r1, sp, #0x4
    mov r0, #0x0
    ldr r6, [sp, #0x34]
    str r0, [r1]
    cmp r8, #0xe
    bne .L_7c
    ldr r1, [r9]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    moveq r8, #0xf
.L_7c:
    ldr r2, [r9]
    mov r0, #0x200
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    ldr r3, [sp, #0x4]
    rsb r0, r0, #0x0
    add r1, r1, r2, lsr #0x1f
    and r2, r3, r0
    and r0, r1, r0, lsr #0x17
    orr r0, r2, r0
    eor r1, sl, r4
    bic r2, r0, #0x200
    and r0, sl, #0x1
    orr r2, r2, r0, lsl #0x9
    bic r2, r2, #0x400
    bic r2, r2, #0x800
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x14
    bic r2, r1, #0xf000
    mov r1, r8, lsl #0x1c
    orr r1, r2, r1, lsr #0x10
    str r1, [sp, #0x4]
    tst r5, #0x1000
    beq .L_124
    ldr r0, [sp, #0x4]
    cmp sl, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x17
    mov r2, r0, lsr #0x17
    orr r1, r1, #0x46
    mov r0, r1, lsl #0x10
    mov r3, r2, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xb
    bl func_ov002_021d46ac
    b .L_1bc
.L_124:
    cmp r8, #0xf
    bne .L_178
    ldr r2, [r9]
    cmp sl, #0x0
    mov r1, r2, lsl #0x2
    movne r0, #0x8000
    mov r1, r1, lsr #0x18
    moveq r0, #0x0
    orr r0, r0, #0x33
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r2, r1, r2, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r1, #0xb
    bl func_ov002_021d46ac
    b .L_1bc
.L_178:
    ldr r1, [r9]
    mov r3, r5, lsl #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsr #0x18
    add r5, r2, r1, lsl #0x1
    and r1, r2, #0x1
    orr r2, r1, #0x5c
    mov r1, r5, lsl #0x16
    orr r0, r0, #0x16
    orr r0, r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r0, #0x3f
    bl func_ov002_021d46ac
.L_1bc:
    cmp r8, #0xe
    bne .L_558
    ldr r2, [r9]
    ldr r1, _LIT0
    mov r0, r2, lsl #0x13
    cmp r1, r0, lsr #0x13
    mov r3, r0, lsr #0x13
    mov r5, #0x0
    bcc .L_2c8
    cmp r3, r1
    bcs .L_420
    sub r0, r1, #0x3b0
    cmp r3, r0
    bhi .L_250
    bcs .L_43c
    ldr r1, _LIT1
    cmp r3, r1
    bhi .L_22c
    bcs .L_420
    sub r0, r1, #0x47
    cmp r3, r0
    bhi .L_21c
    beq .L_420
    b .L_45c
.L_21c:
    sub r0, r1, #0x37
    cmp r3, r0
    beq .L_43c
    b .L_45c
.L_22c:
    add r0, r1, #0xe6
    cmp r3, r0
    bhi .L_240
    beq .L_43c
    b .L_45c
.L_240:
    ldr r0, _LIT2
    cmp r3, r0
    beq .L_43c
    b .L_45c
.L_250:
    sub r0, r1, #0x10c
    cmp r3, r0
    bhi .L_2a4
    bcs .L_43c
    ldr r0, _LIT3
    cmp r3, r0
    bhi .L_274
    beq .L_3c8
    b .L_45c
.L_274:
    add r2, r0, #0x1b0
    cmp r3, r2
    bhi .L_45c
    sub r2, r1, #0x140
    cmp r3, r2
    bcc .L_45c
    sub r1, r1, #0x140
    cmp r3, r1
    addne r0, r0, #0x1b0
    cmpne r3, r0
    beq .L_420
    b .L_45c
.L_2a4:
    sub r0, r1, #0x9e
    cmp r3, r0
    bhi .L_2b8
    beq .L_43c
    b .L_45c
.L_2b8:
    sub r0, r1, #0x9a
    cmp r3, r0
    beq .L_3e4
    b .L_45c
.L_2c8:
    ldr r0, _LIT4
    cmp r3, r0
    bhi .L_358
    bcs .L_444
    add r2, r1, #0x95
    cmp r3, r2
    bhi .L_32c
    bcs .L_43c
    sub r2, r0, #0x1cc
    cmp r3, r2
    bhi .L_31c
    add r2, r1, #0x1
    cmp r3, r2
    bcc .L_45c
    addne r1, r1, #0x6
    cmpne r3, r1
    beq .L_420
    sub r0, r0, #0x1cc
    cmp r3, r0
    beq .L_43c
    b .L_45c
.L_31c:
    add r0, r1, #0x32
    cmp r3, r0
    beq .L_43c
    b .L_45c
.L_32c:
    sub r1, r0, #0x20
    cmp r3, r1
    bhi .L_348
    sub r0, r0, #0x20
    cmp r3, r0
    beq .L_43c
    b .L_45c
.L_348:
    sub r0, r0, #0x1
    cmp r3, r0
    beq .L_444
    b .L_45c
.L_358:
    add r2, r0, #0x98
    cmp r3, r2
    bhi .L_39c
    mov r1, r2
    cmp r3, r1
    bcs .L_43c
    add r1, r0, #0x2
    cmp r3, r1
    bhi .L_38c
    add r0, r0, #0x2
    cmp r3, r0
    beq .L_444
    b .L_45c
.L_38c:
    add r0, r0, #0x3
    cmp r3, r0
    beq .L_444
    b .L_45c
.L_39c:
    add r2, r0, #0x1d8
    cmp r3, r2
    bhi .L_3b8
    add r0, r0, #0x1d8
    cmp r3, r0
    beq .L_444
    b .L_45c
.L_3b8:
    add r0, r1, #0x3ac
    cmp r3, r0
    beq .L_444
    b .L_45c
.L_3c8:
    mov r0, r2, lsl #0x12
    mov r1, r2, lsl #0x2
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x18
    add r2, r0, r1, lsl #0x1
    mov r1, #0xe
    bl func_ov002_021df53c
.L_3e4:
    ldr r1, [r9]
    mov r2, #0x1
    mov r0, r1, lsl #0x12
    mov r3, r1, lsl #0x2
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x1f
    mov r3, r3, lsr #0x18
    add r3, r0, r3, lsl #0x1
    mov r3, r3, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e267c
    b .L_45c
.L_420:
    cmp r4, #0x0
    beq .L_45c
    ldr r0, [r9]
    mov r0, r0, lsl #0x12
    cmp sl, r0, lsr #0x1f
    moveq r5, #0x1
    b .L_45c
.L_43c:
    mov r5, #0x1
    b .L_45c
.L_444:
    cmp r6, #0x0
    bne .L_458
    cmp r7, #0x0
    movne r5, #0x1
    bne .L_45c
.L_458:
    mov r5, #0x0
.L_45c:
    cmp r5, #0x0
    beq .L_4b8
    ldr r5, [r9]
    ldr r0, [sp]
    mov r1, r5, lsl #0x12
    mov r3, r1, lsr #0x1f
    mov r0, r0, lsl #0x19
    mov r1, r3, lsl #0x1f
    mov r2, r5, lsl #0x2
    mov fp, r5, lsl #0x13
    mov r5, r2, lsr #0x18
    add r3, r3, r5, lsl #0x1
    and r1, r1, #-2147483648
    and r0, r0, #0x7e000000
    orr r1, r1, r0
    mov r2, fp, lsr #0x13
    mov r0, r2, lsl #0x10
    orr r1, r1, #0x4e0000
    mov r3, r3, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldr r2, [sp, #0x4]
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
.L_4b8:
    cmp r4, #0x0
    beq .L_4ec
    cmp r6, #0x0
    bne .L_4ec
    cmp r7, #0x0
    beq .L_4ec
    ldr r0, [r9]
    mov r0, r0, lsl #0x12
    cmp sl, r0, lsr #0x1f
    bne .L_4ec
    ldr r1, _LIT5
    mov r0, sl
    bl func_ov002_02253a10
.L_4ec:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b824
    cmp r0, #0x9
    bne .L_558
    ldr r4, _LIT6
    mov r5, #0x0
    mov fp, #0x5
.L_510:
    ldr r0, [r9]
    mov r1, r5
    mov r0, r0, lsl #0x12
    mov r2, r4
    mov r0, r0, lsr #0x1f
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_54c
    ldr r0, [r9]
    mov r1, r5
    mov r0, r0, lsl #0x12
    mov r2, fp
    mov r3, #0x1
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2ca4
.L_54c:
    add r5, r5, #0x1
    cmp r5, #0x4
    ble .L_510
.L_558:
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov002_02244efc
    cmp r7, #0x0
    beq .L_5d4
    ldr r0, [r9]
    mov r0, r0, lsl #0x12
    cmp sl, r0, lsr #0x1f
    cmpeq r8, #0xe
    bne .L_598
    ldr r1, _LIT7
    rsb r0, sl, #0x1
    mov r2, #0x1
    bl func_ov002_022537d4
.L_598:
    mov r0, sl
    bl func_ov002_02254b7c
    cmp r6, #0x2
    beq .L_5d4
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b824
    cmp r0, #0x1
    bne .L_5d4
    ldr r1, _LIT8
    mov r0, sl
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_021e267c
.L_5d4:
    cmp r6, #0x1
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r9]
    ldr r2, _LIT9
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r3, r1, r3, lsr #0x1f
    mov r0, sl
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT9
    mov r0, sl
    bl func_ov002_021df5e4
    ldr r3, _LIT9
    mov r0, sl
    mov r1, #0x7d0
    mov r2, #0x0
    bl func_ov002_021df848
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001793
_LIT1: .word 0x000011bc
_LIT2: .word 0x00001309
_LIT3: .word 0x000014a5
_LIT4: .word 0x00001966
_LIT5: .word 0x000017a4
_LIT6: .word 0x00001a8d
_LIT7: .word 0x00001306
_LIT8: .word 0x000014e2
_LIT9: .word 0x00001379
