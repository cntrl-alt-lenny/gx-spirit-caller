; func_ov002_022b1764 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0e4c
        .extern func_0201174c
        .extern func_02034734
        .extern func_ov002_022b02b8
        .extern func_ov002_022b12b0
        .global func_ov002_022b1764
        .arm
func_ov002_022b1764:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    cmp r1, #0x74
    bgt .L_380
    bge .L_584
    cmp r1, #0xb
    addls pc, pc, r1, lsl #0x2
    b .L_614
    b .L_614
    b .L_38c
    b .L_450
    b .L_4c8
    b .L_4d0
    b .L_614
    b .L_4f8
    b .L_614
    b .L_614
    b .L_614
    b .L_524
    b .L_41c
.L_380:
    cmp r1, #0x75
    beq .L_5cc
    b .L_614
.L_38c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    blt .L_3ac
    bl func_02034734
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_3ac:
    ldr r0, _LIT1
    ldr r1, [r0, #0xd00]
    cmp r1, #0x1
    bne .L_414
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    beq .L_414
    ldr r0, _LIT0
    ldr r0, [r0, #0xba4]
    bl func_0201174c
    ldr r1, _LIT2
    ldr r1, [r1, #0xa64]
    and r1, r1, #0x1f00000
    mov r1, r1, lsr #0x14
    cmp r1, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT3
    ldr r2, _LIT4
    ldrh r1, [r1, #0x98]
    mov r1, r1, lsl #0x2
    add r1, r1, #0x66
    mul r3, r0, r1
    smull r1, r0, r2, r3
    mov r1, r3, lsr #0x1f
    add r0, r1, r0, asr #0x5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_414:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_41c:
    ldr r0, _LIT1
    ldr r1, [r0, #0xd00]
    cmp r1, #0x1
    bne .L_448
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    beq .L_448
    ldr r0, _LIT0
    ldr r0, [r0, #0xba4]
    bl func_0201174c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_448:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_450:
    ldr r0, _LIT0
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    blt .L_470
    bl func_02034734
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_470:
    ldr r0, _LIT5
    ldr r0, [r0, #0xcc]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT1
    ldr r1, [r0, #0xd00]
    cmp r1, #0x1
    bne .L_4c0
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    beq .L_4c0
    ldr r0, _LIT0
    ldr r0, [r0, #0xba4]
    bl func_0201174c
    ldr r3, _LIT6
    mov r1, r0, lsr #0x1f
    smull r2, r0, r3, r0
    add r0, r1, r0, asr #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4d0:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT0
    mov r0, #0x96
    ldr r1, [r1, #0xba4]
    mul r0, r1, r0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4f8:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd00]
    cmp r0, #0x3
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0xba4]
    bl func_0201174c
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_524:
    ldr r0, [r6, #0x8]
    mov r5, #0x0
    mov r4, r5
    cmp r0, #0x0
    bls .L_578
    ldr r8, _LIT0
    ldr r7, _LIT3
.L_540:
    bl func_02034734
    cmp r0, #0x2
    bne .L_55c
    ldr r0, [r8, #0xbac]
    cmp r0, #0x0
    ldrlth r1, [r7, #0x58]
    blt .L_560
.L_55c:
    ldrh r1, [r7, #0x52]
.L_560:
    ldr r0, [r6, #0x8]
    sub r1, r1, r4
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, r1
    bcc .L_540
.L_578:
    mov r0, #0x64
    mul r0, r5, r0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_584:
    ldr r0, [r6, #0x24]
    mov r4, #0x0
    mov r5, r4
    cmp r0, #0x0
    ble .L_5c0
.L_598:
    add r0, r6, r5, lsl #0x1
    ldrh r0, [r0, #0x94]
    sub r0, r0, #0x4
    bl func_ov002_022b02b8
    cmp r0, #0x0
    ldr r0, [r6, #0x24]
    add r5, r5, #0x1
    addne r4, r4, #0x1
    cmp r5, r0
    blt .L_598
.L_5c0:
    mov r0, #0x32
    mul r0, r4, r0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_5cc:
    ldr r0, _LIT2
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0x1
    ldrne r0, [r6, #0x58]
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT3
    ldr r1, [r6, #0x58]
    ldrh r0, [r0, #0x80]
    ldr r2, _LIT4
    mov r0, r0, lsl #0x2
    add r0, r0, #0x66
    mul r3, r1, r0
    smull r1, r0, r2, r3
    mov r1, r3, lsr #0x1f
    add r0, r1, r0, asr #0x5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_614:
    sub r0, r1, #0x4
    bl func_ov002_022b12b0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_02104e6c
_LIT3: .word data_0210586c
_LIT4: .word 0x51eb851f
_LIT5: .word data_ov002_022d0e4c
_LIT6: .word 0x66666667
