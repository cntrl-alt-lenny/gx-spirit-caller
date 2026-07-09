; func_ov002_021fb12c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae434
        .extern func_ov002_021ca310
        .extern func_ov002_021ea0c4
        .extern func_ov002_021f4170
        .extern func_ov002_021ff2cc
        .extern func_ov002_02257790
        .extern func_ov002_0226afe0
        .global func_ov002_021fb12c
        .arm
func_ov002_021fb12c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [r2, #0x5b4]
    mov r5, r1
    cmp r0, #0x0
    beq .L_34
    cmp r0, #0x1
    beq .L_1ec
    cmp r0, #0x2
    beq .L_234
    b .L_240
.L_34:
    ldrh r0, [r6, #0x2]
    ldrh r2, [r6, #0x4]
    ldr r4, _LIT1
    mov r1, r0, lsl #0x1f
    mov r3, r1, lsr #0x1f
    mov r1, r0, lsl #0x1a
    ldr r0, _LIT2
    and r3, r3, #0x1
    mla r4, r3, r0, r4
    mov r1, r1, lsr #0x1b
    mov r0, #0x14
    mul r0, r1, r0
    add r1, r4, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    mov r4, #0x0
    ldr r1, _LIT3
    mov r0, r6
    orreq r4, r4, #0x1
    bl func_ov002_02257790
    cmp r0, #0x0
    ldrh r0, [r6, #0x2]
    ldrh r2, [r6, #0x4]
    ldr r7, _LIT1
    mov r1, r0, lsl #0x1f
    mov r3, r1, lsr #0x1f
    mov r1, r0, lsl #0x1a
    ldr r0, _LIT2
    and r3, r3, #0x1
    mla r7, r3, r0, r7
    mov r1, r1, lsr #0x1b
    mov r0, #0x14
    mul r0, r1, r0
    add r1, r7, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    orrne r4, r4, #0x2
    cmp r0, r2, lsr #0x17
    bne .L_12c
    mov r0, r6
    mov r1, r5
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    beq .L_12c
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    orrne r4, r4, #0x4
.L_12c:
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_188
    tst r4, #0x4
    beq .L_160
    ldr r0, _LIT6
    mov r1, #0x2
    str r1, [r0, #0xd44]
    b .L_1d0
.L_160:
    tst r4, #0x2
    beq .L_178
    ldr r0, _LIT6
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_1d0
.L_178:
    ldr r0, _LIT6
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_1d0
.L_188:
    ldrh r0, [r6]
    mov r1, #0x0
    bl func_ov002_021f4170
    mov r7, r0
    ldrh r0, [r6]
    mov r1, #0x1
    bl func_ov002_021f4170
    mov r5, r0
    ldrh r0, [r6]
    mov r1, #0x2
    bl func_ov002_021f4170
    mov r3, r0
    mov r0, #0x0
    stmia sp, {r0, r4}
    ldr r0, _LIT7
    mov r1, r7
    mov r2, r5
    bl func_ov002_021ae434
.L_1d0:
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1ec:
    ldr r0, _LIT6
    ldr r1, [r0, #0xd44]
    add r1, r1, #0x1
    strh r1, [r6, #0xc]
    ldrh r3, [r6, #0x2]
    ldr r2, [r0, #0xd44]
    ldrh r1, [r6]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afe0
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_234:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_240:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word func_ov002_021ea0c4
_LIT4: .word 0x000019ed
_LIT5: .word data_ov002_022cd664
_LIT6: .word data_ov002_022d008c
_LIT7: .word 0x00000103
