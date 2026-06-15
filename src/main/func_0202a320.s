; func_0202a320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021cd8
        .extern func_020224c0
        .extern func_02022644
        .extern func_0202290c
        .extern func_0202ab64
        .extern func_0202aba0
        .extern func_0202acec
        .global func_0202a320
        .arm
func_0202a320:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r0
    ldr r0, [r9]
    mov r6, #0x0
    str r0, [sp]
    add r4, r9, #0xb8
    add r8, r9, #0x80
    add r5, r9, #0xa8
    add r7, r9, #0x74
    b .L_33c
.L_28:
    ldr r3, [r9]
    ldr r2, [r3]
    mov r0, r2, lsr #0x18
    sub r0, r0, #0xa0
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b .L_328
    b .L_70
    b .L_94
    b .L_c8
    b .L_e0
    b .L_1bc
    b .L_1d8
    b .L_1f4
    b .L_228
    b .L_25c
    b .L_280
    b .L_300
.L_70:
    mov r0, #0x1
    str r0, [r9, #0xd8]
    mov r0, r9
    add r1, r9, #0x98
    add r2, r9, #0x68
    bl func_02022644
    cmp r0, #0x0
    movne r6, #0x1
    b .L_328
.L_94:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r9, #0xdc]
    mov r0, r9
    bl func_0202ab64
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_328
.L_c8:
    mov r0, r9
    bl func_0202aba0
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_328
.L_e0:
    mov r0, r2, lsr #0x10
    ldr r2, [r3, #0x4]
    and r1, r0, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7]
    ldr r2, [r9]
    mov r0, r9
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7, #0x4]
    ldmia r7, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldr r2, [r9]
    mov r0, r9
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r8]
    ldr r2, [r9]
    mov r0, r9
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r8, #0x4]
    ldmia r8, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_328
.L_1bc:
    mov r0, r9
    mov r1, r5
    mov r2, r7
    bl func_02022644
    cmp r0, #0x0
    movne r6, #0x1
    b .L_328
.L_1d8:
    mov r0, r9
    mov r1, r4
    mov r2, r8
    bl func_02022644
    cmp r0, #0x0
    movne r6, #0x1
    b .L_328
.L_1f4:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r9, #0xde]
    mov r0, r9
    bl func_0202acec
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_328
.L_228:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r9, #0xe0]
    mov r0, r9
    bl func_0202acec
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_328
.L_25c:
    mov r0, #0x3
    str r0, [r9, #0xd8]
    mov r0, r9
    add r1, r9, #0xc8
    add r2, r9, #0x8c
    bl func_02022644
    cmp r0, #0x0
    movne r6, #0x1
    b .L_328
.L_280:
    mov r1, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r9]
    mov sl, r0
    ldmia r2, {r1, r2}
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    ldr r2, [r9]
    mov fp, r0
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh sl, [r9, #0xe2]
    strh fp, [r9, #0xe4]
    strh r0, [r9, #0xe6]
    ldr r0, [r9]
    add r0, r0, #0x8
    str r0, [r9]
    b .L_328
.L_300:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_020224c0
    strh r0, [r9, #0xe8]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
.L_328:
    ldr r1, [r9]
    ldr r0, [sp]
    cmp r1, r0
    movne r0, #0x0
    strne r0, [r9, #0x4]
.L_33c:
    cmp r6, #0x0
    bne .L_354
    mov r0, r9
    bl func_02021cd8
    cmp r0, #0x0
    beq .L_28
.L_354:
    ldrh r0, [r9, #0xea]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_3e4
    ldrb r0, [r9, #0xa7]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_384
    mov r0, r9
    add r1, r9, #0x98
    add r2, r9, #0x68
    bl func_0202290c
.L_384:
    ldrb r0, [r9, #0xb7]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_3a4
    mov r0, r9
    add r1, r9, #0xa8
    add r2, r9, #0x74
    bl func_0202290c
.L_3a4:
    ldrb r0, [r9, #0xc7]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_3c4
    mov r0, r9
    add r1, r9, #0xb8
    add r2, r9, #0x80
    bl func_0202290c
.L_3c4:
    ldrb r0, [r9, #0xd7]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_3e4
    mov r0, r9
    add r1, r9, #0xc8
    add r2, r9, #0x8c
    bl func_0202290c
.L_3e4:
    ldr r1, [r9, #0x4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r9, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
