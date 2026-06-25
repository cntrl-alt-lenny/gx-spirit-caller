; func_ov002_021fc3e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_02031470
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021baca8
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .extern func_ov002_021bd110
        .extern func_ov002_021fc818
        .extern func_ov002_021fd270
        .global func_ov002_021fc3e8
        .arm
func_ov002_021fc3e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl]
    mov r9, r1
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl, #0x2]
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    ldreq r0, _LIT1
    moveq r1, #0x4
    streq r1, [r0, #0xd80]
    ldrh r0, [sl, #0x2]
    bic r0, r0, #0x3000
    strh r0, [sl, #0x2]
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x11
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    ldrh r0, [sl]
    bne .L_238
    bl func_0202e234
    cmp r0, #0x0
    ldrh r0, [sl]
    beq .L_b4
    bl func_02031470
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl]
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_33c
    ldrh r0, [sl, #0x2]
    bic r0, r0, #0x3000
    orr r0, r0, #0x2000
    strh r0, [sl, #0x2]
    b .L_33c
.L_b4:
    bl func_0202b878
    cmp r0, #0x16
    ldrh r0, [sl, #0x2]
    ldrh r1, [sl]
    bne .L_13c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd110
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    ldrh r1, [sl, #0x2]
    ldr r2, [r0, #0xcec]
    mov r0, r1, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl]
    bl func_0202b8c0
    cmp r0, #0x0
    bne .L_124
    ldr r0, _LIT1
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    cmpne r0, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_124:
    ldr r0, _LIT3
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_33c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13c:
    mov r0, r0, lsl #0x1f
    mov r6, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd110
    cmp r0, #0x0
    moveq r0, r6
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    ldr r2, _LIT4
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    ldrh r0, [sl, #0x2]
    ldr r2, _LIT5
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    movne r6, #0x1
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1bc
    ldrh r0, [sl, #0x2]
    ldr r2, _LIT5
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    moveq r6, #0x1
.L_1bc:
    ldrh r0, [sl, #0x2]
    ldr r5, _LIT6
    ldr r1, [r5, #0x4]
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    bne .L_228
    ldr r8, _LIT7
    mov r7, #0x0
    ldr r0, [r8, #0x5d4]
    cmp r0, #0x0
    bls .L_228
    ldr fp, _LIT8
    mov r4, r8
.L_1f0:
    ldrb r0, [r8, #0x5dc]
    cmp r0, #0x12
    bne .L_214
    ldr r0, [r5, #0x4]
    ldr r1, [r5, #0x20]
    mov r2, fp
    bl func_ov002_021baca8
    cmp r0, #0x0
    movne r6, #0x1
.L_214:
    ldr r0, [r4, #0x5d4]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x1
    bcc .L_1f0
.L_228:
    cmp r6, #0x0
    bne .L_33c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_238:
    bl func_0202e234
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x1a
    mov r4, r1, lsr #0x1b
    cmp r4, #0x5
    movcc r0, #0x0
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    ldr r1, _LIT9
    mov r0, #0x14
    mul r3, r2, r1
    mul r2, r4, r0
    ldr r1, _LIT10
    add r0, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT11
    add r0, r0, r3
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x14
    tst r0, #0x1
    beq .L_33c
    ldrh r0, [sl]
    bl func_0202b878
    cmp r0, #0x17
    bne .L_304
    ldrh r0, [sl, #0x2]
    ldr r1, _LIT12
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bae7c
    cmp r0, #0x0
    bne .L_304
    ldrh r1, [sl, #0x2]
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    ldreq r0, _LIT1
    moveq r1, #0x1
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_304:
    ldrh r0, [sl]
    bl func_0202b8c0
    cmp r0, #0x5
    bne .L_33c
    ldrh r1, [sl, #0x2]
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    ldreq r0, _LIT1
    moveq r1, #0x1
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_33c:
    ldr r6, _LIT7
    ldr r0, [r6, #0x5d4]
    cmp r0, #0x0
    bne .L_37c
    mov r0, sl
    mov r1, r9
    bl func_ov002_021fc818
    cmp r0, #0x0
    beq .L_3f4
    mov r0, sl
    mov r1, r9
    bl func_ov002_021fd270
    cmp r0, #0x0
    beq .L_3f4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_37c:
    cmp r0, #0x0
    mov r5, #0x0
    bls .L_3f4
    mov r4, r6
    mov r7, r6
.L_390:
    ldrh r2, [sl, #0x2]
    ldrb r1, [r6, #0x5dc]
    add r0, r4, r5, lsl #0x2
    bic r2, r2, #0xfc0
    mov r1, r1, lsl #0x1a
    orr r1, r2, r1, lsr #0x14
    strh r1, [sl, #0x2]
    ldr r2, [r0, #0x5fc]
    mov r0, sl
    mov r1, r9
    str r2, [sl, #0x14]
    bl func_ov002_021fc818
    cmp r0, #0x0
    beq .L_3e0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021fd270
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3e0:
    ldr r0, [r7, #0x5d4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x1
    bcc .L_390
.L_3f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000fee
_LIT3: .word 0x00001390
_LIT4: .word 0x000014a5
_LIT5: .word 0x0000198a
_LIT6: .word data_ov002_022cd3f4
_LIT7: .word data_ov002_022ce288
_LIT8: .word 0x000018f5
_LIT9: .word 0x00000868
_LIT10: .word data_ov002_022cf1a4
_LIT11: .word data_ov002_022cf1ac
_LIT12: .word 0x0000146f
