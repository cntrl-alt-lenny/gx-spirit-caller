; func_ov002_02228bcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0250
        .extern func_0202e234
        .extern func_0202e2f8
        .extern func_ov002_021b947c
        .extern func_ov002_021bc6c4
        .extern func_ov002_021c10e8
        .extern func_ov002_021d59cc
        .extern func_ov002_021d81d4
        .extern func_ov002_021d8474
        .extern func_ov002_021de480
        .extern func_ov002_021de678
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e2d94
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02228bcc
        .arm
func_ov002_02228bcc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_1fc
    add r1, sp, #0xc
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    bl func_ov002_021e2b3c
    ldrh r0, [sl, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_14c
    ldr fp, _LIT0
.L_4c:
    mov r0, sl
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_138
    mov r0, sl
    mov r1, r4
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, sl
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_138
    mov r0, sl
    mov r1, r5
    mov r2, r6
    mov r3, #0x2000
    bl func_ov002_021de678
    cmp r0, #0x0
    beq .L_138
    mov r0, #0x14
    mul r9, r6, r0
    ldr r0, _LIT1
    and r1, r5, #0x1
    mla r8, r1, r0, fp
    add r0, r8, r9
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_138
    add r0, r8, r9
    mov r1, r6
    ldrh r6, [r0, #0x38]
    ldrh r7, [r0, #0x36]
    mov r0, r5
    mov r2, #0x1
    bl func_ov002_021c10e8
    add r1, r8, #0x30
    ldr r1, [r1, r9]
    mov r0, r0, lsl #0x2
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    add r0, r0, r1, lsl #0x3
    add r0, r0, r7, lsl #0x1
    add r1, r6, r0
    add r0, sp, #0xc
    str r1, [r0, r5, lsl #0x2]
.L_138:
    ldrh r0, [sl, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x18
    blt .L_4c
.L_14c:
    ldrh r0, [sl, #0x2]
    ldrh r2, [sl, #0x4]
    ldr r4, _LIT0
    mov r1, r0, lsl #0x1f
    mov r3, r1, lsr #0x1f
    mov r1, r0, lsl #0x1a
    ldr r0, _LIT1
    and r3, r3, #0x1
    mla r4, r3, r0, r4
    mov r1, r1, lsr #0x1b
    mov r0, #0x14
    mul r0, r1, r0
    add r1, r4, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    bne .L_1ec
    mov r5, #0x0
    add r4, sp, #0xc
    mov r6, #0x3
.L_1b0:
    ldr r0, [r4, r5, lsl #0x2]
    mov r3, r6
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [sl, #0x2]
    ldrh r2, [sl]
    mov r7, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r7, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d59cc
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_1b0
.L_1ec:
    bl func_ov002_021e2c5c
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1fc:
    ldr r0, _LIT2
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7f
    beq .L_2e0
    cmp r0, #0x80
    bne .L_3c0
    ldr fp, _LIT3
    mov r9, #0x0
    strh fp, [sl, #0xa]
    ldrh r0, [sl, #0xa]
    strh r0, [sl, #0x8]
.L_228:
    ldrh r0, [sl, #0x2]
    ldr r1, [sl, #0x14]
    mov r0, r0, lsl #0x1f
    eor r4, r9, r0, lsr #0x1f
    rsb r0, r4, #0x1
    mov r0, r0, lsl #0x4
    mov r0, r1, lsr r0
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r5, r2, asr #0x3
    mov r1, r2, asr #0x1
    mov r0, r5
    and r6, r1, #0x1
    and r7, r2, #0x1
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xf
    and r8, r0, #0xff
    bne .L_2c8
    mov r0, r4
    bl func_ov002_021bc6c4
    add r1, sl, r4, lsl #0x1
    strh r0, [r1, #0x8]
    ldrh r0, [r1, #0x8]
    cmp r0, fp
    bne .L_2ac
    mov r0, r8
    mov r1, r5
    bl func_ov002_021d81d4
    b .L_2c8
.L_2ac:
    stmia sp, {r0, r7}
    mov r0, r8
    mov r1, #0xf
    mov r2, r5
    mov r3, r4
    str r6, [sp, #0x8]
    bl func_ov002_021d8474
.L_2c8:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_228
    add sp, sp, #0x14
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e0:
    ldr r6, _LIT4
    ldr r5, _LIT0
    ldr r4, _LIT3
    mov r9, #0x0
    mov fp, #0x14
.L_2f4:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    eor r8, r9, r0, lsr #0x1f
    add r0, sl, r8, lsl #0x1
    ldrh r0, [r0, #0x8]
    cmp r0, r4
    beq .L_3a8
    rsb r0, r8, #0x1
    ldr r1, [sl, #0x14]
    mov r0, r0, lsl #0x4
    mov r0, r1, lsr r0
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r1, asr #0x3
    mov r1, r1, asr #0x2
    and r7, r1, #0x1
    mov r0, r0, lsl #0x2
    ldrh r0, [r6, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    bne .L_36c
    add r0, sl, r8, lsl #0x1
    ldrh r1, [r0, #0x8]
    ldrh r3, [sl]
    mov r0, r8
    mov r2, #0x0
    bl func_ov002_021de480
    b .L_3a8
.L_36c:
    cmp r8, r7
    beq .L_3a8
    ldr r0, _LIT1
    and r1, r8, #0x1
    mla r0, r1, r0, r5
    add r1, sl, r8, lsl #0x1
    ldrh r1, [r1, #0x8]
    mov r2, #0x0
    mla r0, r1, fp, r0
    ldr r0, [r0, #0x40]
    tst r0, #0x1
    moveq r3, #0x1
    movne r3, #0x0
    mov r0, r8
    bl func_ov002_021e2d94
.L_3a8:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_2f4
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3c0:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce288
_LIT3: .word 0x0000ffff
_LIT4: .word data_ov002_022d0250
