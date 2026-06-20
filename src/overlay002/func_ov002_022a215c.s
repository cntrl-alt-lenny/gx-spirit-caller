; func_ov002_022a215c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov002_022d016c
        .extern data_ov002_022d0f2c
        .extern func_0200617c
        .extern func_02006194
        .extern func_020b3870
        .extern func_ov002_021afaf0
        .extern func_ov002_021afbc4
        .extern func_ov002_021aff4c
        .extern func_ov002_021aff90
        .extern func_ov002_022477d8
        .extern func_ov002_0226b3f0
        .extern func_ov002_0229f3b4
        .extern func_ov002_0229f788
        .extern func_ov002_0229f9a4
        .extern func_ov002_022a10fc
        .extern func_ov002_022a16fc
        .extern func_ov002_022a1784
        .extern func_ov002_022a1870
        .extern func_ov002_022a19a8
        .extern func_ov002_022a1e60
        .extern func_ov002_022a28a0
        .extern func_ov002_022ac028
        .extern func_ov002_022b0444
        .extern func_ov002_022b2048
        .global func_ov002_022a215c
        .arm
func_ov002_022a215c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    str r1, [r4, #0x18]
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_124
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    bne .L_124
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr ip, [r0]
    ldr r3, [r0]
    and ip, ip, #0x1f00
    mov lr, ip, lsr #0x8
    bic ip, r3, #0x1f00
    bic r3, lr, #0xc
    orr r3, ip, r3, lsl #0x8
    str r3, [r0]
    ldrh r3, [r0, #0x4a]
    bic r3, r3, #0x3f
    orr r3, r3, #0x3f
    strh r3, [r0, #0x4a]
    ldr ip, [r0]
    ldr r3, [r0]
    and ip, ip, #0xe000
    mov lr, ip, lsr #0xd
    bic ip, r3, #0xe000
    bic r3, lr, #0x2
    orr r3, ip, r3, lsl #0xd
    str r3, [r0]
    str r1, [r2, #0xd0]
    str r1, [r4]
    ldr r0, [r4, #0x70]
    cmp r0, #0x0
    beq .L_ac
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x70]
.L_ac:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_c4
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x68]
.L_c4:
    ldr r0, [r4, #0x4]
    cmp r0, #0xd
    bne .L_e8
    ldr r3, [r4, #0x8]
    mov r0, r4
    mov r1, #0x20
    mov r2, #0x0
    bl func_ov002_0229f9a4
    ldmia sp!, {r4, r5, r6, pc}
.L_e8:
    cmp r0, #0xb
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x24]
    mov r5, #0x0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
.L_100:
    add r0, r4, r5, lsl #0x1
    ldrh r0, [r0, #0x94]
    sub r0, r0, #0x4
    bl func_ov002_022b0444
    ldr r0, [r4, #0x24]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_100
    ldmia sp!, {r4, r5, r6, pc}
.L_124:
    ldr r0, [r4, #0x194]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_154
    add r6, r4, #0x198
.L_138:
    mov r0, r6
    bl func_ov002_0229f3b4
    ldr r0, [r4, #0x194]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x20
    blt .L_138
.L_154:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_180
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    movgt r1, #0x1
    ldr r0, [r4, #0x38]
    movle r1, #0x0
    sub r0, r0, r1
    str r0, [r4, #0x38]
    b .L_208
.L_180:
    mov r0, r4
    bl func_ov002_022a1784
    cmp r0, #0x0
    beq .L_1e0
    ldr r0, [r4, #0x4]
    cmp r0, #0xb
    ldr r0, [r4, #0x38]
    bne .L_1a8
    cmp r0, #0xc
    b .L_1ac
.L_1a8:
    cmp r0, #0x10
.L_1ac:
    movlt r1, #0x1
    ldr r0, [r4, #0x38]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r4, #0x38]
    mov r0, r4
    bl func_ov002_022a1870
    cmp r0, #0x0
    beq .L_208
    ldr r0, _LIT1
    mov r1, #0x2
    str r1, [r0, #0xd0]
    b .L_208
.L_1e0:
    ldr r0, [r4, #0x38]
    ldr r1, [r4, #0x38]
    cmp r0, #0x4
    movgt r2, #0x1
    movle r2, #0x0
    sub r1, r1, r2
    str r1, [r4, #0x38]
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd0]
.L_208:
    ldr r0, [r4, #0x4]
    cmp r0, #0xc
    beq .L_220
    cmp r0, #0x20
    beq .L_238
    b .L_250
.L_220:
    bl func_ov002_0226b3f0
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_0229f788
    ldmia sp!, {r4, r5, r6, pc}
.L_238:
    bl func_ov002_022477d8
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_0229f788
    ldmia sp!, {r4, r5, r6, pc}
.L_250:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    bne .L_2c4
    mov r0, r4
    bl func_ov002_022a16fc
    cmp r0, #0x0
    beq .L_2ac
    bl func_02006194
    cmp r0, #0x0
    bne .L_294
    bl func_0200617c
    cmp r0, #0x0
    beq .L_2ac
.L_294:
    ldr r1, _LIT1
    mov r2, #0x2
    mov r0, r4
    str r2, [r1, #0xd0]
    bl func_ov002_022a19a8
    b .L_2c4
.L_2ac:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd0]
    cmp r0, #0x2
    bne .L_2c4
    mov r0, r4
    bl func_ov002_022a1e60
.L_2c4:
    ldr r0, [r4, #0x4]
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_5d4
    b .L_314
    b .L_314
    b .L_314
    b .L_3a8
    b .L_314
    b .L_3a8
    b .L_3a8
    b .L_314
    b .L_314
    b .L_3a8
    b .L_48c
    b .L_30c
    b .L_5d4
    b .L_314
.L_30c:
    mov r0, r4
    bl func_ov002_022b2048
.L_314:
    ldr r6, [r4, #0x194]
    mov ip, #0x0
    cmp r6, #0x0
    ble .L_5d4
    mov r0, #0x1
    mov r2, ip
.L_32c:
    add r1, r4, ip, lsl #0x5
    ldr r5, [r1, #0x198]
    mov r3, r2
    cmp r5, #0x0
    ldrne r1, [r1, #0x1b0]
    cmpne r1, #0x0
    movne r3, r0
    cmp r3, #0x0
    beq .L_398
    cmp r5, #0x0
    addne r0, r4, ip, lsl #0x5
    ldrne r0, [r0, #0x1b0]
    cmpne r0, #0x0
    beq .L_370
    cmp r0, #0x10
    movlt r0, #0x1
    blt .L_374
.L_370:
    mov r0, #0x0
.L_374:
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r4, ip, lsl #0x5
    ldr r2, [r0, #0x1b4]
    ldr r1, _LIT2
    mov r0, r4
    str r2, [r1, #0xd44]
    bl func_ov002_0229f788
    ldmia sp!, {r4, r5, r6, pc}
.L_398:
    add ip, ip, #0x1
    cmp ip, r6
    blt .L_32c
    b .L_5d4
.L_3a8:
    ldr r6, [r4, #0x194]
    mov ip, #0x0
    cmp r6, #0x0
    ble .L_5d4
    mov r0, #0x1
    mov r2, ip
.L_3c0:
    add r1, r4, ip, lsl #0x5
    ldr r5, [r1, #0x198]
    mov r3, r2
    cmp r5, #0x0
    ldrne r1, [r1, #0x1b0]
    cmpne r1, #0x0
    movne r3, r0
    cmp r3, #0x0
    beq .L_47c
    cmp r5, #0x0
    addne r0, r4, ip, lsl #0x5
    ldrne r0, [r0, #0x1b0]
    cmpne r0, #0x0
    beq .L_404
    cmp r0, #0x10
    movlt r0, #0x1
    blt .L_408
.L_404:
    mov r0, #0x0
.L_408:
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp ip, #0x0
    beq .L_42c
    cmp ip, #0x1
    beq .L_450
    cmp ip, #0x2
    beq .L_45c
    ldmia sp!, {r4, r5, r6, pc}
.L_42c:
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x20]
    add r0, r0, r1
    sub r0, r0, #0x1
    bl func_020b3870
    mov r0, r4
    str r1, [r4, #0x20]
    bl func_ov002_022a10fc
    ldmia sp!, {r4, r5, r6, pc}
.L_450:
    mov r0, r4
    bl func_ov002_022a28a0
    ldmia sp!, {r4, r5, r6, pc}
.L_45c:
    ldr r0, [r4, #0x20]
    ldr r1, [r4, #0x24]
    add r0, r0, #0x1
    bl func_020b3870
    mov r0, r4
    str r1, [r4, #0x20]
    bl func_ov002_022a10fc
    ldmia sp!, {r4, r5, r6, pc}
.L_47c:
    add ip, ip, #0x1
    cmp ip, r6
    blt .L_3c0
    b .L_5d4
.L_48c:
    ldr r6, [r4, #0x194]
    mov ip, #0x0
    cmp r6, #0x0
    ble .L_5d4
    mov r0, #0x1
    mov r2, ip
.L_4a4:
    add r1, r4, ip, lsl #0x5
    ldr r5, [r1, #0x198]
    mov r3, r2
    cmp r5, #0x0
    ldrne r1, [r1, #0x1b0]
    cmpne r1, #0x0
    movne r3, r0
    cmp r3, #0x0
    beq .L_5c8
    cmp r5, #0x0
    addne r0, r4, ip, lsl #0x5
    ldrne r0, [r0, #0x1b0]
    cmpne r0, #0x0
    beq .L_4e8
    cmp r0, #0x10
    movlt r0, #0x1
    blt .L_4ec
.L_4e8:
    mov r0, #0x0
.L_4ec:
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp ip, #0x0
    beq .L_510
    cmp ip, #0x1
    beq .L_564
    cmp ip, #0x2
    beq .L_570
    ldmia sp!, {r4, r5, r6, pc}
.L_510:
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x20]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0xf0
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    sub r1, r1, r0
    str r1, [r4, #0x20]
    ldr r0, [r4, #0x8]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0xf
    cmp r1, r0
    movle r1, r0
    mov r0, r4
    str r1, [r4, #0x20]
    bl func_ov002_022a10fc
    ldmia sp!, {r4, r5, r6, pc}
.L_564:
    mov r0, r4
    bl func_ov002_022a28a0
    ldmia sp!, {r4, r5, r6, pc}
.L_570:
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x20]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0xf0
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    add r2, r1, r0
    str r2, [r4, #0x20]
    ldr r0, [r4, #0x8]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r1, r0, #0xff
    cmp r2, r1
    movle r1, r2
    mov r0, r4
    str r1, [r4, #0x20]
    bl func_ov002_022a10fc
    ldmia sp!, {r4, r5, r6, pc}
.L_5c8:
    add ip, ip, #0x1
    cmp ip, r6
    blt .L_4a4
.L_5d4:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r6, [r4, #0x194]
    mov ip, #0x0
    cmp r6, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    mov r0, #0x1
    mov r2, ip
.L_5f8:
    add r1, r4, ip, lsl #0x5
    ldr r5, [r1, #0x198]
    mov r3, r2
    cmp r5, #0x0
    ldrne r1, [r1, #0x1b0]
    cmpne r1, #0x0
    movne r3, r0
    cmp r3, #0x0
    beq .L_728
    cmp r5, #0x0
    addne r0, r4, ip, lsl #0x5
    ldrne r0, [r0, #0x1b0]
    cmpne r0, #0x0
    beq .L_63c
    cmp r0, #0x10
    movlt r0, #0x1
    blt .L_640
.L_63c:
    mov r0, #0x0
.L_640:
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp ip, #0x0
    beq .L_660
    cmp ip, #0x1
    cmpne ip, #0x2
    beq .L_66c
    ldmia sp!, {r4, r5, r6, pc}
.L_660:
    mov r0, r4
    bl func_ov002_022a28a0
    ldmia sp!, {r4, r5, r6, pc}
.L_66c:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022ac028
    mov r1, #0x0
    str r1, [r4, #0x60]
    cmp r0, #0x0
    beq .L_69c
    bl func_ov002_021aff90
    ldr r0, [r4, #0x4c]
    sub r0, r0, #0x1
    str r0, [r4, #0x4c]
    b .L_718
.L_69c:
    bl func_ov002_021afaf0
    ldr r1, [r4, #0x4c]
    cmp r1, r0
    bge .L_718
    ldr r2, [r4, #0x68]
    ldr r0, [r4, #0x20]
    add r1, r1, #0x1
    ldr r0, [r2, r0, lsl #0x2]
    str r1, [r4, #0x4c]
    bl func_ov002_021aff4c
    bl func_ov002_021afaf0
    ldr r1, [r4, #0x4c]
    cmp r1, r0
    bne .L_6e8
    mov r0, #0x0
    str r0, [r4, #0x14]
    mov r0, #0x1
    str r0, [r4, #0x60]
    b .L_718
.L_6e8:
    ldr r0, [r4, #0x20]
    add r5, r0, #0x1
    bl func_ov002_021afbc4
    cmp r5, r0
    bge .L_718
    mov r0, r4
    mov r1, r5
    bl func_ov002_022ac028
    cmp r0, #0x0
    ldreq r0, [r4, #0x20]
    addeq r0, r0, #0x1
    streq r0, [r4, #0x20]
.L_718:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a10fc
    ldmia sp!, {r4, r5, r6, pc}
.L_728:
    add ip, ip, #0x1
    cmp ip, r6
    blt .L_5f8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x04001000
_LIT1: .word data_ov002_022d0f2c
_LIT2: .word data_ov002_022d016c
