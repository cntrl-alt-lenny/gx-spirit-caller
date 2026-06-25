; func_ov002_021d264c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf168
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_ov002_021b0c04
        .extern func_ov002_021b1f20
        .extern func_ov002_021b91c4
        .extern func_ov002_021b9368
        .extern func_ov002_021b9aa8
        .extern func_ov002_021baa04
        .extern func_ov002_021baca8
        .extern func_ov002_021c9b80
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d264c
        .arm
func_ov002_021d264c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r5, [r1, #0x4]
    ldrh r8, [r1, #0x6]
    tst r0, #0x8000
    movne r4, #0x1
    moveq r4, #0x0
    ldrh r6, [r1, #0x2]
    mov r3, r5, lsl #0x1a
    mov r2, r5, lsl #0x11
    mov r0, r4
    mov r1, r8
    strh r5, [sp, #0x8]
    mov r7, r3, lsr #0x1b
    mov r9, r2, lsr #0x1f
    bl func_ov002_021b9aa8
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x810]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_3a0
    b .L_74
    b .L_a0
    b .L_230
    b .L_36c
.L_74:
    mov r1, r4
    mov r2, r6
    mov r3, r9
    mov r0, #0x44
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a0:
    mov r0, #0x44
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r1, r0, #0x120
    ldr r0, _LIT3
    add r1, r1, r5, lsl #0x2
    bl func_ov002_021b91c4
    ldrh r2, [sp, #0x6]
    mov r0, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r0, [sp, #0x4]
    bic r3, r2, #0x1
    and r2, r1, #0x1
    orr r1, r3, r2
    strh r1, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    bic r0, r0, #0x1
    orr r0, r0, r2
    bic r1, r1, #0x3e
    orr r1, r1, #0x16
    strh r1, [sp, #0x6]
    strh r0, [sp, #0x4]
    ldrh r6, [sp, #0x6]
    mov r0, r5, lsl #0x10
    ldrh r2, [sp, #0x4]
    mov r5, r0, lsr #0x10
    mov r0, r7, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r9, lsl #0x10
    mov r3, r0, lsr #0x10
    bic r6, r6, #0x3fc0
    mov r0, r5, lsl #0x18
    orr r0, r6, r0, lsr #0x12
    strh r0, [sp, #0x6]
    ldrh r5, [sp, #0x6]
    bic r2, r2, #0x3e
    mov r0, r1, lsl #0x1b
    orr r0, r2, r0, lsr #0x1a
    strh r0, [sp, #0x4]
    ldrh r0, [sp, #0x4]
    bic r1, r5, #0x8000
    strh r1, [sp, #0x6]
    bic r0, r0, #0x3fc0
    strh r0, [sp, #0x4]
    ldrh r1, [sp, #0x6]
    ldrh r0, [sp, #0x4]
    mov r6, r3, lsl #0x1f
    bic r1, r1, #0x4000
    orr r2, r1, r6, lsr #0x11
    bic r1, r0, #0x8000
    strh r2, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    strh r1, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    bic r5, r2, #0x4000
    mov r2, r0, lsl #0x12
    orr r5, r5, r6, lsr #0x11
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    strh r5, [sp, #0x4]
    bl func_ov002_021baa04
    ldr r2, _LIT3
    mov r0, r4
    mov r1, r7
    mov r3, r9
    bl func_ov002_021b9368
    cmp r9, #0x0
    beq .L_1e8
    mov r2, #0x1
    mov r0, r4
    mov r1, r7
    mov r3, r2
    bl func_ov002_021c9b80
.L_1e8:
    cmp r9, #0x0
    movne r0, #0x3
    moveq r0, #0x4
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r2, [sp, #0x6]
    ldrh r3, [sp, #0x4]
    mov r0, r8, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    mov r0, #0x18
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_230:
    cmp r9, #0x0
    bne .L_318
    ldr r0, _LIT4
    ldr r1, [r0, #0xcf8]
    cmp r1, #0x2
    bne .L_268
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT2
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT5
    ldr r0, [r1, r2]
    orr r0, r0, #0x100000
    str r0, [r1, r2]
.L_268:
    mov r0, r6
    bl func_0202b878
    cmp r0, #0x16
    bne .L_2e4
    mov r8, #0x0
    ldr r6, _LIT6
    mov r5, r8
    mov fp, #0x8
.L_288:
    mov r9, #0x5
    and sl, r8, #0xff
.L_290:
    mov r0, r8
    mov r1, r9
    mov r2, r6
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_2cc
    and r0, r9, #0xff
    orr r0, sl, r0, lsl #0x8
    mov r3, r0, lsl #0x10
    mov r0, r4
    mov r1, r7
    mov r2, fp
    mov r3, r3, lsr #0x10
    str r5, [sp]
    bl func_ov002_021b1f20
.L_2cc:
    add r9, r9, #0x1
    cmp r9, #0xa
    blt .L_290
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_288
.L_2e4:
    mov r1, r4
    mov r2, r7
    mov r0, #0x1c
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT7
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_354
    mov r0, #0x1d
    mov r1, #0x1
    bl func_ov002_021b0c04
    b .L_354
.L_318:
    mov r0, r6
    bl func_0202b878
    cmp r0, #0x17
    bne .L_340
    ldr r3, _LIT8
    mov r2, #0x1
    mov r0, r4
    mov r1, #0xb
    str r2, [sp]
    bl func_ov002_021b1f20
.L_340:
    mov r1, r4
    mov r2, r6
    mov r0, #0x43
    mov r3, #0x2
    bl func_ov002_0229ade0
.L_354:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_36c:
    mov r0, #0x1c
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x43
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
.L_3a0:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf168
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cf288
_LIT6: .word 0x00001390
_LIT7: .word data_ov002_022cd73c
_LIT8: .word 0x0000198a
