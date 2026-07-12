; func_ov005_021afa98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov005_021b1b8c
        .extern data_ov005_021b1b90
        .extern data_ov005_021b1b94
        .extern data_ov005_021b1b98
        .extern data_ov005_021b1b9c
        .extern data_ov005_021b1ba0
        .extern data_ov005_021b1bb4
        .extern data_ov005_021b1bc8
        .extern data_ov005_021b1bdc
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_02094410
        .extern func_020aace8
        .extern func_020aaf60
        .global func_ov005_021afa98
        .arm
func_ov005_021afa98:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    mov r4, r1
    mov r0, r4
    bl func_020aace8
    ldr r1, _LIT0
    str r0, [sp, #0x14]
    mov r0, #0x0
    ldr r1, [r1, #0x4]
    str r0, [sp, #0xc]
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_3d4
    ldr r0, [sp, #0x14]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [sp, #0x8]
    ldr r0, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ble .L_5a8
    ldr r0, [sp, #0xc]
    str r0, [sp, #0x4]
.L_60:
    ldr r0, [sp, #0x4]
    ldr r1, _LIT1
    add r2, r4, r0
    ldrb r3, [r4, r0]
    ldrb r0, [r2, #0x1]
    ldrb r2, [r1]
    ldrb r1, [r1, #0x1]
    add r0, r0, r3, lsl #0x8
    mov r9, #0x0
    add r1, r1, r2, lsl #0x8
    cmp r1, r0
    ldr sl, _LIT2
    streq r9, [sp, #0xc]
    beq .L_3ac
    ldr r1, _LIT3
    ldrb r2, [r1]
    ldrb r1, [r1, #0x1]
    add r1, r1, r2, lsl #0x8
    cmp r1, r0
    beq .L_f8
    ldr r1, _LIT4
    ldrb r2, [r1]
    ldrb r1, [r1, #0x1]
    add r1, r1, r2, lsl #0x8
    cmp r1, r0
    beq .L_f8
    ldr r1, _LIT5
    ldrb r2, [r1]
    ldrb r1, [r1, #0x1]
    add r1, r1, r2, lsl #0x8
    cmp r0, r1
    blt .L_118
    ldr r1, _LIT6
    ldrb r2, [r1]
    ldrb r1, [r1, #0x1]
    add r1, r1, r2, lsl #0x8
    cmp r0, r1
    bgt .L_118
.L_f8:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    movne r7, #0x1
    bne .L_120
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r7, #0x0
    b .L_120
.L_118:
    mov r7, #0x0
    str r7, [sp, #0xc]
.L_120:
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r6, r0
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov fp, r0
.L_148:
    add r0, r9, sl
    add r0, r0, r0, lsr #0x1f
    mov r8, r0, asr #0x1
    mov r0, r8, lsl #0x1
    ldrh r5, [fp, r0]
    add r0, r6, r5
    bl func_020aace8
    mov r2, r0
    ldr r0, [sp, #0x4]
    add r1, r6, r5
    add r0, r4, r0
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_19c
    mov r0, r6
    bl func_02006e00
    mov r0, fp
    bl func_02006e00
    add sp, sp, #0x44
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19c:
    sublt sl, r8, #0x1
    addge r9, r8, #0x1
    cmp sl, r9
    bge .L_148
    mov r0, r6
    bl func_02006e00
    mov r0, fp
    bl func_02006e00
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_3ac
    cmp r7, #0x0
    bne .L_3ac
    add r1, sp, #0x24
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094410
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r5, r0
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r2, _LIT11
    str r0, [sp]
    ldr r0, _LIT12
    sub r2, r2, #0x19
    str r2, [sp, #0x1c]
    ldr r2, _LIT11
    ldr r8, _LIT12
    rsb r2, r2, #0x7a
    str r2, [sp, #0x20]
    ldr r2, _LIT11
    add r1, sp, #0x24
    rsb r2, r2, #0x9b
    str r2, [sp, #0x18]
    ldr r2, _LIT11
    mov fp, #0x0
    mov ip, #0x1
    add r7, r0, #0x7
    add r3, r0, #0xc8
    add r6, r0, #0xbf
    add lr, r0, #0xe9
    add r0, r0, #0xd0
    rsb r2, r2, #0x7b
    sub r8, r8, #0x50
.L_260:
    ldr r9, [sp, #0x10]
    add r9, r9, fp
    add sl, r4, r9, lsl #0x1
    ldrb r9, [r4, r9, lsl #0x1]
    ldrb sl, [sl, #0x1]
    add r9, sl, r9, lsl #0x8
    mov r9, r9, lsl #0x10
    cmp r8, r9, lsr #0x10
    mov r9, r9, lsr #0x10
    moveq r9, #0x20
    streqb r9, [r1]
    beq .L_318
    ldr sl, _LIT12
    cmp r9, sl
    moveq r9, #0x24
    streqb r9, [r1]
    beq .L_318
    cmp r9, r7
    moveq r9, #0x40
    streqb r9, [r1]
    beq .L_318
    cmp r9, r6
    bcc .L_2cc
    cmp r9, r3
    addls r9, r9, r2
    strlsb r9, [r1]
    bls .L_318
.L_2cc:
    cmp r9, r0
    bcc .L_2ec
    cmp r9, lr
    bhi .L_2ec
    ldr sl, [sp, #0x18]
    add r9, r9, sl
    strb r9, [r1]
    b .L_318
.L_2ec:
    ldr sl, [sp, #0x1c]
    cmp r9, sl
    bcc .L_314
    ldr sl, _LIT11
    cmp r9, sl
    bhi .L_314
    ldr sl, [sp, #0x20]
    add r9, r9, sl
    strb r9, [r1]
    b .L_318
.L_314:
    mov ip, #0x0
.L_318:
    cmp ip, #0x0
    add r1, r1, #0x1
    add fp, fp, #0x1
    bne .L_260
    add r6, sp, #0x24
    mov r7, #0x0
    ldr r8, _LIT13
    strb r7, [r6, fp]
.L_338:
    add r0, r7, r8
    add r0, r0, r0, lsr #0x1f
    mov r9, r0, asr #0x1
    ldr r0, [sp]
    mov r1, r9, lsl #0x1
    ldrh sl, [r0, r1]
    add r0, r5, sl
    bl func_020aace8
    mov r2, r0
    add r1, r5, sl
    mov r0, r6
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_38c
    mov r0, r5
    bl func_02006e00
    ldr r0, [sp]
    bl func_02006e00
    add sp, sp, #0x44
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_38c:
    sublt r8, r9, #0x1
    addge r7, r9, #0x1
    cmp r8, r7
    bge .L_338
    mov r0, r5
    bl func_02006e00
    ldr r0, [sp]
    bl func_02006e00
.L_3ac:
    ldr r0, [sp, #0x10]
    add r1, r0, #0x1
    ldr r0, [sp, #0x8]
    str r1, [sp, #0x10]
    cmp r1, r0
    ldr r0, [sp, #0x4]
    add r0, r0, #0x2
    str r0, [sp, #0x4]
    blt .L_60
    b .L_5a8
.L_3d4:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    ble .L_4c8
    add r2, sp, #0x24
.L_3e4:
    ldr r0, [sp, #0xc]
    ldrsb r1, [r4, r0]
    cmp r1, #0x41
    blt .L_404
    cmp r1, #0x5a
    addle r0, r1, #0x20
    strleb r0, [r2]
    ble .L_4ac
.L_404:
    and r3, r1, #0xff
    cmp r3, #0x8c
    bgt .L_418
    beq .L_49c
    b .L_4a8
.L_418:
    sub r0, r3, #0xc0
    cmp r0, #0x1c
    addls pc, pc, r0, lsl #0x2
    b .L_4a8
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_4a8
    b .L_49c
    b .L_4a8
    b .L_4a8
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_4a8
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_4a8
    b .L_49c
    b .L_4a8
    b .L_4a8
    b .L_49c
    b .L_49c
    b .L_49c
    b .L_49c
.L_49c:
    add r0, r3, #0x20
    strb r0, [r2]
    b .L_4ac
.L_4a8:
    strb r1, [r2]
.L_4ac:
    ldr r0, [sp, #0xc]
    add r2, r2, #0x1
    add r1, r0, #0x1
    ldr r0, [sp, #0x14]
    str r1, [sp, #0xc]
    cmp r1, r0
    blt .L_3e4
.L_4c8:
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r9, r0
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov sl, r0
    ldr r0, [sp, #0x14]
    mov r8, #0x0
    cmp r0, #0x0
    ble .L_598
    add fp, sp, #0x24
.L_504:
    ldr r7, _LIT13
    mov r6, #0x0
.L_50c:
    add r0, r6, r7
    add r0, r0, r0, lsr #0x1f
    mov r5, r0, asr #0x1
    mov r0, r5, lsl #0x1
    ldrh r4, [sl, r0]
    add r0, r9, r4
    bl func_020aace8
    add r1, r9, r4
    mov r2, r0
    add r0, fp, r8
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_55c
    mov r0, r9
    bl func_02006e00
    mov r0, sl
    bl func_02006e00
    add sp, sp, #0x44
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_55c:
    sublt r7, r5, #0x1
    addge r6, r5, #0x1
    cmp r7, r6
    bge .L_50c
    add r1, fp, r8
.L_570:
    ldrsb r0, [r1]
    cmp r0, #0x20
    cmpne r0, #0x0
    addne r1, r1, #0x1
    addne r8, r8, #0x1
    bne .L_570
    ldr r0, [sp, #0x14]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_504
.L_598:
    mov r0, r9
    bl func_02006e00
    mov r0, sl
    bl func_02006e00
.L_5a8:
    mov r0, #0x1
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov005_021b1b8c
_LIT2: .word 0x0000022a
_LIT3: .word data_ov005_021b1b90
_LIT4: .word data_ov005_021b1b94
_LIT5: .word data_ov005_021b1b98
_LIT6: .word data_ov005_021b1b9c
_LIT7: .word data_ov005_021b1ba0
_LIT8: .word data_ov005_021b1bb4
_LIT9: .word data_ov005_021b1bc8
_LIT10: .word data_ov005_021b1bdc
_LIT11: .word 0x0000829a
_LIT12: .word 0x00008190
_LIT13: .word 0x000005a5
