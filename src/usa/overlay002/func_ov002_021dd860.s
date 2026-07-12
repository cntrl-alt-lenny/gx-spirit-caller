; func_ov002_021dd860 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce85c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b38e4
        .extern func_ov002_021b3dec
        .extern func_ov002_021babc8
        .extern func_ov002_021baf88
        .extern func_ov002_021c1c48
        .extern func_ov002_021c1d40
        .extern func_ov002_021d46ac
        .extern func_ov002_021d9738
        .extern func_ov002_021dcb58
        .extern func_ov002_021dd860
        .extern func_ov002_02244efc
        .global func_ov002_021dd860
        .arm
func_ov002_021dd860:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov r9, r0
    and r0, r9, #0x1
    ldr r4, _LIT0
    mov r6, r3
    mul sl, r0, r4
    str r0, [sp, #0x14]
    ldr r4, _LIT1
    mov r8, r1
    mov r0, #0x14
    add r1, r4, sl
    mul r4, r8, r0
    add r0, r1, #0x30
    str r0, [sp, #0x24]
    ldr r0, [r0, r4]
    mov r7, r2
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    tst r6, #0x10000
    str r0, [sp, #0x20]
    ldr r5, [sp, #0x50]
    bne .L_1a90
    mov r0, r5
    bl func_0202b824
    cmp r0, #0x16
    bne .L_1a54
    and r0, r6, #0x1
    cmp r0, #0x0
    movgt r2, #0x1
    movle r2, #0x0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c1c48
    cmp r0, #0x0
    beq .L_1a90
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a54:
    mov r0, r5
    bl func_0202b824
    cmp r0, #0x17
    bne .L_1a90
    and r0, r6, #0x1
    cmp r0, #0x0
    movgt r2, #0x1
    movle r2, #0x0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c1d40
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a90:
    cmp r8, #0x4
    bgt .L_1afc
    tst r6, #0x2
    beq .L_1afc
    ldr r2, _LIT2
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    beq .L_1afc
    mov r0, r9
    mov r1, r8
    mov r2, #0x1
    bl func_ov002_021b38e4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    mov r4, #0x0
    and r0, r0, #0xff
    and r1, r1, #0xff
    mov r2, #0xe
    mov r3, #0x2
    str r4, [sp]
    bl func_ov002_021dd860
    add sp, sp, #0x2c
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1afc:
    cmp r8, #0x5
    blt .L_1b30
    tst r6, #0x2
    cmpne r5, #0x0
    beq .L_1b30
    ldr r2, _LIT3
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b3dec
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b30:
    cmp r7, #0xe
    cmpne r7, #0xf
    beq .L_1b6c
    ldr r0, _LIT4
    add r0, r0, sl
    ldr r0, [r4, r0]
    mov r0, r0, lsr #0x3
    tst r0, #0x1
    ldrne r0, _LIT5
    cmpne r5, r0
    ldrne r0, _LIT6
    cmpne r5, r0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b6c:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_2154
    ldr r0, _LIT7
    add r1, r8, r9, lsl #0x4
    ldr r0, [r0, #0xd4]
    mov fp, #0x1
    tst r0, fp, lsl r1
    mov r0, fp, lsl r1
    str r0, [sp, #0x18]
    bne .L_2154
    ldr r1, _LIT0
    ldr r0, [sp, #0x14]
    mov r2, #0x14
    mul r1, r0, r1
    mul r0, r8, r2
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r1, _LIT1
    ldr r0, [sp, #0xc]
    tst r6, #0x1
    add r0, r1, r0
    add r1, r0, #0x30
    ldr r0, [sp, #0x10]
    moveq fp, #0x0
    ldr r0, [r1, r0]
    tst r6, #0x8
    mov r1, r0, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    moveq sl, #0x1
    movne sl, #0x0
    str r0, [sp, #0x1c]
    cmp r7, #0xe
    bne .L_1c18
    ldr r0, [sp, #0x20]
    bl func_0202e2a4
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x8]
    beq .L_1c20
.L_1c18:
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_1c20:
    tst r6, #0x2
    movne r0, #0x1
    strne r0, [sp, #0x4]
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    add r1, sp, #0x28
    mov r0, #0x0
    cmp r7, #0xe
    str r0, [r1]
    bne .L_1cb0
    ldr r0, _LIT7
    ldr r0, [r0, #0xd8]
    tst r0, #0x1
    movne r7, #0xf
    tst r0, #0x2
    beq .L_1c70
    ldr r0, [sp, #0x20]
    bl func_0202e1e0
    cmp r0, #0x0
    movne r7, #0xf
.L_1c70:
    ldr r0, _LIT7
    ldr r1, [r0, #0xd8]
    tst r1, #0x4
    beq .L_1c8c
    ldr r0, [sp, #0x1c]
    tst r0, #0x1
    moveq r7, #0xf
.L_1c8c:
    tst r1, #0x8
    beq .L_1ca4
    ldr r0, [sp, #0x1c]
    and r0, r0, #0x1
    cmp r0, #0x1
    moveq r7, #0xf
.L_1ca4:
    cmp r7, #0xf
    moveq r0, #0x0
    streq r0, [sp, #0x8]
.L_1cb0:
    cmp sl, #0x0
    beq .L_1ce0
    cmp r7, #0xa
    ble .L_1ce0
    ldr r2, _LIT8
    mov r0, r9
    mov r1, r8
    bl func_ov002_021babc8
    cmp r0, #0x0
    movne r0, #0x0
    movne r7, #0xf
    strne r0, [sp, #0x8]
.L_1ce0:
    mov r0, r5
    bl func_0202b86c
    cmp r0, #0x6
    bne .L_1d08
    ldr r0, _LIT9
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    movne r7, #0xd
    strne r0, [sp, #0x8]
.L_1d08:
    cmp sl, #0x0
    beq .L_1d38
    cmp r7, #0xb
    bne .L_1d38
    ldr r0, [sp, #0x20]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_1d38
    ldr r0, _LIT10
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r7, #0xf
.L_1d38:
    mov r1, #0x200
    ldr r0, [sp, #0x28]
    rsb r1, r1, #0x0
    and r2, r0, r1
    ldr r0, [sp, #0x1c]
    ldr r3, _LIT11
    and r0, r0, r1, lsr #0x17
    orr r0, r2, r0
    bic r1, r0, #0x200
    mov r0, r9, lsl #0x1f
    orr r0, r1, r0, lsr #0x16
    bic r1, r0, #0x3c00
    mov r0, r8, lsl #0x1c
    orr r0, r1, r0, lsr #0x12
    bic r2, r0, #0x4000
    ldr r1, _LIT12
    ldr r0, [sp, #0xc]
    cmp sl, #0x0
    add r1, r1, r0
    add r0, r3, r0
    ldr r3, [sp, #0x10]
    ldrh r1, [r3, r1]
    ldrh r3, [r3, r0]
    eor r0, r9, fp
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x11
    bic r2, r1, #0x20000
    mov r1, r3, lsl #0x1f
    orr r1, r2, r1, lsr #0xe
    bic r1, r1, #0x40000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0xd
    bic r1, r0, #0x8000
    ldr r0, [sp, #0x4]
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    str r0, [sp, #0x28]
    moveq r0, #0x1
    movne r0, #0x0
    ldr r2, [sp, #0x28]
    mov r1, r0, lsl #0x1f
    bic r2, r2, #0x800000
    orr r1, r2, r1, lsr #0x8
    mov r0, r7, lsl #0x1c
    bic r1, r1, #0x780000
    orr r0, r1, r0, lsr #0x9
    str r0, [sp, #0x28]
    ldr r1, _LIT7
    ldr r0, [sp, #0x18]
    ldr r2, [r1, #0xd4]
    tst r6, #0x30
    orr r0, r2, r0
    str r0, [r1, #0xd4]
    beq .L_1e58
    ldr r1, [sp, #0x28]
    ldr r2, _LIT13
    cmp r9, #0x0
    movne r0, #0x8000
    mov r1, r1, lsl #0x17
    moveq r0, #0x0
    mov r1, r1, lsr #0x17
    ldr r2, [r2, r8, lsl #0x2]
    orr r0, r0, #0x4c
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d46ac
.L_1e58:
    tst r6, #0x1000
    beq .L_1ea4
    ldr r0, [sp, #0x28]
    cmp r9, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x17
    mov r3, r0, lsr #0x17
    orr r1, r1, #0x46
    mov r0, r1, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r2, r7, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    b .L_20d4
.L_1ea4:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1f14
    ldr r1, [sp, #0x28]
    cmp r9, #0x0
    mov r2, r1, lsl #0x8
    mov r2, r2, lsr #0x1f
    and r3, fp, #0xf
    and r2, r2, #0xf
    movne r0, #0x8000
    orr r2, r3, r2, lsl #0x4
    moveq r0, #0x0
    mov r1, r1, lsl #0x17
    mov r3, r1, lsr #0x17
    orr r0, r0, #0x31
    mov r0, r0, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r3, r3, lsl #0x10
    and sl, r7, #0xff
    and r2, r2, #0xff
    orr r2, sl, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    b .L_20d4
.L_1f14:
    cmp r7, #0xa
    bgt .L_1f7c
    and r0, r6, #0x40000
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    eor r2, r9, r0
    cmp r9, #0x0
    movne r3, #0x8000
    moveq r3, #0x0
    and r1, r9, #0xff
    and r0, r8, #0xff
    orr r1, r1, r0, lsl #0x8
    orr r3, r3, #0x3d
    mov r0, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    and r3, r7, #0xff
    and r2, r2, #0xff
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
    b .L_20d4
.L_1f7c:
    ldr r0, [sp, #0x20]
    bl func_0202e2a4
    cmp r0, #0x0
    beq .L_1fcc
    ldr r0, [sp, #0x28]
    cmp r9, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x17
    mov r2, r0, lsr #0x17
    orr r1, r1, #0x31
    mov r0, r1, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x10
    bl func_ov002_021d46ac
    b .L_20d4
.L_1fcc:
    cmp r7, #0xf
    bne .L_2020
    tst r6, #0x20
    bicne r0, r6, #0x20
    orrne r6, r0, #0x10
    ldr r0, [sp, #0x28]
    cmp r9, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r0, lsl #0x17
    mov r3, r0, lsr #0x17
    orr r1, r1, #0x33
    mov r0, r1, lsl #0x10
    mov r2, r6, lsl #0x10
    mov r3, r3, lsl #0x10
    and r1, r8, #0xff
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    b .L_20d4
.L_2020:
    and r0, r6, #0x40000
    cmp r0, #0x0
    ldr r0, [sp, #0x24]
    movgt r1, #0x1
    ldr r0, [r0, r4]
    movle r1, #0x0
    sub r2, r7, #0xb
    mov r0, r0, lsl #0x12
    eor r0, r1, r0, lsr #0x1f
    cmp r2, #0x3
    mov r1, #0x0
    addls pc, pc, r2, lsl #0x2
    b .L_2094
    b .L_2064
    b .L_207c
    b .L_2084
    b .L_2090
.L_2064:
    ldr r1, _LIT0
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT14
    ldr r1, [r1, r3]
    b .L_2094
.L_207c:
    mov r1, #0x1
    b .L_2094
.L_2084:
    tst r6, #0x800000
    movne r1, #0x1
    b .L_2094
.L_2090:
    mov r1, #0x1
.L_2094:
    and sl, r0, #0x1
    mov r2, r7, lsl #0x1b
    ldr r0, [sp, #0x14]
    mov r3, r8, lsl #0x1b
    orr r0, r0, r3, lsr #0x1a
    mov r3, r6, lsl #0x10
    orr r2, sl, r2, lsr #0x1a
    mov r1, r1, lsl #0x16
    orr r1, r2, r1, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r0, #0x40
    bl func_ov002_021d46ac
.L_20d4:
    cmp r7, #0xa
    ble .L_2120
    cmp r5, #0x0
    movne r3, #0x80000
    add r0, sp, #0x28
    ldr r1, [sp, #0x24]
    moveq r3, #0x0
    ldr r0, [r0]
    mov r2, r5
    add r1, r1, r4
    orr r3, r6, r3
    bl func_ov002_021d9738
    ldr r0, [sp, #0x20]
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_2120
    ldr r1, [sp, #0x28]
    mov r0, #0x1b
    bl func_ov002_02244efc
.L_2120:
    ldr r0, [sp, #0x8]
    mov r1, r9
    cmp r0, #0x0
    movne r3, #0x1400000
    ldr r0, [sp, #0x24]
    moveq r3, #0x0
    mov r2, r8
    add r0, r0, r4
    orr r3, r6, r3
    bl func_ov002_021dcb58
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2154:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00001825
_LIT3: .word 0x00001513
_LIT4: .word data_ov002_022cf0cc
_LIT5: .word 0x000014fb
_LIT6: .word 0x000019e1
_LIT7: .word data_ov002_022d008c
_LIT8: .word 0x000016f8
_LIT9: .word 0x000019da
_LIT10: .word 0x00001afc
_LIT11: .word data_ov002_022cf0c4
_LIT12: .word data_ov002_022cf0c2
_LIT13: .word data_ov002_022ce85c
_LIT14: .word data_ov002_022cf098
