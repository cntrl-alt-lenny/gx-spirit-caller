; func_ov002_022391f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae558
        .extern func_ov002_021b9a84
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c8390
        .extern func_ov002_021d58dc
        .extern func_ov002_022106c4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_02257a60
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_0227ab74
        .extern func_ov002_022903f0
        .global func_ov002_022391f4
        .arm
func_ov002_022391f4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r1, #0x0
    mov r7, r0
    bl func_ov002_0223dda4
    ldr r2, _LIT0
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    ldr r2, [r2, #0x5a8]
    and r4, r0, #0xff
    sub r1, r2, #0x7c
    cmp r1, #0x4
    and r5, r3, #0xff
    addls pc, pc, r1, lsl #0x2
    b .L_2a8
    b .L_1e0
    b .L_184
    b .L_f8
    b .L_bc
    b .L_54
.L_54:
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_b4
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_b4
    mov r0, r7
    mov r1, r6
    bl func_ov002_02257a60
    cmp r0, #0x0
    beq .L_b4
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_bc:
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_e8
    ldrh r1, [r7]
    ldr r2, _LIT3
    bl func_ov002_022903f0
    b .L_f0
.L_e8:
    ldr r0, _LIT3
    bl func_ov002_02259204
.L_f0:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_f8:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_17c
    ldr r1, _LIT4
    ldr r3, _LIT5
    ldr r2, [r1, #0xd70]
    ldr r0, _LIT6
    and r2, r2, #0x1
    mla r3, r2, r0, r3
    ldr r0, [r1, #0xd78]
    add r2, r3, #0x120
    ldr r3, [r2, r0, lsl #0x2]
    ldr r0, _LIT2
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    strh r2, [r7, #0xc]
    ldrh r2, [r7, #0x2]
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r1, #0xd44]
    beq .L_174
    ldrh r1, [r7, #0xc]
    mov r0, #0xf7
    mov r2, #0x1
    bl func_ov002_021ae558
.L_174:
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_17c:
    mov r0, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_184:
    mov r0, r4
    bl func_ov002_021bc5e4
    strh r0, [r7, #0xe]
    ldrh r0, [r7, #0x2]
    mov r5, #0x0
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    ldrh r0, [r7, #0xc]
    movne r5, #0x10
    bl func_ov002_021b9a84
    ldrh r3, [r7]
    mov r1, r5, lsl #0x10
    ldr r2, _LIT4
    mov r3, r3, lsl #0x10
    orr r1, r3, r1, lsr #0x10
    str r1, [sp]
    ldr r3, [r2, #0xd44]
    mov r1, r0
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_0227ab74
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1e0:
    ldrh r1, [r7, #0xe]
    mov r0, r4
    bl func_ov002_021c8390
    ldr r1, _LIT7
    cmp r0, r1
    movgt r0, r1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [r7, #0x2]
    mov r0, r4
    mov r1, r5
    mov r3, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x17
    bl func_ov002_021d58dc
    mov r0, #0x0
    str r0, [sp]
    ldrh r2, [r7, #0x2]
    ldrh r1, [r7, #0xe]
    mov r0, r4
    mov r3, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x7
    bl func_ov002_021d58dc
    ldrh r1, [r7, #0x4]
    mov r0, r4
    mov r3, #0x3
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    str r1, [sp]
    ldrh r1, [r7, #0xe]
    ldrh r2, [r7]
    bl func_ov002_021d58dc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x0000011e
_LIT2: .word data_ov002_022cd664
_LIT3: .word func_ov002_022106c4
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cf08c
_LIT6: .word 0x00000868
_LIT7: .word 0x0000ffff
