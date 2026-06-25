; func_ov002_022215e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022ce720
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_0202e79c
        .extern func_ov002_021ae400
        .extern func_ov002_021b9ecc
        .extern func_ov002_021de9c0
        .extern func_ov002_021e27c0
        .extern func_ov002_021ff3bc
        .extern func_ov002_022107b4
        .extern func_ov002_0223de94
        .extern func_ov002_022536e8
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_0226b094
        .extern func_ov002_0227adb8
        .extern func_ov002_02290500
        .global func_ov002_022215e8
        .arm
func_ov002_022215e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5a8]
    mov r4, r1
    sub r2, r2, #0x77
    cmp r2, #0x9
    addls pc, pc, r2, lsl #0x2
    b .L_354
    b .L_338
    b .L_304
    b .L_354
    b .L_354
    b .L_354
    b .L_354
    b .L_2b0
    b .L_274
    b .L_1d0
    b .L_4c
.L_4c:
    ldrh r0, [r4, #0x6]
    mov r8, #0x0
    mov r7, r8
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_e8
    ldr r6, _LIT1
    mov fp, #0x1
.L_70:
    mov r0, r4
    mov r1, r7
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and sl, r1, #0xff
    cmp sl, #0x4
    bhi .L_d4
    and r9, r0, #0xff
    ldr r0, _LIT2
    and r2, r9, #0x1
    mla r1, r2, r0, r6
    mov r0, #0x14
    mla r0, sl, r0, r1
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_d4
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b9ecc
    bl func_0202e79c
    cmp r0, #0x0
    addne r0, sl, r9, lsl #0x4
    orrne r8, r8, fp, lsl r0
.L_d4:
    ldrh r0, [r4, #0x6]
    add r7, r7, #0x1
    mov r0, r0, lsl #0x18
    cmp r7, r0, lsr #0x18
    blt .L_70
.L_e8:
    mov r0, r5
    mov r1, r8
    bl func_ov002_021de9c0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    mov r9, #0x0
    ldr r2, [r1, #0x494]
    ldr r1, _LIT3
    mov r2, r2, lsl #0x19
    mov r2, r2, lsr #0x18
    mov r7, r9
    strh r9, [r1, r2]
.L_120:
    ldr r3, _LIT1
    ldr r1, _LIT2
    and r2, r9, #0x1
    mla r1, r2, r1, r3
    ldr r4, _LIT0
    add r8, r1, #0x30
    mov r6, #0x0
    mov r5, #0x1
.L_140:
    add r1, r6, r7
    tst r0, r5, lsl r1
    beq .L_1a8
    ldr r1, [r4, #0x494]
    ldr sl, [r8]
    mov r1, r1, lsl #0x19
    add r1, r4, r1, lsr #0x18
    add r2, r1, #0x400
    ldrh r3, [r2, #0x98]
    mov r1, sl, lsl #0x2
    mov r1, r1, lsr #0x18
    add r3, r3, #0x1
    strh r3, [r2, #0x98]
    ldr r3, [r4, #0x494]
    mov r2, sl, lsl #0x12
    mov sl, r3, lsl #0x19
    add sl, r4, sl, lsr #0x18
    add sl, sl, #0x400
    ldrh sl, [sl, #0x98]
    mov r1, r1, lsl #0x1
    add r2, r1, r2, lsr #0x1f
    add r1, r3, sl
    mov r1, r1, lsl #0x19
    add r1, r4, r1, lsr #0x18
    add r1, r1, #0x400
    strh r2, [r1, #0x98]
.L_1a8:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r8, r8, #0x14
    ble .L_140
    add r9, r9, #0x1
    cmp r9, #0x2
    add r7, r7, #0x10
    blt .L_120
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d0:
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r5, #0x2]
    ldr r6, _LIT2
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, r6
    ldr r1, [r1, r3]
    mov r4, #0x0
    cmp r1, #0x0
    bls .L_264
    ldr r7, _LIT1
.L_210:
    ldrh r1, [r5]
    mov r2, r4
    bl func_ov002_022536e8
    cmp r0, #0x0
    beq .L_240
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_240:
    ldrh r0, [r5, #0x2]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r6, r7
    ldr r1, [r1, #0xc]
    cmp r4, r1
    bcc .L_210
.L_264:
    ldr r1, _LIT6
    bl func_ov002_021ae400
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_274:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_2a0
    ldrh r1, [r5]
    ldr r2, _LIT8
    bl func_ov002_02290500
    b .L_2a8
.L_2a0:
    ldr r0, _LIT8
    bl func_ov002_022592ec
.L_2a8:
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2b0:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r5, #0x2]
    ldrh r3, [r5]
    ldr r5, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and r4, r0, #0x1
    mla r5, r4, r1, r5
    ldr r2, _LIT9
    mov r3, r3, lsl #0x10
    ldr r1, [r2, #0xd78]
    add r2, r5, #0x120
    add r1, r2, r1, lsl #0x2
    mov r2, #0x1
    bl func_ov002_0227adb8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_304:
    ldrh r0, [r5, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e27c0
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b094
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_338:
    ldrh r0, [r5, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e27c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_354:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022ce720
_LIT4: .word data_ov002_022cf178
_LIT5: .word 0x0000011e
_LIT6: .word 0x00000122
_LIT7: .word data_ov002_022cd744
_LIT8: .word func_ov002_022107b4
_LIT9: .word data_ov002_022d016c
