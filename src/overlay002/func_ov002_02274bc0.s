; func_ov002_02274bc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022ce720
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202ed04
        .extern func_ov002_021ae400
        .extern func_ov002_021b947c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021de5d4
        .extern func_ov002_021dea48
        .extern func_ov002_021e286c
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02274ae0
        .extern func_ov002_02290500
        .global func_ov002_02274bc0
        .arm
func_ov002_02274bc0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    mov r2, r1, lsl #0x18
    mov r2, r2, lsr #0x18
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_6b8
    b .L_30
    b .L_2ac
    b .L_310
    b .L_43c
.L_30:
    bic r2, r1, #0xff00
    ldr r1, _LIT1
    str r2, [r0, #0x18]
    mov r2, #0x2
    str r2, [r1, #0x6a4]
    ldr r0, [r0]
    ldr r4, _LIT2
    mov r0, r0, lsl #0x9
    cmp r4, r0, lsr #0x11
    mov r0, r0, lsr #0x11
    bcc .L_c4
    cmp r0, r4
    bcs .L_1ac
    ldr r3, _LIT3
    cmp r0, r3
    bhi .L_a0
    bcs .L_170
    sub r2, r3, #0x45
    cmp r0, r2
    bhi .L_234
    sub r2, r3, #0x48
    cmp r0, r2
    bcc .L_234
    beq .L_138
    sub r2, r3, #0x45
    cmp r0, r2
    beq .L_14c
    b .L_234
.L_a0:
    add r2, r3, #0x1
    cmp r0, r2
    bhi .L_b4
    beq .L_184
    b .L_234
.L_b4:
    sub r2, r4, #0x1
    cmp r0, r2
    beq .L_198
    b .L_234
.L_c4:
    add r2, r4, #0x1f8
    cmp r0, r2
    bhi .L_114
    bcs .L_1fc
    ldr r3, _LIT4
    cmp r0, r3
    bhi .L_e8
    beq .L_1c0
    b .L_234
.L_e8:
    add r2, r3, #0x2
    cmp r0, r2
    bhi .L_234
    add r2, r3, #0x1
    cmp r0, r2
    bcc .L_234
    beq .L_1d4
    add r2, r3, #0x2
    cmp r0, r2
    beq .L_1e8
    b .L_234
.L_114:
    ldr r3, _LIT5
    cmp r0, r3
    bhi .L_128
    beq .L_210
    b .L_234
.L_128:
    add r2, r3, #0x1
    cmp r0, r2
    beq .L_224
    b .L_234
.L_138:
    mov r2, #0x1580
    str r2, [r1, #0x6b4]
    add r2, r2, #0x30
    str r2, [r1, #0x6b8]
    b .L_234
.L_14c:
    mov r3, #0x1580
    str r3, [r1, #0x6b4]
    add r2, r3, #0x30
    str r2, [r1, #0x6b8]
    add r2, r3, #0x33
    str r2, [r1, #0x6bc]
    mov r2, #0x3
    str r2, [r1, #0x6a4]
    b .L_234
.L_170:
    mov r2, #0x1580
    str r2, [r1, #0x6b4]
    add r2, r2, #0x33
    str r2, [r1, #0x6b8]
    b .L_234
.L_184:
    sub r2, r3, #0x49
    str r2, [r1, #0x6b4]
    sub r2, r3, #0x46
    str r2, [r1, #0x6b8]
    b .L_234
.L_198:
    rsb r2, r3, #0x2f40
    str r2, [r1, #0x6b4]
    sub r2, r4, #0x9
    str r2, [r1, #0x6b8]
    b .L_234
.L_1ac:
    sub r2, r4, #0x1
    str r2, [r1, #0x6b4]
    sub r2, r4, #0x3a0
    str r2, [r1, #0x6b8]
    b .L_234
.L_1c0:
    sub r2, r3, #0x70
    str r2, [r1, #0x6b4]
    add r2, r3, #0x7
    str r2, [r1, #0x6b8]
    b .L_234
.L_1d4:
    sub r2, r3, #0x70
    str r2, [r1, #0x6b4]
    add r2, r3, #0x3
    str r2, [r1, #0x6b8]
    b .L_234
.L_1e8:
    sub r2, r3, #0x70
    str r2, [r1, #0x6b4]
    add r2, r3, #0x8
    str r2, [r1, #0x6b8]
    b .L_234
.L_1fc:
    add r3, r4, #0xa9
    ldr r2, _LIT6
    str r3, [r1, #0x6b4]
    str r2, [r1, #0x6b8]
    b .L_234
.L_210:
    sub r2, r3, #0x150
    str r2, [r1, #0x6b4]
    sub r2, r3, #0xdc
    str r2, [r1, #0x6b8]
    b .L_234
.L_224:
    sub r2, r3, #0x150
    str r2, [r1, #0x6b4]
    sub r2, r3, #0xdb
    str r2, [r1, #0x6b8]
.L_234:
    ldr r1, _LIT1
    mov r2, #0x0
    str r2, [r1, #0x6ac]
    bl func_0202ed04
    cmp r0, #0x0
    beq .L_268
    ldr r0, _LIT0
    mov r1, #0x4c
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    b .L_280
.L_268:
    ldr r0, _LIT0
    mov r1, #0x46
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
.L_280:
    ldr r3, _LIT7
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2ac:
    ldr r2, [r0]
    ldr r1, _LIT8
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_2dc
    mov r1, r2, lsl #0x9
    ldr r2, _LIT9
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_2e4
.L_2dc:
    ldr r0, _LIT9
    bl func_ov002_022592ec
.L_2e4:
    ldr r3, _LIT7
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_310:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_424
    ldr r0, _LIT10
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r6, [r0, #0xd70]
    add r4, r2, r1
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b9ecc
    mov r2, #0x14
    ldr r5, _LIT11
    ldr r1, _LIT12
    and r3, r6, #0x1
    mla r6, r3, r1, r5
    ldr r5, _LIT1
    mul r1, r4, r2
    add r2, r6, #0x30
    ldr r3, [r2, r1]
    ldr r1, [r5, #0x6a4]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    cmp r1, #0x0
    add r1, r2, r3, lsr #0x1f
    mov r6, #0x0
    ble .L_3a8
    mov r3, r6
.L_388:
    add r4, r5, r6, lsl #0x2
    ldr r2, [r4, #0x6b4]
    add r6, r6, #0x1
    cmp r0, r2
    streq r3, [r4, #0x6b4]
    ldr r2, [r5, #0x6a4]
    cmp r6, r2
    blt .L_388
.L_3a8:
    ldr r0, _LIT1
    ldr r2, _LIT13
    ldr r4, [r0, #0x494]
    ldr r3, [r0, #0x6ac]
    add r3, r4, r3
    mov r3, r3, lsl #0x19
    mov r3, r3, lsr #0x18
    strh r1, [r2, r3]
    ldr r1, [r0, #0x6ac]
    add r1, r1, #0x1
    str r1, [r0, #0x6ac]
    ldr r0, [r0, #0x6a4]
    cmp r1, r0
    bcs .L_3f8
    ldr r2, _LIT7
    ldr r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    sub r0, r0, #0x1
    b .L_40c
.L_3f8:
    ldr r2, _LIT7
    ldr r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
.L_40c:
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r2]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_424:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x18]
    bic r2, r2, #0xff
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_43c:
    ldr r0, _LIT1
    ldr r1, [r0, #0x6a4]
    ldr r0, [r0, #0x6ac]
    cmp r0, r1
    bne .L_548
    sub r0, r1, #0x1
    cmp r0, #0x0
    mov r7, #0x0
    ble .L_548
.L_460:
    ldr r0, _LIT1
    ldr r1, [r0, #0x494]
    add r1, r1, r7
    mov r1, r1, lsl #0x19
    add r0, r0, r1, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    bl func_ov002_021b947c
    ldr r4, _LIT1
    mov r6, r0
    ldr r0, [r4, #0x6a4]
    mov r5, #0x1
    cmp r0, #0x1
    ble .L_538
.L_498:
    ldr r0, [r4, #0x494]
    add r0, r0, r5
    mov r0, r0, lsl #0x19
    add r0, r4, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    bl func_ov002_021b947c
    mov r1, r6, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, r2, lsr #0x10
    mov r2, r3, asr #0x8
    mov r1, r1, asr #0x8
    and r2, r2, #0xff
    and r1, r1, #0xff
    cmp r2, r1
    bls .L_528
    ldr r2, [r4, #0x494]
    mov r6, r0
    add r1, r2, r7
    add r0, r2, r5
    mov r1, r1, lsl #0x19
    mov r0, r0, lsl #0x19
    add r1, r4, r1, lsr #0x18
    add r0, r4, r0, lsr #0x18
    add r1, r1, #0x400
    add r0, r0, #0x400
    ldrh r2, [r1, #0x98]
    ldrh r0, [r0, #0x98]
    strh r0, [r1, #0x98]
    ldr r0, [r4, #0x494]
    add r0, r0, r5
    mov r0, r0, lsl #0x19
    add r0, r4, r0, lsr #0x18
    add r0, r0, #0x400
    strh r2, [r0, #0x98]
.L_528:
    ldr r0, [r4, #0x6a4]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_498
.L_538:
    add r7, r7, #0x1
    sub r0, r0, #0x1
    cmp r7, r0
    blt .L_460
.L_548:
    ldr r0, _LIT1
    ldr r1, _LIT13
    ldr r2, [r0, #0x6ac]
    sub r2, r2, #0x1
    str r2, [r0, #0x6ac]
    ldr r0, [r0, #0x494]
    add r0, r0, r2
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x18
    ldrh r0, [r1, r0]
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    mov r0, r0, lsr #0x10
    and r1, r1, #0xff
    mov r0, r0, lsl #0x10
    add r4, r1, r0, lsr #0x10
    cmp r4, #0xa
    bgt .L_640
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202ed04
    cmp r0, #0x0
    beq .L_624
    ldr r0, _LIT0
    ldr ip, _LIT7
    ldr r0, [r0]
    ldr r1, [ip]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r2, _LIT12
    ldr r3, _LIT11
    and r5, r0, #0x1
    mla r3, r5, r2, r3
    mov r2, #0x14
    mla r2, r4, r2, r3
    ldr r2, [r2, #0x30]
    mov r5, #0x1
    mov r2, r2, lsl #0x12
    mov r3, r2, lsr #0x1f
    mov r2, #0x0
    mov r3, r5, lsl r3
    mov r5, r1, lsl #0x10
    orr r3, r3, r5, lsr #0x18
    bic r5, r1, #0xff00
    mov r1, r3, lsl #0x18
    orr r5, r5, r1, lsr #0x10
    mov r1, r4
    mov r3, r2
    str r5, [ip]
    bl func_ov002_021dea48
    b .L_640
.L_624:
    ldr r0, _LIT0
    mov r1, r4
    ldr r0, [r0]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021de5d4
.L_640:
    ldr r0, _LIT1
    ldr r0, [r0, #0x6ac]
    cmp r0, #0x0
    bne .L_6b0
    ldr r6, _LIT10
    ldr r5, _LIT0
    mov r4, #0x0
.L_65c:
    ldr r0, [r5, #0x18]
    ldr r2, [r6, #0xcec]
    mov r1, r0, lsl #0x10
    eor r0, r2, r4
    mov r1, r1, lsr #0x18
    mov r1, r1, lsr r0
    tst r1, #0x1
    beq .L_680
    bl func_ov002_021e286c
.L_680:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_65c
    ldr r2, _LIT7
    ldr r1, [r2]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r2]
.L_6b0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_6b8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022ce288
_LIT2: .word 0x00001954
_LIT3: .word 0x000015f9
_LIT4: .word 0x00001a6d
_LIT5: .word 0x00001b4d
_LIT6: .word 0x00001a73
_LIT7: .word data_ov002_022cd318
_LIT8: .word data_ov002_022cd744
_LIT9: .word func_ov002_02274ae0
_LIT10: .word data_ov002_022d016c
_LIT11: .word data_ov002_022cf16c
_LIT12: .word 0x00000868
_LIT13: .word data_ov002_022ce720
