; func_ov002_0228b8c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bce20
        .extern func_ov002_021c8400
        .extern func_ov002_0223dda4
        .extern func_ov002_02253600
        .extern func_ov002_022574e0
        .global func_ov002_0228b8c8
        .arm
func_ov002_0228b8c8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r7, r1
    mov r8, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r7, #0x2]
    ldrh r0, [r8, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r7, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_170
.L_4c:
    mov r0, r7
    mov r1, r4
    bl func_ov002_0223dda4
    ldrh r2, [r8, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r5, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    and r6, r1, #0xff
    bne .L_15c
    cmp r6, #0x4
    bgt .L_15c
    mov r0, r8
    mov r1, r5
    mov r2, r6
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_15c
    ldrh r1, [r8]
    ldr r0, _LIT0
    cmp r1, r0
    beq .L_c8
    add r0, r0, #0x330
    cmp r1, r0
    beq .L_100
    ldr r0, _LIT1
    cmp r1, r0
    beq .L_134
    b .L_154
.L_c8:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c8400
    ldrh r2, [r8, #0x2]
    mov r3, r0
    ldrh r1, [r8]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r2, r3, #0x3
    bl func_ov002_02253600
    cmp r0, #0x0
    bne .L_154
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_100:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c8400
    ldrh r3, [r8, #0x2]
    ldrh r1, [r8]
    mov r2, r0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x0
    bne .L_154
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_134:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bce20
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_154:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_15c:
    ldrh r0, [r7, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    blt .L_4c
.L_170:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00001768
_LIT1: .word 0x00001a9a
