; func_ov002_021e1c8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202e234
        .extern func_0202e2c8
        .extern func_0202e2f8
        .extern func_0202e42c
        .extern func_ov002_021ba294
        .extern func_ov002_021baca8
        .extern func_ov002_021bd85c
        .extern func_ov002_021ca5bc
        .extern func_ov002_021d479c
        .extern func_ov002_021df62c
        .extern func_ov002_021e276c
        .extern func_ov002_021e2d94
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .global func_ov002_021e1c8c
        .arm
func_ov002_021e1c8c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r5, r3
    ldr r3, [r5]
    mov r6, r0
    mov r2, r3, lsl #0x12
    mov r0, r3, lsl #0x2
    mov r3, r3, lsl #0x13
    mov r9, r2, lsr #0x1f
    mov r0, r0, lsr #0x18
    add r0, r9, r0, lsl #0x1
    mov sl, r1
    mov r8, r3, lsr #0x13
    ldr fp, [sp, #0x30]
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    moveq r7, #0x1
    movne r7, #0x0
    cmp r7, #0x0
    mov r4, #0x0
    bne .L_64
    mov r0, r8
    bl func_0202e2f8
    cmp r0, #0x0
    moveq r4, #0x1
.L_64:
    mov r0, #0x0
    add r1, sp, #0x4
    str r0, [r1]
    ldr r2, [r5]
    str r0, [sp]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    ldr r1, _LIT0
    sub r0, r0, #0x200
    add r2, r2, r3, lsr #0x1f
    and r3, r0, #0x0
    and r0, r2, r1
    orr r1, r3, r0
    bic r2, r1, #0x200
    mov r1, r6, lsl #0x1f
    orr r1, r2, r1, lsr #0x16
    eor r0, r6, fp
    orr r1, r1, #0x400
    bic r1, r1, #0x800
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x14
    str r0, [sp, #0x4]
    cmp r7, #0x0
    movne r0, #0xf
    moveq r0, #0xe
    ldr r1, [sp, #0x4]
    mov r0, r0, lsl #0x1c
    bic r1, r1, #0xf000
    orr r0, r1, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldr r1, [sp, #0x4]
    cmp r6, #0x0
    mov r2, r1, lsl #0x10
    movne r0, #0x8000
    mov ip, r2, lsr #0x1c
    moveq r0, #0x0
    mov r1, r1, lsl #0x17
    orr r0, r0, #0x31
    mov r2, r1, lsr #0x17
    mov r0, r0, lsl #0x10
    mov r1, sl, lsl #0x10
    and r3, fp, #0xf
    and ip, ip, #0xff
    orr r3, ip, r3, lsl #0x8
    mov r3, r3, lsl #0x10
    mov ip, r2, lsl #0x10
    mov r2, r3, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r3, ip, lsr #0x10
    bl func_ov002_021d479c
    ldr r1, _LIT1
    cmp r8, r1
    bgt .L_1f4
    bge .L_328
    ldr r2, _LIT2
    cmp r8, r2
    bgt .L_19c
    bge .L_328
    sub r0, r1, #0x570
    cmp r8, r0
    bgt .L_178
    bge .L_328
    ldr r0, _LIT3
    cmp r8, r0
    beq .L_2b0
    b .L_39c
.L_178:
    ldr r0, _LIT4
    cmp r8, r0
    bgt .L_18c
    beq .L_328
    b .L_39c
.L_18c:
    add r0, r0, #0x67
    cmp r8, r0
    beq .L_328
    b .L_39c
.L_19c:
    add r0, r2, #0x25c
    cmp r8, r0
    bgt .L_1bc
    bge .L_328
    sub r0, r1, #0x20c
    cmp r8, r0
    beq .L_328
    b .L_39c
.L_1bc:
    sub r0, r1, #0xa0
    cmp r8, r0
    bgt .L_1e4
    add r0, r2, #0x270
    cmp r8, r0
    blt .L_39c
    subne r0, r1, #0xa0
    cmpne r8, r0
    beq .L_308
    b .L_39c
.L_1e4:
    add r0, r2, #0x2a4
    cmp r8, r0
    beq .L_328
    b .L_39c
.L_1f4:
    ldr r0, _LIT5
    cmp r8, r0
    bgt .L_26c
    bge .L_2f4
    sub r2, r0, #0x1ac
    cmp r8, r2
    bgt .L_248
    add r2, r1, #0x9f
    cmp r8, r2
    blt .L_238
    addne r1, r1, #0xa4
    cmpne r8, r1
    beq .L_2d0
    sub r0, r0, #0x1ac
    cmp r8, r0
    beq .L_2f4
    b .L_39c
.L_238:
    add r0, r1, #0x9e
    cmp r8, r0
    beq .L_2d0
    b .L_39c
.L_248:
    add r0, r1, #0xd0
    cmp r8, r0
    bgt .L_25c
    beq .L_328
    b .L_39c
.L_25c:
    ldr r0, _LIT6
    cmp r8, r0
    beq .L_2f4
    b .L_39c
.L_26c:
    add r1, r0, #0x11c
    cmp r8, r1
    bgt .L_28c
    bge .L_338
    add r0, r0, #0xb8
    cmp r8, r0
    beq .L_328
    b .L_39c
.L_28c:
    ldr r0, _LIT7
    cmp r8, r0
    bgt .L_2a0
    beq .L_328
    b .L_39c
.L_2a0:
    add r0, r0, #0x2b
    cmp r8, r0
    beq .L_328
    b .L_39c
.L_2b0:
    cmp r7, #0x0
    bne .L_39c
    cmp fp, #0x0
    beq .L_39c
    cmp sl, #0xd
    moveq r0, #0x1
    streq r0, [sp]
    b .L_39c
.L_2d0:
    cmp r7, #0x0
    bne .L_39c
    cmp fp, #0x0
    beq .L_39c
    cmp sl, #0xb
    cmpeq r9, r6
    moveq r0, #0x1
    streq r0, [sp]
    b .L_39c
.L_2f4:
    cmp r7, #0x0
    cmpeq sl, #0xb
    moveq r0, #0x1
    streq r0, [sp]
    b .L_39c
.L_308:
    cmp r7, #0x0
    bne .L_39c
    cmp fp, #0x0
    beq .L_39c
    cmp r9, r6
    moveq r0, #0x1
    streq r0, [sp]
    b .L_39c
.L_328:
    cmp r7, #0x0
    moveq r0, #0x1
    streq r0, [sp]
    b .L_39c
.L_338:
    cmp r7, #0x0
    bne .L_39c
    ldr r0, _LIT8
    ldr r3, [r5]
    ldr r0, [r0, #0xcec]
    cmp r9, r0
    moveq r0, #0x1
    movne r0, #0x0
    add r1, r0, #0x1
    mov r0, r3, lsl #0x2
    and r1, r1, #0xff
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x4
    orr r2, r1, #0x1
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    mov r3, r0, lsl #0x10
    mov r0, r9
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
.L_39c:
    ldr r0, _LIT9
    cmp r8, r0
    bne .L_3d8
    ldr r1, _LIT10
    mov r0, r6
    bl func_ov002_021ba294
    cmp r0, #0x0
    blt .L_3d8
    mov r1, r6, lsl #0x1f
    ldr r0, _LIT11
    and r1, r1, #-2147483648
    ldr r2, [sp, #0x4]
    orr r0, r1, r0
    mov r1, #0x0
    bl func_ov002_021e30b4
.L_3d8:
    cmp r4, #0x0
    beq .L_490
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    beq .L_490
    mov r0, r8
    bl func_0202e42c
    cmp r0, #0x0
    beq .L_490
    ldr r0, _LIT12
    mov sl, #0x0
    add r7, r0, #0x2a0000
.L_40c:
    ldr r2, _LIT12
    mov r0, sl
    mov r1, #0xa
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_484
    ldr r1, _LIT13
    ldr r0, _LIT14
    and r2, sl, #0x1
    mla r1, r2, r1, r0
    cmp r9, sl
    movne r0, #0x1
    moveq r0, #0x0
    ldr r2, [r1, #0xf8]
    mov r1, sl, lsl #0x1f
    mov r0, r0, lsl #0x18
    and r1, r1, #-2147483648
    and r0, r0, #0x1000000
    orr r1, r1, #0x3c000000
    orr r0, r1, r0
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x4]
    orr r0, r0, r7
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_484:
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_40c
.L_490:
    cmp r4, #0x0
    beq .L_538
    mov r0, r8
    bl func_0202e2c8
    cmp r0, #0x0
    beq .L_538
    ldr r0, _LIT15
    mov sl, #0x0
    add r7, r0, #0x2a0000
.L_4b4:
    ldr r2, _LIT15
    mov r0, sl
    mov r1, #0xa
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_52c
    ldr r1, _LIT13
    ldr r0, _LIT14
    and r2, sl, #0x1
    mla r1, r2, r1, r0
    cmp r9, sl
    movne r0, #0x1
    moveq r0, #0x0
    ldr r2, [r1, #0xf8]
    mov r1, sl, lsl #0x1f
    mov r0, r0, lsl #0x18
    and r1, r1, #-2147483648
    and r0, r0, #0x1000000
    orr r1, r1, #0x3c000000
    orr r0, r1, r0
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    ldr r2, [sp, #0x4]
    orr r0, r0, r7
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_52c:
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_4b4
.L_538:
    mov r0, r8
    bl func_0202b878
    cmp r0, #0x9
    bne .L_590
    cmp r4, #0x0
    beq .L_590
    ldr sl, _LIT16
    mov r7, #0x0
.L_558:
    mov r0, r9
    mov r1, r7
    mov r2, sl
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_584
    mov r0, r9
    mov r1, r7
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
.L_584:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_558
.L_590:
    ldr r2, [r5]
    mov r0, r8
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021bd85c
    cmp r0, #0x0
    moveq r2, #0x1
    ldr r1, _LIT17
    movne r2, #0x0
    cmp r8, r1
    bgt .L_5f0
    bge .L_714
    sub r0, r1, #0xbc
    cmp r8, r0
    bgt .L_5e0
    beq .L_6c0
    b .L_814
.L_5e0:
    sub r0, r1, #0x7d
    cmp r8, r0
    beq .L_614
    b .L_814
.L_5f0:
    ldr r0, _LIT18
    cmp r8, r0
    bgt .L_604
    beq .L_67c
    b .L_814
.L_604:
    ldr r0, _LIT19
    cmp r8, r0
    beq .L_79c
    b .L_814
.L_614:
    cmp r2, #0x0
    cmpne r4, #0x0
    beq .L_814
    ldr r2, [r5]
    mov r0, r9
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r2, r1, r2, lsr #0x1f
    mov r1, #0xe
    bl func_ov002_021df62c
    ldr r2, [r5]
    mov r1, r8, lsl #0x10
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r9
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e276c
    b .L_814
.L_67c:
    cmp r2, #0x0
    cmpne r4, #0x0
    beq .L_814
    ldr r2, [r5]
    mov r1, r8, lsl #0x10
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r9
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e276c
    b .L_814
.L_6c0:
    cmp r6, r9
    bne .L_814
    cmp r4, #0x0
    cmpne fp, #0x0
    beq .L_814
    ldr r3, [r5]
    mov r0, r6
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    mov r1, r3, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r1, r1, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e276c
    b .L_814
.L_714:
    cmp r6, r9
    bne .L_814
    cmp r4, #0x0
    cmpne fp, #0x0
    beq .L_814
    ldr r0, _LIT8
    ldr r1, [r0, #0xcec]
    cmp r9, r1
    bne .L_750
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x1
    b .L_754
.L_750:
    mov r0, #0x1
.L_754:
    ldr r3, [r5]
    and r1, r0, #0xf
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x4
    orr r2, r1, #0x1
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    mov r3, r0, lsl #0x10
    mov r0, r9
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
    b .L_814
.L_79c:
    cmp r4, #0x0
    beq .L_814
    ldr r0, _LIT8
    ldr r1, [r0, #0xcec]
    cmp r9, r1
    bne .L_7cc
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x1
    b .L_7d0
.L_7cc:
    mov r0, #0x1
.L_7d0:
    ldr r3, [r5]
    and r1, r0, #0xf
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x4
    orr r2, r1, #0x1
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    mov r3, r0, lsl #0x10
    mov r0, r9
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
.L_814:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_860
    ldr r1, [r5]
    mov r2, r9, lsl #0x1f
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    and r2, r2, #-2147483648
    orr r3, r2, #0x4e0000
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r3, r3, #0x3c000000
    mov r0, r8, lsl #0x10
    ldr r2, [sp, #0x4]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_860:
    ldr r1, [sp, #0x4]
    mov r0, #0x1e
    bl func_ov002_02244fe4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000001ff
_LIT1: .word 0x000016f5
_LIT2: .word 0x000013e3
_LIT3: .word 0x0000106d
_LIT4: .word 0x000012a2
_LIT5: .word 0x00001946
_LIT6: .word 0x00001828
_LIT7: .word 0x00001a8f
_LIT8: .word data_ov002_022d016c
_LIT9: .word 0x000018aa
_LIT10: .word 0x00001445
_LIT11: .word 0x3c501445
_LIT12: .word 0x0000169f
_LIT13: .word 0x00000868
_LIT14: .word data_ov002_022cf16c
_LIT15: .word 0x0000187f
_LIT16: .word 0x00001a8d
_LIT17: .word 0x00001522
_LIT18: .word 0x000016f9
_LIT19: .word 0x0000185c
