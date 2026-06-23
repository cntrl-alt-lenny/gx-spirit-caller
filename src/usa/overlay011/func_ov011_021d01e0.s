; func_ov011_021d01e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_02013948
        .extern func_02018b14
        .extern func_020190f0
        .extern func_0202c06c
        .extern func_ov000_021ab40c
        .extern func_ov000_021ab5ec
        .extern func_ov000_021ab660
        .extern func_ov000_021ac680
        .extern func_ov000_021ae288
        .extern func_ov000_021ae380
        .extern func_ov000_021ae3a0
        .extern func_ov000_021af390
        .extern func_ov011_021c9f5c
        .extern func_ov011_021ca520
        .extern func_ov011_021ca550
        .extern func_ov011_021ca584
        .extern func_ov011_021ca59c
        .extern func_ov011_021ca5b4
        .extern func_ov011_021ca5e4
        .extern func_ov011_021caaf8
        .extern func_ov011_021cb154
        .extern func_ov011_021cc310
        .extern func_ov011_021cc718
        .extern func_ov011_021cc734
        .extern func_ov011_021cce78
        .extern func_ov011_021cd574
        .extern func_ov011_021cdab8
        .extern func_ov011_021cdad0
        .extern func_ov011_021cdb14
        .extern func_ov011_021cef84
        .extern func_ov011_021cef9c
        .extern func_ov011_021cf218
        .extern func_ov011_021cf98c
        .extern func_ov011_021cfa34
        .extern func_ov011_021cfa60
        .extern func_ov011_021cfb08
        .extern func_ov011_021d0f38
        .extern func_ov011_021d0f64
        .global func_ov011_021d01e0
        .arm
func_ov011_021d01e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2b0]
    mov r5, #0x0
    mov r0, r0, lsl #0xb
    mov r0, r0, lsr #0x18
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_7a0
    b .L_320
    b .L_7a0
    b .L_7a0
    b .L_7a0
    b .L_7a0
    b .L_7a0
    b .L_32c
    b .L_3b4
    b .L_5dc
    b .L_7a0
    b .L_668
    b .L_694
    b .L_6f4
    b .L_78c
.L_320:
    bl func_ov011_021cb154
    bl func_ov011_021cd574
    b .L_7a4
.L_32c:
    bl func_ov011_021ca59c
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    beq .L_36c
    cmp r0, #0x1
    bne .L_390
    ldr r1, _LIT2
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x2]
    bl func_ov011_021ca550
    b .L_390
.L_36c:
    ldr r2, _LIT2
    ldrh r0, [r2]
    sub r1, r2, #0x4
    bic r0, r0, #0x3
    strh r0, [r2]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1]
