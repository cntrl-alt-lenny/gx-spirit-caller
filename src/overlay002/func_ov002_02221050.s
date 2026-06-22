; func_ov002_02221050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021b99b4
        .extern func_ov002_021bc618
        .extern func_ov002_021c33e4
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ff3bc
        .extern func_ov002_0227adb8
        .global func_ov002_02221050
        .arm
func_ov002_02221050:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r3, [r2, #0x5a8]
    cmp r3, #0x7e
    beq .L_11c
    cmp r3, #0x7f
    beq .L_50
    cmp r3, #0x80
    bne .L_128
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021e2b3c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_50:
    ldrh r0, [r5, #0x6]
    ldr r1, [r2, #0x5ac]
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x18
    bge .L_114
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_114
    ldr r0, _LIT0
    ldrh r2, [r5, #0x2]
    ldr r0, [r0, #0x5ac]
    add r0, r5, r0, lsl #0x1
    ldrh r1, [r0, #0x8]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b99b4
    movs r4, r0
    bmi .L_fc
    ldrh r0, [r5, #0x2]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_fc
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    ldr r5, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and r3, r0, #0x1
    mla r1, r3, r1, r5
    add r1, r1, #0x18
    add r1, r1, #0x400
    add r1, r1, r4, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
.L_fc:
    ldr r1, _LIT0
    mov r0, #0x7f
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, pc}
.L_114:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_11c:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_128:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
