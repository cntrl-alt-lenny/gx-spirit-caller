; func_ov002_0225acbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd444
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021ae4f4
        .extern func_ov002_021b3dec
        .extern func_ov002_021b9dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021be1f8
        .extern func_ov002_021be2a4
        .extern func_ov002_021bf1b4
        .extern func_ov002_021d46ac
        .extern func_ov002_021d5a90
        .extern func_ov002_021d8fd0
        .extern func_ov002_022591d0
        .extern func_ov002_02259ff8
        .extern func_ov002_02266138
        .extern func_ov002_022661fc
        .extern func_ov002_02266270
        .extern func_ov002_02266568
        .extern func_ov002_02285cc0
        .extern func_ov002_02297b70
        .extern func_ov002_0229acd0
        .global func_ov002_0225acbc
        .arm
func_ov002_0225acbc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    mov r4, r0
    ldr r5, _LIT1
    str r4, [r6]
    ldr r2, [r5, #0xd30]
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_51c
    b .L_38
    b .L_80
    b .L_310
    b .L_444
    b .L_4ac
.L_38:
    mov r0, #0x0
    str r0, [r6, #0x8]
    str r0, [r6, #0x14]
    cmp r4, #0x0
    mov r1, #0x0
    movne r0, #0x8000
    orr r0, r0, #0x15
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_80:
    bl func_ov002_02266568
    cmp r0, #0x0
    beq .L_130
    mov r0, r4
    bl func_ov002_022661fc
    rsb r8, r4, #0x1
    mov r7, r0
    mov r0, r8
    bl func_ov002_02266270
    mov r6, r0
    cmp r7, #0x0
    cmpge r6, #0x0
    blt .L_114
    mov r0, r4
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021be2a4
    cmp r0, #0x0
    beq .L_114
    mov r5, #0x1
    mov r0, r4
    mov r1, r7
    mov r2, r8
    mov r3, r6
    str r5, [sp]
    bl func_ov002_021bf1b4
    cmp r0, #0x0
    beq .L_114
    mov r0, r4
    bl func_ov002_022661fc
    ldr r1, _LIT0
    mov r2, #0x0
    str r0, [r1, #0x1c]
    str r2, [r1, #0x10]
    str r2, [r1, #0xc]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_114:
    ldr r1, _LIT1
    mov r0, #0xc
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    str r0, [r1, #0xd34]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_130:
    ldr r1, _LIT2
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_208
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, r4, #0x1
    mla r9, r1, r0, r2
    ldr fp, _LIT2
    rsb sl, r4, #0x1
    mov r6, #0x0
    mov r5, #0x1
.L_168:
    mov r0, r4
    mov r1, r6
    bl func_ov002_021b9dec
    cmp r0, fp
    bne .L_1f8
    ldr r0, [r9, #0x3c]
    cmp r0, #0x0
    beq .L_1f8
    mov r0, r4
    mov r1, r6
    mov r2, #0x1
    mov r8, #0x0
    bl func_ov002_021be2a4
    cmp r0, #0x0
    beq .L_1d8
    mov r7, r8
.L_1a8:
    mov r0, r4
    mov r1, r6
    mov r2, sl
    mov r3, r7
    str r5, [sp]
    bl func_ov002_021bf1b4
    cmp r0, #0x0
    movne r8, #0x1
    bne .L_1d8
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_1a8
.L_1d8:
    cmp r8, #0x0
    bne .L_1f8
    mov r0, r4
    mov r1, r6
    mov r2, #0x0
    bl func_ov002_021d8fd0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f8:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r9, r9, #0x14
    ble .L_168
.L_208:
    ldr r0, _LIT5
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_2ac
    mov r0, r4
    bl func_ov002_02259ff8
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, r4
    bl func_ov002_02285cc0
    mov r5, r0
    mov r0, r4
    mov r1, r5
    bl func_ov002_02297b70
    cmp r0, #0x0
    beq .L_260
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd54]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_260:
    cmp r5, #0x0
    beq .L_290
    ldr r1, _LIT6
    ldr r0, _LIT0
    ldr r2, [r1, #0x200]
    mov r1, #0x0
    str r2, [r0, #0x1c]
    str r1, [r0, #0x10]
    str r1, [r0, #0xc]
    str r1, [r0, #0x18]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_290:
    ldr r1, _LIT1
    mov r0, #0xc
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    str r0, [r1, #0xd34]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2ac:
    mov r6, #0x0
    mov r5, #0x1
.L_2b4:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_021be1f8
    cmp r0, #0x0
    beq .L_2e4
    mov r1, r4
    mov r2, r6
    mov r0, #0x7
    mov r3, #0x0
    bl func_ov002_0229acd0
    b .L_2f0
.L_2e4:
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_2b4
.L_2f0:
    mov r0, #0x3
    bl func_ov002_022591d0
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_310:
    ldr r1, [r5, #0xd50]
    cmp r1, #0x0
    beq .L_374
    ldr r0, [r5, #0xd64]
    cmp r0, #0x0
    bne .L_360
    ldr r2, [r5, #0xd74]
    ldr r1, [r5, #0xd78]
    mov r0, #0xb
    add r1, r2, r1
    str r1, [r6, #0x1c]
    mov r5, #0x0
    str r5, [r6, #0x10]
    str r5, [r6, #0xc]
    rsb r2, r4, #0x1
    sub r3, r0, #0xc
    str r5, [r6, #0x18]
    bl func_ov002_0229acd0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_360:
    mov r0, #0x1
    str r0, [r5, #0xd54]
    sub r0, r2, #0x1
    str r0, [r5, #0xd30]
    b .L_43c
.L_374:
    bl func_ov002_02259ff8
    cmp r0, #0x0
    beq .L_420
    ldr r2, _LIT7
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_3b8
    mov r0, #0xdd
    bl func_ov002_021ae3a4
    mov r1, r5
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3b8:
    mov r1, r5
    ldr r0, [r1, #0xd64]
    sub r0, r0, #0xd
    cmp r0, #0x4
    beq .L_3d8
    cmp r0, #0x5
    beq .L_3f0
    b .L_420
.L_3d8:
    mov r0, #0xc
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    str r0, [r1, #0xd34]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3f0:
    mov r0, r4
    bl func_ov002_02266138
    cmp r0, #0x0
    beq .L_420
    mov r1, r5
    mov r0, #0xc
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    mov r2, #0x1
    str r2, [r1, #0xd34]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_420:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    str r0, [r1, #0xd44]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_43c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_444:
    ldr r1, [r5, #0xd44]
    cmp r1, #0x0
    beq .L_468
    mov r0, #0xc
    str r0, [r5, #0xd2c]
    mov r0, #0x0
    str r0, [r5, #0xd30]
    str r0, [r5, #0xd34]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_468:
    mov r5, #0x8
    bl func_ov002_02259ff8
    cmp r0, #0x0
    beq .L_48c
    mov r0, r4
    orr r5, r5, #0x10
    bl func_ov002_02266138
    cmp r0, #0x0
    orrne r5, r5, #0x20
.L_48c:
    mov r0, r5
    bl func_ov002_021ae4f4
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4ac:
    ldr r1, [r5, #0xd44]
    cmp r1, #0x4
    beq .L_4c4
    cmp r1, #0x5
    beq .L_4f0
    b .L_50c
.L_4c4:
    mov r1, #0xc
    str r1, [r5, #0xd2c]
    mov r4, #0x0
    str r4, [r5, #0xd30]
    ldr r2, _LIT7
    mov r1, #0xb
    mov r3, #0x1
    str r4, [r5, #0xd34]
    bl func_ov002_021d5a90
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4f0:
    mov r0, #0xc
    str r0, [r5, #0xd2c]
    mov r0, #0x0
    str r0, [r5, #0xd30]
    mov r1, #0x1
    str r1, [r5, #0xd34]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_50c:
    mov r0, #0x1
    str r0, [r5, #0xd30]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_51c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00001a79
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cd664
_LIT6: .word data_ov002_022cd444
_LIT7: .word 0x000011ed
