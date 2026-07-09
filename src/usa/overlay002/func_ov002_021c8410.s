; func_ov002_021c8410 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_0202b854
        .extern func_ov002_021b3538
        .extern func_ov002_021b414c
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1c6c
        .extern func_ov002_021c8400
        .extern func_ov002_021c92ec
        .global func_ov002_021c8410
        .arm
func_ov002_021c8410:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    mov sl, r0
    ldr r3, _LIT0
    and r5, sl, #0x1
    mul r6, r5, r3
    mov r4, #0x14
    mov r3, r1
    mul r5, r3, r4
    ldr r7, _LIT1
    str r1, [sp]
    add r3, r7, r6
    add r3, r3, r5
    ldr r3, [r3, #0x30]
    mov r9, r2
    mov r2, r3, lsl #0x13
    mov r4, r2, lsr #0x13
    bl func_ov002_021c19f0
    mov fp, r0
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_021c1c6c
    str r0, [sp, #0x4]
    cmp r4, #0x0
    addeq sp, sp, #0x20
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    bl func_0202b854
    ldr r1, [sp]
    mov r8, r0
    cmp r1, #0x5
    addge sp, sp, #0x20
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    add r1, r1, r6
    ldrh r1, [r5, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    cmp r4, r0
    bne .L_e4
    ldr r1, [sp]
    mov r0, sl
    bl func_ov002_021b3538
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_e4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c8400
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e4:
    cmp r9, #0x0
    bne .L_120
    ldr r0, _LIT1
    ldr r1, _LIT5
    add r0, r0, r6
    add r0, r0, #0x30
    ldr r2, [r0, r5]
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    bl func_ov002_021b414c
    cmp r0, #0x0
    movgt r8, r0
.L_120:
    ldr r0, _LIT6
    add r0, r0, r6
    ldrh r6, [r5, r0]
    cmp r6, #0x0
    beq .L_354
    ldr r0, _LIT7
    add r0, r0, #0x41
    str r0, [sp, #0xc]
    ldr r0, _LIT7
    add r0, r0, #0x3b
    str r0, [sp, #0x8]
    ldr r0, _LIT8
    sub r0, r0, #0xda
    str r0, [sp, #0x10]
    ldr r0, _LIT8
    sub r0, r0, #0xda
    str r0, [sp, #0x14]
    ldr r0, _LIT9
    add r0, r0, #0x1c4
    str r0, [sp, #0x18]
    ldr r0, _LIT7
    add r0, r0, #0x1c
    str r0, [sp, #0x1c]
.L_17c:
    ldr r0, _LIT10
    mov r1, r6, lsl #0x3
    add r2, r0, r6, lsl #0x3
    ldrh r3, [r2, #0x2]
    ldrh r1, [r0, r1]
    ldrh r6, [r2, #0x6]
    mov r3, r3, lsl #0x1c
    mov r0, r1, asr #0x8
    mov r3, r3, lsr #0x1c
    and r7, r1, #0xff
    and r0, r0, #0xff
    cmp r3, #0x1
    beq .L_1c4
    cmp r3, #0x5
    beq .L_1ec
    cmp r3, #0xa
    beq .L_29c
    b .L_34c
.L_1c4:
    cmp r9, #0x0
    bne .L_34c
    ldr r0, _LIT7
    cmp r1, r0
    bne .L_34c
    ldrh r0, [r2, #0x4]
    sub r8, r8, r0, lsl #0x1
    cmp r8, #0x1
    movlt r8, #0x1
    b .L_34c
.L_1ec:
    ldr r0, _LIT9
    cmp r1, r0
    beq .L_238
    ldr r0, [sp, #0x8]
    cmp r1, r0
    ldrne r0, [sp, #0xc]
    cmpne r1, r0
    bne .L_34c
    ldr r0, _LIT10
    ldrh r2, [r2, #0x4]
    add r0, r0, r6, lsl #0x3
    ldrh r1, [r0, #0x6]
    and r0, r2, #0xf0
    mov r0, r0, asr #0x4
    and r8, r0, #0xff
    ldr r0, _LIT10
    add r0, r0, r1, lsl #0x3
    ldrh r6, [r0, #0x6]
    b .L_34c
.L_238:
    ldr r0, [sp, #0x10]
    cmp r4, r0
    bgt .L_274
    ldr r0, [sp, #0x14]
    cmp r4, r0
    bge .L_294
    ldr r0, _LIT9
    cmp r4, r0
    bgt .L_264
    beq .L_294
    b .L_34c
.L_264:
    ldr r0, [sp, #0x18]
    cmp r4, r0
    moveq r8, #0xa
    b .L_34c
.L_274:
    ldr r0, _LIT8
    cmp r4, r0
    bgt .L_288
    beq .L_294
    b .L_34c
.L_288:
    ldr r0, _LIT11
    cmp r4, r0
    bne .L_34c
.L_294:
    mov r8, #0x4
    b .L_34c
.L_29c:
    cmp r9, #0x0
    bne .L_34c
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r3, r7, #0x1
    mla r2, r3, r2, r1
    mov r1, #0x14
    mla r1, r0, r1, r2
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r5, r0, lsr #0x13
    beq .L_34c
    ldr r0, [r1, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_34c
    mov r0, r5
    bl func_0202b824
    cmp r0, #0x17
    bne .L_310
    cmp sl, r7
    movne r0, #0x1
    moveq r0, #0x0
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    and r0, r0, r1
    cmp r0, #0x0
    bgt .L_34c
    b .L_32c
.L_310:
    cmp sl, r7
    movne r0, #0x1
    moveq r0, #0x0
    add r0, r0, #0x1
    and r0, fp, r0
    cmp r0, #0x0
    bgt .L_34c
.L_32c:
    ldr r0, [sp, #0x1c]
    cmp r5, r0
    bne .L_34c
    cmp r8, #0x0
    beq .L_34c
    sub r8, r8, #0x2
    cmp r8, #0x1
    movlt r8, #0x1
.L_34c:
    cmp r6, #0x0
    bne .L_17c
.L_354:
    cmp r9, #0x0
    bne .L_410
    ldr r6, _LIT1
    ldr r4, _LIT12
    ldr r5, _LIT0
    mov r7, #0x0
    mov r9, #0x1
.L_370:
    and r0, r7, #0x1
    mla r3, r0, r5, r6
    ldr r0, [r3, #0xf8]
    mov r0, r0, lsl #0x13
    movs r2, r0, lsr #0x13
    beq .L_404
    ldr r1, [r3, #0x108]
    add r0, r3, #0x100
    ldrh r0, [r0]
    mov r3, r1, lsr #0x6
    and r3, r3, #0x1
    mvn r3, r3
    and r0, r0, r3
    mov r3, r1, lsr #0x2
    orr r1, r3, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_404
    cmp sl, r7
    movne r0, r9
    moveq r0, #0x0
    add r0, r0, #0x1
    and r0, fp, r0
    cmp r0, #0x0
    bgt .L_404
    cmp r2, r4
    bne .L_404
    ldr r1, [sp]
    mov r0, sl
    mov r2, #0x3
    bl func_ov002_021c92ec
    cmp r0, #0x0
    beq .L_404
    sub r8, r8, #0x1
    cmp r8, #0x1
    movlt r8, #0x1
.L_404:
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_370
.L_410:
    mov r0, r8
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000019ed
_LIT4: .word 0x0000ffff
_LIT5: .word 0x000018d9
_LIT6: .word data_ov002_022cf0c6
_LIT7: .word 0x000015c7
_LIT8: .word 0x00001809
_LIT9: .word 0x00001472
_LIT10: .word data_ov002_022d0570
_LIT11: .word 0x00001aca
_LIT12: .word 0x0000150b
