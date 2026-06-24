; func_ov002_021cf2cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf168
        .extern data_ov002_022cf180
        .extern data_ov002_022cf188
        .extern func_0202e234
        .extern func_ov002_021b0c04
        .extern func_ov002_021b91c4
        .extern func_ov002_021b947c
        .extern func_ov002_021b99b4
        .extern func_ov002_021baa04
        .extern func_ov002_021bab38
        .extern func_ov002_021c2934
        .extern func_ov002_021c2c54
        .extern func_ov002_021c93f0
        .extern func_ov002_021c97f8
        .extern func_ov002_021c988c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021cf2cc
        .arm
func_ov002_021cf2cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r6, #0x1
    ldrh r1, [r0, #0x2]
    moveq r6, #0x0
    ldrh sl, [r0, #0x6]
    and r9, r1, #0xff
    cmp r9, #0xa
    movle r0, r1, asr #0x8
    andle r7, r0, #0xff
    ble .L_1550
    mov r0, sl
    bl func_ov002_021b947c
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
.L_1550:
    ldr r0, _LIT0
    ldrh r4, [r0, #0x4]
    ldr r0, _LIT0
    tst r4, #0x30
    movne r8, #0x1
    ldr r1, [r0, #0x810]
    moveq r8, #0x0
    and r5, r4, #0x1
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_1a6c
    b .L_1590
    b .L_1600
    b .L_169c
    b .L_1a00
    b .L_1a54
.L_1590:
    cmp r9, #0xe
    bne .L_15e8
    mov r0, r6
    mov r1, sl
    bl func_ov002_021b99b4
    ldr r1, _LIT1
    and r2, r6, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_15e8
    mov r1, sl, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2c54
    mov r1, r6
    mov r2, r9
    mov r3, sl
    mov r0, #0x16
    bl func_ov002_0229ade0
.L_15e8:
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1600:
    mov r0, #0x16
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r6
    mov r1, r9
    mov r2, r7
    bl func_ov002_021c93f0
    mov r4, r0
    mov r0, r6
    mov r1, r9
    mov r2, r7
    bl func_ov002_021c93f0
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    adds r3, r0, r1, lsr #0x1f
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    beq .L_1684
    and r1, r9, #0xff
    and r0, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r1, r6
    mov r0, #0x1f
    bl func_ov002_0229ade0
.L_1684:
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_169c:
    mov r0, #0x1f
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r6
    mov r1, r9
    mov r2, r7
    bl func_ov002_021c93f0
    mov sl, r0
    ldr r1, [sl]
    mov r0, r5, lsl #0x1f
    bic r1, r1, #0x40000
    orr r0, r1, r0, lsr #0xd
    bic r3, r0, #0x80000
    bic r2, r3, #0x20000
    bic r1, r2, #0x100000
    mov r0, r1, lsl #0xf
    str r1, [sl]
    cmp r8, r0, lsr #0x1e
    mov r0, r0, lsr #0x1e
    ldr r1, [sl]
    movls r8, r0
    mov r0, r8, lsl #0x1e
    bic r1, r1, #0x18000
    orr r0, r1, r0, lsr #0xf
    bic r3, r0, #0x200000
    ldr r1, _LIT3
    mov r0, #0x0
    mov r2, #0x1
    str r3, [sl]
    bl func_ov002_021c2934
    mov r0, #0x1
    ldr r1, _LIT3
    mov r2, r0
    bl func_ov002_021c2934
    ldr r0, _LIT4
    mov r1, sl
    bl func_ov002_021b91c4
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r6, r0
    bne .L_1788
    cmp r5, #0x0
    beq .L_1788
    mov r0, #0x26
    mov r1, #0x1
    bl func_ov002_021b0c04
    ldr r0, _LIT0
    ldr r0, [r0, #0x818]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_1788
    mov r0, #0x27
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_1788:
    ldrh r1, [sp, #0x2]
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r3, r1, r0, lsr #0x12
    mov r0, r6
    mov r1, r9
    mov r2, r7
    strh r3, [sp, #0x2]
    bl func_ov002_021c97f8
    ldrh r1, [sp, #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x8000
    orr r3, r1, r0, lsr #0x10
    mov r0, r6
    mov r1, r9
    mov r2, r7
    strh r3, [sp, #0x2]
    bl func_ov002_021c988c
    ldr r2, _LIT0
    ldrh r3, [sp, #0x2]
    ldr r2, [r2, #0x818]
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    ldrh r1, [sp]
    mov r2, r2, lsr #0x10
    bic r3, r3, #0x4000
    mov r0, r0, lsl #0x1f
    orr r0, r3, r0, lsr #0x11
    bic r3, r1, #0x1
    and r1, r2, #0x1
    orr r1, r3, r1
    strh r1, [sp]
    strh r0, [sp, #0x2]
    ldrh r0, [sp, #0x2]
    ldrh r3, [sp]
    ldr r5, _LIT1
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    bic r0, r3, #0x3e
    orr r0, r0, #0x1e
    strh r0, [sp]
    ldrh r8, [sp]
    mov r0, r2, lsr #0x1f
    mov r2, r7
    mov r7, r8, lsl #0x1f
    mov r7, r7, lsr #0x1f
    and r7, r7, #0x1
    bic r3, r8, #0x3fc0
    mul r8, r7, r5
    ldr r5, _LIT6
    mov r1, r1, lsr #0x1b
    ldr r5, [r5, r8]
    mov r5, r5, lsl #0x10
    mov r5, r5, lsr #0x10
    mov r5, r5, lsl #0x18
    orr r3, r3, r5, lsr #0x12
    strh r3, [sp]
    bl func_ov002_021baa04
    mov r2, #0x0
    tst r4, #0x80
    movne r2, #0x80
    tst r4, #0x2040
    beq .L_1920
    ldrh r2, [sp, #0x2]
    tst r4, #0x2000
    movne r9, #0xff
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1
    orr r1, r1, r2, lsl #0x2
    orr r1, r6, r1
    and r0, r9, #0xf
    and r1, r1, #0xf
    orr r0, r1, r0, lsl #0x4
    and r0, r0, #0xff
    mov r0, r0, lsl #0x8
    orr r0, r0, #0x40
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
.L_1920:
    ldrh r0, [sp]
    ldr r3, _LIT4
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021bab38
    ldrh r0, [sp]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97f8
    ldrh r1, [sp]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp]
    ldrh r0, [sp]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c988c
    ldr r1, _LIT0
    ldrh r4, [sp]
    ldr r1, [r1, #0x818]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r3, r0, lsl #0x1f
    bic r4, r4, #0x4000
    mov r1, r1, lsr #0x18
    orr r3, r4, r3, lsr #0x11
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    strh r3, [sp]
    mov r1, r1, lsl #0x10
    ldrh r2, [sp, #0x2]
    ldrh r3, [sp]
    mov r0, #0x18
    mov r1, r1, lsr #0x10
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1a00:
    cmp r5, #0x0
    beq .L_1a3c
    add r1, r9, r7
    cmp r1, #0xa
    bgt .L_1a3c
    ldr r2, [r0, #0x818]
    mov r1, r6
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r2, r0, r2, lsr #0x1f
    mov r0, #0x4a
    mov r3, #0x0
    bl func_ov002_0229ade0
.L_1a3c:
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1a54:
    mov r0, #0x4a
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
.L_1a6c:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf180
_LIT3: .word 0x000016da
_LIT4: .word data_ov002_022cf168
_LIT5: .word data_ov002_022cd73c
_LIT6: .word data_ov002_022cf188
