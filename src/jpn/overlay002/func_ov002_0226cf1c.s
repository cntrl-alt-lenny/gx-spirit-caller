; func_ov002_0226cf1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021aff6c
        .extern func_ov002_021bc538
        .extern func_ov002_02253600
        .global func_ov002_0226cf1c
        .arm
func_ov002_0226cf1c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    ldr r3, _LIT1
    ldr r2, [r2, #0xd9c]
    mov r6, r0
    mov r5, r1
    cmp r2, #0x0
    ldrh r4, [r3, #0xa2]
    beq .L_38
    cmp r2, #0x1
    beq .L_1e8
    cmp r2, #0x2
    beq .L_3e0
    b .L_4f0
.L_38:
    ldr r1, _LIT2
    cmp r5, r1
    bgt .L_c0
    bge .L_150
    ldr r2, _LIT3
    cmp r5, r2
    bgt .L_88
    bge .L_150
    ldr r0, _LIT4
    cmp r5, r0
    bgt .L_78
    bge .L_140
    sub r0, r0, #0xbe
    cmp r5, r0
    beq .L_140
    b .L_1d0
.L_78:
    add r0, r0, #0xd5
    cmp r5, r0
    beq .L_1c4
    b .L_1d0
.L_88:
    add r1, r2, #0x43
    cmp r5, r1
    bgt .L_b0
    mov r0, r1
    cmp r5, r0
    bge .L_150
    add r0, r2, #0x34
    cmp r5, r0
    beq .L_150
    b .L_1d0
.L_b0:
    add r1, r2, #0x128
    cmp r5, r1
    beq .L_19c
    b .L_1d0
.L_c0:
    ldr r1, _LIT5
    cmp r5, r1
    bgt .L_100
    bge .L_1b8
    sub r0, r1, #0x7f
    cmp r5, r0
    bgt .L_f0
    bge .L_140
    sub r0, r1, #0x84
    cmp r5, r0
    beq .L_1a8
    b .L_1d0
.L_f0:
    sub r0, r1, #0x50
    cmp r5, r0
    beq .L_150
    b .L_1d0
.L_100:
    add r0, r1, #0x82
    cmp r5, r0
    bgt .L_120
    bge .L_1a8
    add r0, r1, #0x5e
    cmp r5, r0
    beq .L_140
    b .L_1d0
.L_120:
    add r0, r1, #0x1f8
    cmp r5, r0
    bgt .L_134
    beq .L_1a8
    b .L_1d0
.L_134:
    cmp r5, #0x19c0
    beq .L_1c4
    b .L_1d0
.L_140:
    mov r0, r6
    mov r1, #0xf6
    bl func_ov002_021ae320
    b .L_1d0
.L_150:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    bne .L_18c
    mov r0, r6
    mov r1, #0xd
    bl func_ov002_021ae320
    ldr r0, _LIT1
    mov r1, #0x0
    strh r1, [r0, #0xb0]
    strh r1, [r0, #0xb2]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_18c:
    ldr r1, _LIT6
    mov r0, r6
    bl func_ov002_021ae320
    b .L_1d0
.L_19c:
    mov r1, #0x5e
    bl func_ov002_021ae320
    b .L_1d0
.L_1a8:
    ldr r1, _LIT7
    mov r0, r6
    bl func_ov002_021ae320
    b .L_1d0
.L_1b8:
    mov r1, #0x16
    bl func_ov002_021ae320
    b .L_1d0
.L_1c4:
    mov r0, r6
    mov r1, #0x56
    bl func_ov002_021ae320
.L_1d0:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1e8:
    ldr r2, _LIT2
    cmp r5, r2
    bgt .L_27c
    bge .L_36c
    ldr r1, _LIT3
    cmp r5, r1
    bgt .L_238
    bge .L_32c
    ldr r1, _LIT4
    cmp r5, r1
    bgt .L_228
    bge .L_318
    sub r0, r1, #0xbe
    cmp r5, r0
    beq .L_300
    b .L_3c8
.L_228:
    add r0, r1, #0xd5
    cmp r5, r0
    beq .L_300
    b .L_3c8
.L_238:
    add r0, r1, #0x43
    cmp r5, r0
    bgt .L_258
    bge .L_36c
    add r0, r1, #0x34
    cmp r5, r0
    beq .L_36c
    b .L_3c8
.L_258:
    add r0, r1, #0xef
    cmp r5, r0
    bgt .L_26c
    beq .L_34c
    b .L_3c8
.L_26c:
    add r0, r1, #0x128
    cmp r5, r0
    beq .L_36c
    b .L_3c8
.L_27c:
    ldr r3, _LIT5
    cmp r5, r3
    bgt .L_2bc
    bge .L_300
    sub r0, r3, #0x7f
    cmp r5, r0
    bgt .L_2ac
    bge .L_300
    sub r0, r3, #0x84
    cmp r5, r0
    beq .L_32c
    b .L_3c8
.L_2ac:
    sub r0, r3, #0x50
    cmp r5, r0
    beq .L_36c
    b .L_3c8
.L_2bc:
    add r2, r3, #0x82
    cmp r5, r2
    bgt .L_2e4
    mov r0, r2
    cmp r5, r0
    bge .L_300
    add r0, r3, #0x5e
    cmp r5, r0
    beq .L_36c
    b .L_3c8
.L_2e4:
    add r2, r3, #0x1f8
    cmp r5, r2
    bgt .L_2f8
    beq .L_384
    b .L_3c8
.L_2f8:
    cmp r5, #0x19c0
    bne .L_3c8
.L_300:
    mov r0, r6
    mov r2, r5
    mov r1, #0x6
    mov r3, #0x1
    bl func_ov002_021af8f0
    b .L_3c8
.L_318:
    mov r2, r5
    mov r1, #0x4a
    mov r3, #0x0
    bl func_ov002_021af8f0
    b .L_3c8
.L_32c:
    cmp r4, #0x20
    movge r4, #0x20
    mov r0, r6
    mov r2, r5
    add r1, r4, #0x6
    mov r3, #0x0
    bl func_ov002_021af8f0
    b .L_3c8
.L_34c:
    cmp r4, #0x20
    movge r4, #0x20
    mov r0, r6
    mov r2, r5
    add r1, r4, #0x27
    mov r3, #0x0
    bl func_ov002_021af8f0
    b .L_3c8
.L_36c:
    mov r0, r6
    mov r2, r5
    mov r3, r4
    mov r1, #0x6
    bl func_ov002_021af8f0
    b .L_3c8
.L_384:
    mov r2, r4
    bl func_ov002_02253600
    mov r7, r0
    mov r0, r6
    bl func_ov002_021bc538
    cmp r7, r0
    blt .L_3ac
    mov r0, r6
    bl func_ov002_021bc538
    mov r7, r0
.L_3ac:
    cmp r7, #0x20
    movge r7, #0x20
    mov r0, r6
    mov r2, r5
    mov r3, r4
    add r1, r7, #0x6
    bl func_ov002_021af8f0
.L_3c8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3e0:
    ldr r0, _LIT8
    cmp r5, r0
    bgt .L_400
    bge .L_420
    sub r0, r0, #0xef
    cmp r5, r0
    beq .L_420
    b .L_4a0
.L_400:
    ldr r0, _LIT9
    cmp r5, r0
    bgt .L_414
    beq .L_420
    b .L_4a0
.L_414:
    add r0, r0, #0x27c
    cmp r5, r0
    bne .L_4a0
.L_420:
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldr r0, [r0, #0xd44]
    mov r4, #0x0
    cmp r0, #0x7
    movhi r0, #0x7
    strh r0, [r5, #0xb0]
    ldrh r0, [r5, #0xb0]
    cmp r0, #0x0
    ble .L_498
    ldr r6, _LIT10
.L_44c:
    add r0, r4, #0x1
    bl func_ov002_021aff6c
    mov r7, r0
    add r0, r4, #0x1
    bl func_ov002_021aff6c
    add r1, r6, r4, lsl #0x1
    ldr r0, [r0]
    ldr r2, [r7]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r2, r0, r2, lsr #0x1f
    add r0, r1, #0x1d00
    strh r2, [r0, #0xb2]
    ldrh r0, [r5, #0xb0]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_44c
.L_498:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4a0:
    bl func_ov002_021afa94
    ldr r1, [r0]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    strh r1, [r0, #0xb0]
    bl func_ov002_021afa94
    mov r4, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    ldr r0, _LIT1
    add r1, r1, r2, lsr #0x1f
    strh r1, [r0, #0xb2]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4f0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word 0x0000166b
_LIT3: .word 0x000014ee
_LIT4: .word 0x000013ed
_LIT5: .word 0x00001796
_LIT6: .word 0x00000121
_LIT7: .word 0x0000011d
_LIT8: .word 0x000015dd
_LIT9: .word 0x00001712
_LIT10: .word data_ov002_022cf08c
