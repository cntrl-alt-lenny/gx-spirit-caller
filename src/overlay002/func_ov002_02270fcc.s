; func_ov002_02270fcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c85f8
        .extern data_ov002_022cd300
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b9830
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021bc8c8
        .global func_ov002_02270fcc
        .arm
func_ov002_02270fcc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r3, _LIT0
    ldr r5, _LIT1
    ldrb r6, [r3, #0x8]
    ldr r4, [r3]
    str r1, [sp]
    ldr r1, [r5, r6, lsl #0x2]
    mov r3, r4, lsl #0x1f
    mov sl, r0
    mov r0, r3, lsr #0x1f
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r6, #0x0
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_148
    ldr r4, _LIT0
    mov r6, #0x1
    ldrb r0, [r4, #0x8]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_b4
    mov r7, r5
.L_60:
    add r0, r4, r5, lsl #0x1
    ldrh r0, [r0, #0xa]
    bl func_ov002_021b9830
    movs r2, r0
    bmi .L_a4
    ldr r1, [r4]
    and r0, r2, #0xff
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_a4
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    bl func_ov002_021bc288
    cmp r0, #0x0
    movne r6, r7
.L_a4:
    ldrb r0, [r4, #0x8]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_60
.L_b4:
    add r9, r0, #0x1
    cmp r9, #0x3
    bge .L_148
    ldr r5, _LIT1
    ldr r4, _LIT0
    mov fp, #0x0
.L_cc:
    ldr r8, [r5, r9, lsl #0x2]
    mov r7, fp
.L_d4:
    ldr r0, [r4]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b9ecc
    cmp r8, r0
    bne .L_130
    ldr r0, [r4]
    mov r2, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    beq .L_130
    ldr r0, [r4]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc288
    cmp r0, #0x0
    movne r6, #0x0
    bne .L_13c
.L_130:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_d4
.L_13c:
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_cc
.L_148:
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    add r4, r1, r0
    cmp r4, #0x4
    bgt .L_230
    ldr r0, _LIT0
    mov r1, sl
    ldr r0, [r0]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp sl, r0, lsr #0x1f
    beq .L_1c8
    ldr r0, _LIT2
    mov r1, #0x14
    ldr r2, _LIT3
    and r3, sl, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c8:
    mov r0, sl
    mov r1, r4
    bl func_ov002_021b9ecc
    ldr r1, [sp, #0x8]
    cmp r1, r0
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, #0x0
    beq .L_224
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp sl, r0, lsr #0x1f
    bne .L_218
    mov r0, sl
    mov r1, r4
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_224
.L_218:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_224:
    add sp, sp, #0xc
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_230:
    cmp r6, #0x0
    bne .L_28c
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp sl, r0, lsr #0x1f
    moveq r0, r1
    cmpeq r0, #0xb
    bne .L_28c
    ldr r0, _LIT2
    ldr r1, _LIT4
    and r2, sl, #0x1
    mla r1, r2, r0, r1
    ldr r0, [sp, #0x4]
    add r0, r1, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r1, r0, lsl #0x13
    ldr r0, [sp, #0x8]
    add sp, sp, #0xc
    cmp r0, r1, lsr #0x13
    movne r0, #0x0
    moveq r0, #0x800
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_28c:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022c85f8
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word data_ov002_022cf16c
