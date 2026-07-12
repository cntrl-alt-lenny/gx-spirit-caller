; func_ov002_02270094 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202f4ac
        .extern func_020317e4
        .extern func_ov002_021b3414
        .extern func_ov002_021b9dec
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021bc64c
        .extern func_ov002_021bc7e8
        .extern func_ov002_021c8390
        .extern func_ov002_021c8860
        .extern func_ov002_021c92ec
        .global func_ov002_02270094
        .arm
func_ov002_02270094:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add r5, r1, r2
    mov r4, r0
    cmp r5, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr fp, _LIT0
    ldrh r0, [fp, #0x16]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldr r0, [fp]
    beq .L_167c
    mov r0, r0, lsl #0x1f
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    bne .L_19dc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_167c:
    ldr r2, _LIT1
    mov r1, r0, lsl #0x9
    cmp r2, r1, lsr #0x11
    mov r6, r1, lsr #0x11
    bcc .L_1718
    cmp r6, r2
    bcs .L_181c
    sub r1, r2, #0x260
    cmp r6, r1
    bhi .L_16ec
    bcs .L_181c
    ldr r1, _LIT2
    cmp r6, r1
    bhi .L_16dc
    sub r1, r1, #0x5
    subs r1, r6, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_19b4
    b .L_1780
    b .L_1780
    b .L_1780
    b .L_1780
    b .L_1780
    b .L_1780
.L_16dc:
    ldr r0, _LIT3
    cmp r6, r0
    beq .L_181c
    b .L_19b4
.L_16ec:
    sub r1, r2, #0x25c
    cmp r6, r1
    bhi .L_1708
    mov r0, r1
    cmp r6, r0
    beq .L_181c
    b .L_19b4
.L_1708:
    sub r1, r2, #0x39
    cmp r6, r1
    beq .L_185c
    b .L_19b4
.L_1718:
    ldr r2, _LIT4
    cmp r6, r2
    bhi .L_1750
    bcs .L_1908
    sub r1, r2, #0x110
    cmp r6, r1
    bhi .L_1744
    mov r0, r1
    cmp r6, r0
    beq .L_181c
    b .L_19b4
.L_1744:
    cmp r6, #0x1a40
    beq .L_18ac
    b .L_19b4
.L_1750:
    add r1, r2, #0x98
    cmp r6, r1
    bhi .L_1770
    bcs .L_181c
    add r1, r2, #0x97
    cmp r6, r1
    beq .L_1958
    b .L_19b4
.L_1770:
    add r0, r2, #0x99
    cmp r6, r0
    beq .L_181c
    b .L_19b4
.L_1780:
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_19b4
    mov r7, #0x0
    mov r6, #0x5
    mov r8, #0x64
.L_1798:
    ldr r3, [fp]
    ldr r1, _LIT5
    mov r0, r3, lsl #0x1f
    mov r9, r0, lsr #0x1f
    ldr r0, _LIT6
    and r2, r9, #0x1
    mla sl, r2, r1, r0
    mov r0, r3, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_020317e4
    add r2, sl, r8
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    bne .L_17fc
    ldrh r0, [r2, #0x38]
    cmp r0, #0x0
    beq .L_17fc
    mov r0, r4
    mov r1, r5
    mov r2, r9
    mov r3, r6
    bl func_ov002_021b3414
    cmp r0, #0x0
    moveq r7, #0x1
.L_17fc:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r8, r8, #0x14
    blt .L_1798
    cmp r7, #0x0
    bne .L_19b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_181c:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8860
    mov r7, r0
    mov r0, r6
    bl func_0202b824
    cmp r7, r0
    beq .L_19b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_185c:
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_1890
    ldr r0, _LIT5
    mov r1, #0x14
    ldr r2, _LIT7
    and r3, r4, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1890:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8390
    cmp r0, #0x7d0
    bge .L_19b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18ac:
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_18e0
    ldr r0, _LIT5
    mov r1, #0x14
    ldr r2, _LIT7
    and r3, r4, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18e0:
    mov r0, r6
    bl func_0202b83c
    mov r2, r0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c92ec
    cmp r0, #0x0
    bne .L_19b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1908:
    ldrh r1, [fp, #0x6]
    cmp r1, r6
    bne .L_19b4
    mov r0, r0, lsl #0x1f
    mov r3, r0, lsr #0x1f
    cmp r4, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT5
    ldr r1, _LIT6
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x12
    cmp r3, r0, lsr #0x1f
    bne .L_19b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1958:
    ldrh r1, [fp, #0x6]
    cmp r1, r6
    bne .L_19b4
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_1998
    ldr r0, _LIT5
    mov r1, #0x14
    ldr r2, _LIT7
    and r3, r4, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1998:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    bl func_0202f4ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19b4:
    ldr r0, _LIT0
    mov r1, r4
    ldr r0, [r0]
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc64c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19dc:
    ldr r1, _LIT0
    ldrb r6, [r1, #0x8]
    cmp r6, #0x0
    bne .L_1a34
    ldr r0, [r1]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_1a74
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    bne .L_1a2c
    mov r0, r4
    mov r1, r5
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    bne .L_1a74
.L_1a2c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a34:
    cmp r6, #0x0
    mov r3, #0x0
    ble .L_1a74
    and r2, r4, #0xff
    and r0, r5, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
.L_1a54:
    add r0, r1, r3, lsl #0x1
    ldrh r0, [r0, #0x10]
    cmp r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r3, r3, #0x1
    cmp r3, r6
    blt .L_1a54
.L_1a74:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x00001985
_LIT2: .word 0x0000164f
_LIT3: .word 0x000016ec
_LIT4: .word 0x00001a96
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf08c
_LIT7: .word data_ov002_022cf0c4
