; func_02035904 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b2f0
        .extern data_0219b3b0
        .extern data_0219b470
        .extern data_0219b680
        .extern func_02034adc
        .extern func_020351c8
        .extern func_0203537c
        .extern func_0203546c
        .extern func_0203587c
        .extern func_020361fc
        .extern func_02036248
        .extern func_0203678c
        .extern func_020372d8
        .extern func_02037a74
        .extern func_02037c04
        .extern func_02037d70
        .extern func_02037f94
        .extern func_0203808c
        .extern func_02038118
        .extern func_020381fc
        .extern func_0203820c
        .extern func_020385a8
        .extern func_02038624
        .extern func_020387c0
        .extern func_0203acf4
        .extern func_0203bd9c
        .extern func_0203c694
        .extern func_0203c6bc
        .extern func_02087144
        .extern func_020873dc
        .extern func_02087470
        .extern func_02087d0c
        .extern func_0208a358
        .extern func_0208a48c
        .extern func_020918f0
        .extern func_020953e0
        .global func_02035904
        .arm
func_02035904:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldrh r1, [r0, #0x12]
    tst r1, #0x8000
    beq .L_678
    ldrh r1, [r0, #0x6]
    mov r6, #0x0
    ldr r0, _LIT0
    cmp r1, #0x0
    moveq r1, #0x1
    cmp r1, #0x4
    movgt r1, #0x4
    ldr r4, _LIT2
    mov r7, r6
    strh r1, [r0, #0x6]
    mov r8, #0x1
.L_48:
    mov r0, r4
    bl func_020385a8
    cmp r0, #0x0
    add r7, r7, #0x1
    movne r6, r8
    cmp r7, #0x3
    add r4, r4, #0x10
    blt .L_48
    bl func_020953e0
    cmp r0, #0xdc
    bge .L_674
    bl func_0203acf4
    bl func_020953e0
    cmp r0, #0xc0
    bge .L_674
    ldr r4, _LIT3
    and fp, r6, #0x1
    mov sl, #0x0
.L_90:
    ldrsb r0, [r5, #0x6a]
    cmp r0, #0x0
    blt .L_618
    ldr r0, _LIT0
    ldrb r0, [r0, #0xef]
    tst r0, #0x80
    beq .L_c0
    ldrh r0, [r5, #0x58]
    tst r0, #0x80
    beq .L_c0
    mov r0, r5
    bl func_020351c8
.L_c0:
    ldrsb r1, [r5, #0x2b]
    cmp r1, #0x0
    beq .L_dc
    ldr r0, _LIT0
    ldrh r0, [r0, #0x6]
    sub r0, r1, r0
    strb r0, [r5, #0x2b]
.L_dc:
    ldr r0, [r5, #0x34]
    ldr r1, [r5]
    mov r0, r0, lsr #0x14
    cmp r1, #0x0
    and r6, r0, #0xf
    ldrneb r0, [r1, #0x58]
    cmpne r0, #0x1
    beq .L_178
    cmp r0, #0x4
    bne .L_618
    mov r0, #0x3
    strb r0, [r1, #0x58]
    ldr r0, [r5, #0x34]
    tst r0, #0x1000000
    beq .L_138
    mov r1, r5
    bl func_0203678c
    cmp r0, #0x0
    bne .L_618
    mov r0, r5
    mov r1, #0x0
    bl func_02036248
    b .L_618
.L_138:
    mov r0, r5
    bl func_020372d8
    cmp r0, #0x0
    bne .L_618
    ldr r1, [r5]
    ldrsb r0, [r1, #0x56]
    sub r0, r0, #0x1
    strb r0, [r1, #0x56]
    ldr r0, [r5]
    ldrsb r0, [r0, #0x56]
    cmp r0, #0x0
    bgt .L_618
    mov r0, r5
    mov r1, #0x0
    bl func_02036248
    b .L_618
.L_178:
    ldrh r0, [r5, #0x68]
    tst r0, #0x4000
    beq .L_3d0
    cmp r6, #0x4
    bne .L_19c
    ldr r0, [r5, #0x4]
    bl func_0203c694
    cmp r0, #0x0
    beq .L_618
.L_19c:
    ldrh r0, [r5, #0x68]
    bic r0, r0, #0x4000
    strh r0, [r5, #0x68]
    ldrh r0, [r5, #0x68]
    tst r0, #0x800
    bne .L_618
    ldr r1, [r5, #0x34]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x10
    ldr r7, [r0, #0x34]
    mov r0, r5
    mov r3, r1, lsr #0x10
    mov r2, #0xc
    mov r1, #0x0
    mla r7, r3, r2, r7
    bl func_0203537c
    ldrsb r1, [r5, #0x6a]
    cmp r1, #0x0
    blt .L_618
    cmp r6, #0x4
    addls pc, pc, r6, lsl #0x2
    b .L_398
    b .L_398
    b .L_234
    b .L_208
    b .L_208
    b .L_378
.L_208:
    ldrh r0, [r7, #0x2]
    mvn r2, #0x0
    mov r3, r2
    str r0, [sp]
    ldrb r6, [r7, #0x6]
    add r0, r5, #0x4
    str r6, [sp, #0x4]
    bl func_0208a358
    cmp r0, #0x0
    bne .L_2a8
    b .L_618
.L_234:
    ldrh r3, [r7, #0x2]
    add r0, r5, #0x4
    mvn r2, #0x0
    str r3, [sp]
    ldrb r3, [r7]
    and r3, r3, #0x7f
    bl func_0208a48c
    cmp r0, #0x0
    beq .L_618
    ldrsb r2, [r5, #0x6a]
    cmp r2, #0x4
    bge .L_2a8
    ldr r1, _LIT3
    mov r0, #0x84
    mla r8, r2, r0, r1
    mov r9, #0x0
    mov r6, r9
.L_278:
    add r0, r8, r9, lsl #0x3
    ldrsh r0, [r0, #0x4]
    mov r2, r0, asr #0x8
    cmp r2, #0x7f
    beq .L_29c
    mov r0, r5
    mov r1, r9
    mov r3, r6
    bl func_020387c0
.L_29c:
    add r9, r9, #0x1
    cmp r9, #0x10
    blt .L_278
.L_2a8:
    ldrsh r1, [r5, #0x18]
    cmp r1, #0x0
    beq .L_2c4
    ldrsh r2, [r5, #0x16]
    mov r0, r5
    mov r3, #0x0
    bl func_0203808c
.L_2c4:
    ldrh r0, [r5, #0x1a]
    cmp r0, #0x0
    beq .L_2dc
    mov r1, r0
    mov r0, r5
    bl func_02038118
.L_2dc:
    ldrb r1, [r5, #0x29]
    cmp r1, #0x0
    beq .L_2f0
    mov r0, r5
    bl func_020381fc
.L_2f0:
    ldrb r1, [r5, #0x2a]
    cmp r1, #0x0
    beq .L_304
    mov r0, r5
    bl func_0203820c
.L_304:
    ldrsb r1, [r5, #0x26]
    ldrh r2, [r5, #0x1c]
    mov r0, r5
    bl func_02037d70
    ldrsb r1, [r5, #0x24]
    cmp r1, #0x40
    beq .L_32c
    mov r0, r5
    mov r2, #0x0
    bl func_02037f94
.L_32c:
    ldrh r0, [r5, #0x68]
    tst r0, #0x100
    ldrne r1, [r5, #0x5c]
    cmpne r1, #0x0
    beq .L_398
    ldr r0, [r1, #0x5c]
    cmp r0, r5
    bne .L_360
    mov r0, #0x0
    str r0, [r1, #0x5c]
    ldrh r1, [r5, #0x1c]
    ldr r0, [r5, #0x5c]
    bl func_020361fc
.L_360:
    mov r0, #0x0
    str r0, [r5, #0x5c]
    ldrh r0, [r5, #0x68]
    bic r0, r0, #0x100
    strh r0, [r5, #0x68]
    b .L_398
.L_378:
    ldr r0, [r5, #0x4]
    bl func_0203bd9c
    cmp r0, #0x0
    bne .L_304
    mov r0, r5
    mov r1, #0x0
    bl func_020361fc
    b .L_618
.L_398:
    ldrb r0, [r7, #0x1]
    movs r0, r0, asr #0x4
    beq .L_618
    ldr r3, _LIT0
    rsb r0, r0, #0xf
    ldrsh r2, [r3, #0x8]
    rsb r0, r0, r0, lsl #0x7
    mov r1, r0, asr #0x4
    add r6, r2, #0x1
    mov r0, #0x0
    mov r2, #0x8
    strh r6, [r3, #0x8]
    bl func_02037c04
    b .L_618
.L_3d0:
    tst r0, #0x2800
    bne .L_618
    cmp r6, #0x5
    bne .L_428
    add r0, r5, #0x40
    bl func_020385a8
    cmp r0, #0x0
    beq .L_428
    ldr r1, [r5, #0x40]
    ldr r0, [r5, #0x4]
    mov r1, r1, asr #0x8
    bl func_02087470
    ldr r0, [r5, #0x40]
    cmp r0, #0x0
    bne .L_428
    ldrh r0, [r5, #0x68]
    tst r0, #0x400
    beq .L_428
    mov r0, r5
    mov r1, #0x0
    bl func_02036248
    b .L_618
.L_428:
    cmp sl, #0x4
    bge .L_49c
    ldrh r9, [r4]
    cmp r9, #0x0
    beq .L_49c
    cmp r9, #0x0
    add r7, r4, #0x4
    mov r8, #0x1
    beq .L_49c
.L_44c:
    tst r9, #0x1
    beq .L_48c
    mov r0, r7
    bl func_02038624
    cmp r0, #0x0
    bne .L_474
    ldrh r1, [r4]
    mvn r0, r8
    and r0, r1, r0
    strh r0, [r4]
.L_474:
    ldrsh r2, [r7]
    mov r1, r8, lsl #0x10
    add r0, r5, #0x4
    mov r1, r1, lsr #0x10
    mov r2, r2, asr #0x8
    bl func_02087d0c
.L_48c:
    mov r8, r8, lsl #0x1
    add r7, r7, #0x8
    movs r9, r9, asr #0x1
    bne .L_44c
.L_49c:
    mov r0, r5
    bl func_0203546c
    cmp r0, #0x0
    bne .L_618
    ldrsb r0, [r5, #0x6a]
    cmp r0, #0x0
    blt .L_618
    add r0, r5, #0xc
    bl func_020385a8
    cmp r0, #0x0
    beq .L_4e4
    ldr r0, [r5, #0xc]
    mov r2, #0x0
    mov r1, r0, lsl #0x8
    mov r0, r5
    mov r3, r2
    mov r1, r1, asr #0x10
    bl func_0203808c
.L_4e4:
    cmp fp, #0x0
    beq .L_4fc
    ldrsb r1, [r5, #0x26]
    mov r0, r5
    mov r2, #0x0
    bl func_02037d70
.L_4fc:
    ldrsb r0, [r5, #0x73]
    cmp r0, #0x0
    beq .L_510
    mov r0, r5
    bl func_0203587c
.L_510:
    ldrh r0, [r5, #0x68]
    tst r0, #0x1
    bne .L_5a8
    ldr r3, [r5, #0x8]
    cmp r3, #0x0
    ldrneh r0, [r5, #0x1e]
    cmpne r0, #0x0
    beq .L_5a8
    ldr r0, _LIT0
    ldrh r2, [r5, #0x1e]
    ldrsb r1, [r5, #0x20]
    ldrh r0, [r0, #0x6]
    add r2, r3, r2
    add r3, r1, r0
.L_548:
    ldrb r1, [r2]
    cmp r1, #0xff
    bne .L_564
    mov r0, #0x0
    strb r0, [r5, #0x21]
    strh r0, [r5, #0x1e]
    b .L_5a4
.L_564:
    and r0, r1, #0x7
    strb r0, [r5, #0x21]
    cmp r3, r1, asr #0x3
    blt .L_5a4
    ldrb r0, [r5, #0x21]
    sub r3, r3, r1, asr #0x3
    cmp r0, #0x7
    beq .L_590
    cmp r0, #0x0
    orrne r0, r0, #0x80
    strb r0, [r5, #0x21]
.L_590:
    ldrh r0, [r5, #0x1e]
    add r2, r2, #0x1
    add r0, r0, #0x1
    strh r0, [r5, #0x1e]
    b .L_548
.L_5a4:
    strb r3, [r5, #0x20]
.L_5a8:
    cmp r6, #0x4
    bne .L_5dc
    ldrh r0, [r5, #0x68]
    tst r0, #0x1
    bne .L_618
    ldr r0, [r5, #0x4]
    bl func_0203c6bc
    cmp r0, #0x0
    beq .L_618
    mov r0, r5
    mvn r1, #0x0
    bl func_02036248
    b .L_618
.L_5dc:
    cmp r6, #0x5
    ldr r0, [r5, #0x4]
    bne .L_604
    bl func_020873dc
    cmp r0, #0x0
    bne .L_618
    mov r0, r5
    mvn r1, #0x0
    bl func_02036248
    b .L_618
.L_604:
    cmp r0, #0x0
    bne .L_618
    mov r0, r5
    mvn r1, #0x0
    bl func_02036248
.L_618:
    add sl, sl, #0x1
    cmp sl, #0x1c
    add r4, r4, #0x84
    add r5, r5, #0x78
    blt .L_90
    ldr r0, _LIT0
    ldrh r0, [r0, #0x12]
    tst r0, #0x8
    beq .L_650
    bl func_02037a74
    cmp r0, #0x0
    beq .L_650
    ldr r0, _LIT4
    bl func_020918f0
.L_650:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x12]
    tst r0, #0x2000
    beq .L_674
    mov r0, #0x0
    bl func_020372d8
    cmp r0, #0x0
    bne .L_674
    bl func_02034adc
.L_674:
    bl func_02087144
.L_678:
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x6]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_0219b680
_LIT2: .word data_0219b2f0
_LIT3: .word data_0219b470
_LIT4: .word data_0219b3b0
