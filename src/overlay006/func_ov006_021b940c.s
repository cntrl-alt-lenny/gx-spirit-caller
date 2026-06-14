; func_ov006_021b940c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb2d8
        .extern data_ov006_021cb2f4
        .extern data_ov006_021cb348
        .extern data_ov006_021cb370
        .extern data_ov006_0224f3e0
        .extern data_ov006_0225bee0
        .extern func_0202b0b4
        .extern func_0202b33c
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202b8a8
        .extern func_0202b8c0
        .extern func_0202b950
        .extern func_0202b980
        .extern func_0202bb20
        .extern func_0202bb78
        .extern func_0202de9c
        .global func_ov006_021b940c
        .arm
func_ov006_021b940c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldrh r6, [r0]
    ldrh r7, [r1]
    mov r0, r6
    bl func_0202bb20
    mov r4, r0
    mov r0, r7
    bl func_0202bb20
    ldr r1, _LIT0
    mov r5, r0
    ldrh r0, [r1]
    tst r0, #0x1
    beq .L_450
    mov r0, r6
    bl func_0202b33c
    mov r8, r0
    mov r0, r7
    bl func_0202b33c
    cmp r8, r0
    subne r0, r8, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_450:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x2
    beq .L_480
    mov r0, r6
    bl func_0202de9c
    mov r8, r0
    mov r0, r7
    bl func_0202de9c
    cmp r8, r0
    subne r0, r8, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_480:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x4
    beq .L_52c
    mov r0, r6
    bl func_0202de9c
    mov r8, r0
    mov r0, r7
    bl func_0202de9c
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_4bc
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_4bc:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_4d4
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_4d4:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_52c
    cmp r4, #0x0
    mvneq r8, #0x1
    beq .L_504
    mov r0, r6
    bl func_0202b950
    mov r0, r0, lsl #0x10
    mov r8, r0, asr #0x10
.L_504:
    cmp r5, #0x0
    mvneq r0, #0x1
    beq .L_520
    mov r0, r7
    bl func_0202b950
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
.L_520:
    cmp r8, r0
    subne r0, r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_52c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8
    beq .L_5d8
    mov r0, r6
    bl func_0202de9c
    mov r8, r0
    mov r0, r7
    bl func_0202de9c
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_568
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_568:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_580
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_580:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_5d8
    cmp r4, #0x0
    mvneq r8, #0x1
    beq .L_5b0
    mov r0, r6
    bl func_0202b980
    mov r0, r0, lsl #0x10
    mov r8, r0, asr #0x10
