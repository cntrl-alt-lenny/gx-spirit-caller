; func_ov002_0221e6c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021afba0
        .extern func_ov002_021b4254
        .extern func_ov002_021ba294
        .extern func_ov002_021bbf50
        .extern func_ov002_021c8470
        .extern func_ov002_021d5a08
        .extern func_ov002_021d5a6c
        .extern func_ov002_021d7d0c
        .extern func_ov002_021d8288
        .extern func_ov002_021de9d4
        .extern func_ov002_021e286c
        .extern func_ov002_0223df38
        .extern func_ov002_022536e8
        .extern func_ov002_0225764c
        .extern func_ov002_0226b054
        .global func_ov002_0221e6c0
        .arm
func_ov002_0221e6c0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldrh r2, [r7, #0x2]
    mov r0, r2, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_e4
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x64
    beq .L_cc
    cmp r0, #0x6f
    beq .L_b0
    cmp r0, #0x80
    bne .L_344
    ldrh r1, [r7]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba294
    movs r4, r0
    bmi .L_90
    ldrh r0, [r7, #0x2]
    ldr r3, _LIT1
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    add r1, r1, r4, lsl #0x2
    bl func_ov002_021d8288
    cmp r0, #0x0
    addne sp, sp, #0xc
    movne r0, #0x64
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_90:
    ldrh r0, [r7, #0x2]
    mov r1, #0x15
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0xc
    mov r0, #0x6f
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_b0:
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    add sp, sp, #0xc
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_cc:
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_e4:
    ldrh r0, [r7, #0x4]
    ldrh r1, [r7]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b4254
    cmp r0, #0x3
    bge .L_290
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_344
    b .L_1e8
    b .L_198
    b .L_170
    b .L_128
.L_128:
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    mov r1, #0x5e
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_170:
    ldrh r0, [r7, #0x2]
    ldrh r2, [r7]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0xc
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_198:
    bl func_ov002_021afba0
    cmp r0, #0xe
    bne .L_1c4
    bl func_ov002_021afb74
    ldrh r1, [r7, #0x2]
    mov r2, r0
    mov r0, r7
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d7d0c
    b .L_1dc
.L_1c4:
    bl func_ov002_021afb74
    ldrh r2, [r7, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8288
.L_1dc:
    add sp, sp, #0xc
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1e8:
    ldrh r2, [r7, #0x2]
    ldrh r4, [r7, #0x4]
    ldr r3, _LIT1
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r5, r2, lsl #0x1a
    ldr r0, _LIT2
    and r2, r1, #0x1
    mla r3, r2, r0, r3
    mov r2, r5, lsr #0x1b
    mov r0, #0x14
    mul r0, r2, r0
    add r3, r3, #0x30
    ldr r3, [r3, r0]
    mov r4, r4, lsl #0x11
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r4, r4, lsr #0x17
    add r0, r0, r3, lsr #0x1f
    cmp r4, r0
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, r7
    bl func_ov002_021de9d4
    ldrh r0, [r7, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    and r0, r0, #0x1
    bl func_ov002_021e286c
    ldrh r0, [r7, #0x4]
    ldrh r1, [r7]
    mov r2, #0x5
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    mov r3, #0x0
    bl func_ov002_021d5a6c
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_290:
    add r2, sp, #0x8
    mov r0, r7
    mov r1, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_344
    ldr r2, [sp, #0x8]
    mov r0, r7
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r5, r2, #0xff
    and r6, r1, #0xff
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_344
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c8470
    ldrh r1, [r7, #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbf50
    mul r1, r4, r0
    ldr r2, _LIT3
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    ldr r1, _LIT4
    add r3, r0, r3, asr #0x2
    cmp r3, r1
    movgt r3, r1
    mov r0, r3, lsl #0x10
    mov r1, #0x2
    str r1, [sp]
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x4]
    ldrh r3, [r7]
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_021d5a08
.L_344:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word 0x66666667
_LIT4: .word 0x0000ffff
