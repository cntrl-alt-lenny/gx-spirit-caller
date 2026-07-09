; func_ov002_02226484 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d0170
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021b939c
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c1008
        .extern func_ov002_021d80e4
        .extern func_ov002_021d8384
        .extern func_ov002_021de390
        .extern func_ov002_021de588
        .extern func_ov002_021e267c
        .extern func_ov002_021e2ca4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02226484
        .arm
func_ov002_02226484:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x12
    movs r1, r1, lsr #0x1e
    bne .L_440
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_434
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r6, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_434
    ldr r0, _LIT0
    and r1, r6, #0x1
    mul sl, r1, r0
    mov r0, #0x14
    mul r9, r7, r0
    ldr r1, _LIT1
    mov r2, r7
    add r0, r1, sl
    add r5, r0, #0x30
    ldr r8, [r5, r9]
    mov r0, r4
    mov r1, r8, lsl #0x2
    mov r3, r1, lsr #0x18
    mov ip, r8, lsl #0x12
    mov r8, r3, lsl #0x1
    mov r1, r6
    mov r3, #0x2000
    add r8, r8, ip, lsr #0x1f
    bl func_ov002_021de588
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r5, r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_434
    ldr r1, _LIT2
    mov r0, r6
    add r3, r1, sl
    mov r1, r7
    mov r2, #0x1
    ldrh r5, [r9, r3]
    bl func_ov002_021c1008
    mov r0, r0, lsl #0x2
    ldrh r1, [r4, #0x2]
    add r0, r0, r8, lsl #0x3
    add r0, r0, r5, lsl #0x1
    add r0, r0, #0x1
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    ldrh r1, [r4]
    mov r2, #0x1
    bl func_ov002_021e267c
.L_434:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_440:
    ldrh r1, [r4]
    ldr r0, _LIT3
    ldr r3, [r4, #0x14]
    cmp r1, r0
    ldrh r0, [r4, #0x2]
    moveq r6, #0x1
    mov r2, r3, lsr #0x2
    mov r1, r3, lsr #0x1
    mov r7, r3, lsr #0x3
    mov r5, r0, lsl #0x1f
    movne r6, #0x0
    mov r0, r7
    eor r6, r6, r5, lsr #0x1f
    and r8, r2, #0x1
    and r9, r1, #0x1
    and sl, r3, #0x1
    bl func_ov002_021b939c
    ldr r1, _LIT4
    ldr r2, _LIT5
    mov r3, r7, lsl #0x2
    ldr r1, [r1, #0x5a8]
    ldrh r2, [r2, r3]
    mov r5, r0
    cmp r1, #0x7f
    mov r0, r2, lsl #0x13
    mov r0, r0, lsr #0x13
    beq .L_530
    cmp r1, #0x80
    bne .L_5a8
    mov r0, r6
    and r4, r5, #0xff
    bl func_ov002_021bc5e4
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, asr #0x8
    ldr r1, _LIT4
    and r2, r2, #0xff
    cmp r2, #0xf
    str r0, [r1, #0x5ac]
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r0, #0x0
    bge .L_508
    mov r0, r4
    mov r1, r7
    bl func_ov002_021d80e4
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_508:
    stmia sp, {r0, sl}
    mov r0, r4
    mov r2, r7
    mov r3, r6
    mov r1, #0xf
    str r9, [sp, #0x8]
    bl func_ov002_021d8384
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_530:
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_558
    ldr r0, _LIT4
    ldrh r3, [r4]
    ldr r1, [r0, #0x5ac]
    mov r0, r6
    mov r2, #0x0
    bl func_ov002_021de390
    b .L_59c
.L_558:
    cmp r6, r8
    beq .L_59c
    ldr r1, _LIT4
    ldr r0, _LIT0
    ldr r1, [r1, #0x5ac]
    mov r2, #0x14
    ldr r3, _LIT6
    and r4, r6, #0x1
    mul r2, r1, r2
    mla r0, r4, r0, r3
    ldr r0, [r2, r0]
    mov r2, #0x0
    tst r0, #0x1
    moveq r3, #0x1
    movne r3, #0x0
    mov r0, r6
    bl func_ov002_021e2ca4
.L_59c:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_5a8:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c2
_LIT3: .word 0x00001a02
_LIT4: .word data_ov002_022ce1a8
_LIT5: .word data_ov002_022d0170
_LIT6: .word data_ov002_022cf0cc
