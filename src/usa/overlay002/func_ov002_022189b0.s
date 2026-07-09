; func_ov002_022189b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_0202e1e0
        .extern func_0202e274
        .extern func_0202e2a4
        .extern func_ov002_021bc538
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c9d10
        .extern func_ov002_021ca1d8
        .extern func_ov002_021d8750
        .extern func_ov002_021de8d0
        .extern func_ov002_021e26d0
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022535a4
        .extern func_ov002_0226aec4
        .extern func_ov002_0226afa4
        .extern func_ov002_0226afc0
        .extern func_ov002_0227ab74
        .global func_ov002_022189b0
        .arm
func_ov002_022189b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    ldr r6, _LIT1
    ldr r2, [r1, #0x5a8]
    ldr r5, [r6, #0xcec]
    ldr r3, [r1, #0x5ac]
    sub r2, r2, #0x77
    mov r4, r0
    cmp r2, #0x9
    eor r5, r5, r3
    addls pc, pc, r2, lsl #0x2
    b .L_3b8
    b .L_388
    b .L_35c
    b .L_344
    b .L_3b8
    b .L_2c4
    b .L_24c
    b .L_238
    b .L_194
    b .L_13c
    b .L_58
.L_58:
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r2, #0x0
    strh r2, [r4, #0xa]
    strh r2, [r4, #0x8]
    strh r2, [r4, #0xe]
    ldr r1, _LIT2
    strh r2, [r4, #0xc]
    bl func_ov002_021de8d0
    mov fp, #0x0
    mov r7, r0
    mov r9, fp
.L_94:
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, fp, #0x1
    mla r0, r1, r0, r2
    add sl, r0, #0x30
    mov r6, #0x0
    mov r5, #0x1
.L_b0:
    add r0, r6, r9
    tst r7, r5, lsl r0
    beq .L_114
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_114
    mov r0, r8
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_114
    mov r0, r8
    bl func_0202e274
    cmp r0, #0x0
    bne .L_114
    ldr r0, [sl]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    add r1, r4, r0, lsl #0x1
    ldrh r0, [r1, #0x8]
    add r0, r0, #0x1
    strh r0, [r1, #0x8]
.L_114:
    add r6, r6, #0x1
    cmp r6, #0x5
    add sl, sl, #0x14
    blt .L_b0
    add fp, fp, #0x1
    cmp fp, #0x2
    add r9, r9, #0x10
    blt .L_94
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13c:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021ca1d8
    mov r4, r0
    mov r0, #0x0
    bl func_ov002_021c9d10
    orr r2, r4, r0
    ldr r1, _LIT0
    mov r0, #0x1
    str r2, [r1, #0x5b0]
    bl func_ov002_021ca1d8
    mov r4, r0
    mov r0, #0x1
    bl func_ov002_021c9d10
    ldr r1, _LIT0
    orr r0, r4, r0
    ldr r2, [r1, #0x5b0]
    orr r0, r2, r0, lsl #0x1
    str r0, [r1, #0x5b0]
    bl func_ov002_021e2a4c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_194:
    add r0, r4, r5, lsl #0x1
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_230
    mov r0, r5
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_230
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b0]
    mov r0, r0, asr r5
    tst r0, #0x1
    beq .L_230
    ldr r0, _LIT4
    and r2, r5, #0x1
    mul r1, r2, r0
    ldr r0, _LIT5
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_21c
    ldr r0, _LIT3
    add r7, r0, r1
.L_1f0:
    ldrh r1, [r4]
    mov r0, r5
    mov r2, r6
    bl func_ov002_022535a4
    cmp r0, #0x0
    movne r0, #0x7d
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r7, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    bcc .L_1f0
.L_21c:
    mov r0, r5
    mov r1, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x79
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_230:
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_238:
    ldrh r1, [r4]
    mov r0, r5
    bl func_ov002_0226afa4
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_24c:
    ldr r0, _LIT4
    and r2, r5, #0x1
    mul r1, r2, r0
    ldr r0, _LIT5
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_2b0
    ldr r0, _LIT3
    add r7, r0, r1
.L_274:
    ldrh r1, [r4]
    mov r0, r5
    mov r2, r6
    bl func_ov002_022535a4
    cmp r0, #0x0
    beq .L_2a0
    ldrh r1, [r4]
    mov r0, r5
    bl func_ov002_0226aec4
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2a0:
    ldr r0, [r7, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    bcc .L_274
.L_2b0:
    mov r0, r5
    mov r1, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x79
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2c4:
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, r5, #0x1
    mla r3, r1, r0, r2
    mov r2, #0x0
    ldr r0, _LIT6
    str r2, [sp]
    ldrh r1, [r0, #0xb0]
    add r3, r3, #0x120
    mov r0, r5
    add r1, r3, r1, lsl #0x2
    mov r3, #0x1
    bl func_ov002_0227ab74
    mov r0, r5
    bl func_ov002_021bc5e4
    add r1, r5, #0x2
    mov r6, r1, lsl #0x1
    add r7, r4, #0x8
    ldrh r3, [r7, r6]
    mov r1, #0x1
    mov r2, r5, lsl #0x1
    orr r0, r3, r1, lsl r0
    strh r0, [r7, r6]
    ldrh r1, [r7, r2]
    add r0, r4, r5, lsl #0x1
    sub r1, r1, #0x1
    strh r1, [r7, r2]
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    movne r0, #0x7c
    moveq r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_344:
    ldrh r1, [r4]
    rsb r0, r5, #0x1
    mov r2, #0x1
    bl func_ov002_0226afc0
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_35c:
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_021e26d0
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x2
    movlt r0, #0x7e
    movge r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_388:
    mov r5, #0x0
.L_38c:
    ldr r0, [r6, #0xcec]
    eor r0, r0, r5
    add r1, r4, r0, lsl #0x1
    ldrh r1, [r1, #0xc]
    bl func_ov002_021d8750
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_38c
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3b8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x001f001f
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf098
_LIT6: .word data_ov002_022d0d8c
