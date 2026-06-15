; func_0206fe0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eed8
        .extern data_0219eedc
        .extern data_0219eef8
        .extern data_0219ef08
        .extern data_0219ef0c
        .extern data_0219ef10
        .extern data_0219ef14
        .extern data_0219ef90
        .extern data_0219eff0
        .extern data_0219f238
        .extern data_0219f3b8
        .extern data_0219f538
        .extern data_021a63d0
        .extern func_0206f48c
        .extern func_0206f4fc
        .extern func_0206f624
        .extern func_02070278
        .extern func_02071010
        .extern func_02071028
        .extern func_02073738
        .extern func_02074498
        .extern func_020745fc
        .extern func_02091768
        .extern func_020919d8
        .extern func_020930b0
        .extern func_020945f4
        .global func_0206fe0c
        .arm
func_0206fe0c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    ldr r3, _LIT0
    mov r1, #0x0
    ldr r0, _LIT1
    mov r2, #0x64
    str r1, [r3]
    bl func_020945f4
    ldr r0, _LIT1
    mov r3, #0x180
    ldr r2, _LIT2
    ldr r1, _LIT3
    str r3, [r0, #0x3c]
    str r2, [r0, #0x40]
    str r3, [r0, #0x48]
    str r1, [r0, #0x4c]
    bl func_02071028
    mov r0, #0x1
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0x50]
    mov r1, r0
    ldr r0, _LIT4
    ldr r5, [sp, #0x4]
    str r1, [r0]
    mov r0, #0x0
    str r0, [sp]
    mov r6, r0
    mov sl, r0
    mov r4, r0
    mov fp, r0
    mov r0, #0x2
    str r0, [sp, #0x14]
    ldr r0, [sp]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    mov r0, r5
    str r0, [sp, #0x38]
    ldr r0, [sp]
    str r0, [sp, #0x3c]
    mov r0, r5
    str r0, [sp, #0x40]
    mov r0, #0x3
    str r0, [sp, #0x20]
    ldr r0, [sp]
    str r0, [sp, #0x30]
    mov r0, r5
    str r0, [sp, #0x34]
    str r0, [sp, #0x2c]
    str r0, [sp, #0x28]
    str r0, [sp, #0x24]
    str r0, [sp, #0x10]
    ldr r0, [sp]
    str r0, [sp, #0x44]
    mov r0, #0x69
    str r0, [sp, #0x48]
    ldr r0, [sp]
    str r0, [sp, #0x4c]
    mov r0, #0x3e8
    str r0, [sp, #0xc]
.L_290:
    ldr r0, [sp, #0xc]
    bl func_02091768
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_5a4
    bl func_020930b0
    mov r9, r0, lsr #0x10
    ldr r0, _LIT5
    orr r9, r9, r1, lsl #0x10
    ldr r0, [r0]
    blx r0
    cmp r0, #0x0
    beq .L_3f0
    ldr r0, [sp, #0x50]
    subs r0, r0, #0x1
    str r0, [sp, #0x50]
    bne .L_410
    ldr r0, _LIT6
    ldr r0, [r0]
    ands r0, r0, #0x1
    beq .L_304
    ldr r0, [sp]
    cmp r0, #0x0
    bne .L_410
    bl func_02070278
    ldr r0, [sp, #0x10]
    str r0, [sp]
    b .L_410
.L_304:
    ldr r0, [sp]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_410
    b .L_324
    b .L_37c
    b .L_3a4
    b .L_410
.L_324:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ldrne r1, [sp, #0x14]
    ldrne r0, _LIT4
    strne r1, [r0]
    ldrne r0, [sp, #0x18]
    strne r0, [sp, #0x8]
    bl func_0206f624
    cmp r0, #0x0
    beq .L_360
    ldr r1, [sp, #0x1c]
    add r0, sp, #0x50
    bl func_0206f4fc
    cmp r0, #0x0
    bne .L_370
.L_360:
    bl func_02070278
    ldr r0, [sp, #0x20]
    str r0, [sp]
    b .L_410
.L_370:
    ldr r0, [sp, #0x24]
    str r0, [sp]
    b .L_410
.L_37c:
    ldr r1, [sp, #0x28]
    add r0, sp, #0x50
    bl func_0206f4fc
    cmp r0, #0x0
    bne .L_410
    ldr r0, [sp, #0x50]
    cmp r0, #0x3c
    ldrcc r0, [sp, #0x14]
    strcc r0, [sp]
    b .L_410
.L_3a4:
    ldr r1, [sp, #0x14]
    add r0, sp, #0x50
    bl func_0206f4fc
    cmp r0, #0x0
    ldrne r0, [sp, #0x2c]
    strne r0, [sp]
    bne .L_410
    ldr r0, [sp, #0x50]
    cmp r0, #0x3c
    bcs .L_410
    ldr r0, [sp, #0x20]
    bl func_02074498
    ldr r0, [sp, #0x34]
    str r0, [sp, #0x50]
    ldr r0, [sp, #0x30]
    str r0, [sp]
    ldr r0, [sp, #0x34]
    str r0, [sp, #0x4]
    b .L_410
.L_3f0:
    ldr r0, [sp, #0x38]
    bl func_02074498
    ldr r0, [sp, #0x40]
    str r0, [sp, #0x50]
    ldr r0, [sp, #0x3c]
    str r0, [sp]
    ldr r0, [sp, #0x40]
    str r0, [sp, #0x4]
.L_410:
    ldr r1, [sp, #0x44]
    ldr r0, _LIT7
.L_418:
    ldr r2, [r0]
    cmp r2, #0x0
    beq .L_440
    ldrh r2, [r0, #0xa]
    sub r2, r9, r2
    mov r2, r2, lsl #0x10
    mov r3, r2, asr #0x10
    ldr r2, _LIT8
    cmp r3, r2
    strgt r6, [r0]
.L_440:
    add r0, r0, #0xc
    add r1, r1, #0x1
    cmp r1, #0x8
    blt .L_418
    ldr r0, _LIT9
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_47c
    ldr r1, [sp, #0x4]
    subs r1, r1, #0x1
    str r1, [sp, #0x4]
    bne .L_47c
    bl func_02073738
    ldr r0, [sp, #0x48]
    str r0, [sp, #0x4]
.L_47c:
    ldr r0, _LIT10
    ldr r7, [r0, #0x8]
    cmp r7, #0x0
    beq .L_53c
.L_48c:
    ldr r1, [r7, #0xa4]
    cmp r1, #0x0
    beq .L_530
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_530
    ldrb r0, [r1, #0x8]
    cmp r0, #0x3
    bne .L_4d8
    ldr r2, [r1, #0x10]
    sub r2, r9, r2
    cmp r2, #0x27
    ble .L_4d8
    strb r5, [r1, #0x8]
    ldrh r0, [r1, #0x1a]
    strh r0, [r1, #0x18]
    ldr r0, [r1, #0x20]
    str r0, [r1, #0x1c]
    b .L_530
.L_4d8:
    cmp r0, #0x2
    bne .L_510
    ldr r2, [r1, #0x10]
    sub r2, r9, r2
    cmp r2, #0x27
    ble .L_510
    ldr r0, [r1, #0x4]
    cmp r0, #0x1
    bne .L_530
    strb r4, [r1, #0x8]
    str r4, [r1, #0x4]
    ldr r0, [r1]
    bl func_020919d8
    b .L_530
.L_510:
    cmp r0, #0x4
    beq .L_530
    ldr r0, [r1, #0x4]
    cmp r0, #0x2
    bne .L_530
    str sl, [r1, #0x4]
    ldr r0, [r1]
    bl func_020919d8
.L_530:
    ldr r7, [r7, #0x68]
    cmp r7, #0x0
    bne .L_48c
.L_53c:
    ldr r7, [sp, #0x4c]
    ldr r8, _LIT11
.L_544:
    ldrh r0, [r8, #0x4]
    cmp r0, #0x0
    beq .L_574
    ldr r0, [r8, #0x2c]
    sub r0, r9, r0
    cmp r0, #0xef
    ble .L_574
    ldr r1, _LIT12
    ldr r0, [r8, #0x34]
    ldr r1, [r1]
    blx r1
    strh fp, [r8, #0x4]
.L_574:
    add r8, r8, #0x38
    add r7, r7, #0x1
    cmp r7, #0x8
    blt .L_544
    mov r0, r9
    bl func_020745fc
    ldr r0, _LIT13
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_290
    blx r0
    b .L_290
.L_5a4:
    ldr r0, _LIT6
    ldr r0, [r0]
    ands r0, r0, #0x1
    bne .L_5c4
    ldr r0, [sp]
    cmp r0, #0x3
    beq .L_5c4
    bl func_0206f48c
.L_5c4:
    bl func_02071010
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ef10
_LIT1: .word data_0219eff0
_LIT2: .word data_0219f3b8
_LIT3: .word data_0219f238
_LIT4: .word data_0219eed8
_LIT5: .word data_0219ef14
_LIT6: .word data_0219eedc
_LIT7: .word data_0219ef90
_LIT8: .word 0x000003bd
_LIT9: .word data_0219eef8
_LIT10: .word data_021a63d0
_LIT11: .word data_0219f538
_LIT12: .word data_0219ef0c
_LIT13: .word data_0219ef08
