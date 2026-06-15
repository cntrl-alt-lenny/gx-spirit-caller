; func_02003f70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c7c
        .global func_02003f70
        .arm
func_02003f70:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov r9, r0
    ldr r0, [r9, #0x1c]
    str r1, [sp, #0x8]
    mov r0, r0, lsl #0x18
    mov r1, r0, lsr #0x18
    ldr r0, [sp, #0x54]
    cmp r1, #0xff
    str r0, [sp, #0x54]
    ldr r0, [sp, #0x58]
    str r2, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr sl, [sp, #0x50]
    str r0, [sp, #0x58]
    moveq r7, #0x0
    beq .L_128
    ldr r0, [r9, #0x20]
    mov r0, r0, lsl #0x17
    mov r7, r0, lsr #0x17
.L_128:
    cmp r1, #0xff
    movne r0, #0x1
    strne r0, [sp, #0x18]
    moveq r0, #0x0
    ldr r8, [r9, #0x10]
    streq r0, [sp, #0x18]
    cmp r8, #0x0
    bne .L_168
    ldr r0, [r9, #0x24]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1f
    moveq r8, #0x0
    beq .L_168
    ldr r0, [sp, #0x54]
    add r0, r0, r0, lsr #0x1f
    mov r8, r0, asr #0x1
.L_168:
    ldr r0, [r9, #0x14]
    ldr r2, [r9, #0x24]
    str r0, [sp, #0x14]
    cmp r0, #0x0
    ldreq r0, [sp, #0x54]
    streq r0, [sp, #0x14]
    ldr r0, [sp, #0x54]
    sub r1, r0, #0x8
    mov r0, r2, lsl #0x14
    str r0, [sp, #0x24]
    mov r0, r2, lsl #0x10
    cmp r1, #0x8
    str r0, [sp, #0x28]
    addls pc, pc, r1, lsl #0x2
    b .L_200
    b .L_1c8
    b .L_200
    b .L_1d4
    b .L_200
    b .L_1e0
    b .L_200
    b .L_1ec
    b .L_200
    b .L_1f8
.L_1c8:
    ldr r0, _LIT0
    ldr r4, [r0, #0x88]
    b .L_200
.L_1d4:
    ldr r0, _LIT0
    ldr r4, [r0, #0x90]
    b .L_200
.L_1e0:
    ldr r0, _LIT0
    ldr r4, [r0, #0x98]
    b .L_200
.L_1ec:
    ldr r0, _LIT0
    ldr r4, [r0, #0xa0]
    b .L_200
.L_1f8:
    ldr r0, _LIT0
    ldr r4, [r0, #0xa8]
.L_200:
    mov r0, #0x0
    str r0, [r9, #0x28]
    ldr r0, [r9, #0x20]
    bic r0, r0, #0x400000
    str r0, [r9, #0x20]
    ldr r0, [sp, #0x8]
    ldrsb r1, [r0]
    cmp r1, #0x0
    beq .L_7c8
    ldr r0, [sp, #0x54]
    mov r0, r0, asr #0x1
    str r0, [sp, #0x1c]
.L_230:
    ldr r0, [sp, #0x8]
    mov r6, #0x0
    cmp r1, #0xa
    add r5, r0, #0x1
    str r6, [sp, #0x20]
    bne .L_26c
    ldr r0, [sp, #0x14]
    mov r7, r6
    add sl, sl, r0
    ldr r0, [r9, #0x20]
    str r5, [sp, #0x8]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_7c8
    b .L_7b8
.L_26c:
    cmp r1, #0x20
    bne .L_2e8
    cmp r7, #0x0
    ble .L_2d8
    ldr r0, [r9, #0x20]
    mov r0, r0, lsl #0x7
    movs r0, r0, lsr #0x1f
    ldrne r0, [r9, #0x18]
    bne .L_29c
    cmp r8, #0x0
    movne r0, r8
    ldreq r0, [sp, #0x1c]
.L_29c:
    add r7, r7, r0
    ldr r0, [sp, #0x10]
    add r1, r0, r7
    ldr r0, [sp, #0x24]
    add r1, r1, r0, lsr #0x1c
    ldr r0, [r9]
    cmp r1, r0, lsl #0x3
    bls .L_2d8
    ldr r0, [sp, #0x14]
    mov r7, #0x0
    add sl, sl, r0
    ldr r0, [r9, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_7c8
.L_2d8:
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    b .L_7b8
.L_2e8:
    cmp r1, #0x40
    bne .L_33c
    ldrsb r1, [r5]
    str r5, [sp, #0x8]
    cmp r1, #0x30
    blt .L_33c
    cmp r1, #0x39
    bgt .L_33c
    sub r0, r1, #0x30
    rsb r1, r0, #0xf
    add r0, r5, #0x1
    str r0, [sp, #0x8]
    ldr r0, _LIT0
    and r2, r1, #0xf
    str r2, [r0, #0x8]
    ldr r0, [r9, #0x24]
    mov r2, r1, lsl #0x1c
    bic r0, r0, #0x1e0000
    orr r0, r0, r2, lsr #0xb
    str r0, [r9, #0x24]
    b .L_7b8
.L_33c:
    cmp r1, #0x2f
    bgt .L_360
    subs r0, r1, #0x2c
    addpl pc, pc, r0, lsl #0x2
    b .L_36c
    b .L_368
    b .L_368
    b .L_368
    b .L_368
.L_360:
    cmp r1, #0x85
    bne .L_36c
.L_368:
    str r5, [sp, #0x20]
.L_36c:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    bne .L_44c
.L_378:
    ldrb r1, [r5]
    cmp r1, #0x20
    bgt .L_3a4
    bge .L_3f4
    cmp r1, #0x0
    bgt .L_398
    beq .L_434
    b .L_43c
.L_398:
    cmp r1, #0xa
    beq .L_434
    b .L_43c
.L_3a4:
    cmp r1, #0x40
    bgt .L_3e0
    bge .L_434
    sub r0, r1, #0x28
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_43c
    b .L_434
    b .L_43c
    b .L_43c
    b .L_43c
    b .L_3e8
    b .L_3e8
    b .L_3e8
    b .L_3e8
.L_3e0:
    cmp r1, #0x85
    bne .L_43c
.L_3e8:
    add r5, r5, #0x1
    str r5, [sp, #0x20]
    b .L_440
.L_3f4:
    ldrb r0, [r5, #0x1]
    cmp r0, #0x21
    bgt .L_408
    beq .L_424
    b .L_42c
.L_408:
    cmp r0, #0x3f
    bgt .L_42c
    cmp r0, #0x3a
    blt .L_42c
    cmpne r0, #0x3b
    cmpne r0, #0x3f
    bne .L_42c
.L_424:
    add r5, r5, #0x2
    b .L_440
.L_42c:
    str r5, [sp, #0x20]
    b .L_440
.L_434:
    str r5, [sp, #0x20]
    b .L_440
.L_43c:
    add r5, r5, #0x1
.L_440:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_378
.L_44c:
    ldr r0, [sp, #0x8]
    cmp r0, r5
    beq .L_48c
.L_458:
    cmp r8, #0x0
    movne r1, r8
    bne .L_47c
    ldrb r1, [r0]
    ldrb r2, [r4, r1, asr #0x1]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1d
    mov r1, r2, asr r1
    and r1, r1, #0xf
.L_47c:
    add r6, r6, r1
    add r0, r0, #0x1
    cmp r0, r5
    bne .L_458
.L_48c:
    ldrb r0, [r5]
    cmp r0, #0x40
    bne .L_62c
    ldrb r0, [r5, #0x1]
    cmp r0, #0x30
    bcc .L_62c
    cmp r0, #0x39
    bhi .L_62c
    mov ip, #0x0
    add r0, r5, #0x2
    mov r2, ip
    mov r3, ip
    b .L_61c
.L_4c0:
    cmp fp, #0x20
    bgt .L_4e8
    bge .L_558
    cmp fp, #0x0
    bgt .L_4dc
    beq .L_5ec
    b .L_5f4
.L_4dc:
    cmp fp, #0xa
    beq .L_5ec
    b .L_5f4
.L_4e8:
    cmp fp, #0x40
    bgt .L_524
    bge .L_5e4
    sub r1, fp, #0x28
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_5f4
    b .L_5ec
    b .L_5f4
    b .L_5f4
    b .L_5f4
    b .L_52c
    b .L_52c
    b .L_52c
    b .L_52c
.L_524:
    cmp fp, #0x85
    bne .L_5f4
.L_52c:
    cmp r8, #0x0
    movne r0, r8
    bne .L_54c
    ldrb r0, [r4, fp, asr #0x1]
    mov r1, fp, lsl #0x1f
    mov r1, r1, lsr #0x1d
    mov r0, r0, asr r1
    and r0, r0, #0xf
.L_54c:
    add r6, r6, r0
    mov r0, r3
    b .L_61c
.L_558:
    ldrb r1, [r0, #0x1]
    cmp r1, #0x21
    bgt .L_56c
    beq .L_588
    b .L_5dc
.L_56c:
    cmp r1, #0x3f
    bgt .L_5dc
    cmp r1, #0x3a
    blt .L_5dc
    cmpne r1, #0x3b
    cmpne r1, #0x3f
    bne .L_5dc
.L_588:
    ldr r1, [r9, #0x20]
    mov r1, r1, lsl #0x7
    movs r1, r1, lsr #0x1f
    ldrne r1, [r9, #0x18]
    bne .L_5a8
    cmp r8, #0x0
    movne r1, r8
    ldreq r1, [sp, #0x1c]
.L_5a8:
    add r6, r6, r1
    cmp r8, #0x0
    movne r1, r8
    bne .L_5d0
    ldrb fp, [r0, #0x1]
    ldrb r1, [r4, fp, asr #0x1]
    mov fp, fp, lsl #0x1f
    mov fp, fp, lsr #0x1d
    mov r1, r1, asr fp
    and r1, r1, #0xf
.L_5d0:
    add r6, r6, r1
    add r0, r0, #0x2
    b .L_61c
.L_5dc:
    mov r0, r2
    b .L_61c
.L_5e4:
    add r0, r0, #0x2
    b .L_61c
.L_5ec:
    mov r0, ip
    b .L_61c
.L_5f4:
    cmp r8, #0x0
    movne r1, r8
    bne .L_614
    ldrb r1, [r4, fp, asr #0x1]
    mov fp, fp, lsl #0x1f
    mov fp, fp, lsr #0x1d
    mov r1, r1, asr fp
    and r1, r1, #0xf
.L_614:
    add r6, r6, r1
    add r0, r0, #0x1
.L_61c:
    cmp r0, #0x0
    ldrneb fp, [r0]
    cmpne fp, #0x0
    bne .L_4c0
.L_62c:
    ldr r1, [sp, #0x10]
    ldr r0, [r9]
    add r1, r1, r7
    add r2, r6, r1
    ldr r1, [sp, #0x24]
    add r1, r2, r1, lsr #0x1c
    cmp r1, r0, lsl #0x3
    bls .L_6b8
    cmp r7, #0x0
    ble .L_670
    ldr r1, [sp, #0x14]
    mov r7, #0x0
    add sl, sl, r1
    ldr r1, [r9, #0x20]
    mov r1, r1, lsl #0x8
    movs r1, r1, lsr #0x1f
    bne .L_7c8
.L_670:
    ldr r1, [sp, #0x10]
    add r1, r1, r7
    add r2, r6, r1
    ldr r1, [sp, #0x24]
    add r1, r2, r1, lsr #0x1c
    cmp r1, r0, lsl #0x3
    bls .L_6b8
    ldr r0, [sp, #0x14]
    add r1, sl, r0, lsl #0x1
    ldr r0, [sp, #0x28]
    add r1, r1, r0, lsr #0x1c
    ldr r0, [r9, #0x4]
    cmp r1, r0, lsl #0x3
    bls .L_6b8
    ldr r0, [r9, #0x20]
    orr r0, r0, #0x400000
    str r0, [r9, #0x20]
    b .L_7c8
.L_6b8:
    ldr r0, [sp, #0x14]
    add r1, sl, r0
    ldr r0, [sp, #0x28]
    add r1, r1, r0, lsr #0x1c
    ldr r0, [r9, #0x4]
    cmp r1, r0, lsl #0x3
    bls .L_6e4
    ldr r0, [r9, #0x20]
    orr r0, r0, #0x400000
    str r0, [r9, #0x20]
    b .L_7c8
.L_6e4:
    ldr r0, [sp, #0x8]
    cmp r0, r5
    mov r6, r0
    beq .L_7a4
.L_6f4:
    cmp r8, #0x0
    movne fp, r8
    bne .L_718
    ldrb r0, [r6]
    ldrb r1, [r4, r0, asr #0x1]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1d
    mov r0, r1, asr r0
    and fp, r0, #0xf
.L_718:
    ldr r0, [sp, #0x10]
    add r0, r0, r7
    add r1, fp, r0
    ldr r0, [sp, #0x24]
    add r1, r1, r0, lsr #0x1c
    ldr r0, [r9]
    cmp r1, r0, lsl #0x3
    bls .L_758
    ldr r0, [sp, #0x14]
    mov r7, #0x0
    add sl, sl, r0
    ldr r0, [r9, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    strne r6, [sp, #0x8]
    bne .L_7c8
.L_758:
    ldr r0, [sp, #0x54]
    str sl, [sp]
    str r0, [sp, #0x4]
    ldr r3, [sp, #0x10]
    ldrb r1, [r6]
    ldr r2, [sp, #0xc]
    ldr ip, [sp, #0x58]
    mov r0, r9
    add r3, r3, r7
    blx ip
    ldr r0, [sp, #0x18]
    add r7, r7, fp
    cmp r0, #0x0
    addne r0, r6, #0x1
    strne r0, [sp, #0x8]
    bne .L_7a4
    add r6, r6, #0x1
    cmp r6, r5
    bne .L_6f4
.L_7a4:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bne .L_7c8
    ldr r0, [sp, #0x20]
    str r0, [sp, #0x8]
.L_7b8:
    ldr r0, [sp, #0x8]
    ldrsb r1, [r0]
    cmp r1, #0x0
    bne .L_230
.L_7c8:
    ldr r0, [sp, #0x8]
    str r0, [r9, #0x28]
    ldr r0, [sp, #0x10]
    add r0, r0, r7
    str r0, [r9, #0x8]
    str sl, [r9, #0xc]
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102c7c