.L_5b0:
    cmp r5, #0x0
    mvneq r0, #0x1
    beq .L_5cc
    mov r0, r7
    bl func_0202b980
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
.L_5cc:
    cmp r8, r0
    subne r0, r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_5d8:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x10
    beq .L_680
    mov r0, r6
    bl func_0202de9c
    mov r8, r0
    mov r0, r7
    bl func_0202de9c
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_614
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_614:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_62c
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_62c:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_680
    mov r0, r6
    bl func_0202b890
    mov r8, r0
    mov r0, r7
    bl func_0202b890
    cmp r4, #0x0
    ldrne r1, _LIT1
    ldrne r2, [r1, r8, lsl #0x2]
    moveq r2, #0xff
    cmp r5, #0x0
    ldrne r1, _LIT1
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0xff
    cmp r2, r0
    subne r0, r2, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_680:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x20
    beq .L_728
    mov r0, r6
    bl func_0202de9c
    mov r8, r0
    mov r0, r7
    bl func_0202de9c
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_6bc
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_6bc:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_6d4
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_6d4:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_728
    mov r0, r6
    bl func_0202b878
    mov r8, r0
    mov r0, r7
    bl func_0202b878
    cmp r4, #0x0
    ldrne r1, _LIT2
    ldrne r2, [r1, r8, lsl #0x2]
    moveq r2, #0xff
    cmp r5, #0x0
    ldrne r1, _LIT2
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0xff
    cmp r2, r0
    subne r0, r2, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_728:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x40
    beq .L_7c8
    mov r0, r6
    bl func_0202de9c
    mov r8, r0
    mov r0, r7
    bl func_0202de9c
    cmp r8, #0x7
    moveq r1, #0xfe
    beq .L_764
    cmp r8, #0x8
    moveq r1, #0xff
    movne r1, #0x0
.L_764:
    cmp r0, #0x7
    moveq r0, #0xfe
    beq .L_77c
    cmp r0, #0x8
    moveq r0, #0xff
    movne r0, #0x0
.L_77c:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    bne .L_7c8
    cmp r4, #0x0
    mvneq r8, #0x0
    beq .L_7a8
    mov r0, r6
    bl func_0202b8a8
    mov r8, r0
.L_7a8:
    cmp r5, #0x0
    mvneq r0, #0x0
    beq .L_7bc
    mov r0, r7
    bl func_0202b8a8
.L_7bc:
    cmp r8, r0
    subne r0, r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_7c8:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x80
    beq .L_8b8
    mov r0, r6
    bl func_0202de9c
    mov r8, r0
    mov r0, r7
    bl func_0202de9c
    cmp r8, #0x7
    mvneq r1, #0x1
    beq .L_804
    cmp r8, #0x8
    mvneq r1, #0x0
    movne r1, r8
.L_804:
    cmp r0, #0x7
    mvneq r0, #0x1
    beq .L_818
    cmp r0, #0x8
    mvneq r0, #0x0
.L_818:
    cmp r1, r0
    subne r0, r1, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r8, #0x7
    bne .L_870
    mov r0, r6
    bl func_0202b8c0
    mov r8, r0
    mov r0, r7
    bl func_0202b8c0
    cmp r4, #0x0
    ldrne r1, _LIT3
    ldrne r2, [r1, r8, lsl #0x2]
    moveq r2, #0xff
    cmp r5, #0x0
    ldrne r1, _LIT3
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0xff
    cmp r2, r0
    beq .L_8b8
    sub r0, r2, r0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_870:
    cmp r8, #0x8
    bne .L_8b8
    mov r0, r6
    bl func_0202b8c0
    mov r8, r0
    mov r0, r7
    bl func_0202b8c0
    cmp r4, #0x0
    ldrne r1, _LIT4
    ldrne r2, [r1, r8, lsl #0x2]
    moveq r2, #0xff
    cmp r5, #0x0
    ldrne r1, _LIT4
    ldrne r0, [r1, r0, lsl #0x2]
    moveq r0, #0xff
    cmp r2, r0
    subne r0, r2, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_8b8:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x100
    beq .L_90c
    cmp r4, #0x0
    moveq r8, #0xff
    beq .L_8e4
    mov r0, r6
    bl func_0202b0b4
    ldr r1, _LIT5
    ldrb r8, [r1, r0]
.L_8e4:
    cmp r5, #0x0
    moveq r0, #0xff
    beq .L_900
    mov r0, r7
    bl func_0202b0b4
    ldr r1, _LIT5
    ldrb r0, [r1, r0]
.L_900:
    cmp r8, r0
    subne r0, r8, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_90c:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x200
    beq .L_970
    cmp r4, #0x0
    beq .L_93c
    mov r0, r6
    bl func_0202bb78
    cmp r0, #0x0
    movne r4, #0x1
    moveq r4, #0x0
    b .L_940
.L_93c:
    mvn r4, #0x0
.L_940:
    cmp r5, #0x0
    beq .L_960
    mov r0, r7
    bl func_0202bb78
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    b .L_964
.L_960:
    mvn r0, #0x0
.L_964:
    cmp r4, r0
    subne r0, r0, r4
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_970:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x4000
    beq .L_9a0
    mov r0, r6
    bl func_0202de9c
    mov r4, r0
    mov r0, r7
    bl func_0202de9c
    cmp r4, r0
    subne r0, r4, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_9a0:
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    beq .L_9d0
    mov r0, r6
    bl func_0202b33c
    mov r4, r0
    mov r0, r7
    bl func_0202b33c
    cmp r4, r0
    subne r0, r4, r0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_9d0:
    sub r0, r6, r7
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov006_0224f3e0
_LIT1: .word data_ov006_021cb348
_LIT2: .word data_ov006_021cb370
_LIT3: .word data_ov006_021cb2d8
_LIT4: .word data_ov006_021cb2f4
_LIT5: .word data_ov006_0225bee0
