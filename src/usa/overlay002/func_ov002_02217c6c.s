; func_ov002_02217c6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdba8
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_0202b854
        .extern func_0202e1e0
        .extern func_ov002_021b90e4
        .extern func_ov002_021bc538
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c97ac
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ca360
        .extern func_ov002_021d81a8
        .extern func_ov002_021d86ec
        .extern func_ov002_021d8750
        .extern func_ov002_021de318
        .extern func_ov002_021deda4
        .extern func_ov002_021df618
        .extern func_ov002_021e1304
        .extern func_ov002_021e2728
        .extern func_ov002_021e27c4
        .extern func_ov002_021e2a2c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0227acc8
        .global func_ov002_02217c6c
        .arm
func_ov002_02217c6c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldrh r1, [r6, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT0
    ldr r1, [r2, #0x5a8]
    sub r1, r1, #0x78
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_2e8
    b .L_294
    b .L_2e8
    b .L_250
    b .L_2e8
    b .L_228
    b .L_1e0
    b .L_dc
    b .L_94
    b .L_58
.L_58:
    ldr r1, _LIT1
    bl func_ov002_021de318
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x15
    bne .L_8c
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_021deda4
    mov r0, r6
    mov r1, #0x1
    bl func_ov002_021deda4
.L_8c:
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_94:
    ldr r1, _LIT2
    mov r0, #0x0
    ldr r3, [r1, #0xcec]
    mov r1, #0x5
    str r3, [r2, #0x5ac]
    str r1, [r2, #0x5b0]
    strh r0, [r6, #0xa]
    strh r0, [r6, #0x8]
    bl func_ov002_021ca1d8
    strh r0, [r6, #0xc]
    mov r0, #0x1
    bl func_ov002_021ca1d8
    strh r0, [r6, #0xe]
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    bl func_ov002_021e2a4c
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_dc:
    ldr r5, [r2, #0x5ac]
    ldr r0, _LIT3
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT4
    ldr r0, [r0, r2]
    cmp r0, #0x0
    beq .L_1d8
    ldr r1, _LIT5
    mov r0, r5
    add r4, r1, r2
    ldr r2, [r4, #0x260]
    mov r1, r2, lsl #0x13
    mov r8, r1, lsr #0x13
    mov r2, r2, lsl #0x12
    mov r1, r8
    mov r7, r2, lsr #0x1f
    bl func_ov002_021df618
    mov r0, r5
    mov r1, #0xd
    mov r2, #0x0
    bl func_ov002_021c97ac
    cmp r0, #0x0
    bne .L_144
    mov r0, r5
    bl func_ov002_021e2728
.L_144:
    mov r0, r5
    bl func_ov002_021d86ec
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_1d0
    mov r0, r8
    bl func_0202b854
    cmp r0, #0x5
    bge .L_1d0
    mov r0, r5
    mov r1, r8
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_1d0
    mov r0, r7
    bl func_ov002_021bc538
    cmp r0, #0x0
    ble .L_1b8
    add r0, r7, #0x2
    add r0, r6, r0, lsl #0x1
    ldrh r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1b8
    ldr r0, _LIT6
    add r1, r4, #0x260
    bl func_ov002_021b90e4
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b8:
    mov r0, r5
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021e1304
    mov r0, #0x7a
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1d0:
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1d8:
    mov r0, #0x7a
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1e0:
    ldr r1, _LIT6
    mov r2, #0x0
    ldr r0, [r1]
    mov r3, r2
    mov r0, r0, lsl #0x12
    mov r5, r0, lsr #0x1f
    mov r0, r5
    bl func_ov002_0227acc8
    mov r0, r5
    bl func_ov002_021bc5e4
    add r4, r6, #0x8
    mov r3, r5, lsl #0x1
    ldrh r2, [r4, r3]
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    strh r0, [r4, r3]
    mov r0, #0x7a
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_228:
    ldr r0, [r2, #0x5ac]
    ldr r3, _LIT5
    ldr r1, _LIT3
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    mov r2, #0x0
    bl func_ov002_021d81a8
    mov r0, #0x7a
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_250:
    ldr r0, [r2, #0x5b0]
    sub r0, r0, #0x1
    str r0, [r2, #0x5b0]
    cmp r0, #0x0
    movgt r0, #0x7e
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r2, #0x5ac]
    mov r1, #0x5
    rsb r3, r0, #0x1
    str r3, [r2, #0x5ac]
    ldr r0, _LIT2
    str r1, [r2, #0x5b0]
    ldr r0, [r0, #0xcec]
    cmp r3, r0
    movne r0, #0x7e
    moveq r0, #0x78
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_294:
    ldr r4, _LIT2
    mov r5, #0x0
.L_29c:
    ldr r0, [r4, #0xcec]
    eor r0, r0, r5
    add r1, r6, r0, lsl #0x1
    ldrh r1, [r1, #0x8]
    bl func_ov002_021d8750
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_29c
    ldr r4, _LIT2
    mov r5, #0x0
.L_2c4:
    ldr r0, [r4, #0xcec]
    eor r0, r0, r5
    bl func_ov002_021e27c4
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_2c4
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2e8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x001f001f
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf09c
_LIT5: .word data_ov002_022cf08c
_LIT6: .word data_ov002_022cdba8
