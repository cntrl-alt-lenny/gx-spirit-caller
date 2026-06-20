; func_ov002_022477e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cacc0
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_0202e234
        .extern func_ov002_021bc288
        .extern func_ov002_021bc6c4
        .extern func_ov002_021ca3f0
        .extern func_ov002_02246e5c
        .extern func_ov002_02246ecc
        .extern func_ov002_02246f68
        .extern func_ov002_0224701c
        .extern func_ov002_022470c4
        .global func_ov002_022477e8
        .arm
func_ov002_022477e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl]
    mov r5, r1
    bl func_ov002_02246e5c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02246ecc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT0
    ldrh r1, [sl, #0x2]
    ldr r0, [r4, r5, lsl #0x2]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x13
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x13
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    strh r5, [sl, #0x8]
    ldr r1, [r4, r5, lsl #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsr #0x1a
    str r1, [r0, #0x5ac]
    mov r1, #0xff
    str r1, [r0, #0x5b0]
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc6c4
    cmp r0, #0x0
    bge .L_12c
    mov r6, #0x0
    ldr r5, _LIT2
    ldr r8, _LIT3
    mov r7, r6
    mov r4, r6
.L_b4:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    and r2, r1, #0x1
    mla r0, r2, r8, r5
    add r0, r0, r7
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_114
    mov r0, sl
    mov r2, r4
    mov r3, r6
    bl func_ov002_022470c4
    cmp r0, #0x0
    beq .L_114
    ldrh r0, [sl, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc288
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_114:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    blt .L_b4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12c:
    ldrh r1, [sl]
    ldr r0, _LIT4
    cmp r1, r0
    addne r0, r0, #0x7e
    cmpne r1, r0
    ldrne r0, _LIT5
    cmpne r1, r0
    bne .L_284
    ldr r0, [r4, r5, lsl #0x2]
    mov r7, #0x0
    mov r0, r0, lsl #0x13
    ldr r5, _LIT2
    ldr fp, _LIT3
    mov r6, r0, lsr #0x13
    mov r4, r7
.L_168:
    and r0, r7, #0x1
    mla r1, r0, fp, r5
    mov r8, #0x0
    add r9, r1, #0x30
.L_178:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1a8
    mov r0, sl
    mov r1, r7
    mov r2, r4
    mov r3, r8
    bl func_ov002_022470c4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a8:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r9, r9, #0x14
    blt .L_178
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_168
    ldrh r0, [sl, #0x2]
    ldr fp, _LIT3
    ldr r1, _LIT6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r0, r2, fp
    ldr r1, [r1, r0]
    mov r9, #0x0
    cmp r1, #0x0
    bls .L_2cc
    ldr r5, _LIT2
    mov r8, r9
    mvn r4, #0x0
.L_1fc:
    add r0, r5, r0
    add r0, r0, r8
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_254
    cmp r7, r6
    moveq r6, r4
    beq .L_254
    ldrh r1, [sl, #0x2]
    mov r0, sl
    mov r2, #0xb
    mov r1, r1, lsl #0x1f
    mov r3, r9
    mov r1, r1, lsr #0x1f
    bl func_ov002_022470c4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_254:
    ldrh r0, [sl, #0x2]
    add r9, r9, #0x1
    add r8, r8, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mul r0, r1, fp
    add r1, r5, r0
    ldr r1, [r1, #0xc]
    cmp r9, r1
    bcc .L_1fc
    b .L_2cc
.L_284:
    ldrh r1, [sl, #0x2]
    ldr r0, [r4, r5, lsl #0x2]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x13
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x13
    bl func_ov002_02246f68
    ldrh r1, [sl, #0x2]
    mov r6, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0224701c
    ldr r1, [r4, r5, lsl #0x2]
    add r0, r6, r0
    cmp r0, r1, lsr #0x1a
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cacc0
_LIT1: .word data_ov002_022ce288
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
_LIT4: .word 0x00001698
_LIT5: .word 0x000019d9
_LIT6: .word data_ov002_022cf178
