; func_ov002_022291a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3a4
        .extern func_ov002_021ca1d8
        .extern func_ov002_021de3c0
        .extern func_ov002_021deaf0
        .extern func_ov002_021e952c
        .extern func_ov002_021ef83c
        .extern func_ov002_022106c4
        .extern func_ov002_022535a4
        .extern func_ov002_022576f4
        .extern func_ov002_02257790
        .extern func_ov002_02259204
        .extern func_ov002_022592c0
        .extern func_ov002_0225930c
        .extern func_ov002_0227acc8
        .extern func_ov002_022903f0
        .global func_ov002_022291a0
        .arm
func_ov002_022291a0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r1, [r2, #0x5a8]
    sub r1, r1, #0x78
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_2b4
    b .L_280
    b .L_24c
    b .L_1fc
    b .L_1bc
    b .L_194
    b .L_150
    b .L_11c
    b .L_e8
    b .L_44
.L_44:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    bl func_ov002_022576f4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x2]
    ldr r6, _LIT1
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, r6
    ldr r1, [r1, r3]
    mov r4, #0x0
    cmp r1, #0x0
    bls .L_e0
    ldr r7, _LIT3
.L_a4:
    ldrh r1, [r5]
    mov r2, r4
    bl func_ov002_022535a4
    cmp r0, #0x0
    movne r0, #0x7f
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x2]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r6, r7
    ldr r1, [r1, #0xc]
    cmp r4, r1
    bcc .L_a4
.L_e0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_e8:
    ldrh r0, [r5, #0x2]
    mov r1, #0x12
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT4
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022592c0
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_11c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT5
    mov r0, r5
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021deaf0
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_150:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_17c
    ldrh r1, [r5]
    ldr r2, _LIT7
    bl func_ov002_022903f0
    b .L_18c
.L_17c:
    ldr r1, _LIT8
    bl func_ov002_021ae320
    ldr r0, _LIT7
    bl func_ov002_02259204
.L_18c:
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_194:
    bl func_ov002_0225930c
    cmp r0, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT5
    ldr r1, _LIT0
    ldr r2, [r0, #0xd78]
    mov r0, #0x7b
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1bc:
    ldrh r0, [r5, #0x2]
    ldrh r3, [r5]
    ldr r5, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r4, r0, #0x1
    mla r5, r4, r1, r5
    ldr r1, [r2, #0x5ac]
    add r2, r5, #0x120
    add r1, r2, r1, lsl #0x2
    mov r3, r3, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    mov r0, #0x7a
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1fc:
    ldr r1, _LIT9
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_23c
    ldr r0, _LIT5
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_244
.L_23c:
    mov r0, #0x68
    bl func_ov002_021ae3a4
.L_244:
    mov r0, #0x79
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_24c:
    ldr r0, _LIT5
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT9
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022592c0
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_280:
    bl func_ov002_0225930c
    cmp r0, #0x0
    moveq r0, #0x7a
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT5
    mov r0, r5
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021de3c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2b4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
_LIT4: .word func_ov002_021ef83c
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022cd664
_LIT7: .word func_ov002_022106c4
_LIT8: .word 0x0000011e
_LIT9: .word func_ov002_021e952c
