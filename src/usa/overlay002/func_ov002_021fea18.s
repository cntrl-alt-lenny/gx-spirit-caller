; func_ov002_021fea18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b824
        .extern func_0202e1e0
        .extern func_0202e21c
        .extern func_0202f994
        .extern func_ov002_021b2f34
        .extern func_ov002_021b2f78
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b3014
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3e2c
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b7c74
        .extern func_ov002_021b939c
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bbeb8
        .extern func_ov002_021c9310
        .extern func_ov002_021c9718
        .extern func_ov002_021c97ac
        .extern func_ov002_021fe8d4
        .global func_ov002_021fea18
        .arm
func_ov002_021fea18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldrh r0, [r7]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_2ec
    ldrh r0, [r7]
    bl func_0202e21c
    cmp r0, #0x0
    beq .L_2ec
    ldrh r0, [r7, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r4, r0
    ldrh r0, [r7]
    bl func_0202f994
    cmp r0, #0x1
    bne .L_110
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT1
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0x4
    bhi .L_110
    ldrh r1, [r7, #0x2]
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_110
    mov r0, r4, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    mov r0, r5, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_dc
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r2, _LIT2
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3e2c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_dc:
    mov r0, r5, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_110
    ldrh r0, [r7, #0x2]
    ldr r2, _LIT2
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_110:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    beq .L_264
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    cmp r5, #0x4
    bhi .L_264
    mov r0, r4, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    mov r0, r8, lsl #0x10
    mov r9, r0, lsr #0x10
    and r6, r4, #0xff
    mov r0, r6
    mov r1, r5
    mov r2, r9
    bl func_ov002_021c97ac
    cmp r0, #0x0
    beq .L_264
    ldr r0, _LIT3
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT4
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_1b4
    mov r0, r6
    mov r1, r5
    mov r2, r9
    bl func_ov002_021c9718
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b4:
    mov r0, r8, lsl #0x10
    movs r0, r0, lsr #0x10
    ldr r2, _LIT5
    mov r0, r6
    beq .L_218
    mov r1, r5
    bl func_ov002_021b3e2c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT6
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b3014
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT7
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b2f78
    cmp r0, #0x0
    beq .L_264
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_218:
    mov r1, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT6
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT7
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b2f34
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_264:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    bls .L_280
    cmp r0, #0xa
    bls .L_2a8
.L_280:
    ldrh r0, [r7, #0x2]
    ldr r2, _LIT8
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2a8:
    cmp r4, #0x1000
    beq .L_34c
    mov r0, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r4, lsr #0x10
    mov r1, r1, asr #0x8
    mov r2, r0, lsl #0x10
    and r0, r4, #0xff
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021c9310
    ldr r0, [r0]
    mov r0, r0, lsl #0xa
    movs r0, r0, lsr #0x1f
    beq .L_34c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2ec:
    ldrh r0, [r7]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_34c
    ldrh r0, [r7, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    cmp r0, #0x1000
    beq .L_34c
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r0, lsr #0x10
    mov r3, r2, asr #0x8
    mov r2, r1, lsl #0x10
    and r0, r0, #0xff
    and r1, r3, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021c9310
    ldr r0, [r0]
    mov r0, r0, lsl #0xa
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_34c:
    ldrh r0, [r7, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    bhi .L_39c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbeb8
    cmp r0, #0x3
    bne .L_39c
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT9
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_39c:
    ldrh r0, [r7]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_3d4
    ldrh r0, [r7, #0x2]
    ldr r2, _LIT8
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x2
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3d4:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_3f0
    cmp r0, #0xa
    bls .L_400
.L_3f0:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_420
.L_400:
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021fe8d4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_420:
    ldr r0, _LIT10
    bl func_ov002_021baf88
    cmp r0, #0x0
    ldrneh r1, [r7]
    ldrne r0, _LIT11
    cmpne r1, r0
    beq .L_4a4
    mov r0, r7
    bl func_ov002_021b7c74
    mov r4, r0
    tst r4, #0x1
    beq .L_474
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT12
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bad9c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_474:
    tst r4, #0x2
    beq .L_4a4
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT12
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4a4:
    ldrh r0, [r7, #0x2]
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, #0xe
    bne .L_4d8
    ldr r0, _LIT13
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4d8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000148e
_LIT1: .word 0x000014da
_LIT2: .word 0x00001433
_LIT3: .word 0x0000166c
_LIT4: .word 0x000012bf
_LIT5: .word 0x00001944
_LIT6: .word 0x00001a9b
_LIT7: .word 0x00001a6d
_LIT8: .word 0x00001679
_LIT9: .word 0x00001955
_LIT10: .word 0x0000159d
_LIT11: .word 0x000015ac
_LIT12: .word 0x0000158b
_LIT13: .word 0x000017b9
