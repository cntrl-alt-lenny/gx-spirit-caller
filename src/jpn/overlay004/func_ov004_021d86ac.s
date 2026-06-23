; func_ov004_021d86ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_ov004_02209eec
        .extern data_ov004_02209f0c
        .extern func_02001cec
        .extern func_0200506c
        .extern func_02005488
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0202c06c
        .extern func_0208de58
        .extern func_0208e0c4
        .extern func_0208e118
        .extern func_02091554
        .extern func_02094410
        .global func_ov004_021d86ac
        .arm
func_ov004_021d86ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x70
    mov r5, r0
    mov r7, r1
    mov r4, r2
    bl func_0208e118
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x1000
    bl func_02094410
    bl func_0208e0c4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x1000
    bl func_02094410
    bl func_0208de58
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094410
    bl func_0208de58
    add r6, r0, #0x160
    mov r0, #0x0
    add r1, r6, #0x4000
    mov r2, #0x3f00
    bl func_02094410
    ldr r0, _LIT0
    mov r1, #0x1c
    mov r2, #0x12
    bl func_02001cec
    mov r1, r7
    mov r3, #0x2
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    add r2, r6, #0x4000
    bl func_0200506c
    mov r0, #0x0
    str r0, [r5, #0x8]
    str r0, [r5, #0x14]
    and r1, r4, #0x10
    ldr r0, [r5, #0x18]
    and r0, r0, #0x10
    cmp r0, r1
    beq .L_198
    mov r7, #0x1
    cmp r1, #0x0
    addne r7, r7, #0x1
    ldr r1, _LIT1
    add r0, sp, #0x50
    mov r2, r7
    bl func_02091554
    ldr r1, _LIT2
    add r0, sp, #0x30
    mov r2, r7
    bl func_02091554
    add r0, sp, #0x8
    bl func_0201d428
    add r0, sp, #0x50
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r1, _LIT3
    str r0, [sp, #0x8]
    mov r0, #0x40
    strh r0, [sp, #0x18]
    sub r0, r0, #0x41
    str r0, [sp, #0x10]
    ldrh r2, [sp, #0x1c]
    str r1, [sp, #0x14]
    add r0, sp, #0x8
    bic r1, r2, #0xf
    orr r1, r1, #0x6
    strh r1, [sp, #0x1c]
    ldrh r1, [sp, #0x1c]
    bic r1, r1, #0x10
    strh r1, [sp, #0x1c]
    bl func_0201e564
    ldr r0, [sp, #0x8]
    bl func_02006e00
    add r0, sp, #0x8
    bl func_0201d428
    add r0, sp, #0x30
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x8]
    mov r0, #0x0
    ldrh r1, [sp, #0x1c]
    str r0, [sp, #0x14]
    strh r0, [sp, #0x18]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x1c]
    ldrh r1, [sp, #0x1c]
    add r0, sp, #0x8
    bic r1, r1, #0x10
    strh r1, [sp, #0x1c]
    bl func_0201e564
    ldr r0, [sp, #0x8]
    bl func_02006e00
.L_198:
    ldr r0, _LIT0
    str r4, [r5, #0x18]
    ldr r0, [r0, #0xc]
    and r1, r4, #0xf
    add r0, r0, #0x14
    str r0, [r5, #0xc]
    str r0, [r5, #0x10]
    cmp r1, #0x2
    bne .L_214
    mov r0, #0x1f
    bl func_0202c06c
    mov r4, r0
    mov r0, #0x1f
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    mov r1, r4
    add r0, r0, r0, lsr #0x1f
    ldr r4, [r5, #0xc]
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x70
    mov r0, #0xc
    str r4, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    add r2, r6, #0x4000
    bl func_0200506c
    ldr r0, [r5, #0xc]
    add r0, r0, #0xc
    str r0, [r5, #0xc]
    b .L_328
.L_214:
    cmp r1, #0x3
    bne .L_274
    mov r0, #0x20
    bl func_0202c06c
    mov r4, r0
    mov r0, #0x20
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    mov r1, r4
    add r0, r0, r0, lsr #0x1f
    ldr r4, [r5, #0xc]
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x70
    mov r0, #0xc
    str r4, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    add r2, r6, #0x4000
    bl func_0200506c
    ldr r0, [r5, #0xc]
    add r0, r0, #0xc
    str r0, [r5, #0xc]
    b .L_328
.L_274:
    cmp r1, #0x4
    ldrne r0, [r5, #0xc]
    subne r0, r0, #0x8
    strne r0, [r5, #0xc]
    bne .L_328
    mov r0, #0x1d
    bl func_0202c06c
    mov r4, r0
    mov r0, #0x1d
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x70
    ldr r2, [r5, #0xc]
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    str r2, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r4
    add r2, r6, #0x4000
    bl func_0200506c
    mov r0, #0x1e
    bl func_0202c06c
    mov r4, r0
    mov r0, #0x1e
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x70
    mov r1, r4
    add r0, r0, r0, lsr #0x1f
    ldr r4, [r5, #0xc]
    mov r0, r0, asr #0x1
    add r3, r0, #0x70
    mov r0, #0xc
    str r4, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    add r2, r6, #0x4000
    bl func_0200506c
    ldr r0, [r5, #0xc]
    add r0, r0, #0xc
    str r0, [r5, #0xc]
.L_328:
    bl func_0208e118
    ldr r2, [r5, #0xc]
    add r0, r0, #0x44
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1d
    mov r4, r1, asr #0x3
    adds r1, r3, r2, ror #0x1d
    addne r4, r4, #0x1
    ldr r3, _LIT4
    cmp r4, #0x0
    mov r7, #0x0
    ble .L_39c
    mov r6, r7
.L_364:
    mov r8, r6
.L_368:
    add r1, r3, #0x1
    mov r2, r8, lsl #0x1
    orr r3, r3, #0x3000
    mov r1, r1, lsl #0x10
    add r8, r8, #0x1
    strh r3, [r0, r2]
    cmp r8, #0x1c
    mov r3, r1, lsr #0x10
    blt .L_368
    add r7, r7, #0x1
    cmp r7, r4
    add r0, r0, #0x40
    blt .L_364
.L_39c:
    bl func_0208e0c4
    add r9, r4, #0x2
    cmp r9, #0x0
    add r0, r0, #0x2
    mov sl, #0x0
    ble .L_460
    ldr r6, _LIT5
    add r7, r4, #0x1
    sub r4, r6, #0x3
    sub ip, r6, #0x2
    sub r8, r6, #0x4
    mov r3, #0x208
    mov lr, #0x204
.L_3d0:
    mov fp, #0x0
.L_3d4:
    cmp fp, #0x0
    beq .L_3e8
    cmp fp, #0x1d
    beq .L_404
    b .L_420
.L_3e8:
    cmp sl, #0x0
    moveq r1, r8
    beq .L_438
    cmp sl, r7
    movlt r1, lr
    addge r1, r6, #0x2
    b .L_438
.L_404:
    cmp sl, #0x0
    moveq r1, ip
    beq .L_438
    cmp sl, r7
    addlt r1, r6, #0x1
    addge r1, r6, #0x4
    b .L_438
.L_420:
    cmp sl, #0x0
    moveq r1, r4
    beq .L_438
    cmp sl, r7
    movlt r1, r6
    movge r1, r3
.L_438:
    orr r2, r1, #0x2000
    mov r1, fp, lsl #0x1
    strh r2, [r0, r1]
    add fp, fp, #0x1
    cmp fp, #0x1e
    blt .L_3d4
    add sl, sl, #0x1
    cmp sl, r9
    add r0, r0, #0x40
    blt .L_3d0
.L_460:
    ldr r0, [r5, #0xc]
    ldr r3, _LIT6
    add r0, r0, #0x18
    str r0, [r5, #0xc]
    ldr r0, [r5, #0x18]
    and r0, r0, #0xf
    cmp r0, #0x1
    bne .L_4c0
    ldr r2, [r5, #0xc]
    ldr r1, _LIT7
    rsb r0, r2, #0xc0
    add r0, r0, r0, lsr #0x1f
    add r0, r2, r0, asr #0x1
    sub r4, r0, #0x8
    sub r0, r2, r4
    and r0, r1, r0, lsl #0x10
    str r0, [r3]
    ldr r2, [r5, #0xc]
    mov r0, #0x2
    sub r2, r2, r4
    and r1, r1, r2, lsl #0x10
    str r1, [r3, #0x4]
    str r0, [r5]
    b .L_4e4
.L_4c0:
    ldr r1, [r5, #0xc]
    ldr r0, _LIT7
    and r1, r0, r1, lsl #0x10
    str r1, [r3]
    ldr r2, [r5, #0xc]
    mov r1, #0x1
    and r0, r0, r2, lsl #0x10
    str r0, [r3, #0x4]
    str r1, [r5]
.L_4e4:
    ldr r3, _LIT8
    mov r0, #0x1
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0x3
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102bb0
_LIT1: .word data_ov004_02209eec
_LIT2: .word data_ov004_02209f0c
_LIT3: .word 0x00004020
_LIT4: .word 0x0000020b
_LIT5: .word 0x00000205
_LIT6: .word 0x04001010
_LIT7: .word 0x01ff0000
_LIT8: .word 0x04001000
