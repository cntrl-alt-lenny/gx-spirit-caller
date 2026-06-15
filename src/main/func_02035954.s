; func_02035954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b3d0
        .extern data_0219b490
        .extern data_0219b550
        .extern data_0219b760
        .extern func_02034b2c
        .extern func_02035218
        .extern func_020353cc
        .extern func_020354bc
        .extern func_020358cc
        .extern func_0203624c
        .extern func_02036298
        .extern func_020367dc
        .extern func_02037328
        .extern func_02037ac4
        .extern func_02037c54
        .extern func_02037dc0
        .extern func_02037fe4
        .extern func_020380dc
        .extern func_02038168
        .extern func_0203824c
        .extern func_0203825c
        .extern func_020385f8
        .extern func_02038674
        .extern func_02038810
        .extern func_0203ad44
        .extern func_0203bdec
        .extern func_0203c6e4
        .extern func_0203c70c
        .extern func_0208722c
        .extern func_020874c4
        .extern func_02087558
        .extern func_02087df4
        .extern func_0208a440
        .extern func_0208a574
        .extern func_020919d8
        .extern func_020954d4
        .global func_02035954
        .arm
func_02035954:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldrh r1, [r0, #0x12]
    tst r1, #0x8000
    beq .L_b10
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
.L_4e0:
    mov r0, r4
    bl func_020385f8
    cmp r0, #0x0
    add r7, r7, #0x1
    movne r6, r8
    cmp r7, #0x3
    add r4, r4, #0x10
    blt .L_4e0
    bl func_020954d4
    cmp r0, #0xdc
    bge .L_b0c
    bl func_0203ad44
    bl func_020954d4
    cmp r0, #0xc0
    bge .L_b0c
    ldr r4, _LIT3
    and fp, r6, #0x1
    mov sl, #0x0
.L_528:
    ldrsb r0, [r5, #0x6a]
    cmp r0, #0x0
    blt .L_ab0
    ldr r0, _LIT0
    ldrb r0, [r0, #0xef]
    tst r0, #0x80
    beq .L_558
    ldrh r0, [r5, #0x58]
    tst r0, #0x80
    beq .L_558
    mov r0, r5
    bl func_02035218
.L_558:
    ldrsb r1, [r5, #0x2b]
    cmp r1, #0x0
    beq .L_574
    ldr r0, _LIT0
    ldrh r0, [r0, #0x6]
    sub r0, r1, r0
    strb r0, [r5, #0x2b]
.L_574:
    ldr r0, [r5, #0x34]
    ldr r1, [r5]
    mov r0, r0, lsr #0x14
    cmp r1, #0x0
    and r6, r0, #0xf
    ldrneb r0, [r1, #0x58]
    cmpne r0, #0x1
    beq .L_610
    cmp r0, #0x4
    bne .L_ab0
    mov r0, #0x3
    strb r0, [r1, #0x58]
    ldr r0, [r5, #0x34]
    tst r0, #0x1000000
    beq .L_5d0
    mov r1, r5
    bl func_020367dc
    cmp r0, #0x0
    bne .L_ab0
    mov r0, r5
    mov r1, #0x0
    bl func_02036298
    b .L_ab0
.L_5d0:
    mov r0, r5
    bl func_02037328
    cmp r0, #0x0
    bne .L_ab0
    ldr r1, [r5]
    ldrsb r0, [r1, #0x56]
    sub r0, r0, #0x1
    strb r0, [r1, #0x56]
    ldr r0, [r5]
    ldrsb r0, [r0, #0x56]
    cmp r0, #0x0
    bgt .L_ab0
    mov r0, r5
    mov r1, #0x0
    bl func_02036298
    b .L_ab0
.L_610:
    ldrh r0, [r5, #0x68]
    tst r0, #0x4000
    beq .L_868
    cmp r6, #0x4
    bne .L_634
    ldr r0, [r5, #0x4]
    bl func_0203c6e4
    cmp r0, #0x0
    beq .L_ab0
.L_634:
    ldrh r0, [r5, #0x68]
    bic r0, r0, #0x4000
    strh r0, [r5, #0x68]
    ldrh r0, [r5, #0x68]
    tst r0, #0x800
    bne .L_ab0
    ldr r1, [r5, #0x34]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x10
    ldr r7, [r0, #0x34]
    mov r0, r5
    mov r3, r1, lsr #0x10
    mov r2, #0xc
    mov r1, #0x0
    mla r7, r3, r2, r7
    bl func_020353cc
    ldrsb r1, [r5, #0x6a]
    cmp r1, #0x0
    blt .L_ab0
    cmp r6, #0x4
    addls pc, pc, r6, lsl #0x2
    b .L_830
    b .L_830
    b .L_6cc
    b .L_6a0
    b .L_6a0
    b .L_810
.L_6a0:
    ldrh r0, [r7, #0x2]
    mvn r2, #0x0
    mov r3, r2
    str r0, [sp]
    ldrb r6, [r7, #0x6]
    add r0, r5, #0x4
    str r6, [sp, #0x4]
    bl func_0208a440
    cmp r0, #0x0
    bne .L_740
    b .L_ab0
.L_6cc:
    ldrh r3, [r7, #0x2]
    add r0, r5, #0x4
    mvn r2, #0x0
    str r3, [sp]
    ldrb r3, [r7]
    and r3, r3, #0x7f
    bl func_0208a574
    cmp r0, #0x0
    beq .L_ab0
    ldrsb r2, [r5, #0x6a]
    cmp r2, #0x4
    bge .L_740
    ldr r1, _LIT3
    mov r0, #0x84
    mla r8, r2, r0, r1
    mov r9, #0x0
    mov r6, r9
.L_710:
    add r0, r8, r9, lsl #0x3
    ldrsh r0, [r0, #0x4]
    mov r2, r0, asr #0x8
    cmp r2, #0x7f
    beq .L_734
    mov r0, r5
    mov r1, r9
    mov r3, r6
    bl func_02038810
.L_734:
    add r9, r9, #0x1
    cmp r9, #0x10
    blt .L_710
.L_740:
    ldrsh r1, [r5, #0x18]
    cmp r1, #0x0
    beq .L_75c
    ldrsh r2, [r5, #0x16]
    mov r0, r5
    mov r3, #0x0
    bl func_020380dc
.L_75c:
    ldrh r0, [r5, #0x1a]
    cmp r0, #0x0
    beq .L_774
    mov r1, r0
    mov r0, r5
    bl func_02038168
.L_774:
    ldrb r1, [r5, #0x29]
    cmp r1, #0x0
    beq .L_788
    mov r0, r5
    bl func_0203824c
.L_788:
    ldrb r1, [r5, #0x2a]
    cmp r1, #0x0
    beq .L_79c
    mov r0, r5
    bl func_0203825c
.L_79c:
    ldrsb r1, [r5, #0x26]
    ldrh r2, [r5, #0x1c]
    mov r0, r5
    bl func_02037dc0
    ldrsb r1, [r5, #0x24]
    cmp r1, #0x40
    beq .L_7c4
    mov r0, r5
    mov r2, #0x0
    bl func_02037fe4
.L_7c4:
    ldrh r0, [r5, #0x68]
    tst r0, #0x100
    ldrne r1, [r5, #0x5c]
    cmpne r1, #0x0
    beq .L_830
    ldr r0, [r1, #0x5c]
    cmp r0, r5
    bne .L_7f8
    mov r0, #0x0
    str r0, [r1, #0x5c]
    ldrh r1, [r5, #0x1c]
    ldr r0, [r5, #0x5c]
    bl func_0203624c
.L_7f8:
    mov r0, #0x0
    str r0, [r5, #0x5c]
    ldrh r0, [r5, #0x68]
    bic r0, r0, #0x100
    strh r0, [r5, #0x68]
    b .L_830
.L_810:
    ldr r0, [r5, #0x4]
    bl func_0203bdec
    cmp r0, #0x0
    bne .L_79c
    mov r0, r5
    mov r1, #0x0
    bl func_0203624c
    b .L_ab0
.L_830:
    ldrb r0, [r7, #0x1]
    movs r0, r0, asr #0x4
    beq .L_ab0
    ldr r3, _LIT0
    rsb r0, r0, #0xf
    ldrsh r2, [r3, #0x8]
    rsb r0, r0, r0, lsl #0x7
    mov r1, r0, asr #0x4
    add r6, r2, #0x1
    mov r0, #0x0
    mov r2, #0x8
    strh r6, [r3, #0x8]
    bl func_02037c54
    b .L_ab0
.L_868:
    tst r0, #0x2800
    bne .L_ab0
    cmp r6, #0x5
    bne .L_8c0
    add r0, r5, #0x40
    bl func_020385f8
    cmp r0, #0x0
    beq .L_8c0
    ldr r1, [r5, #0x40]
    ldr r0, [r5, #0x4]
    mov r1, r1, asr #0x8
    bl func_02087558
    ldr r0, [r5, #0x40]
    cmp r0, #0x0
    bne .L_8c0
    ldrh r0, [r5, #0x68]
    tst r0, #0x400
    beq .L_8c0
    mov r0, r5
    mov r1, #0x0
    bl func_02036298
    b .L_ab0
.L_8c0:
    cmp sl, #0x4
    bge .L_934
    ldrh r9, [r4]
    cmp r9, #0x0
    beq .L_934
    cmp r9, #0x0
    add r7, r4, #0x4
    mov r8, #0x1
    beq .L_934
.L_8e4:
    tst r9, #0x1
    beq .L_924
    mov r0, r7
    bl func_02038674
    cmp r0, #0x0
    bne .L_90c
    ldrh r1, [r4]
    mvn r0, r8
    and r0, r1, r0
    strh r0, [r4]
.L_90c:
    ldrsh r2, [r7]
    mov r1, r8, lsl #0x10
    add r0, r5, #0x4
    mov r1, r1, lsr #0x10
    mov r2, r2, asr #0x8
    bl func_02087df4
.L_924:
    mov r8, r8, lsl #0x1
    add r7, r7, #0x8
    movs r9, r9, asr #0x1
    bne .L_8e4
.L_934:
    mov r0, r5
    bl func_020354bc
    cmp r0, #0x0
    bne .L_ab0
    ldrsb r0, [r5, #0x6a]
    cmp r0, #0x0
    blt .L_ab0
    add r0, r5, #0xc
    bl func_020385f8
    cmp r0, #0x0
    beq .L_97c
    ldr r0, [r5, #0xc]
    mov r2, #0x0
    mov r1, r0, lsl #0x8
    mov r0, r5
    mov r3, r2
    mov r1, r1, asr #0x10
    bl func_020380dc
.L_97c:
    cmp fp, #0x0
    beq .L_994
    ldrsb r1, [r5, #0x26]
    mov r0, r5
    mov r2, #0x0
    bl func_02037dc0
.L_994:
    ldrsb r0, [r5, #0x73]
    cmp r0, #0x0
    beq .L_9a8
    mov r0, r5
    bl func_020358cc
.L_9a8:
    ldrh r0, [r5, #0x68]
    tst r0, #0x1
    bne .L_a40
    ldr r3, [r5, #0x8]
    cmp r3, #0x0
    ldrneh r0, [r5, #0x1e]
    cmpne r0, #0x0
    beq .L_a40
    ldr r0, _LIT0
    ldrh r2, [r5, #0x1e]
    ldrsb r1, [r5, #0x20]
    ldrh r0, [r0, #0x6]
    add r2, r3, r2
    add r3, r1, r0
.L_9e0:
    ldrb r1, [r2]
    cmp r1, #0xff
    bne .L_9fc
    mov r0, #0x0
    strb r0, [r5, #0x21]
    strh r0, [r5, #0x1e]
    b .L_a3c
.L_9fc:
    and r0, r1, #0x7
    strb r0, [r5, #0x21]
    cmp r3, r1, asr #0x3
    blt .L_a3c
    ldrb r0, [r5, #0x21]
    sub r3, r3, r1, asr #0x3
    cmp r0, #0x7
    beq .L_a28
    cmp r0, #0x0
    orrne r0, r0, #0x80
    strb r0, [r5, #0x21]
.L_a28:
    ldrh r0, [r5, #0x1e]
    add r2, r2, #0x1
    add r0, r0, #0x1
    strh r0, [r5, #0x1e]
    b .L_9e0
.L_a3c:
    strb r3, [r5, #0x20]
.L_a40:
    cmp r6, #0x4
    bne .L_a74
    ldrh r0, [r5, #0x68]
    tst r0, #0x1
    bne .L_ab0
    ldr r0, [r5, #0x4]
    bl func_0203c70c
    cmp r0, #0x0
    beq .L_ab0
    mov r0, r5
    mvn r1, #0x0
    bl func_02036298
    b .L_ab0
.L_a74:
    cmp r6, #0x5
    ldr r0, [r5, #0x4]
    bne .L_a9c
    bl func_020874c4
    cmp r0, #0x0
    bne .L_ab0
    mov r0, r5
    mvn r1, #0x0
    bl func_02036298
    b .L_ab0
.L_a9c:
    cmp r0, #0x0
    bne .L_ab0
    mov r0, r5
    mvn r1, #0x0
    bl func_02036298
.L_ab0:
    add sl, sl, #0x1
    cmp sl, #0x1c
    add r4, r4, #0x84
    add r5, r5, #0x78
    blt .L_528
    ldr r0, _LIT0
    ldrh r0, [r0, #0x12]
    tst r0, #0x8
    beq .L_ae8
    bl func_02037ac4
    cmp r0, #0x0
    beq .L_ae8
    ldr r0, _LIT4
    bl func_020919d8
.L_ae8:
    ldr r0, _LIT0
    ldrh r0, [r0, #0x12]
    tst r0, #0x2000
    beq .L_b0c
    mov r0, #0x0
    bl func_02037328
    cmp r0, #0x0
    bne .L_b0c
    bl func_02034b2c
.L_b0c:
    bl func_0208722c
.L_b10:
    ldr r0, _LIT0
    mov r1, #0x0
    strh r1, [r0, #0x6]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219b2e0
_LIT1: .word data_0219b760
_LIT2: .word data_0219b3d0
_LIT3: .word data_0219b550
_LIT4: .word data_0219b490
