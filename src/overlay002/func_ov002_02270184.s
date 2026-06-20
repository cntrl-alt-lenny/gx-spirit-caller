; func_ov002_02270184 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202f500
        .extern func_02031838
        .extern func_ov002_021b34f4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021bc72c
        .extern func_ov002_021bc8c8
        .extern func_ov002_021c8470
        .extern func_ov002_021c8940
        .extern func_ov002_021c93cc
        .global func_ov002_02270184
        .arm
func_ov002_02270184:
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
    beq .L_54
    mov r0, r0, lsl #0x1f
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    bne .L_3b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_54:
    ldr r2, _LIT1
    mov r1, r0, lsl #0x9
    cmp r2, r1, lsr #0x11
    mov r6, r1, lsr #0x11
    bcc .L_f0
    cmp r6, r2
    bcs .L_1f4
    sub r1, r2, #0x260
    cmp r6, r1
    bhi .L_c4
    bcs .L_1f4
    ldr r1, _LIT2
    cmp r6, r1
    bhi .L_b4
    sub r1, r1, #0x5
    subs r1, r6, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_38c
    b .L_158
    b .L_158
    b .L_158
    b .L_158
    b .L_158
    b .L_158
.L_b4:
    ldr r0, _LIT3
    cmp r6, r0
    beq .L_1f4
    b .L_38c
.L_c4:
    sub r1, r2, #0x25c
    cmp r6, r1
    bhi .L_e0
    mov r0, r1
    cmp r6, r0
    beq .L_1f4
    b .L_38c
.L_e0:
    sub r1, r2, #0x39
    cmp r6, r1
    beq .L_234
    b .L_38c
.L_f0:
    ldr r2, _LIT4
    cmp r6, r2
    bhi .L_128
    bcs .L_2e0
    sub r1, r2, #0x110
    cmp r6, r1
    bhi .L_11c
    mov r0, r1
    cmp r6, r0
    beq .L_1f4
    b .L_38c
.L_11c:
    cmp r6, #0x1a40
    beq .L_284
    b .L_38c
.L_128:
    add r1, r2, #0x98
    cmp r6, r1
    bhi .L_148
    bcs .L_1f4
    add r1, r2, #0x97
    cmp r6, r1
    beq .L_330
    b .L_38c
.L_148:
    add r0, r2, #0x99
    cmp r6, r0
    beq .L_1f4
    b .L_38c
.L_158:
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    beq .L_38c
    mov r7, #0x0
    mov r6, #0x5
    mov r8, #0x64
.L_170:
    ldr r3, [fp]
    ldr r1, _LIT5
    mov r0, r3, lsl #0x1f
    mov r9, r0, lsr #0x1f
    ldr r0, _LIT6
    and r2, r9, #0x1
    mla sl, r2, r1, r0
    mov r0, r3, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_02031838
    add r2, sl, r8
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    bne .L_1d4
    ldrh r0, [r2, #0x38]
    cmp r0, #0x0
    beq .L_1d4
    mov r0, r4
    mov r1, r5
    mov r2, r9
    mov r3, r6
    bl func_ov002_021b34f4
    cmp r0, #0x0
    moveq r7, #0x1
.L_1d4:
    add r6, r6, #0x1
    cmp r6, #0xa
    add r8, r8, #0x14
    blt .L_170
    cmp r7, #0x0
    bne .L_38c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f4:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8940
    mov r7, r0
    mov r0, r6
    bl func_0202b878
    cmp r7, r0
    beq .L_38c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_234:
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_268
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
.L_268:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    cmp r0, #0x7d0
    bge .L_38c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_284:
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_2b8
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
.L_2b8:
    mov r0, r6
    bl func_0202b890
    mov r2, r0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c93cc
    cmp r0, #0x0
    bne .L_38c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e0:
    ldrh r1, [fp, #0x6]
    cmp r1, r6
    bne .L_38c
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
    bne .L_38c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_330:
    ldrh r1, [fp, #0x6]
    cmp r1, r6
    bne .L_38c
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_370
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
.L_370:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9ecc
    bl func_0202f500
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_38c:
    ldr r0, _LIT0
    mov r1, r4
    ldr r0, [r0]
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc72c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3b4:
    ldr r1, _LIT0
    ldrb r6, [r1, #0x8]
    cmp r6, #0x0
    bne .L_40c
    ldr r0, [r1]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_44c
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    bne .L_404
    mov r0, r4
    mov r1, r5
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_44c
.L_404:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_40c:
    cmp r6, #0x0
    mov r3, #0x0
    ble .L_44c
    and r2, r4, #0xff
    and r0, r5, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
.L_42c:
    add r0, r1, r3, lsl #0x1
    ldrh r0, [r0, #0x10]
    cmp r2, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r3, r3, #0x1
    cmp r3, r6
    blt .L_42c
.L_44c:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x00001985
_LIT2: .word 0x0000164f
_LIT3: .word 0x000016ec
_LIT4: .word 0x00001a96
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf16c
_LIT7: .word data_ov002_022cf1a4
