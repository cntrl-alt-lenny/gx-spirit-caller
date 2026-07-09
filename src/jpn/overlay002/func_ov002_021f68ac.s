; func_ov002_021f68ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021aff6c
        .extern func_ov002_021b3dec
        .extern func_ov002_021bbe70
        .extern func_ov002_021ca5b8
        .extern func_ov002_021d8038
        .extern func_ov002_021de55c
        .extern func_ov002_021df5e4
        .extern func_ov002_021f495c
        .extern func_ov002_021f6850
        .extern func_ov002_02253600
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_021f68ac
        .arm
func_ov002_021f68ac:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r6, r1
    ldr r2, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xb
    bl func_ov002_021b3dec
    ldr r1, _LIT1
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    bne .L_98
    mov r0, r5
    mov r1, r6
    bl func_ov002_021f495c
    mov r0, #0x0
    strh r0, [r5, #0x8]
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, #0x0
    bne .L_98
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_98:
    cmp r4, #0x0
    beq .L_1c4
    ldr r0, _LIT1
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_c4
    cmp r0, #0x1
    beq .L_104
    cmp r0, #0x2
    beq .L_150
    b .L_2ac
.L_c4:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df5e4
    ldrh r0, [r5, #0x2]
    mov r1, #0x50
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_104:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_150:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_1ac
    ldr r1, _LIT3
    mov r0, r5
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    mov r3, #0x0
    bl func_ov002_021de55c
    ldrh r0, [r5, #0x8]
    add r0, r0, #0x1
    strh r0, [r5, #0x8]
    ldrh r0, [r5, #0x8]
    cmp r0, #0x3
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT1
    ldr r1, [r0, #0x5b4]
    sub r1, r1, #0x1
    str r1, [r0, #0x5b4]
    b .L_1bc
.L_1ac:
    ldrh r0, [r5, #0x8]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_1bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c4:
    ldr r0, _LIT1
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_1e8
    cmp r0, #0x1
    beq .L_214
    cmp r0, #0x2
    beq .L_248
    b .L_2ac
.L_1e8:
    ldrh r0, [r5, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_214:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, #0x2a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_248:
    ldr r4, _LIT3
    mov r7, #0x0
    ldr r0, [r4, #0xd44]
    cmp r0, #0x0
    bls .L_290
    mov r6, r7
.L_260:
    add r0, r7, #0x1
    bl func_ov002_021aff6c
    ldrh r3, [r5, #0x2]
    mov r1, r0
    mov r2, r6
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8038
    ldr r0, [r4, #0xd44]
    add r7, r7, #0x1
    cmp r7, r0
    bcc .L_260
.L_290:
    ldr r1, _LIT1
    strh r0, [r5, #0x8]
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2ac:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000014a0
_LIT1: .word data_ov002_022ce1a8
_LIT2: .word func_ov002_021f6850
_LIT3: .word data_ov002_022d008c
