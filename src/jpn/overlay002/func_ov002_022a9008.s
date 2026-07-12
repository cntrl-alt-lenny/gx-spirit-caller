; func_ov002_022a9008 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0eb8
        .extern func_020060f4
        .extern func_02006178
        .extern func_0207eea8
        .extern func_0207ef74
        .extern func_0208b014
        .extern func_0208c584
        .extern func_ov002_021be1f8
        .extern func_ov002_0229d1b8
        .extern func_ov002_022a61e8
        .extern func_ov002_022a6cc8
        .extern func_ov002_022a8558
        .global func_ov002_022a9008
        .arm
func_ov002_022a9008:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x5c
    mov sl, r0
    ldr r0, [sl, #0x620]
    cmp r0, #0x0
    addeq sp, sp, #0x5c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r1, [sp, #0x44]
    strh r0, [sp, #0x48]
    ldr r0, [sl, #0x620]
    cmp r0, #0x3
    blt .L_38c
    mov r0, #0x0
    str r0, [sp]
    ldr r2, [sl, #0x628]
    ldr r3, [sl, #0x62c]
    add r0, sp, #0x24
    mov r1, sl
    bl func_ov002_022a6cc8
    ldr r2, [sp, #0x24]
    ldr r1, [sp, #0x28]
    ldr r0, [sl, #0x620]
    str r2, [sp, #0x3c]
    str r1, [sp, #0x40]
    cmp r0, #0x3
    bne .L_e4
    mov r0, sl
    bl func_ov002_022a8558
    cmp r0, #0x0
    beq .L_9c
    bl func_02006178
    cmp r0, #0x0
    beq .L_9c
    add r0, sp, #0x34
    add r1, sp, #0x38
    bl func_020060f4
    b .L_140
.L_9c:
    add r2, sl, #0x500
    ldrh r3, [r2, #0x90]
    add r0, sp, #0x1c
    mov r1, sl
    mov r3, r3, lsl #0x12
    mov r3, r3, lsr #0x18
    str r3, [sp]
    ldrh r2, [r2, #0x90]
    mov r3, r2, lsl #0x1a
    mov r4, r2, lsl #0x1f
    mov r2, r4, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6cc8
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x20]
    str r1, [sp, #0x34]
    str r0, [sp, #0x38]
    b .L_140
.L_e4:
    ldr r3, [sl, #0x634]
    mov r0, #0x0
    cmp r3, #0x4
    str r0, [sp]
    ble .L_120
    ldr r2, [sl, #0x630]
    add r0, sp, #0x14
    mov r1, sl
    mov r3, #0x7
    bl func_ov002_022a6cc8
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    str r1, [sp, #0x34]
    str r0, [sp, #0x38]
    b .L_140
.L_120:
    ldr r2, [sl, #0x630]
    add r0, sp, #0xc
    mov r1, sl
    bl func_ov002_022a6cc8
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x10]
    str r1, [sp, #0x34]
    str r0, [sp, #0x38]
.L_140:
    ldr r6, [sp, #0x40]
    ldr r0, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    ldr r2, [sp, #0x34]
    sub r1, r6, r0
    sub r0, r3, r2
    bl func_0208c584
    rsb r0, r0, #0x0
    ldr r1, [sl, #0x624]
    mov r0, r0, lsl #0x10
    cmp r1, #0x80
    mov r4, r0, lsr #0x10
    bge .L_1d0
    ldr r0, _LIT2
    ldr r2, [sl, #0x628]
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r2, r0
    bne .L_1a8
    sub r0, r4, #0x8000
    mul r1, r0, r1
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r0, r0, asr #0x7
    add r4, r0, #0x8000
    b .L_1c0
.L_1a8:
    mov r0, r4, lsl #0x10
    mov r0, r0, asr #0x10
    mul r1, r0, r1
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r4, r0, asr #0x7
.L_1c0:
    mov r0, r4, lsl #0x10
    mov r4, r0, lsr #0x10
    ldr r5, [sp, #0x3c]
    b .L_208
.L_1d0:
    ldr r2, [sp, #0x38]
    ldr r0, [sp, #0x3c]
    ldr r3, [sp, #0x34]
    sub r7, r1, #0x80
    sub r3, r3, r0
    sub r1, r2, r6
    mul r5, r7, r3
    mul r3, r7, r1
    mov r1, r5, asr #0x6
    mov r2, r3, asr #0x6
    add r1, r5, r1, lsr #0x19
    add r2, r3, r2, lsr #0x19
    add r5, r0, r1, asr #0x7
    add r6, r6, r2, asr #0x7
.L_208:
    mov r0, r4, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, _LIT3
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r0]
    add r0, sp, #0x4c
    bl func_0208b014
    cmp r4, #0x0
    ble .L_244
    cmp r4, #0x8000
    movle r0, #0x1
    ble .L_248
.L_244:
    mov r0, #0x0
.L_248:
    cmp r4, #0x4000
    sub r5, r5, r0
    ble .L_260
    cmp r4, #0xc000
    movle r0, #0x1
    ble .L_264
.L_260:
    mov r0, #0x0
.L_264:
    sub r0, r6, r0
    sub r1, r0, #0x10
    ldr r2, [sp, #0x44]
    ldr r0, _LIT4
    sub r3, r5, #0x10
    and r0, r2, r0
    and r1, r1, #0xff
    orr r0, r0, r1
    mov r2, r3, lsl #0x17
    orr r2, r0, r2, lsr #0x7
    ldr r0, _LIT5
    add r1, sp, #0x4c
    str r2, [sp, #0x44]
    bl func_0207eea8
    mov r2, #0x400
    ldrh r3, [sp, #0x48]
    rsb r2, r2, #0x0
    ldr r5, [sp, #0x44]
    ldr r1, _LIT6
    and r2, r3, r2
    and r1, r5, r1
    orr r1, r1, #0x100
    orr r3, r1, r0, lsl #0x19
    orr r2, r2, #0x31
    orr r2, r2, #0x100
    strh r2, [sp, #0x48]
    ldr r0, _LIT5
    add r1, sp, #0x44
    str r3, [sp, #0x44]
    mov r2, #0x1
    bl func_0207ef74
    ldr r0, [sl, #0x624]
    cmp r0, #0x80
    ble .L_38c
    cmp r4, #0x0
    ble .L_300
    cmp r4, #0x8000
    movle r1, #0x1
    ble .L_304
.L_300:
    mov r1, #0x0
.L_304:
    ldr r0, [sp, #0x3c]
    cmp r4, #0x4000
    sub r0, r0, r1
    str r0, [sp, #0x3c]
    ble .L_324
    cmp r4, #0xc000
    movle r2, #0x1
    ble .L_328
.L_324:
    mov r2, #0x0
.L_328:
    ldr r0, [sp, #0x40]
    ldrh r1, [sp, #0x48]
    sub r3, r0, r2
    mov r0, #0x400
    ldr r4, [sp, #0x3c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    sub r6, r4, #0x10
    orr r4, r0, #0x39
    sub r2, r3, #0x10
    and r1, r2, #0xff
    orr r4, r4, #0x100
    ldr r5, [sp, #0x44]
    ldr r0, _LIT4
    mov r2, r6, lsl #0x17
    and r0, r5, r0
    orr r0, r0, r1
    orr r5, r0, r2, lsr #0x7
    ldr r0, _LIT5
    add r1, sp, #0x44
    mov r2, #0x1
    str r3, [sp, #0x40]
    str r5, [sp, #0x44]
    strh r4, [sp, #0x48]
    bl func_0207ef74
.L_38c:
    ldr r0, [sl, #0x61c]
    cmp r0, #0x0
    bge .L_404
    mov r8, #0x0
    mov r6, #0x1
    ldr r7, _LIT7
    ldr r4, _LIT8
    mov r9, r8
    str r8, [sl, #0x61c]
    add r5, sl, #0x21c
    mov fp, r6
.L_3b8:
    ldr r0, [sl, #0x628]
    and r2, r0, #0x1
    mla r1, r2, r4, r7
    add r1, r1, r9
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_3f4
    mov r1, r8
    mov r2, fp
    bl func_ov002_021be1f8
    cmp r0, #0x0
    ldrne r0, [r5, #0x400]
    orrne r0, r0, r6, lsl r8
    strne r0, [r5, #0x400]
.L_3f4:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r9, r9, #0x14
    blt .L_3b8
.L_404:
    mov r8, #0x0
    mov r4, #0x400
    ldr r7, _LIT7
    ldr fp, _LIT2
    mov r9, r8
    rsb r4, r4, #0x0
    mov r5, r8
    mov r6, #0x1
.L_424:
    ldr r0, [sl, #0x620]
    cmp r0, #0x2
    ble .L_43c
    ldr r0, [sl, #0x62c]
    cmp r8, r0
    beq .L_528
.L_43c:
    ldr r1, [sl, #0x628]
    ldr r0, _LIT8
    and r2, r1, #0x1
    mla r0, r2, r0, r7
    add r0, r0, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_528
    mov r0, sl
    mov r2, r8
    mov r3, #0x0
    bl func_ov002_022a61e8
    bl func_ov002_0229d1b8
    cmp r0, #0x0
    bne .L_528
    ldr r0, [sl, #0x61c]
    tst r0, r6, lsl r8
    beq .L_528
    str r5, [sp]
    ldr r2, [sl, #0x628]
    add r0, sp, #0x4
    mov r1, sl
    mov r3, r8
    bl func_ov002_022a6cc8
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0x4]
    str r1, [sp, #0x30]
    sub r1, r1, #0x10
    and r3, r1, #0xff
    str r0, [sp, #0x2c]
    sub r0, r0, #0x10
    ldr ip, [sp, #0x44]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x17
    and r1, ip, r1
    orr r1, r1, r3
    orr r0, r1, r0, lsr #0x7
    str r0, [sp, #0x44]
    ldr r2, [fp, #0x4]
    ldr r1, [sl, #0x628]
    eor r0, r2, #0x1
    cmp r1, r0
    ldrh r1, [sp, #0x48]
    moveq r3, #0x30000000
    ldr r2, [sp, #0x44]
    ldr r0, _LIT6
    movne r3, #0x0
    and r0, r2, r0
    orr r0, r0, r3
    and r1, r1, r4
    str r0, [sp, #0x44]
    orr r0, r1, #0x29
    orr r0, r0, #0x100
    strh r0, [sp, #0x48]
    ldr r0, _LIT5
    add r1, sp, #0x44
    mov r2, #0x1
    bl func_0207ef74
.L_528:
    add r9, r9, #0x14
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_424
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x80002000
_LIT1: .word 0x00001529
_LIT2: .word data_ov002_022cd65c
_LIT3: .word data_020bee8c
_LIT4: .word 0xfe00ff00
_LIT5: .word data_ov002_022d0eb8
_LIT6: .word 0xc1fffcff
_LIT7: .word data_ov002_022cf08c
_LIT8: .word 0x00000868
