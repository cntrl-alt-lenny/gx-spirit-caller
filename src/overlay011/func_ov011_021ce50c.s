; func_ov011_021ce50c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02104bac
        .extern data_ov011_021d2fc8
        .extern data_ov011_021d2fc9
        .extern data_ov011_021d3020
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern func_02006264
        .extern func_02037208
        .extern func_ov000_021ac550
        .extern func_ov000_021ac760
        .extern func_ov000_021ac770
        .extern func_ov000_021ac78c
        .extern func_ov000_021ac7c4
        .extern func_ov011_021c9e2c
        .extern func_ov011_021ca4d8
        .extern func_ov011_021ca630
        .extern func_ov011_021ca67c
        .extern func_ov011_021ca694
        .extern func_ov011_021ca6ac
        .extern func_ov011_021cada4
        .extern func_ov011_021cc374
        .extern func_ov011_021ccad8
        .extern func_ov011_021ce3a4
        .extern func_ov011_021ce4d4
        .extern func_ov011_021cf2dc
        .extern func_ov011_021d1d18
        .global func_ov011_021ce50c
        .arm
func_ov011_021ce50c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldr r0, [r0, #0x29c]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r5, #0x274]
    mov r1, r0, lsl #0x13
    mov r1, r1, lsr #0x1c
    cmp r1, #0x1
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x18
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021d1d18
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021cf2dc
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r5, #0x278]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021ca6ac
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021c9e2c
    cmp r0, #0x0
    beq .L_280
    ldr r1, [r5, #0x268]
    mov r0, #0x0
    bic r1, r1, #0xf
    str r1, [r5, #0x268]
    str r0, [r5, #0x23c]
    str r0, [r5, #0x238]
    b .L_8d4
.L_280:
    ldr r4, _LIT2
    add r3, sp, #0x0
    mov r2, #0xa
.L_28c:
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    add r4, r4, #0x2
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    subs r2, r2, #0x1
    bne .L_28c
    ldr r2, [r5, #0x268]
    mov r0, r2, lsl #0x1c
    movs r1, r0, lsr #0x1c
    beq .L_47c
    ldr r0, [r5, #0x264]
    cmp r0, #0x0
    ldr r0, _LIT3
    moveq r2, #0x1
    ldrh r0, [r0, #0x54]
    movne r2, #0x0
    rsb r8, r2, #0x5
    tst r0, #0x1
    beq .L_2fc
    add r2, r5, #0x164
    sub r1, r1, #0x1
    mov r0, #0x14
    mla r0, r1, r0, r2
    mov r1, #0x1
    bl func_ov000_021ac78c
    b .L_42c
.L_2fc:
    tst r0, #0x2
    beq .L_328
    ldr r1, [r5, #0x268]
    mov r0, #0x43
    bic r4, r1, #0xf
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x268]
    bl func_02037208
    b .L_42c
.L_328:
    tst r0, #0x60
    beq .L_3ac
    add r4, r5, #0x164
    mov r6, #0x14
.L_338:
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    bhi .L_35c
    ldr r0, [r5, #0x268]
    bic r0, r0, #0xf
    orr r0, r0, #0x5
    b .L_370
.L_35c:
    ldr r1, [r5, #0x268]
    sub r0, r0, #0x1
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
.L_370:
    str r0, [r5, #0x268]
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    sub r1, r0, #0x1
    mla r0, r1, r6, r4
    bl func_ov000_021ac550
    cmp r0, #0x0
    beq .L_338
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_42c
.L_3ac:
    tst r0, #0x90
    beq .L_42c
    add r4, r5, #0x164
    mov r6, #0x14
.L_3bc:
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    cmp r8, r0, lsr #0x1c
    mov r0, r0, lsr #0x1c
    bhi .L_3e0
    ldr r0, [r5, #0x268]
    bic r0, r0, #0xf
    orr r0, r0, #0x1
    b .L_3f4
.L_3e0:
    ldr r1, [r5, #0x268]
    add r0, r0, #0x1
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
.L_3f4:
    str r0, [r5, #0x268]
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    sub r1, r0, #0x1
    mla r0, r1, r6, r4
    bl func_ov000_021ac550
    cmp r0, #0x0
    beq .L_3bc
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_42c:
    cmp r8, #0x0
    mov r6, #0x0
    ble .L_8d4
    add r7, r5, #0x164
    mov r9, #0x1
    mov r4, r6
.L_444:
    ldr r0, [r5, #0x268]
    mov r1, r4
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    sub r0, r0, #0x1
    cmp r6, r0
    moveq r1, r9
    mov r0, r7
    bl func_ov000_021ac7c4
    add r6, r6, #0x1
    cmp r6, r8
    add r7, r7, #0x14
    blt .L_444
    b .L_8d4
.L_47c:
    ldr r0, _LIT3
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_4c0
    ldr r0, [r5, #0x280]
    mov r0, r0, lsl #0x9
    movs r0, r0, lsr #0x1f
    bne .L_8d4
    bic r1, r2, #0xf
    mov r0, #0x3a
    orr r4, r1, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x268]
    bl func_02037208
    b .L_8d4
.L_4c0:
    tst r1, #0x2
    beq .L_51c
    ldr r0, [r5, #0x280]
    mov r0, r0, lsl #0x9
    movs r0, r0, lsr #0x1f
    bne .L_8d4
    add r0, r5, #0x1b4
    bl func_ov000_021ac550
    cmp r0, #0x0
    beq .L_504
    add r0, r5, #0x1b4
    mov r1, #0x1
    bl func_ov000_021ac7c4
    add r0, r5, #0x1b4
    mov r1, #0x1
    bl func_ov000_021ac78c
    bl func_ov011_021ce4d4
.L_504:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_8d4
.L_51c:
    ldr r0, [r5, #0x264]
    cmp r0, #0x0
    beq .L_534
    cmp r0, #0x1
    beq .L_6a8
    b .L_8d4
.L_534:
    mov r0, r2, lsl #0x17
    movs r4, r0, lsr #0x1c
    bne .L_578
    tst r1, #0xf0
    beq .L_578
    ldr r1, [r5, #0x280]
    bic r2, r2, #0x1e0
    mov r0, #0x38
    orr r6, r2, #0x20
    orr r4, r1, #0x200
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r6, [r5, #0x268]
    str r4, [r5, #0x280]
    bl func_02037208
    b .L_8d4
.L_578:
    tst r1, #0x40
    beq .L_5c4
    ldr r0, _LIT4
    ldr r3, [r5, #0x268]
    add r0, sp, r0
    ldrb r2, [r0, r4, lsl #0x2]
    ldr r1, [r5, #0x280]
    mov r0, #0x38
    bic r3, r3, #0x1e0
    orr r4, r1, #0x200
    mov r2, r2, lsl #0x1c
    orr r6, r3, r2, lsr #0x17
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r6, [r5, #0x268]
    str r4, [r5, #0x280]
    bl func_02037208
    b .L_8d4
.L_5c4:
    tst r1, #0x80
    beq .L_610
    ldr r0, _LIT5
    ldr r3, [r5, #0x268]
    add r0, sp, r0
    ldrb r2, [r0, r4, lsl #0x2]
    ldr r1, [r5, #0x280]
    mov r0, #0x38
    bic r3, r3, #0x1e0
    orr r4, r1, #0x200
    mov r2, r2, lsl #0x1c
    orr r6, r3, r2, lsr #0x17
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r6, [r5, #0x268]
    str r4, [r5, #0x280]
    bl func_02037208
    b .L_8d4
.L_610:
    tst r1, #0x10
    beq .L_65c
    ldr r0, _LIT6
    ldr r3, [r5, #0x268]
    add r0, sp, r0
    ldrb r2, [r0, r4, lsl #0x2]
    ldr r1, [r5, #0x280]
    mov r0, #0x38
    bic r3, r3, #0x1e0
    orr r4, r1, #0x200
    mov r2, r2, lsl #0x1c
    orr r6, r3, r2, lsr #0x17
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r6, [r5, #0x268]
    str r4, [r5, #0x280]
    bl func_02037208
    b .L_8d4
.L_65c:
    tst r1, #0x20
    beq .L_8d4
    ldr r0, _LIT7
    ldr r3, [r5, #0x268]
    add r0, sp, r0
    ldrb r2, [r0, r4, lsl #0x2]
    ldr r1, [r5, #0x280]
    mov r0, #0x38
    bic r3, r3, #0x1e0
    orr r4, r1, #0x200
    mov r2, r2, lsl #0x1c
    orr r6, r3, r2, lsr #0x17
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r6, [r5, #0x268]
    str r4, [r5, #0x280]
    bl func_02037208
    b .L_8d4
.L_6a8:
    ldr r0, [r5, #0x25c]
    ldr r1, [r5, #0x258]
    mov r0, r0, lsl #0x1a
    mov r6, r0, lsr #0x1a
    ldr r0, _LIT3
    mov r1, r1, lsr #0x1a
    subs r4, r1, #0x1
    movmi r4, #0x0
    subs r6, r6, #0x1
    ldrh r0, [r0, #0x52]
    movmi r6, #0x0
    tst r0, #0x40
    beq .L_6fc
    ldr r1, [r5, #0x234]
    mov r0, #0x3000
    sub r1, r1, #0x3000
    rsb r0, r0, #0x0
    str r1, [r5, #0x234]
    str r0, [r5, #0x23c]
    mov r6, #0xa
    b .L_750
.L_6fc:
    tst r0, #0x80
    beq .L_720
    ldr r1, [r5, #0x234]
    mov r0, #0x3000
    add r1, r1, #0x3000
    str r1, [r5, #0x234]
    str r0, [r5, #0x23c]
    mov r6, #0xa
    b .L_750
.L_720:
    ldr r0, [r5, #0x23c]
    ldr r1, _LIT8
    mul r2, r0, r6
    smull r0, r3, r1, r2
    mov r0, r2, lsr #0x1f
    ldr r1, [r5, #0x234]
    add r3, r0, r3, asr #0x2
    add r0, r1, r3
    str r0, [r5, #0x234]
    cmp r6, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x23c]
.L_750:
    ldr r0, _LIT3
    ldrh r0, [r0, #0x52]
    tst r0, #0x10
    beq .L_77c
    ldr r1, [r5, #0x230]
    mov r0, #0x3000
    add r1, r1, #0x3000
    str r1, [r5, #0x230]
    str r0, [r5, #0x238]
    mov r4, #0xa
    b .L_7d4
.L_77c:
    tst r0, #0x20
    beq .L_7a4
    ldr r1, [r5, #0x230]
    mov r0, #0x3000
    sub r1, r1, #0x3000
    rsb r0, r0, #0x0
    str r1, [r5, #0x230]
    str r0, [r5, #0x238]
    mov r4, #0xa
    b .L_7d4
.L_7a4:
    ldr r0, [r5, #0x238]
    ldr r1, _LIT8
    mul r2, r0, r4
    smull r0, r3, r1, r2
    mov r0, r2, lsr #0x1f
    ldr r1, [r5, #0x230]
    add r3, r0, r3, asr #0x2
    add r0, r1, r3
    str r0, [r5, #0x230]
    cmp r4, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x238]
.L_7d4:
    cmp r4, #0x0
    cmpeq r6, #0x0
    bne .L_80c
    bl func_ov011_021ccad8
    ldr r0, [r5, #0x25c]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    beq .L_818
    mov r0, #0x1
    bl func_ov011_021cada4
    ldr r0, [r5, #0x25c]
    bic r0, r0, #0x40
    str r0, [r5, #0x25c]
    b .L_818
.L_80c:
    ldr r0, [r5, #0x25c]
    orr r0, r0, #0x40
    str r0, [r5, #0x25c]
.L_818:
    ldr r0, [r5, #0x268]
    ldr r7, [r5, #0x258]
    mov r0, r0, lsl #0x17
    ldr r8, [r5, #0x25c]
    ldr r1, _LIT9
    mov r3, r0, lsr #0x1c
    ldr r0, _LIT10
    ldrb r2, [r1, r3, lsl #0x1]
    ldrb r1, [r0, r3, lsl #0x1]
    bic r7, r7, #-67108864
    ldr r0, [r5, #0x264]
    orr ip, r7, r4, lsl #0x1a
    mov r7, #0x0
    bic r8, r8, #0x3f
    and r4, r6, #0x3f
    orr r4, r8, r4
    mov r8, r7
    str ip, [r5, #0x258]
    str r4, [r5, #0x25c]
    cmp r0, #0x1
    mov r4, r2, lsl #0xf
    mov r6, r1, lsl #0xf
    bne .L_890
    cmp r3, #0x5
    bne .L_890
    bl GetSystemWork
    ldr r0, [r0, #0x8f8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    moveq r8, #0xe8000
.L_890:
    ldr r1, [r5, #0x230]
    cmp r1, r7
    strlt r7, [r5, #0x230]
    blt .L_8ac
    sub r0, r4, #0x1000
    cmp r1, r0
    strgt r0, [r5, #0x230]
.L_8ac:
    ldr r1, [r5, #0x234]
    cmp r1, r8
    strlt r8, [r5, #0x234]
    blt .L_8c8
    sub r0, r6, #0x1000
    cmp r1, r0
    strgt r0, [r5, #0x234]
.L_8c8:
    ldr r0, [r5, #0x270]
    bic r0, r0, #0x10000000
    str r0, [r5, #0x270]
.L_8d4:
    bl func_02006264
    cmp r0, #0x0
    beq .L_93c
    bl func_ov011_021ca4d8
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021cc374
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021ca6ac
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021ce3a4
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_93c:
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r0, r5, #0x164
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_9c4
    ldr r0, [r5, #0x268]
    orr r0, r0, #0x10
    str r0, [r5, #0x268]
    bl func_ov011_021ce3a4
    cmp r0, #0x0
    bne .L_9a8
    add r0, r5, #0x164
    bl func_ov000_021ac770
    ldr r1, [r5, #0x268]
    mov r0, #0x43
    bic r4, r1, #0x10
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x268]
    bl func_02037208
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_9a8:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_9c4:
    add r0, r5, #0x1b4
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_9f4
    bl func_ov011_021ce4d4
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_9f4:
    add r0, r5, #0x18c
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_a70
    ldr r2, [r5, #0x280]
    ldr r0, _LIT11
    ldr r1, [r5, #0x274]
    ldr r3, [r5, #0x268]
    and r2, r2, r0
    and r1, r1, r0, asr #0xa
    ldr r0, [r5, #0x264]
    orr r3, r3, #0x10
    orr r2, r2, #0xf000000
    orr r1, r1, #0x18000
    str r3, [r5, #0x268]
    str r2, [r5, #0x280]
    str r1, [r5, #0x274]
    cmp r0, #0x1
    bne .L_a50
    bl func_ov011_021ca694
    cmp r0, #0x0
    beq .L_a50
    bl func_ov011_021ca630
.L_a50:
    bl func_ov011_021ca67c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_a70:
    add r0, r5, #0x178
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_ad8
    ldr r1, [r5, #0x268]
    ldr r0, [r5, #0x264]
    orr r1, r1, #0x10
    str r1, [r5, #0x268]
    cmp r0, #0x1
    bne .L_aa8
    bl func_ov011_021ca694
    cmp r0, #0x0
    beq .L_aa8
    bl func_ov011_021ca630
.L_aa8:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r5, #0x274]
    ldr r0, _LIT12
    add sp, sp, #0x14
    and r0, r1, r0
    orr r0, r0, #0xc000
    str r0, [r5, #0x274]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_ad8:
    add r0, r5, #0x1a0
    bl func_ov000_021ac760
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r5, #0x268]
    ldr r0, [r5, #0x264]
    orr r1, r1, #0x10
    str r1, [r5, #0x268]
    cmp r0, #0x1
    bne .L_b14
    bl func_ov011_021ca694
    cmp r0, #0x0
    beq .L_b14
    bl func_ov011_021ca630
.L_b14:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r5, #0x274]
    ldr r0, _LIT12
    and r0, r1, r0
    orr r0, r0, #0xc000
    str r0, [r5, #0x274]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d403c
_LIT2: .word data_ov011_021d3020
_LIT3: .word data_02104bac
_LIT4: .word 0xfffffffc
_LIT5: .word 0xfffffffd
_LIT6: .word 0xfffffffe
_LIT7: .word 0xffffffff
_LIT8: .word 0x66666667
_LIT9: .word data_ov011_021d2fc8
_LIT10: .word data_ov011_021d2fc9
_LIT11: .word 0x807fffff
_LIT12: .word 0xffe01fff
