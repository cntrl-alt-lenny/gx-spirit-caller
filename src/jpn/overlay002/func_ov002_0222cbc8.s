; func_ov002_0222cbc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021af8f0
        .extern func_ov002_021aff6c
        .extern func_ov002_021d7880
        .extern func_ov002_021d7c1c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_02253600
        .global func_ov002_0222cbc8
        .arm
func_ov002_0222cbc8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_160
    b .L_108
    b .L_a4
    b .L_64
    b .L_30
.L_30:
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mul r0, r3, r0
    ldr r0, [r1, r0]
    str r0, [r2, #0x5ac]
    cmp r0, #0x0
    movne r0, #0x7f
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_64:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_021d7880
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_a4:
    ldrh r0, [r4, #0x2]
    ldr r5, [r2, #0x5ac]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_02253600
    cmp r0, r5
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    cmp r5, #0x20
    ldrh r2, [r4]
    movge r5, #0x20
    mov r0, r0, lsl #0x1f
    add r1, r5, #0x6
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    bl func_ov002_021e2a4c
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_108:
    ldr r0, _LIT3
    ldr r1, [r2, #0x5ac]
    ldr r0, [r0, #0xd44]
    cmp r1, r0
    bcs .L_154
    add r0, r1, #0x1
    bl func_ov002_021aff6c
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d7c1c
    ldr r1, _LIT0
    mov r0, #0x7d
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, pc}
.L_154:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_160:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d008c
