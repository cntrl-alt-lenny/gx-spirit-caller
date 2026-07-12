; func_ov002_02277d5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022d008c
        .extern func_0202f994
        .extern func_ov002_021babc8
        .extern func_ov002_021bac78
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021c8400
        .extern func_ov002_021c92ec
        .extern func_ov002_021d46ac
        .extern func_ov002_021de390
        .extern func_ov002_021df590
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e2fc4
        .extern func_ov002_021fd72c
        .extern func_ov002_021fe2e4
        .extern func_ov002_02253f84
        .extern func_ov002_022767c4
        .global func_ov002_02277d5c
        .arm
func_ov002_02277d5c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r5, _LIT0
    ldr r0, [r5, #0x18]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_2b10
    b .L_226c
    b .L_2388
    b .L_2400
    b .L_24b8
    b .L_24b8
    b .L_24b8
    b .L_24b8
    b .L_24b8
    b .L_24c4
    b .L_2560
.L_226c:
    ldr r0, [r5]
    mov r3, #0x4
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldr r0, [r5]
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x9
    orr r2, r1, #0x60
    mov r1, r0, lsr #0x11
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021d46ac
    ldr r2, [r5]
    ldr r0, _LIT1
    mov r1, r2, lsl #0x1f
    mov r5, r2, lsl #0x1b
    mov r4, r1, lsr #0x1f
    ldr r2, _LIT2
    and r3, r4, #0x1
    mla r0, r3, r0, r2
    mov r5, r5, lsr #0x1c
    mov r1, #0x14
    mul r1, r5, r1
    ldrh r0, [r1, r0]
    mov r2, #0x1
    cmp r0, #0x0
    beq .L_2324
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x34
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #-16777216
    orr r1, r1, #0x1000000
    b .L_2358
.L_2324:
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x35
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r3, #0x2
    bl func_ov002_021d46ac
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #-16777216
.L_2358:
    ldr r3, _LIT3
    str r1, [r0, #0x18]
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2388:
    ldr r0, [r5]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, [r5]
    orr r3, r1, #0x2c
    mov r1, r0, lsl #0x9
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1c
    mov r0, r3, lsl #0x10
    mov r1, r1, lsr #0x11
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d46ac
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2400:
    ldr r0, [r5]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c8400
    cmp r0, #0x3
    bge .L_248c
    ldr r0, _LIT4
    bl func_ov002_021baf88
    cmp r0, #0x0
    ble .L_248c
    ldr r1, _LIT4
    mvn r0, #0x0
    bl func_ov002_021df590
    ldr r0, [r5]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    ldr r0, [r5]
    movgt r2, #0x1
    mov r1, r0, lsl #0x1b
    mov r3, r0, lsl #0x9
    mov r4, r0, lsl #0x1f
    movle r2, #0x0
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r3, r3, lsr #0x11
    bl func_ov002_021de390
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_248c:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_24b8:
    mov r0, #0x20
    bl func_ov002_022767c4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_24c4:
    ldr r4, [r5]
    ldr r0, _LIT1
    mov r1, r4, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, _LIT5
    and r2, r3, #0x1
    mla r1, r2, r0, r1
    mov r0, r4, lsl #0x1b
    mov r4, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r3, #0x0
    movne r1, #0x8000
    ldr r0, _LIT0
    moveq r1, #0x0
    orr r1, r1, #0x45
    ldrh r2, [r0, #0x4]
    mov r0, r1, lsl #0x10
    mov r1, r4, lsl #0x10
    ldrb r3, [r5, #0x8]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2560:
    bl func_ov002_021fe2e4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r5]
    mov r2, #0x15
    mov r1, r0, lsl #0x1b
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r3, #0x1
    bl func_ov002_021e2ca4
    ldr r0, [r5]
    mov r1, r0, lsl #0x1b
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_02253f84
    mov r8, #0x0
    ldr r6, _LIT5
    ldr r7, _LIT6
    ldr r4, _LIT1
    mov r9, r8
    mov sl, r8
.L_25c0:
    ldr r0, [r5]
    mov r1, r0, lsl #0x1b
    cmp r8, r1, lsr #0x1c
    beq .L_2648
    mov r0, r0, lsl #0x1f
    mov r1, r8
    mov r2, r7
    mov r0, r0, lsr #0x1f
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_2648
    ldr r0, [r5]
    mov r1, r8, lsl #0x10
    mov r0, r0, lsl #0x1f
    mov r2, r0, lsr #0x1f
    and r0, r2, #0x1
    mla r3, r0, r4, r6
    add r0, r3, #0x30
    ldr r0, [r0, r9]
    mov fp, r2, lsl #0x1f
    mov r2, r0, lsl #0x2
    mov r3, r2, lsr #0x18
    and r2, fp, #-2147483648
    mov fp, r0, lsl #0x12
    mov r0, r3, lsl #0x1
    add r0, r0, fp, lsr #0x1f
    mov r3, r0, lsl #0x10
    orr r2, r2, #0xe200000
    and r0, r1, #0x1f0000
    orr r0, r2, r0
    mov r2, sl
    orr r0, r0, r7
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
.L_2648:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r9, r9, #0x14
    blt .L_25c0
    ldr r0, [r5]
    mov r2, #0x5
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c92ec
    cmp r0, #0x0
    beq .L_273c
    mov fp, #0x0
.L_2680:
    ldr r0, _LIT7
    mov r6, #0x0
    ldr r1, [r0, #0xcec]
    ldr r2, _LIT5
    eor r8, r1, fp
    ldr r0, _LIT1
    and r1, r8, #0x1
    mla r2, r1, r0, r2
    mov r0, r8, lsl #0x1f
    and r0, r0, #-2147483648
    ldr r4, _LIT8
    add r7, r2, #0x30
    orr r9, r0, #0xe200000
    mov sl, r6
.L_26b8:
    ldr r0, [r5]
    mov r1, r0, lsl #0x1f
    cmp r8, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1b
    cmpeq r6, r0, lsr #0x1c
    beq .L_2720
    mov r0, r8
    mov r1, r6
    mov r2, r4
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_2720
    ldr r2, [r7]
    mov r0, r6, lsl #0x10
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    and r3, r0, #0x1f0000
    add r0, r1, r2, lsr #0x1f
    orr r3, r9, r3
    mov r1, r0, lsl #0x10
    mov r2, sl
    orr r0, r3, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_2720:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    blt .L_26b8
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_2680
.L_273c:
    ldr r0, [r5]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1b
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021bac78
    cmp r0, #0x0
    beq .L_2ae4
    ldr r4, [r5]
    ldr r2, _LIT5
    mov r0, r4, lsl #0x1f
    mov r6, r0, lsr #0x1f
    mov r0, r4, lsl #0x1b
    mov r1, r0, lsr #0x1c
    ldr r0, _LIT1
    and r6, r6, #0x1
    mla r7, r6, r0, r2
    ldr r2, [sp]
    mov r3, #0x14
    bic r2, r2, #0x200
    orr r2, r2, r6, lsl #0x9
    mov r0, r4, lsl #0x18
    mul r6, r1, r3
    add r7, r7, #0x30
    ldr r7, [r7, r6]
    mov r0, r0, lsr #0x1e
    mov r6, r7, lsl #0x2
    ldr r4, _LIT0
    bic r2, r2, #0x3c00
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x8000
    bic r9, r1, #0x4000
    ldrh r4, [r4, #0x4]
    mov r6, r6, lsr #0x18
    mov r8, r0, lsl #0x1f
    mov r0, r6, lsl #0x1
    mov r2, r7, lsl #0x12
    add r2, r0, r2, lsr #0x1f
    and r4, r4, #0x1
    ldr r1, _LIT9
    orr r6, r9, r8, lsr #0x11
    sub r0, r3, #0x214
    and r3, r6, r0
    and r0, r2, r1
    orr r0, r3, r0
    bic r0, r0, #0x10000
    str r0, [sp]
    cmp r4, #0x0
    movgt r3, #0x1
    ldr r1, [sp]
    ldr r0, [r5]
    movle r3, #0x0
    bic r2, r1, #0x20000
    mov r1, r3, lsl #0x1f
    orr r1, r2, r1, lsr #0xe
    bic r2, r1, #0xc0000
    ldr r1, _LIT10
    mov r0, r0, lsl #0x9
    cmp r1, r0, lsr #0x11
    str r2, [sp]
    mov r0, r0, lsr #0x11
    bcc .L_2904
    cmp r0, r1
    bcs .L_29bc
    ldr r2, _LIT11
    cmp r0, r2
    bhi .L_2894
    bcs .L_29bc
    sub r1, r2, #0xf9
    cmp r0, r1
    bhi .L_2870
    bcs .L_29bc
    ldr r1, _LIT12
    cmp r0, r1
    beq .L_29ac
    b .L_2a08
.L_2870:
    sub r1, r2, #0x85
    cmp r0, r1
    bhi .L_2884
    beq .L_29bc
    b .L_2a08
.L_2884:
    sub r1, r2, #0x9
    cmp r0, r1
    beq .L_29bc
    b .L_2a08
.L_2894:
    add r1, r2, #0xa1
    cmp r0, r1
    bhi .L_28b4
    bcs .L_29bc
    add r1, r2, #0x21
    cmp r0, r1
    beq .L_29bc
    b .L_2a08
.L_28b4:
    add r1, r2, #0xae
    cmp r0, r1
    bhi .L_28c8
    beq .L_29bc
    b .L_2a08
.L_28c8:
    sub r1, r0, #0x2a
    sub r1, r1, #0x1500
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_2a08
    b .L_29bc
    b .L_29bc
    b .L_2a08
    b .L_2a08
    b .L_29bc
    b .L_2a08
    b .L_2a08
    b .L_2a08
    b .L_2a08
    b .L_29bc
.L_2904:
    ldr r3, _LIT13
    cmp r0, r3
    bhi .L_2958
    bcs .L_29bc
    ldr r2, _LIT14
    cmp r0, r2
    bhi .L_2934
    bcs .L_29bc
    sub r1, r2, #0x3
    cmp r0, r1
    beq .L_29bc
    b .L_2a08
.L_2934:
    add r1, r2, #0xf
    cmp r0, r1
    bhi .L_2948
    beq .L_29bc
    b .L_2a08
.L_2948:
    sub r1, r3, #0x4c
    cmp r0, r1
    beq .L_29bc
    b .L_2a08
.L_2958:
    add r1, r3, #0x10c
    cmp r0, r1
    bhi .L_2988
    bcs .L_29bc
    add r1, r3, #0x1
    cmp r0, r1
    bhi .L_297c
    beq .L_29bc
    b .L_2a08
.L_297c:
    cmp r0, #0x1900
    beq .L_29bc
    b .L_2a08
.L_2988:
    ldr r1, _LIT15
    cmp r0, r1
    bhi .L_299c
    beq .L_29bc
    b .L_2a08
.L_299c:
    add r1, r1, #0xae
    cmp r0, r1
    beq .L_29bc
    b .L_2a08
.L_29ac:
    ldr r1, _LIT0
    ldr r1, [r1, #0x18]
    movs r1, r1, lsr #0x18
    beq .L_2a08
.L_29bc:
    ldr r1, [r5]
    ldr r2, [sp]
    mov r3, r1, lsl #0x1f
    mov r3, r3, lsr #0x1f
    mov r1, r1, lsl #0x1b
    mov r3, r3, lsl #0x1f
    mov r1, r1, lsr #0x1c
    and r4, r3, #-2147483648
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x17
    mov r1, r1, lsr #0x17
    mov r1, r1, lsl #0x10
    orr r4, r4, #0xe200000
    and r3, r3, #0x1f0000
    mov r0, r0, lsl #0x10
    orr r3, r4, r3
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_2a08:
    ldr r0, [r5]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202f994
    cmp r0, #0x0
    beq .L_2ae4
    ldr r2, [r5]
    ldr r6, [sp]
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, r2, lsl #0x1b
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1c
    mov r4, r2, lsl #0x9
    and r3, r1, #-2147483648
    mov r2, r0, lsl #0x10
    mov r4, r4, lsr #0x11
    mov r0, r6, lsl #0x17
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x10
    orr r3, r3, #0xe200000
    and r2, r2, #0x1f0000
    mov r0, r4, lsl #0x10
    orr r2, r3, r2
    orr r4, r2, r0, lsr #0x10
    mov r0, r4
    mov r2, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021fd72c
    cmp r0, #0x0
    beq .L_2ae4
    ldr r0, [r5]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldr r0, [r5]
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x9
    orr r2, r1, #0x61
    mov r1, r0, lsr #0x11
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
    ldr r1, [sp]
    mov r0, r4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x17
    mov r1, r1, lsl #0x10
    mov r2, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_2ae4:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2b10:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c2
_LIT3: .word data_ov002_022cd238
_LIT4: .word 0x00001255
_LIT5: .word data_ov002_022cf08c
_LIT6: .word 0x000018b6
_LIT7: .word data_ov002_022d008c
_LIT8: .word 0x000019f0
_LIT9: .word 0x000001ff
_LIT10: .word 0x000016bc
_LIT11: .word 0x00001293
_LIT12: .word 0x00001005
_LIT13: .word 0x000018ba
_LIT14: .word 0x000016fd
_LIT15: .word 0x000019f1
