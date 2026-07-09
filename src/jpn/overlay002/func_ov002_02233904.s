; func_ov002_02233904 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_0202b0ac
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021bcf50
        .extern func_ov002_021d5c58
        .extern func_ov002_021d8324
        .extern func_ov002_021d86b4
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_02257564
        .extern func_ov002_02257a60
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0229cd4c
        .global func_ov002_02233904
        .arm
func_ov002_02233904:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x10c
    ldr r2, _LIT0
    mov r7, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x64
    bgt .L_24
    beq .L_230
    b .L_240
.L_24:
    sub r2, r2, #0x7b
    cmp r2, #0x5
    addls pc, pc, r2, lsl #0x2
    b .L_240
    b .L_180
    b .L_130
    b .L_cc
    b .L_a4
    b .L_70
    b .L_4c
.L_4c:
    bl func_ov002_02257a60
    cmp r0, #0x0
    addeq sp, sp, #0x10c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_ov002_021e2a4c
    add sp, sp, #0x10c
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_70:
    bl func_ov002_02257a60
    cmp r0, #0x0
    addeq sp, sp, #0x10c
    moveq r0, #0x64
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0x10c
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_a4:
    ldrh r0, [r7, #0x2]
    ldrh r2, [r7]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    add sp, sp, #0x10c
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_cc:
    bl func_ov002_021afa94
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    strh r0, [r7, #0x8]
    bl func_ov002_021afa94
    mov r4, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    strh r0, [r7, #0xa]
    ldrh r0, [r7, #0x2]
    ldrh r2, [r7, #0xa]
    mov r1, #0xe
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d86b4
    add sp, sp, #0x10c
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_130:
    ldrh r0, [r7, #0x8]
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0xc
    mov r1, #0x45
    bl func_ov002_0229cd4c
    ldrh r0, [r7, #0x2]
    add r1, sp, #0xc
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    add sp, sp, #0x10c
    mov r0, #0x7b
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_180:
    bl func_ov002_0225930c
    cmp r0, #0x0
    addeq sp, sp, #0x10c
    moveq r0, #0x7c
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    mov r0, r0, lsr #0x1f
    add r6, r3, r2
    ldr r5, [r1, #0xd70]
    bl func_ov002_021bcf50
    ldrh r2, [r7, #0x2]
    mov r4, r0
    mov r1, #0x1
    str r4, [sp]
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldrh r2, [r7, #0xa]
    mov r3, r0
    mov r1, #0xe
    bl func_ov002_021d8324
    ldrh r0, [r7, #0x2]
    and r3, r4, #0xff
    and r2, r5, #0xff
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r4, r0, #0xff
    and r1, r6, #0xff
    orr r2, r2, r1, lsl #0x8
    orr r3, r4, r3, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5c58
    add sp, sp, #0x10c
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_230:
    bl func_ov002_021e2b6c
    add sp, sp, #0x10c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_240:
    mov r0, #0x0
    add sp, sp, #0x10c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000139
_LIT2: .word func_ov002_02257564
_LIT3: .word data_ov002_022d008c
