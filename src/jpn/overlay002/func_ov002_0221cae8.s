; func_ov002_0221cae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cdba8
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021b98d4
        .extern func_ov002_021b9ac0
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021bc538
        .extern func_ov002_021c3304
        .extern func_ov002_021ca1d8
        .extern func_ov002_021de8e4
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0223b378
        .extern func_ov002_0223bbc4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_022535a4
        .extern func_ov002_02257564
        .extern func_ov002_0227acc8
        .global func_ov002_0221cae8
        .arm
func_ov002_0221cae8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    ldrh r2, [r4, #0x4]
    and r7, r0, #0xff
    and r8, r3, #0xff
    mov r1, r2, lsl #0x1d
    movs r0, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x7b
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_2f4
    b .L_2e8
    b .L_2a0
    b .L_27c
    b .L_2f4
    b .L_198
    b .L_68
.L_68:
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_02257564
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r7, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r5, r8, r0
    add r6, r2, #0x30
    ldr r1, [r6, r5]
    mov r0, r4
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    strh r1, [r4, #0xa]
    ldr r3, [r6, r5]
    mov r1, r7
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r3, r2, r3, lsr #0x1f
    mov r2, r8
    strh r3, [r4, #0xc]
    bl func_ov002_021de8e4
    add r0, r6, r5
    bl func_ov002_021b9ac0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r4, #0xa]
    bl func_ov002_0223b378
    ldrh r3, [r4, #0x2]
    ldrh r1, [r4]
    ldrh r2, [r4, #0xc]
    mov r3, r3, lsl #0x1f
    mov r5, r0
    mov r0, r3, lsr #0x1f
    bl func_ov002_022535a4
    strh r0, [r4, #0xe]
    ldrh r1, [r4, #0xe]
    cmp r1, r5
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r4, #0xa]
    ldr r2, _LIT3
    bl func_ov002_0223bbc4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT4
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_190
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT5
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bad9c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_190:
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_198:
    ldrh r6, [r4, #0xe]
    mov r5, #0x0
    cmp r6, #0x0
    ble .L_208
    ldr r7, _LIT3
.L_1ac:
    ldr r1, [r7]
    ldrh r2, [r4, #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x1f
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    mov r0, r3, lsr #0x1f
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021b98d4
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021c3304
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r5, r5, #0x1
    cmp r5, r6
    add r7, r7, #0x4
    blt .L_1ac
.L_208:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, r6
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_26c
    ldr r0, _LIT7
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_274
.L_26c:
    mov r0, #0x59
    bl func_ov002_021ae3a4
.L_274:
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_27c:
    ldr r0, _LIT7
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2a4c
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2a0:
    ldrh r0, [r4, #0x2]
    ldr r1, [r1, #0x5ac]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    add r1, r2, r1, lsl #0x2
    mov r0, r0, lsr #0x1f
    mov r2, #0x1
    mov r3, #0x0
    ldrh r4, [r4, #0xe]
    bl func_ov002_0227acc8
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, r4
    movlt r0, #0x7c
    movge r0, #0x7b
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2e8:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2f4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cdba8
_LIT4: .word 0x0000159d
_LIT5: .word 0x0000158b
_LIT6: .word data_ov002_022cd664
_LIT7: .word data_ov002_022d008c
