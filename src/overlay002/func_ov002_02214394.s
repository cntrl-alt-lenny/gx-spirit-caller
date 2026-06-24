; func_ov002_02214394 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b3618
        .extern func_ov002_021c1d28
        .extern func_ov002_021c229c
        .extern func_ov002_021c8470
        .extern func_ov002_021de480
        .extern func_ov002_021df818
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02219f7c
        .global func_ov002_02214394
        .arm
func_ov002_02214394:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldrh r2, [r6, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x2
    bne .L_1a0
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r1, r1, #0x1
    mla r4, r1, r0, r3
    mov r2, r2, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r0, #0x14
    ldrh r1, [r6, #0x4]
    mul r0, r3, r0
    mov r2, r1, lsl #0x11
    add r1, r4, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsr #0x17
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    bl func_ov002_021e2b3c
    ldrh r0, [r6, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3618
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    ldrh r2, [r6]
    ldr r1, _LIT2
    and r4, r0, #0xff
    cmp r2, r1
    and r5, r3, #0xff
    bne .L_e0
    ldrh r0, [r6, #0x2]
    mov r2, #0x0
    mov r3, r2
    mov ip, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021de480
.L_e0:
    mov r0, #0x1
    str r0, [sp]
    ldrh r1, [r6, #0x2]
    ldrh r2, [r6]
    mov r0, r4
    mov r3, r1, lsl #0x1a
    mov r1, r5
    mov r3, r3, lsr #0x1b
    bl func_ov002_021c229c
    cmp r0, #0x0
    beq .L_158
    ldrh r0, [r6, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r4
    bl func_ov002_021c1d28
    cmp r0, #0x0
    bne .L_158
    ldrh r0, [r6, #0x2]
    ldrh r3, [r6]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r4
    bl func_ov002_021de480
.L_158:
    ldrh r1, [r6]
    ldr r0, _LIT2
    cmp r1, r0
    bne .L_190
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8470
    ldrh r1, [r6, #0x2]
    mov r2, r0
    mov r0, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
.L_190:
    bl func_ov002_021e2c5c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1a0:
    bl func_ov002_02219f7c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001286
