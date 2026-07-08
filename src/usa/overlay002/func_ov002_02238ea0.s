; func_ov002_02238ea0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202e2a4
        .extern func_ov002_021b9dec
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021d8fd0
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02238ea0
        .arm
func_ov002_02238ea0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldrh r4, [r8, #0x2]
    ldr r1, _LIT0
    ldrh r3, [r8, #0x4]
    mov r2, r4, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mov r5, r4, lsl #0x1a
    mul r1, r2, r1
    ldr r4, _LIT1
    mov r5, r5, lsr #0x1b
    mov r2, #0x14
    mul r2, r5, r2
    add r4, r4, r1
    add r4, r4, #0x30
    mov r5, r3, lsl #0x11
    ldr r4, [r4, r2]
    mov r5, r5, lsr #0x17
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    cmp r5, r3
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_3f8
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r6, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    mov r0, r8
    mov r1, r6
    mov r2, r7
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_3f8
    ldr r2, _LIT1
    ldr r0, _LIT0
    and r1, r6, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r4, r7, r0
    add r5, r2, #0x30
    ldr r0, [r5, r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_3f8
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    ldrh r1, [r8]
    cmp r1, r0
    beq .L_3f8
    ldrh r0, [r8, #0x2]
    ldr r2, _LIT3
    mov r3, #0x1
    mov ip, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d5a90
    ldrh r0, [r8, #0x2]
    mov r2, #0x0
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8fd0
    ldr r0, [r5, r4]
    ldrh r1, [r8]
    mov r2, r0, lsl #0x13
    mov r0, r2, lsr #0x13
    cmp r1, r2, lsr #0x13
    bne .L_3cc
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
.L_3cc:
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r8, #0x2]
    ldrh r2, [r8]
    mov r3, #0x2
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d58dc
.L_3f8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x00000fb6
