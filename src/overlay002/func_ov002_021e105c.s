; func_ov002_021e105c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202b878
        .extern func_ov002_021baca8
        .extern func_ov002_021ca51c
        .extern func_ov002_021ca5bc
        .extern func_ov002_021d479c
        .extern func_ov002_021df62c
        .extern func_ov002_021e276c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e2d94
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .global func_ov002_021e105c
        .arm
func_ov002_021e105c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov fp, r0
    ldr r0, _LIT0
    and r5, fp, #0x1
    mul r4, r5, r0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r0, r4]
    ldr r0, [sp]
    mov sl, r3
    cmp r0, r1
    strcs r1, [sp]
    cmp fp, #0x0
    movne r5, #0x8000
    str r2, [sp, #0x4]
    moveq r5, #0x0
    bl func_ov002_021ca51c
    orr r3, sl, r0
    ldr r0, [sp]
    orr r1, r5, #0x56
    mov r2, r0, lsl #0x10
    ldr r0, [sp, #0x4]
    mov r1, r1, lsl #0x10
    mov r5, r0, lsl #0x10
    mov r0, r1, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r1, r2, lsr #0x10
    mov r2, r3, lsr #0x10
    mov r3, r5, lsr #0x10
    bl func_ov002_021d479c
    bl func_ov002_021e2b3c
    ldr r0, [sp]
    mov r7, #0x0
    cmp r0, #0x0
    ble .L_364
    mov r0, fp, lsl #0x1f
    and r0, r0, #-2147483648
    orr r0, r0, #0x4e0000
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    ldr r1, _LIT2
    eor r0, fp, r0
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    add r1, r1, r4
    orr r0, r0, #0x38000000
    add r9, r1, #0x260
    str r0, [sp, #0x8]
.L_c4:
    ldr r0, [r9]
    cmp sl, #0x0
    mov r0, r0, lsl #0x13
    movne r5, #0xf
    moveq r5, #0xe
    mov r4, r0, lsr #0x13
    cmp sl, #0x0
    bne .L_108
    ldr r1, [r9]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    moveq r5, #0xf
.L_108:
    ldr r0, [sp, #0x10]
    mov r3, #0x200
    bic r2, r0, #0x800
    ldr r0, [sp, #0xc]
    ldr r1, [r9]
    mov r0, r0, lsl #0x1f
    orr r6, r2, r0, lsr #0x14
    mov r0, r1, lsl #0x12
    mov r2, r1, lsl #0x2
    bic r1, r6, #0x200
    mov r6, fp, lsl #0x1f
    orr r1, r1, r6, lsr #0x16
    cmp r5, #0xe
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsr #0x18
    mov r5, r5, lsl #0x1c
    bic r1, r1, #0xf000
    add r2, r0, r2, lsl #0x1
    orr r1, r1, r5, lsr #0x10
    rsb r3, r3, #0x0
    and r5, r1, r3
    and r1, r2, r3, lsr #0x17
    orr r1, r5, r1
    bic r1, r1, #0x400
    str r1, [sp, #0x10]
    bne .L_344
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_1d8
    bge .L_250
    ldr r2, _LIT4
    cmp r4, r2
    bgt .L_1b4
    bge .L_2a0
    ldr r0, _LIT5
    cmp r4, r0
    bgt .L_1a4
    beq .L_294
    b .L_2dc
.L_1a4:
    add r0, r0, #0x118
    cmp r4, r0
    beq .L_2a0
    b .L_2dc
.L_1b4:
    add r0, r2, #0x67
    cmp r4, r0
    bgt .L_1c8
    beq .L_2a0
    b .L_2dc
.L_1c8:
    sub r0, r1, #0xc2
    cmp r4, r0
    beq .L_2a0
    b .L_2dc
.L_1d8:
    add r0, r1, #0x250
    cmp r4, r0
    bgt .L_220
    bge .L_2a0
    add r0, r1, #0x1b0
    cmp r4, r0
    bgt .L_210
    ldr r0, _LIT6
    cmp r4, r0
    blt .L_2dc
    addne r0, r0, #0x2
    cmpne r4, r0
    beq .L_294
    b .L_2dc
.L_210:
    ldr r0, _LIT7
    cmp r4, r0
    beq .L_2a0
    b .L_2dc
.L_220:
    add r0, r1, #0x320
    cmp r4, r0
    bgt .L_240
    bge .L_2a0
    add r0, r1, #0x254
    cmp r4, r0
    beq .L_258
    b .L_2dc
.L_240:
    ldr r0, _LIT8
    cmp r4, r0
    beq .L_2a0
    b .L_2dc
.L_250:
    mov r1, #0xe
    bl func_ov002_021df62c
.L_258:
    ldr r0, [r9]
    mov r2, #0x1
    mov r5, r0, lsl #0x12
    mov r3, r0, lsl #0x2
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r1, r0, lsl #0x10
    mov r0, r5, lsr #0x1f
    mov r3, r3, lsr #0x18
    add r3, r0, r3, lsl #0x1
    mov r3, r3, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_2dc
.L_294:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_2dc
.L_2a0:
    ldr r3, [r9]
    ldr r2, [sp, #0x10]
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r3, lsl #0x13
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x13
    mov r3, r0, lsl #0x10
    ldr r0, [sp, #0x8]
    mov r1, r1, lsl #0x10
    orr r0, r0, r1, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e30b4
.L_2dc:
    mov r0, r4
    bl func_0202b878
    cmp r0, #0x9
    bne .L_344
    ldr r6, _LIT9
    mov r8, #0x0
    mov r5, #0x5
    mov r4, #0x1
.L_2fc:
    ldr r0, [r9]
    mov r1, r8
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r2, r6
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_338
    ldr r0, [r9]
    mov r1, r8
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r2, r5
    mov r3, r4
    bl func_ov002_021e2d94
.L_338:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_2fc
.L_344:
    ldr r1, [sp, #0x10]
    mov r0, #0x1c
    bl func_ov002_02244fe4
    ldr r0, [sp]
    add r7, r7, #0x1
    cmp r7, r0
    add r9, r9, #0x4
    blt .L_c4
.L_364:
    bl func_ov002_021e2c5c
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000014a5
_LIT4: .word 0x000012a2
_LIT5: .word 0x0000106d
_LIT6: .word 0x00001653
_LIT7: .word 0x00001687
_LIT8: .word 0x000019fe
_LIT9: .word 0x00001a8d
