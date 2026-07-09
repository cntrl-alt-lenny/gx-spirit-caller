; func_ov002_021ccfd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_ov002_021b0b24
        .extern func_ov002_021b2b08
        .extern func_ov002_021c9a4c
        .extern func_ov002_021c9aa0
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021ccfd8
        .arm
func_ov002_021ccfd8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldrh r0, [r0]
    mov r1, #0x14
    ldr r3, _LIT2
    tst r0, #0x8000
    movne r9, #0x1
    ldr r0, _LIT0
    moveq r9, #0x0
    and fp, r9, #0x1
    ldrh r4, [r0, #0x2]
    mul sl, fp, r2
    mul r6, r4, r1
    add r1, r3, sl
    add r3, r1, #0x30
    ldrh r2, [r0, #0x6]
    ldr r1, [r3, r6]
    add r7, r3, r6
    mov r1, r1, lsl #0x13
    movs r8, r1, lsr #0x13
    and r1, r2, #0x1
    and r3, r2, #0x2
    and r5, r2, #0x4
    and r2, r2, #0x8
    str r2, [sp]
    ldrh r2, [r0, #0x4]
    moveq r1, #0x0
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    streq r1, [r0, #0x80c]
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r0, #0x810]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_338
    b .L_a8
    b .L_100
    b .L_1f8
    b .L_304
.L_a8:
    cmp r1, #0x0
    beq .L_cc
    ldr r4, _LIT3
    mov r1, r9
    mov r2, r8
    mov r0, #0x47
    mov r3, #0x0
    str r8, [r4, #0x24]
    bl func_ov002_0229acd0
.L_cc:
    cmp r5, #0x0
    beq .L_e8
    mov r1, r9
    mov r2, r8
    mov r0, #0x47
    mov r3, #0x1
    bl func_ov002_0229acd0
.L_e8:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_100:
    mov r0, #0x47
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r5, #0x0
    beq .L_130
    mov r2, #0x1
    mov r0, r9
    mov r1, r4
    mov r3, r2
    bl func_ov002_021c9aa0
.L_130:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_150
    mov r0, r9
    mov r1, r4
    mov r2, #0x2
    mov r3, #0x1
    bl func_ov002_021c9aa0
.L_150:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_198
    ldr r0, [sp, #0x8]
    ldrh r3, [r7, #0x6]
    mov r1, r4, lsl #0x1b
    mov r2, r0, lsl #0x1f
    orr r0, fp, r1, lsr #0x1a
    mov r1, r3, lsl #0x1f
    orr r0, r0, r2, lsr #0x11
    orr r0, r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x1a
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0229acd0
    b .L_1e0
.L_198:
    ldrh r1, [r7, #0x8]
    ldr r0, [sp, #0x4]
    ldrh r3, [r7, #0x6]
    cmp r0, #0x0
    mov r0, r4, lsl #0x1b
    rsb r1, r1, #0x1
    mov r1, r1, lsl #0x1f
    orr r0, fp, r0, lsr #0x1a
    moveq r2, #0x1
    mov r3, r3, lsl #0x1f
    orr r0, r0, r1, lsr #0x11
    orr r0, r0, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    movne r2, #0x0
    mov r0, #0x1a
    mov r3, #0x0
    bl func_ov002_0229acd0
.L_1e0:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f8:
    mov r0, #0x1a
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    cmp r0, #0x0
    bne .L_29c
    ldrh r0, [r7, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    strh r0, [r7, #0x8]
    ldrh r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_250
    ldr r0, _LIT4
    ldr r1, [r0, #0xce8]
    add r1, r1, #0x1
    str r1, [r0, #0xce8]
    strh r1, [r7, #0x4]
    b .L_280
.L_250:
    mov r0, r9
    mov r1, r4
    bl func_ov002_021b2b08
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_280
    cmp r4, #0x4
    bgt .L_280
    mov r0, #0x1c
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_280:
    cmp r4, #0x4
    bgt .L_29c
    ldrh r3, [r7, #0x8]
    mov r0, r9
    mov r1, r4
    mov r2, #0x13
    bl func_ov002_021c9aa0
.L_29c:
    cmp r5, #0x0
    beq .L_2d8
    mov r0, r8
    bl func_0202b824
    cmp r0, #0x16
    bne .L_2c4
    mov r0, r9
    mov r1, #0x1a
    mov r2, #0x1
    bl func_ov002_021c9a4c
.L_2c4:
    mov r1, r9
    mov r2, r8
    mov r0, #0x43
    mov r3, #0x1
    bl func_ov002_0229acd0
.L_2d8:
    ldr r1, _LIT6
    ldr r0, _LIT0
    add r2, r1, sl
    ldr r1, [r2, r6]
    add sp, sp, #0xc
    orr r1, r1, #0x100
    str r1, [r2, r6]
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_304:
    mov r0, #0x43
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
.L_338:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cd314
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cd65c
_LIT6: .word data_ov002_022cf0cc