.L_390:
    ldr r2, [r4, #0x274]
    ldr r0, _LIT3
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0xb
    str r0, [r4, #0x274]
.L_3b4:
    ldr r6, _LIT4
    add r7, r6, #0x1
    bl func_ov011_021cdab8
    cmp r0, #0x0
    moveq r8, #0x1
    add r0, r4, #0x178
    movne r8, #0x0
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_3ec
    ldr r6, _LIT5
    mov r8, #0x1
    add r7, r6, #0x4
    b .L_404
.L_3ec:
    add r0, r4, #0x1a0
    bl func_ov000_021ac680
    cmp r0, #0x0
    ldrne r6, _LIT6
    movne r8, #0x1
    addne r7, r6, #0x4
.L_404:
    bl func_ov011_021ca5e4
    bl func_ov011_021cd574
    bl func_ov011_021ca584
    cmp r0, #0x0
    bne .L_7a4
    cmp r8, #0x0
    bne .L_42c
    bl func_ov011_021cef9c
    cmp r0, #0x0
    beq .L_7a4
.L_42c:
    bl func_ov000_021af390
    cmp r0, #0x0
    bne .L_7a4
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    bne .L_490
    bl func_ov011_021cdab8
    cmp r0, #0x0
    moveq r9, #0x0
    beq .L_45c
    bl func_ov011_021cc718
    mov r9, r0
.L_45c:
    bl func_020190f0
    add r0, r9, r0
    bl func_02013948
    ldr r1, [r4, #0x260]
    mov r2, r1, lsl #0xc
    cmp r0, r2, lsr #0x1c
    beq .L_490
    bic r2, r1, #0xf0000
    mov r1, r0, lsl #0x1c
    orr r2, r2, r1, lsr #0xc
    mov r1, #0x0
    str r2, [r4, #0x260]
    bl func_ov011_021caaf8
.L_490:
    cmp r8, #0x0
    beq .L_4fc
    mov r0, r6
    bl func_0202c06c
    .word 0xebff8663
    mov r6, r0
    mov r0, r7
    bl func_0202c06c
    .word 0xebff865f
    mov r1, r6
    mov r2, r0
    mov r0, #0x0
    mov r3, #0x1
    bl func_ov000_021ae288
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov000_021ab40c
    ldr r2, [r4, #0x274]
    ldr r0, _LIT3
    mov r1, r2, lsl #0xb
    and r2, r2, r0
    mov r0, r1, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x18
    orr r0, r2, r0, lsr #0xb
    str r0, [r4, #0x274]
    b .L_5d4
.L_4fc:
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021d0f38
    cmp r0, #0x1
    bne .L_5b4
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021d0f64
    bl func_ov011_021cdb14
    cmp r0, #0x0
    beq .L_544
    ldr r1, [r4, #0x274]
    ldr r0, _LIT3
    and r0, r1, r0
    orr r0, r0, #0x14000
    b .L_5a0
.L_544:
    mov r0, r6
    bl func_0202c06c
    .word 0xebff8638
    mov r6, r0
    mov r0, r7
    bl func_0202c06c
    .word 0xebff8634
    mov r2, r0
    mov r1, r6
    mov r0, #0x0
    mov r3, #0x1
    bl func_ov000_021ae288
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov000_021ab40c
    ldr r2, [r4, #0x274]
    ldr r0, _LIT3
    mov r1, r2, lsl #0xb
    and r2, r2, r0
    mov r0, r1, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x18
    orr r0, r2, r0, lsr #0xb
.L_5a0:
    str r0, [r4, #0x274]
    bl func_ov011_021cc734
    bl func_ov011_021cdad0
    bl func_ov011_021cef84
    b .L_5d4
.L_5b4:
    ldr r1, [r4, #0x274]
    ldr r0, _LIT3
    and r0, r1, r0
    orr r0, r0, #0x14000
    str r0, [r4, #0x274]
    bl func_ov011_021cc734
    bl func_ov011_021cdad0
    bl func_ov011_021cef84
.L_5d4:
    bl func_ov011_021c9f5c
    b .L_7a4
.L_5dc:
    bl func_ov011_021cd574
    bl func_ov000_021ae380
    cmp r0, #0x0
    beq .L_7a4
    bl func_ov000_021ae3a0
    cmp r0, #0x0
    bne .L_600
    bl func_ov011_021cf98c
    b .L_7a4
.L_600:
    add r0, r4, #0x178
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_618
    bl func_ov011_021cfa60
    b .L_7a4
.L_618:
    add r0, r4, #0x1a0
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_630
    bl func_ov011_021cfa60
    b .L_7a4
.L_630:
    bl func_ov000_021ae3a0
    cmp r0, #0x1
    beq .L_648
    cmp r0, #0x2
    beq .L_660
    b .L_7a4
.L_648:
    ldr r1, [r4, #0x274]
    ldr r0, _LIT3
    and r0, r1, r0
    orr r0, r0, #0x14000
    str r0, [r4, #0x274]
    b .L_7a4
.L_660:
    bl func_ov011_021cf98c
    b .L_7a4
.L_668:
    bl func_ov011_021cd574
    bl func_ov011_021cef9c
    cmp r0, #0x0
    beq .L_7a4
    mov r0, r5
    bl func_ov011_021cfa34
    ldr r0, [r4, #0x278]
    bic r0, r0, #0xf
    orr r0, r0, #0x2
    str r0, [r4, #0x278]
    b .L_7a4
.L_694:
    bl func_ov011_021cd574
    bl func_ov011_021cf218
    cmp r0, #0x0
    beq .L_7a4
    bl func_02018b14
    cmp r0, #0x0
    beq .L_6bc
    bl func_ov011_021cfa60
    bl func_ov011_021ca59c
    b .L_7a4
.L_6bc:
    bl func_ov011_021ca520
    ldr r1, [r4, #0x274]
    ldr r0, _LIT3
    and r0, r1, r0
    str r0, [r4, #0x274]
    bl func_ov011_021cc310
    ldr r0, [r4, #0x268]
    bic r0, r0, #0xf
    str r0, [r4, #0x268]
    bl func_ov011_021cce78
    ldr r0, [r4, #0x270]
    bic r0, r0, #0x10000000
    str r0, [r4, #0x270]
    b .L_7a4
.L_6f4:
    bl func_ov011_021ca5b4
    cmp r0, #0x0
    beq .L_704
    bl func_ov011_021ca584
.L_704:
    bl func_ov011_021cd574
    ldr r2, [r4, #0x280]
    mov r0, r2, lsl #0x1
    movs r1, r0, lsr #0x18
    beq .L_730
    ldr r0, _LIT7
    sub r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x1
    str r0, [r4, #0x280]
.L_730:
    ldr r0, [r4, #0x280]
    mov r0, r0, lsl #0x1
    movs r0, r0, lsr #0x18
    bne .L_784
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_760
    mov r0, #0x0
    mov r1, #0x10
    bl func_ov000_021ab660
.L_760:
    ldr r2, [r4, #0x274]
    ldr r0, _LIT3
    mov r1, r2, lsl #0xb
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0xb
    str r0, [r4, #0x274]
.L_784:
    bl func_ov011_021cb154
    b .L_7a4
.L_78c:
    bl func_ov011_021cd574
    bl func_ov000_021ab5ec
    cmp r0, #0x0
    movne r5, #0x1
    b .L_7a4
.L_7a0:
    bl func_ov011_021cfb08
.L_7a4:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word 0x0400000c
_LIT3: .word 0xffe01fff
_LIT4: .word 0x000004b4
_LIT5: .word 0x0000051f
_LIT6: .word 0x0000051e
_LIT7: .word 0x807fffff
