; func_ov002_022351ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b939c
        .extern func_ov002_021c9310
        .extern func_ov002_021ca5b8
        .extern func_ov002_021d58dc
        .extern func_ov002_021d8038
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0223de04
        .global func_ov002_022351ac
        .arm
func_ov002_022351ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r7, r0
    ldr r0, [r4, #0x5a8]
    cmp r0, #0x7f
    beq .L_590
    cmp r0, #0x80
    bne .L_644
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r0, r4
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    ldrh r0, [r7, #0x6]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_584
    bl func_ov002_021e2a4c
    ldrh r0, [r7, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    subs r6, r0, #0x1
    bmi .L_580
    ldr r8, _LIT0
    mov r4, #0x0
    mov r5, #0x1
.L_504:
    mov r0, r7
    mov r1, r6
    bl func_ov002_0223de04
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xe
    bne .L_578
    mov r2, r0, lsr #0x10
    mov r2, r2, lsl #0x10
    and r0, r0, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021c9310
    mov r1, r0
    ldrh r2, [r7, #0x2]
    ldr r3, [r1]
    mov r0, r2, lsl #0x1f
    mov r2, r3, lsl #0x12
    mov r0, r0, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    mov r0, r2, lsr #0x1f
    movne r2, r5
    moveq r2, r4
    bl func_ov002_021d8038
    ldr r0, [r8, #0x5ac]
    add r0, r0, #0x1
    str r0, [r8, #0x5ac]
.L_578:
    subs r6, r6, #0x1
    bpl .L_504
.L_580:
    bl func_ov002_021e2b6c
.L_584:
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_590:
    ldrh r2, [r7, #0x2]
    ldr r1, _LIT1
    ldr r6, _LIT2
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov r8, r2, lsl #0x1a
    mul r2, r3, r1
    add r6, r6, r2
    mov r1, r8, lsr #0x1b
    mov r3, #0x14
    ldrh r5, [r7, #0x4]
    mul r3, r1, r3
    add r6, r6, #0x30
    mov r8, r5, lsl #0x11
    ldr r6, [r6, r3]
    mov r8, r8, lsr #0x17
    mov r5, r6, lsl #0x2
    mov r5, r5, lsr #0x18
    mov r6, r6, lsl #0x12
    mov r5, r5, lsl #0x1
    add r5, r5, r6, lsr #0x1f
    cmp r8, r5
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r5, _LIT3
    add r2, r5, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r3, [r4, #0x5ac]
    mov r2, #0x12c
    mul r2, r3, r2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    str r2, [sp]
    ldrh r2, [r7]
    mov r3, #0x3
    bl func_ov002_021d58dc
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_644:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c4
