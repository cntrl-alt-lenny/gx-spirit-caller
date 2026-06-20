; func_ov002_02235b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c2f24
        .extern func_ov002_021d90c0
        .extern func_ov002_02223d48
        .extern func_ov002_0226b0b0
        .extern func_ov002_0226b0f0
        .global func_ov002_02235b74
        .arm
func_ov002_02235b74:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    ldrh r6, [r4, #0x2]
    mov r2, r6, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x14
    bne .L_120
    bl func_ov002_02223d48
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_120:
    ldr r5, _LIT0
    ldr r0, [r5, #0x5a8]
    cmp r0, #0x7e
    beq .L_224
    cmp r0, #0x7f
    beq .L_1f4
    cmp r0, #0x80
    bne .L_2ac
    mov r0, r6, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT1
    and r2, r0, #0x1
    mul r1, r2, r1
    ldr r2, _LIT2
    mov r6, r6, lsl #0x1a
    add r5, r2, r1
    mov r6, r6, lsr #0x1b
    mov r2, #0x14
    ldrh r3, [r4, #0x4]
    mul r2, r6, r2
    add r5, r5, #0x30
    mov r3, r3, lsl #0x11
    ldr r5, [r5, r2]
    mov r6, r3, lsr #0x17
    mov r3, r5, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r5, lsr #0x1f
    cmp r6, r3
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r3, _LIT3
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r4]
    bl func_ov002_021c2f24
    strh r0, [r4, #0x8]
    ldrh r2, [r4, #0x8]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r3, #0xff
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b0f0
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1f4:
    ldr r0, _LIT4
    mov r1, r6, lsl #0x1a
    ldrh r2, [r0, #0xb0]
    mov r3, r6, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d90c0
    mov r0, r5
    mov r1, #0x1
    str r1, [r0, #0x5ac]
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_224:
    ldr r2, [r5, #0x5ac]
    cmp r2, #0x6
    bge .L_2a4
    ldr r0, _LIT2
    ldr ip, _LIT1
    mov r1, #0x1
    mov lr, #0x14
.L_240:
    ldrh r8, [r4, #0x2]
    mov r3, r8, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r7, r3, #0x1
    mla r6, r7, ip, r0
    mov r7, r8, lsl #0x1a
    mov r7, r7, lsr #0x1b
    mla r6, r7, lr, r6
    ldr r6, [r6, #0x3c]
    tst r6, r1, lsl r2
    beq .L_290
    ldrh r1, [r4]
    rsb r0, r3, #0x1
    bl func_ov002_0226b0b0
    ldr r1, _LIT0
    mov r0, #0x7e
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_290:
    ldr r2, [r5, #0x5ac]
    add r2, r2, #0x1
    str r2, [r5, #0x5ac]
    cmp r2, #0x6
    blt .L_240
.L_2a4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2ac:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word data_ov002_022d0e6c
