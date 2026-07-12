; func_ov002_021d3514 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf088
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c8
        .extern data_ov002_022cf0cc
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern func_ov002_021b0b24
        .extern func_ov002_021b1e40
        .extern func_ov002_021b3d48
        .extern func_ov002_021b3dec
        .extern func_ov002_021b90e4
        .extern func_ov002_021b939c
        .extern func_ov002_021ba924
        .extern func_ov002_021baa58
        .extern func_ov002_021c9310
        .extern func_ov002_021c9718
        .extern func_ov002_021c97ac
        .extern func_ov002_021c9aa0
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d3514
        .arm
func_ov002_021d3514:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldrh r9, [r0, #0x4]
    ldrh r7, [r0, #0x2]
    ldr r0, _LIT1
    mov r4, r9, lsl #0x2
    ldrh r0, [r0, r4]
    mov r1, r7, lsl #0x10
    mov r5, r7, lsl #0x1f
    mov r3, r0, lsl #0x13
    mov r0, r7, lsl #0x12
    movs r0, r0, lsr #0x18
    ldr r0, _LIT0
    mov r8, r1, lsr #0x1f
    mov r6, r7, lsl #0x1a
    mov r2, r7, lsl #0x11
    strh r7, [sp, #0x8]
    mov r7, r2, lsr #0x1f
    movne r2, #0x1
    ldr r1, [r0, #0x810]
    moveq r2, #0x0
    mov r5, r5, lsr #0x1f
    mov r6, r6, lsr #0x1b
    mov r3, r3, lsr #0x13
    ldrh sl, [r0, #0x6]
    cmp r1, #0x0
    beq .L_88
    cmp r1, #0x1
    beq .L_370
    cmp r1, #0x2
    beq .L_594
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_88:
    mvn r0, #0x0
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9
    bl func_ov002_021b939c
    mov fp, r0
    mov r0, fp, lsl #0x10
    mov r1, fp, lsr #0x10
    mov r2, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    mov r1, r2, asr #0x8
    mov sl, r0, lsr #0x10
    and r9, r1, #0xff
    mov r0, sl, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r3, _LIT0
    mov r1, r9
    and r0, fp, #0xff
    str r1, [r3, #0x814]
    bl func_ov002_021c9310
    mov r1, r0
    ldr r2, [r1]
    ldr r0, _LIT2
    bic r2, r2, #0x80000
    bic r2, r2, #0x20000
    bic r2, r2, #0x100000
    bic r2, r2, #0x200000
    str r2, [r1]
    bl func_ov002_021b90e4
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    cmp r5, r0
    andeq r0, r9, #0xff
    cmpeq r0, #0xe
    bne .L_128
    mov r0, #0x1b
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_128:
    ldrh r2, [sp, #0x6]
    and r0, fp, #0xff
    and r1, r9, #0xff
    bic r2, r2, #0x1
    and r0, r0, #0x1
    orr r0, r2, r0
    strh r0, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    mov r0, sl, lsl #0x10
    mov r1, r1, lsl #0x1b
    bic r2, r2, #0x3e
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x18
    bic r1, r1, #0x3fc0
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c9718
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97ac
    ldrh r3, [sp, #0x4]
    mov r1, r5, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r6, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x1f
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x4]
    ldrh r3, [sp, #0x4]
    mov r2, r1, lsr #0x10
    ldrh r1, [sp, #0x6]
    bic r3, r3, #0x3e
    mov r2, r2, lsl #0x1b
    orr r2, r3, r2, lsr #0x1a
    strh r2, [sp, #0x4]
    ldrh r3, [sp, #0x4]
    mov r2, r8, lsl #0x10
    bic r1, r1, #0x4000
    orr r1, r1, r0, lsr #0x11
    bic r0, r3, #0x3fc0
    strh r0, [sp, #0x4]
    ldrh r3, [sp, #0x4]
    mov r2, r2, lsr #0x10
    strh r1, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    mov r0, r7, lsl #0x10
    bic r3, r3, #0x8000
    mov r2, r2, lsl #0x1f
    orr r2, r3, r2, lsr #0x10
    strh r2, [sp, #0x4]
    ldrh r3, [sp, #0x4]
    mov r2, r0, lsr #0x10
    mov r0, r1, lsl #0x1a
    mov r1, r0, lsr #0x1b
    bic r3, r3, #0x4000
    mov r0, r2, lsl #0x1f
    orr r0, r3, r0, lsr #0x11
    strh r0, [sp, #0x4]
    cmp r1, #0xa
    bhi .L_2b0
    ldr r0, _LIT1
    ldrh r2, [r0, r4]
    mov r0, r2, lsl #0x11
    mov r0, r0, lsr #0x1e
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x6000
    mov r0, r0, lsl #0x1e
    orr r2, r2, r0, lsr #0x11
    ldr r0, _LIT1
    strh r2, [r0, r4]
.L_2b0:
    ldrh r0, [sp, #0x6]
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r2, r2, lsr #0x18
    bl func_ov002_021ba924
    ldrh r2, [sp, #0x4]
    and r1, r7, #0xff
    and r0, r8, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r2, lsl #0x1a
    mov r4, r2, lsl #0x1f
    mov r2, r0, lsl #0x10
    ldr r3, _LIT2
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x10
    bl func_ov002_021baa58
    mov r0, r5
    mov r1, r6
    mov r2, #0x2
    mov r3, #0x1
    bl func_ov002_021c9aa0
    ldr r1, _LIT0
    ldrh r2, [sp, #0x6]
    ldr r1, [r1, #0x818]
    ldrh r3, [sp, #0x4]
    mov r4, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r4, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, #0x18
    orr r1, r1, #0x20000
    bl func_ov002_0229acd0
    mov r0, r5
    mov r1, r6
    mov r2, #0x8
    mov r3, #0x1
    bl func_ov002_021c9aa0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_370:
    cmp r2, #0x0
    beq .L_488
    ldr r2, _LIT4
    cmp r3, r2
    bgt .L_3cc
    bge .L_42c
    ldr r1, _LIT5
    cmp r3, r1
    bgt .L_3a8
    bge .L_42c
    sub r0, r1, #0xcc
    cmp r3, r0
    beq .L_410
    b .L_488
.L_3a8:
    add r0, r1, #0x1c4
    cmp r3, r0
    bgt .L_3bc
    beq .L_42c
    b .L_488
.L_3bc:
    sub r0, r2, #0xda
    cmp r3, r0
    beq .L_42c
    b .L_488
.L_3cc:
    add r0, r2, #0xf2
    cmp r3, r0
    bgt .L_3ec
    bge .L_46c
    add r0, r2, #0xab
    cmp r3, r0
    beq .L_46c
    b .L_488
.L_3ec:
    ldr r0, _LIT6
    cmp r3, r0
    bgt .L_400
    beq .L_46c
    b .L_488
.L_400:
    add r0, r0, #0x7c
    cmp r3, r0
    beq .L_42c
    b .L_488
.L_410:
    mov r4, #0x0
    mov r0, r5
    mov r1, r6
    mov r2, #0x5
    str r4, [sp]
    bl func_ov002_021b1e40
    b .L_488
.L_42c:
    ldr r3, _LIT5
    mov r0, r5
    mov r1, r6
    mov r2, #0x5
    str sl, [sp]
    bl func_ov002_021b1e40
    mov r1, #0x14
    ldr r3, _LIT7
    ldr r0, _LIT8
    and r2, r5, #0x1
    mla r3, r2, r0, r3
    mul r1, r6, r1
    ldr r0, [r3, r1]
    orr r0, r0, #0x400
    str r0, [r3, r1]
    b .L_488
.L_46c:
    ldr r0, _LIT8
    mov r1, #0x14
    ldr r2, _LIT9
    and r3, r5, #0x1
    mul r1, r6, r1
    mla r0, r3, r0, r2
    str sl, [r1, r0]
.L_488:
    ldr r0, _LIT10
    ldr r1, [r0, #0xcf8]
    cmp r1, #0x2
    bne .L_4b8
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT8
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT11
    ldr r0, [r1, r2]
    orr r0, r0, #0x100000
    str r0, [r1, r2]
.L_4b8:
    ldr r0, _LIT0
    ldr r0, [r0, #0x814]
    cmp r0, #0xb
    bne .L_508
    ldr r2, _LIT12
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_508
    ldr r2, _LIT12
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3d48
    str r0, [sp]
    ldr r3, _LIT12
    mov r0, r5
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021b1e40
.L_508:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229acd0
    and r3, r5, #0x1
    mov r1, #0x14
    ldr r2, _LIT13
    ldr r0, _LIT8
    mul r1, r6, r1
    mla r2, r3, r0, r2
    add r2, r2, #0x30
    mov r0, r6, lsl #0x1b
    ldr r2, [r2, r1]
    orr r3, r3, r0, lsr #0x1a
    mov r0, r2, lsl #0x2
    mov r4, r7, lsl #0x1f
    mov r1, r0, lsr #0x18
    orr r0, r3, r4, lsr #0x11
    mov r5, r8, lsl #0x1f
    orr r0, r0, r5, lsr #0x10
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    add r2, r2, r3, lsr #0x1f
    mov r0, #0x34
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_594:
    mov r0, #0x34
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022d0170
_LIT2: .word data_ov002_022cf088
_LIT3: .word data_ov002_022cd65c
_LIT4: .word 0x00001809
_LIT5: .word 0x00001472
_LIT6: .word 0x00001a4e
_LIT7: .word data_ov002_022cf0cc
_LIT8: .word 0x00000868
_LIT9: .word data_ov002_022cf0c8
_LIT10: .word data_ov002_022d008c
_LIT11: .word data_ov002_022cf1a8
_LIT12: .word 0x000015c7
_LIT13: .word data_ov002_022cf08c
