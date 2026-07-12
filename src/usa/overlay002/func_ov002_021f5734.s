; func_ov002_021f5734 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae434
        .extern func_ov002_021b3538
        .extern func_ov002_021b3dec
        .extern func_ov002_021b8dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bc538
        .extern func_ov002_021bcca0
        .extern func_ov002_021bcf50
        .extern func_ov002_021c2e44
        .extern func_ov002_021ca1d8
        .extern func_ov002_021d58dc
        .extern func_ov002_021dea38
        .extern func_ov002_021f4170
        .extern func_ov002_021f48e0
        .extern func_ov002_021f495c
        .extern func_ov002_021ff080
        .extern func_ov002_022058e8
        .extern func_ov002_022576f4
        .extern func_ov002_022579d0
        .extern func_ov002_0226adb8
        .extern func_ov002_0226af00
        .extern func_ov002_0226afe0
        .global func_ov002_021f5734
        .arm
func_ov002_021f5734:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r6, r0
    ldr r2, [r2, #0x5b4]
    mov r5, r1
    cmp r2, #0x0
    ldr r7, _LIT1
    mov r4, #0x0
    beq .L_3c
    cmp r2, #0x1
    beq .L_5b8
    cmp r2, #0x2
    beq .L_600
    b .L_7f0
.L_3c:
    ldrh r3, [r6]
    ldr r2, _LIT2
    cmp r3, r2
    bgt .L_d8
    bge .L_268
    sub ip, r2, #0x70
    cmp r3, ip
    bgt .L_8c
    mov r1, ip
    cmp r3, r1
    bge .L_16c
    ldr r1, _LIT3
    cmp r3, r1
    bgt .L_7c
    beq .L_13c
    b .L_420
.L_7c:
    add r1, r1, #0x248
    cmp r3, r1
    beq .L_158
    b .L_420
.L_8c:
    sub ip, r2, #0x1e
    cmp r3, ip
    bgt .L_c8
    sub ip, r2, #0x22
    cmp r3, ip
    blt .L_b8
    beq .L_1f4
    sub r0, r2, #0x1e
    cmp r3, r0
    beq .L_224
    b .L_420
.L_b8:
    sub r0, r2, #0x58
    cmp r3, r0
    beq .L_1a4
    b .L_420
.L_c8:
    sub r0, r2, #0xa
    cmp r3, r0
    beq .L_260
    b .L_420
.L_d8:
    ldr r1, _LIT4
    cmp r3, r1
    bgt .L_10c
    bge .L_364
    add r0, r2, #0x6
    cmp r3, r0
    bgt .L_fc
    beq .L_2ac
    b .L_420
.L_fc:
    sub r0, r1, #0xfd
    cmp r3, r0
    beq .L_328
    b .L_420
.L_10c:
    add r0, r2, #0x294
    cmp r3, r0
    bgt .L_12c
    bge .L_260
    add r0, r1, #0xcb
    cmp r3, r0
    beq .L_3a0
    b .L_420
.L_12c:
    add r0, r1, #0x1a0
    cmp r3, r0
    beq .L_224
    b .L_420
.L_13c:
    mov r1, #0x2
    mov r4, #0x1
    strh r1, [r6, #0xc]
    bl func_ov002_022576f4
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_420
.L_158:
    mov r4, #0x1
    bl func_ov002_022576f4
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_420
.L_16c:
    mov r1, #0x2
    strh r1, [r6, #0xc]
    mov r4, #0x1
    bl func_ov002_022576f4
    cmp r0, #0x0
    beq .L_420
    ldrh r0, [r6, #0x2]
    mvn r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcca0
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_420
.L_1a4:
    ldrh r2, [r6, #0x2]
    ldr r0, _LIT5
    ldr r1, _LIT6
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r2, r3, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    rsb r1, r3, #0x1
    cmp r0, #0x0
    ldr r0, _LIT5
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    orrne r4, r4, #0x1
    ldr r0, [r0, r2]
    ldr r7, _LIT7
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_420
.L_1f4:
    bl func_ov002_022058e8
    cmp r0, #0x0
    ldr r0, _LIT8
    orrne r4, r4, #0x1
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    bne .L_420
    ldr r0, _LIT9
    bl func_ov002_021baf88
    cmp r0, #0x0
    orreq r4, r4, #0x2
    b .L_420
.L_224:
    mov r0, r6
    mov r1, r5
    bl func_ov002_022058e8
    cmp r0, #0x0
    ldrh r0, [r6, #0x2]
    ldr r2, _LIT10
    orrne r4, r4, #0x1
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3dec
    cmp r0, #0x0
    orreq r4, r4, #0x2
    b .L_420
.L_260:
    mov r4, #0x3
    b .L_420
.L_268:
    mov r0, r5
    bl func_ov002_021b8dec
    mov r1, #0x1
    str r1, [sp]
    cmp r0, #0x0
    ldrh r2, [r6, #0x2]
    ldrh r0, [r6, #0x4]
    orrne r4, r4, #0x1
    mov r5, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r3, #0x0
    mov r0, r5, lsr #0x1f
    mov r2, r2, lsr #0x17
    bl func_ov002_021ff080
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_420
.L_2ac:
    mov r0, #0x1
    strh r0, [r6, #0xc]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcf50
    cmp r0, #0x0
    blt .L_2dc
    mov r0, r6
    bl func_ov002_022576f4
    cmp r0, #0x0
    orrne r4, r4, #0x1
.L_2dc:
    mov r0, #0x2
    strh r0, [r6, #0xc]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_420
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_420
    mov r0, r6
    bl func_ov002_022576f4
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_420
.L_328:
    ldrh r0, [r6, #0x2]
    sub r1, r1, #0xfc
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2e44
    cmp r0, #0x0
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT11
    orrne r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2e44
    cmp r0, #0x0
    orrne r4, r4, #0x2
    b .L_420
.L_364:
    mov r4, #0x1
    bl func_ov002_022576f4
    cmp r0, #0x0
    beq .L_420
    ldrh r2, [r6, #0x2]
    ldr r0, _LIT5
    ldr r1, _LIT6
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x2
    orrcs r4, r4, #0x2
    b .L_420
.L_3a0:
    ldrh r3, [r6, #0x2]
    ldr r0, _LIT5
    ldr r2, _LIT6
    mov r3, r3, lsl #0x1f
    mov r5, r3, lsr #0x1f
    and r3, r5, #0x1
    mul r0, r3, r0
    ldr r0, [r2, r0]
    cmp r0, #0x0
    beq .L_3f4
    ldr r0, _LIT8
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    beq .L_3f0
    rsb r0, r5, #0x1
    add r1, r1, #0x15
    sub r2, r4, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_3f4
.L_3f0:
    orr r4, r4, #0x1
.L_3f4:
    ldrh r2, [r6, #0x2]
    ldr r0, _LIT5
    ldr r1, _LIT12
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    rsb r2, r2, #0x1
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    orrne r4, r4, #0x2
.L_420:
    cmp r4, #0x0
    addeq sp, sp, #0x8
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT13
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r0, [r0, r3, lsl #0x2]
    cmp r0, #0x1
    bne .L_568
    ldrh r2, [r6]
    ldr r1, _LIT14
    cmp r2, r1
    bgt .L_484
    bge .L_518
    ldr r0, _LIT3
    cmp r2, r0
    bgt .L_474
    beq .L_4a8
    b .L_540
.L_474:
    add r0, r0, #0x248
    cmp r2, r0
    beq .L_4dc
    b .L_540
.L_484:
    add r0, r1, #0xe0
    cmp r2, r0
    bgt .L_498
    beq .L_518
    b .L_540
.L_498:
    ldr r0, _LIT4
    cmp r2, r0
    beq .L_518
    b .L_540
.L_4a8:
    mov r0, r6
    rsb r1, r3, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    beq .L_4cc
    ldr r0, _LIT8
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_59c
.L_4cc:
    ldr r0, _LIT8
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_59c
.L_4dc:
    tst r4, #0x2
    beq .L_508
    mov r0, r6
    rsb r1, r3, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    beq .L_508
    ldr r0, _LIT8
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_59c
.L_508:
    ldr r0, _LIT8
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_59c
.L_518:
    tst r4, #0x2
    beq .L_530
    ldr r0, _LIT8
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_59c
.L_530:
    ldr r0, _LIT8
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_59c
.L_540:
    tst r4, #0x1
    beq .L_558
    ldr r0, _LIT8
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_59c
.L_558:
    ldr r0, _LIT8
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_59c
.L_568:
    ldrh r0, [r6]
    mov r1, #0x0
    bl func_ov002_021f4170
    mov r5, r0
    ldrh r0, [r6]
    mov r1, #0x1
    bl func_ov002_021f4170
    mov r3, #0x0
    mov r2, r0
    mov r0, r7
    mov r1, r5
    stmia sp, {r3, r4}
    bl func_ov002_021ae434
.L_59c:
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_5b8:
    ldr r0, _LIT8
    ldr r1, [r0, #0xd44]
    add r1, r1, #0x1
    strh r1, [r6, #0xc]
    ldrh r3, [r6, #0x2]
    ldr r2, [r0, #0xd44]
    ldrh r1, [r6]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afe0
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b4]
    mov r0, r4
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_600:
    ldrh r2, [r6]
    ldr r7, _LIT10
    cmp r2, r7
    bgt .L_658
    sub r3, r7, #0x4
    cmp r2, r3
    blt .L_62c
    beq .L_6c4
    cmp r2, r7
    beq .L_764
    b .L_7e4
.L_62c:
    sub r3, r7, #0x52
    cmp r2, r3
    bgt .L_648
    mov r0, r3
    cmp r2, r0
    beq .L_688
    b .L_7e4
.L_648:
    sub r3, r7, #0x3a
    cmp r2, r3
    beq .L_6b0
    b .L_7e4
.L_658:
    add r3, r7, #0xa6
    cmp r2, r3
    bgt .L_678
    bge .L_7e0
    add r0, r7, #0x1e
    cmp r2, r0
    beq .L_7b4
    b .L_7e4
.L_678:
    ldr r0, _LIT15
    cmp r2, r0
    beq .L_764
    b .L_7e4
.L_688:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x2
    bne .L_7e4
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT16
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af00
    b .L_7e4
.L_6b0:
    bl func_ov002_021f48e0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021f495c
    b .L_7e4
.L_6c4:
    ldrh r2, [r6, #0xc]
    cmp r2, #0x1
    bne .L_6d4
    bl func_ov002_021f495c
.L_6d4:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x2
    bne .L_7e4
    ldrh r0, [r6, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3538
    ldrh r1, [r6, #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021dea38
    and r2, r4, #0xff
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    ldr r3, _LIT17
    ldr r0, _LIT5
    and r2, r2, #0x1
    mla r3, r2, r0, r3
    and r1, r1, #0xff
    mov r0, #0x14
    smulbb r0, r1, r0
    add r1, r3, #0x30
    ldr r1, [r1, r0]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    strh r0, [r6, #0xe]
    b .L_7e4
.L_764:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x1
    bne .L_77c
    mov r0, r6
    mov r1, r5
    bl func_ov002_021f495c
.L_77c:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x2
    bne .L_7e4
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r6, #0x2]
    ldr r2, _LIT10
    mov r3, #0x2
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d58dc
    b .L_7e4
.L_7b4:
    ldrh r0, [r6, #0xc]
    cmp r0, #0x2
    bne .L_7e4
    ldrh r0, [r6, #0x2]
    mov r1, #0x1
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r3, r1
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226adb8
    b .L_7e4
.L_7e0:
    bl func_ov002_021f48e0
.L_7e4:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7f0:
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000103
_LIT2: .word 0x000015f1
_LIT3: .word 0x00001298
_LIT4: .word 0x00001776
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf09c
_LIT7: .word 0x00000117
_LIT8: .word data_ov002_022d008c
_LIT9: .word 0x000013f2
_LIT10: .word 0x000015d3
_LIT11: .word 0x0000167b
_LIT12: .word data_ov002_022cf098
_LIT13: .word data_ov002_022cd664
_LIT14: .word 0x00001599
_LIT15: .word 0x00001916
_LIT16: .word 0x0000ffff
_LIT17: .word data_ov002_022cf08c
