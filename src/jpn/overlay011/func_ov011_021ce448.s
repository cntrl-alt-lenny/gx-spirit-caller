; func_ov011_021ce448 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02104acc
        .extern data_ov011_021d2ed8
        .extern data_ov011_021d2ed9
        .extern data_ov011_021d2f30
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_02006248
        .extern func_020371b8
        .extern func_ov000_021ac470
        .extern func_ov000_021ac680
        .extern func_ov000_021ac690
        .extern func_ov000_021ac6ac
        .extern func_ov000_021ac6e4
        .extern func_ov011_021c9d4c
        .extern func_ov011_021ca3f8
        .extern func_ov011_021ca550
        .extern func_ov011_021ca59c
        .extern func_ov011_021ca5b4
        .extern func_ov011_021ca5cc
        .extern func_ov011_021cace0
        .extern func_ov011_021cc2b0
        .extern func_ov011_021cca14
        .extern func_ov011_021ce2e0
        .extern func_ov011_021ce410
        .extern func_ov011_021cf218
        .extern func_ov011_021d1c28
        .global func_ov011_021ce448
        .arm
func_ov011_021ce448:
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
    bl func_ov011_021d1c28
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021cf218
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r5, #0x278]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021ca5cc
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021c9d4c
    cmp r0, #0x0
    beq .L_b8
    ldr r1, [r5, #0x268]
    mov r0, #0x0
    bic r1, r1, #0xf
    str r1, [r5, #0x268]
    str r0, [r5, #0x23c]
    str r0, [r5, #0x238]
    b .L_70c
.L_b8:
    ldr r4, _LIT2
    add r3, sp, #0x0
    mov r2, #0xa
.L_c4:
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    add r4, r4, #0x2
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    subs r2, r2, #0x1
    bne .L_c4
    ldr r2, [r5, #0x268]
    mov r0, r2, lsl #0x1c
    movs r1, r0, lsr #0x1c
    beq .L_2b4
    ldr r0, [r5, #0x264]
    cmp r0, #0x0
    ldr r0, _LIT3
    moveq r2, #0x1
    ldrh r0, [r0, #0x54]
    movne r2, #0x0
    rsb r8, r2, #0x5
    tst r0, #0x1
    beq .L_134
    add r2, r5, #0x164
    sub r1, r1, #0x1
    mov r0, #0x14
    mla r0, r1, r0, r2
    mov r1, #0x1
    bl func_ov000_021ac6ac
    b .L_264
.L_134:
    tst r0, #0x2
    beq .L_160
    ldr r1, [r5, #0x268]
    mov r0, #0x43
    bic r4, r1, #0xf
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x268]
    bl func_020371b8
    b .L_264
.L_160:
    tst r0, #0x60
    beq .L_1e4
    add r4, r5, #0x164
    mov r6, #0x14
.L_170:
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    bhi .L_194
    ldr r0, [r5, #0x268]
    bic r0, r0, #0xf
    orr r0, r0, #0x5
    b .L_1a8
.L_194:
    ldr r1, [r5, #0x268]
    sub r0, r0, #0x1
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
.L_1a8:
    str r0, [r5, #0x268]
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    sub r1, r0, #0x1
    mla r0, r1, r6, r4
    bl func_ov000_021ac470
    cmp r0, #0x0
    beq .L_170
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_264
.L_1e4:
    tst r0, #0x90
    beq .L_264
    add r4, r5, #0x164
    mov r6, #0x14
.L_1f4:
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    cmp r8, r0, lsr #0x1c
    mov r0, r0, lsr #0x1c
    bhi .L_218
    ldr r0, [r5, #0x268]
    bic r0, r0, #0xf
    orr r0, r0, #0x1
    b .L_22c
.L_218:
    ldr r1, [r5, #0x268]
    add r0, r0, #0x1
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
.L_22c:
    str r0, [r5, #0x268]
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    sub r1, r0, #0x1
    mla r0, r1, r6, r4
    bl func_ov000_021ac470
    cmp r0, #0x0
    beq .L_1f4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_264:
    cmp r8, #0x0
    mov r6, #0x0
    ble .L_70c
    add r7, r5, #0x164
    mov r9, #0x1
    mov r4, r6
.L_27c:
    ldr r0, [r5, #0x268]
    mov r1, r4
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    sub r0, r0, #0x1
    cmp r6, r0
    moveq r1, r9
    mov r0, r7
    bl func_ov000_021ac6e4
    add r6, r6, #0x1
    cmp r6, r8
    add r7, r7, #0x14
    blt .L_27c
    b .L_70c
.L_2b4:
    ldr r0, _LIT3
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_2f8
    ldr r0, [r5, #0x280]
    mov r0, r0, lsl #0x9
    movs r0, r0, lsr #0x1f
    bne .L_70c
    bic r1, r2, #0xf
    mov r0, #0x3a
    orr r4, r1, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x268]
    bl func_020371b8
    b .L_70c
.L_2f8:
    tst r1, #0x2
    beq .L_354
    ldr r0, [r5, #0x280]
    mov r0, r0, lsl #0x9
    movs r0, r0, lsr #0x1f
    bne .L_70c
    add r0, r5, #0x1b4
    bl func_ov000_021ac470
    cmp r0, #0x0
    beq .L_33c
    add r0, r5, #0x1b4
    mov r1, #0x1
    bl func_ov000_021ac6e4
    add r0, r5, #0x1b4
    mov r1, #0x1
    bl func_ov000_021ac6ac
    bl func_ov011_021ce410
.L_33c:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_70c
.L_354:
    ldr r0, [r5, #0x264]
    cmp r0, #0x0
    beq .L_36c
    cmp r0, #0x1
    beq .L_4e0
    b .L_70c
.L_36c:
    mov r0, r2, lsl #0x17
    movs r4, r0, lsr #0x1c
    bne .L_3b0
    tst r1, #0xf0
    beq .L_3b0
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
    bl func_020371b8
    b .L_70c
.L_3b0:
    tst r1, #0x40
    beq .L_3fc
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
    bl func_020371b8
    b .L_70c
.L_3fc:
    tst r1, #0x80
    beq .L_448
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
    bl func_020371b8
    b .L_70c
.L_448:
    tst r1, #0x10
    beq .L_494
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
    bl func_020371b8
    b .L_70c
.L_494:
    tst r1, #0x20
    beq .L_70c
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
    bl func_020371b8
    b .L_70c
.L_4e0:
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
    beq .L_534
    ldr r1, [r5, #0x234]
    mov r0, #0x3000
    sub r1, r1, #0x3000
    rsb r0, r0, #0x0
    str r1, [r5, #0x234]
    str r0, [r5, #0x23c]
    mov r6, #0xa
    b .L_588
.L_534:
    tst r0, #0x80
    beq .L_558
    ldr r1, [r5, #0x234]
    mov r0, #0x3000
    add r1, r1, #0x3000
    str r1, [r5, #0x234]
    str r0, [r5, #0x23c]
    mov r6, #0xa
    b .L_588
.L_558:
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
.L_588:
    ldr r0, _LIT3
    ldrh r0, [r0, #0x52]
    tst r0, #0x10
    beq .L_5b4
    ldr r1, [r5, #0x230]
    mov r0, #0x3000
    add r1, r1, #0x3000
    str r1, [r5, #0x230]
    str r0, [r5, #0x238]
    mov r4, #0xa
    b .L_60c
.L_5b4:
    tst r0, #0x20
    beq .L_5dc
    ldr r1, [r5, #0x230]
    mov r0, #0x3000
    sub r1, r1, #0x3000
    rsb r0, r0, #0x0
    str r1, [r5, #0x230]
    str r0, [r5, #0x238]
    mov r4, #0xa
    b .L_60c
.L_5dc:
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
.L_60c:
    cmp r4, #0x0
    cmpeq r6, #0x0
    bne .L_644
    bl func_ov011_021cca14
    ldr r0, [r5, #0x25c]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    beq .L_650
    mov r0, #0x1
    bl func_ov011_021cace0
    ldr r0, [r5, #0x25c]
    bic r0, r0, #0x40
    str r0, [r5, #0x25c]
    b .L_650
.L_644:
    ldr r0, [r5, #0x25c]
    orr r0, r0, #0x40
    str r0, [r5, #0x25c]
.L_650:
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
    bne .L_6c8
    cmp r3, #0x5
    bne .L_6c8
    bl GetSystemWork
    ldr r0, [r0, #0x8f8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    moveq r8, #0xe8000
.L_6c8:
    ldr r1, [r5, #0x230]
    cmp r1, r7
    strlt r7, [r5, #0x230]
    blt .L_6e4
    sub r0, r4, #0x1000
    cmp r1, r0
    strgt r0, [r5, #0x230]
.L_6e4:
    ldr r1, [r5, #0x234]
    cmp r1, r8
    strlt r8, [r5, #0x234]
    blt .L_700
    sub r0, r6, #0x1000
    cmp r1, r0
    strgt r0, [r5, #0x234]
.L_700:
    ldr r0, [r5, #0x270]
    bic r0, r0, #0x10000000
    str r0, [r5, #0x270]
.L_70c:
    bl func_02006248
    cmp r0, #0x0
    beq .L_774
    bl func_ov011_021ca3f8
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021cc2b0
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021ca5cc
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    bl func_ov011_021ce2e0
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_774:
    ldr r0, [r5, #0x268]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r0, r5, #0x164
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_7fc
    ldr r0, [r5, #0x268]
    orr r0, r0, #0x10
    str r0, [r5, #0x268]
    bl func_ov011_021ce2e0
    cmp r0, #0x0
    bne .L_7e0
    add r0, r5, #0x164
    bl func_ov000_021ac690
    ldr r1, [r5, #0x268]
    mov r0, #0x43
    bic r4, r1, #0x10
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0x268]
    bl func_020371b8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_7e0:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_7fc:
    add r0, r5, #0x1b4
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_82c
    bl func_ov011_021ce410
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_82c:
    add r0, r5, #0x18c
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_8a8
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
    bne .L_888
    bl func_ov011_021ca5b4
    cmp r0, #0x0
    beq .L_888
    bl func_ov011_021ca550
.L_888:
    bl func_ov011_021ca59c
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_8a8:
    add r0, r5, #0x178
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_910
    ldr r1, [r5, #0x268]
    ldr r0, [r5, #0x264]
    orr r1, r1, #0x10
    str r1, [r5, #0x268]
    cmp r0, #0x1
    bne .L_8e0
    bl func_ov011_021ca5b4
    cmp r0, #0x0
    beq .L_8e0
    bl func_ov011_021ca550
.L_8e0:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r5, #0x274]
    ldr r0, _LIT12
    add sp, sp, #0x14
    and r0, r1, r0
    orr r0, r0, #0xc000
    str r0, [r5, #0x274]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_910:
    add r0, r5, #0x1a0
    bl func_ov000_021ac680
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r5, #0x268]
    ldr r0, [r5, #0x264]
    orr r1, r1, #0x10
    str r1, [r5, #0x268]
    cmp r0, #0x1
    bne .L_94c
    bl func_ov011_021ca5b4
    cmp r0, #0x0
    beq .L_94c
    bl func_ov011_021ca550
.L_94c:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r5, #0x274]
    ldr r0, _LIT12
    and r0, r1, r0
    orr r0, r0, #0xc000
    str r0, [r5, #0x274]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word data_ov011_021d2f30
_LIT3: .word data_02104acc
_LIT4: .word 0xfffffffc
_LIT5: .word 0xfffffffd
_LIT6: .word 0xfffffffe
_LIT7: .word 0xffffffff
_LIT8: .word 0x66666667
_LIT9: .word data_ov011_021d2ed8
_LIT10: .word data_ov011_021d2ed9
_LIT11: .word 0x807fffff
_LIT12: .word 0xffe01fff
