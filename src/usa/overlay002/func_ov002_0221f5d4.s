; func_ov002_0221f5d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd34c
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern func_ov002_021be3c0
        .extern func_ov002_021bf1b4
        .extern func_ov002_021c023c
        .extern func_ov002_021c026c
        .extern func_ov002_021c1d64
        .extern func_ov002_021d46ac
        .extern func_ov002_021d6718
        .extern func_ov002_021e2be4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_0226b114
        .global func_ov002_0221f5d4
        .arm
func_ov002_0221f5d4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_820
    b .L_80c
    b .L_6e8
    b .L_5bc
    b .L_448
.L_448:
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT1
    ldr r1, [r1, #0xd0]
    tst r1, #0x1
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r1, r1, lsr #0x1
    tst r1, #0x1
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r5, #0x0
    mov r2, r5
    mov r1, #0x1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_4e8
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_0223dda4
    and r3, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    ldr r0, _LIT2
    ldr r1, _LIT3
    and r3, r3, #0x1
    mla r1, r3, r0, r1
    and r2, r2, #0xff
    mov r0, #0x14
    smulbb r0, r2, r0
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    movne r5, #0x1
.L_4e8:
    cmp r5, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_5b0
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r5, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, asr #0x8
    ldr r0, _LIT2
    ldr r1, _LIT3
    and r2, r5, #0x1
    mla r1, r2, r0, r1
    and r6, r3, #0xff
    mov r0, #0x14
    smulbb r0, r6, r0
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    beq .L_5b0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021c1d64
    cmp r0, #0x0
    bne .L_5b0
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x1b
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d46ac
    mov r0, #0x1
    mov r1, #0x0
    bl func_ov002_021e2be4
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_5b0:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_5bc:
    ldr r1, _LIT4
    ldr r5, [r1, #0x20]
    cmp r5, #0x5
    bge .L_62c
    ldr r2, [r1, #0x4]
    ldr r3, _LIT5
    ldr r0, _LIT2
    and r2, r2, #0x1
    mla r3, r2, r0, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r2, r3, #0x30
    ldr r1, [r1]
    ldr r2, [r2, r0]
    rsb r3, r1, #0x1
    mov r1, r2, lsl #0x2
    mov r0, #0x38
    mul r5, r3, r0
    mov r1, r1, lsr #0x18
    ldr r3, _LIT6
    mov r0, r1, lsl #0x1
    mov r2, r2, lsl #0x12
    ldr r1, [r3, r5]
    add r0, r0, r2, lsr #0x1f
    cmp r1, r0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_62c:
    mov r0, r4
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_6dc
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_0223dda4
    and r5, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    ldr r0, _LIT2
    and r1, r5, #0x1
    mul r8, r1, r0
    ldr r1, _LIT3
    and r6, r2, #0xff
    mov r0, #0x14
    smulbb r7, r6, r0
    add r0, r1, r8
    ldrh r0, [r7, r0]
    cmp r0, #0x0
    beq .L_6dc
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021c1d64
    cmp r0, #0x0
    bne .L_6dc
    ldr r0, _LIT7
    add r0, r0, r8
    ldrh r0, [r7, r0]
    cmp r0, #0x0
    beq .L_6d0
    mov r3, #0x0
    mov r0, r4
    mov r1, r5
    mov r2, r6
    str r3, [sp]
    bl func_ov002_021d6718
.L_6d0:
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_6dc:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_6e8:
    mov r1, #0x1
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r5, r0, #0xff
    and r4, r1, #0xff
    mov r0, r5
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_021be3c0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT4
    ldr r3, [r0, #0x20]
    cmp r3, #0x5
    blt .L_798
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c023c
    cmp r0, #0x0
    bne .L_768
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021c026c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_768:
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x1a
    mov r0, r0, lsl #0x10
    mov r1, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d46ac
    b .L_800
.L_798:
    mov r1, #0x0
    str r1, [sp]
    ldr r2, [r0, #0x4]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bf1b4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT4
    cmp r5, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r2, [r0, #0x20]
    ldr r3, [r0, #0x4]
    orr r1, r1, #0x19
    mov r0, r1, lsl #0x10
    mov r1, r4, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
.L_800:
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_80c:
    mov r0, #0x0
    bl func_ov002_0226b114
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_820:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf0c4
_LIT4: .word data_ov002_022cd314
_LIT5: .word data_ov002_022cf08c
_LIT6: .word data_ov002_022cd34c
_LIT7: .word data_ov002_022cf0c2
