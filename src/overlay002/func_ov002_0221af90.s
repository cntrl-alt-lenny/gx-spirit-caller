; func_ov002_0221af90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021b99b4
        .extern func_ov002_021b9b64
        .extern func_ov002_021bc618
        .extern func_ov002_021c33e4
        .extern func_ov002_021ca2b8
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0223def4
        .extern func_ov002_0227adb8
        .global func_ov002_0221af90
        .arm
func_ov002_0221af90:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r1, [r5]
    ldr r0, _LIT0
    cmp r1, r0
    beq .L_34
    add r0, r0, #0x1e0
    cmp r1, r0
    beq .L_3c
    ldr r0, _LIT1
    cmp r1, r0
    moveq r4, #0x3
    b .L_40
.L_34:
    mov r4, #0x3
    b .L_40
.L_3c:
    mov r4, #0x2
.L_40:
    ldr r0, _LIT2
    ldr r1, [r0, #0x5a8]
    cmp r1, #0x7e
    beq .L_178
    cmp r1, #0x7f
    beq .L_128
    cmp r1, #0x80
    bne .L_184
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, r4
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_110
.L_b0:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223def4
    ldrh r2, [r5, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b99b4
    movs r2, r0
    movmi r0, #0x0
    ldmmiia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021c33e4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x18
    blt .L_b0
.L_110:
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    bl func_ov002_021e2b3c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_128:
    ldr r1, [r0, #0x5ac]
    mov r0, r5
    bl func_ov002_0223def4
    bl func_ov002_021b9b64
    ldrh r3, [r5, #0x2]
    mov r1, r0
    ldrh r2, [r5]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    ldr r0, _LIT2
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, r4
    movlt r0, #0x7f
    movge r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_178:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_184:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000138a
_LIT1: .word 0x000018a4
_LIT2: .word data_ov002_022ce288
