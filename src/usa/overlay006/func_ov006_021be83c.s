; func_ov006_021be83c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cbf14
        .extern data_ov006_021cbf1c
        .extern data_ov006_021cbf30
        .extern data_ov006_021cbf44
        .extern data_ov006_021cbf58
        .extern data_ov006_021cc044
        .extern data_ov006_021cc098
        .extern data_ov006_021cc148
        .extern data_ov006_021cc1a8
        .extern data_ov006_021cc214
        .extern data_ov006_021cc4f8
        .extern data_ov006_021cc930
        .extern data_ov006_0224f328
        .extern data_ov006_0225dd50
        .extern func_ov006_021b6c1c
        .extern func_ov006_021b6e50
        .extern func_ov006_021bd5b0
        .extern func_ov006_021c6ad0
        .global func_ov006_021be83c
        .arm
func_ov006_021be83c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r0, [sp, #0x34]
    ldr r6, [r9, #0x50]
    mov r4, #0x0
    str r4, [r0]
    str r4, [r0, #0x4]
    str r4, [r0, #0x8]
    str r0, [sp, #0x34]
    add r4, r9, #0xa0
    mov r0, #0x24
    ldr r5, [r9, #0x40]
    mla r4, r6, r0, r4
    mov r8, r1
    mov r7, r2
    cmp r5, #0x6
    addls pc, pc, r5, lsl #0x2
    b .L_68
    b .L_70
    b .L_70
    b .L_70
    b .L_70
    b .L_68
    b .L_68
    b .L_68
.L_68:
    mov r3, #0x0
    str r3, [sp, #0x30]
.L_70:
    cmp r3, #0x0
    beq .L_1c8
    ldr r1, [r9, #0x50]
    mov r0, r9
    bl func_ov006_021bd5b0
    movs r2, r0
    bmi .L_1c8
    ldr r0, [r4, #0x20]
    ldr r1, [r9, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT0
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    ldr r1, _LIT1
    ldr fp, _LIT2
    ldr sl, _LIT3
    ldr r6, _LIT4
    str r1, [sp]
    str r0, [sp, #0x4]
    mov r5, #0x0
.L_c0:
    ldr r0, _LIT0
    ldr r2, [sp, #0x4]
    mov r1, r5
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ble .L_1a4
    ldr r1, [r9, #0x40]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_11c
    b .L_104
    b .L_10c
    b .L_114
    b .L_104
    b .L_11c
    b .L_104
    b .L_11c
.L_104:
    ldr r1, [sp]
    b .L_120
.L_10c:
    mov r1, fp
    b .L_120
.L_114:
    mov r1, sl
    b .L_120
.L_11c:
    mov r1, r6
.L_120:
    sub r0, r0, #0x1
    ldrsh r2, [r1, #0x2]
    add r0, r0, r0, lsl #0x1
    add r3, r0, #0x1
    add ip, r3, r3, lsr #0x1f
    sub r3, r2, #0x7
    mov r3, r3, lsl #0x10
    ldrsh r1, [r1]
    str r3, [sp, #0x8]
    add r2, r2, #0x7
    add r3, r1, #0x6
    add r3, r3, ip, asr #0x1
    add r0, r0, r0, lsr #0x1f
    sub r1, r1, #0x6
    sub r0, r1, r0, asr #0x1
    mov r0, r0, lsl #0x10
    cmp r8, r0, asr #0x10
    ldrge r0, [sp, #0x8]
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    cmpge r7, r0, asr #0x10
    blt .L_1a4
    cmp r8, r3, asr #0x10
    cmple r7, r2, asr #0x10
    bgt .L_1a4
    ldr r0, [sp, #0x34]
    mov r1, #0x3
    stmia r0, {r1, r5}
    ldr r1, [sp, #0x4]
    add sp, sp, #0xc
    str r1, [r0, #0x8]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a4:
    ldr r0, [sp]
    add r5, r5, #0x1
    add r0, r0, #0x4
    cmp r5, #0x5
    str r0, [sp]
    add fp, fp, #0x4
    add sl, sl, #0x4
    add r6, r6, #0x4
    blt .L_c0
.L_1c8:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    beq .L_21c
    ldr r0, _LIT5
    ldr r1, _LIT6
    ldrsh r0, [r0]
    cmp r8, r0
    ldrgesh r0, [r1, #0x2]
    cmpge r7, r0
    blt .L_21c
    ldrsh r0, [r1, #0x4]
    cmp r8, r0
    ldrlesh r0, [r1, #0x6]
    cmple r7, r0
    bgt .L_21c
    ldr r0, [sp, #0x34]
    mov r1, #0x4
    str r1, [r0]
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_21c:
    ldr r0, [r9, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_294
    b .L_248
    b .L_264
    b .L_270
    b .L_248
    b .L_294
    b .L_27c
    b .L_288
.L_248:
    ldr r0, [r9, #0x50]
    cmp r0, #0x4
    ldreq sl, _LIT7
    moveq r6, #0x9
    ldrne sl, _LIT8
    movne r6, #0x1a
    b .L_29c
.L_264:
    ldr sl, _LIT9
    mov r6, #0x7
    b .L_29c
.L_270:
    ldr sl, _LIT10
    mov r6, #0xf
    b .L_29c
.L_27c:
    ldr sl, _LIT11
    mov r6, #0x9
    b .L_29c
.L_288:
    ldr sl, _LIT12
    mov r6, #0x7
    b .L_29c
.L_294:
    ldr sl, _LIT13
    mov r6, #0x8
.L_29c:
    cmp r6, #0x0
    mov r5, #0x0
    ble .L_3a0
.L_2a8:
    ldr r0, [sl, #0x8]
    cmp r0, #0x16
    blt .L_324
    cmp r0, #0x1d
    bgt .L_324
    ldr r1, [r4, #0x20]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    bne .L_390
    ldr r1, [r9, #0x50]
    cmp r1, #0x4
    beq .L_390
    cmp r0, #0x16
    blt .L_2f0
    cmp r0, #0x19
    movle fp, #0x1
    suble r3, r0, #0x16
    ble .L_2f8
.L_2f0:
    mov fp, #0x0
    sub r3, r0, #0x1a
.L_2f8:
    ldr r2, [r4, #0x10]
    ldr r1, [r4, #0x8]
    sub r1, r2, r1
    cmp r3, r1
    bge .L_390
    cmp fp, #0x0
    beq .L_324
    add r1, r4, r3
    ldrsb r1, [r1, #0x1c]
    cmp r1, #0x0
    beq .L_390
.L_324:
    ldr r1, [r9, #0x40]
    cmp r1, #0x3
    cmpeq r0, #0x1
    beq .L_390
    ldr r0, _LIT14
    bl func_ov006_021c6ad0
    cmp r0, #0x0
    ldreq r0, [sl, #0x8]
    cmpeq r0, #0x5
    beq .L_390
    ldrsh r0, [sl]
    cmp r8, r0
    ldrgesh r0, [sl, #0x2]
    cmpge r7, r0
    blt .L_390
    ldrsh r0, [sl, #0x4]
    cmp r8, r0
    ldrlesh r0, [sl, #0x6]
    cmple r7, r0
    bgt .L_390
    ldr r1, [sp, #0x34]
    mov r0, #0x1
    str r0, [r1]
    ldr r2, [sl, #0x8]
    add sp, sp, #0xc
    str r2, [r1, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_390:
    add r5, r5, #0x1
    cmp r5, r6
    add sl, sl, #0xc
    blt .L_2a8
.L_3a0:
    ldr sl, [r9, #0x50]
    mov r1, #0x0
    cmp sl, #0x4
    moveq fp, #0x3
    movne fp, #0x4
    cmp fp, #0x0
    ble .L_4d0
    ldr r9, [r4, #0x8]
    mov r3, #0x56
    mov r2, r9
    mov r5, #0x36
.L_3cc:
    cmp r2, #0x0
    blt .L_3e4
    ldr r0, [r4, #0x10]
    add r6, r9, r1
    cmp r6, r0
    blt .L_3f8
.L_3e4:
    cmp r9, #0x0
    cmpeq r1, #0x0
    ldreq r0, [r4, #0x10]
    cmpeq r0, #0x0
    bne .L_4b8
.L_3f8:
    cmp sl, #0x4
    moveq r6, r3
    movne r6, r5
    sub r0, r6, #0xd
    cmp r7, r0
    blt .L_4b8
    add r0, r6, #0xd
    cmp r7, r0
    bgt .L_4b8
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_484
    mov r0, #0x0
    mov r6, #0xe
.L_434:
    sub ip, r6, #0xa
    cmp r8, ip
    blt .L_470
    add ip, r6, #0xa
    cmp r8, ip
    bgt .L_470
    ldr r2, [sp, #0x34]
    mov r3, #0x2
    str r3, [r2]
    str r0, [r2, #0x4]
    mov r0, r2
    str r1, [r0, #0x8]
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_470:
    add r0, r0, #0x1
    cmp r0, #0xa
    add r6, r6, #0x17
    blt .L_434
    b .L_4b8
.L_484:
    cmp r8, #0x4
    blt .L_4b8
    cmp r8, #0xe7
    bgt .L_4b8
    ldr r0, [sp, #0x34]
    mov r2, #0x2
    str r2, [r0]
    mov r2, #0x0
    str r2, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4b8:
    add r1, r1, #0x1
    cmp r1, fp
    add r2, r2, #0x1
    add r3, r3, #0x20
    add r5, r5, #0x20
    blt .L_3cc
.L_4d0:
    ldr r1, [sp, #0x34]
    mov r0, #0x0
    str r0, [r1]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word data_ov006_021cbf1c
_LIT2: .word data_ov006_021cbf30
_LIT3: .word data_ov006_021cbf44
_LIT4: .word data_ov006_021cbf58
_LIT5: .word data_ov006_021cbf14
_LIT6: .word data_ov006_021cbf14
_LIT7: .word data_ov006_021cc1a8
_LIT8: .word data_ov006_021cc930
_LIT9: .word data_ov006_021cc044
_LIT10: .word data_ov006_021cc4f8
_LIT11: .word data_ov006_021cc214
_LIT12: .word data_ov006_021cc098
_LIT13: .word data_ov006_021cc148
_LIT14: .word data_ov006_0225dd50
