; func_ov002_022706c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf0c4
        .extern func_0202df24
        .extern func_0202f110
        .extern func_ov002_021b2f34
        .extern func_ov002_021b9dec
        .extern func_ov002_021bc7e8
        .extern func_ov002_021bd5e8
        .extern func_ov002_021c8400
        .extern func_ov002_021c8860
        .global func_ov002_022706c8
        .arm
func_ov002_022706c8:
    stmdb sp!, {r4, r5, r6, lr}
    add r5, r1, r2
    mov r6, r0
    cmp r5, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, r6
    ldr r0, [r0]
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r6
    beq .L_80
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT2
    and r3, r6, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_80:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r1, _LIT0
    ldr r3, _LIT3
    ldr r1, [r1]
    mov r4, r0
    mov r1, r1, lsl #0x9
    cmp r3, r1, lsr #0x11
    mov r2, r1, lsr #0x11
    bcc .L_134
    cmp r2, r3
    bcs .L_2fc
    ldr r3, _LIT4
    cmp r2, r3
    bhi .L_e8
    bcs .L_204
    ldr r1, _LIT5
    cmp r2, r1
    bhi .L_d8
    beq .L_1a4
    b .L_3b4
.L_d8:
    ldr r1, _LIT6
    cmp r2, r1
    beq .L_1d4
    b .L_3b4
.L_e8:
    add r1, r3, #0x6e
    cmp r2, r1
    bhi .L_124
    add r1, r3, #0x6a
    cmp r2, r1
    bcc .L_114
    beq .L_29c
    add r0, r3, #0x6e
    cmp r2, r0
    beq .L_2b4
    b .L_3b4
.L_114:
    add r0, r3, #0x14
    cmp r2, r0
    beq .L_250
    b .L_3b4
.L_124:
    add r1, r3, #0x13c
    cmp r2, r1
    beq .L_2e4
    b .L_3b4
.L_134:
    add r1, r3, #0xec
    cmp r2, r1
    bhi .L_174
    bcs .L_35c
    add r1, r3, #0xc9
    cmp r2, r1
    bhi .L_164
    bcs .L_32c
    add r1, r3, #0x2f
    cmp r2, r1
    beq .L_314
    b .L_3b4
.L_164:
    add r1, r3, #0xd3
    cmp r2, r1
    beq .L_344
    b .L_3b4
.L_174:
    ldr r1, _LIT7
    cmp r2, r1
    bhi .L_194
    bcs .L_378
    sub r1, r1, #0x7
    cmp r2, r1
    beq .L_3a4
    b .L_3b4
.L_194:
    add r3, r1, #0x1
    cmp r2, r3
    beq .L_390
    b .L_3b4
.L_1a4:
    sub r1, r1, #0x1
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    ldr r2, _LIT8
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b2f34
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_1d4:
    sub r1, r1, #0x294
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    ldr r2, _LIT8
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b2f34
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_204:
    add r0, r3, #0x6
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT2
    and r3, r6, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_3b4
    ldr r0, _LIT9
    cmp r4, r0
    bne .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_250:
    sub r0, r3, #0xb9
    bl func_ov002_021bd5e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT2
    and r3, r6, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_3b4
    ldr r0, _LIT9
    cmp r4, r0
    bne .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_29c:
    ldr r1, _LIT10
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_2b4:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c8400
    cmp r0, #0x6
    blt .L_3b4
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c8860
    cmp r0, #0x12
    bne .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_2e4:
    sub r1, r3, #0x760
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_2fc:
    sub r1, r3, #0x1
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_314:
    rsb r1, r3, #0x2fc0
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_32c:
    sub r1, r3, #0x8f0
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_344:
    sub r1, r3, #0xde
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_35c:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c8860
    cmp r0, #0x3
    bne .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_378:
    sub r1, r1, #0x1
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_390:
    bl func_0202df24
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_3a4:
    bl func_0202f110
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r4, r5, r6, pc}
.L_3b4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000018b9
_LIT4: .word 0x00001758
_LIT5: .word 0x0000112e
_LIT6: .word 0x0000128c
_LIT7: .word 0x000019f7
_LIT8: .word 0x00001238
_LIT9: .word 0x0000173b
_LIT10: .word 0x00001122
