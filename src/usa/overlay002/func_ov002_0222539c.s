; func_ov002_0222539c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3a4
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021bb83c
        .extern func_ov002_021d46ac
        .extern func_ov002_021d8198
        .extern func_ov002_021e2728
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a2c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .extern func_ov002_0226afe0
        .global func_ov002_0222539c
        .arm
func_ov002_0222539c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_20
    beq .L_244
    b .L_25c
.L_20:
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_25c
    b .L_228
    b .L_25c
    b .L_25c
    b .L_25c
    b .L_158
    b .L_fc
    b .L_cc
    b .L_a8
    b .L_54
.L_54:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_90
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r4, r5, r6, pc}
.L_90:
    mov r0, r0, lsl #0x1f
    mov r1, #0x5e
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_a8:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_cc:
    bl func_ov002_021afa94
    ldrh r1, [r4, #0x2]
    ldr r0, [r0]
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    mov r2, r0, lsl #0x13
    ldrh r1, [r4]
    rsb r0, r3, #0x1
    mov r2, r2, lsr #0x13
    bl func_ov002_0226afe0
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_fc:
    ldr r0, _LIT1
    bl func_ov002_021bb83c
    cmp r0, #0x0
    beq .L_144
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_138
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_150
.L_138:
    ldr r0, _LIT4
    bl func_ov002_021ae3a4
    b .L_150
.L_144:
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0xd44]
.L_150:
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, pc}
.L_158:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_184
    bl func_ov002_021afa94
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8198
    b .L_220
.L_184:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r6, #0x8000
    moveq r6, #0x0
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r2, [r5]
    mov r0, r0, lsl #0x2
    mov r1, r0, lsr #0x18
    orr r0, r6, #0x57
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    mov r3, #0x0
    bl func_ov002_021d46ac
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2728
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2728
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_220:
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_228:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_244:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_25c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x0000159d
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022d008c
_LIT4: .word 0x00000131
