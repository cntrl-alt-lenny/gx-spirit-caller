; func_ov002_0221eff4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b98d4
        .extern func_ov002_021bcf50
        .extern func_ov002_021c194c
        .extern func_ov002_021c1c48
        .extern func_ov002_021d5c58
        .extern func_ov002_021d8324
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_0226b02c
        .global func_ov002_0221eff4
        .arm
func_ov002_0221eff4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldrh r1, [r7, #0x2]
    ldrh r0, [r7, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b98d4
    cmp r0, #0x0
    addlt sp, sp, #0xc
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcf50
    mvn r1, #0x0
    cmp r0, r1
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_3cc
    mov r0, r7
    mov r1, #0x0
    bl func_ov002_0223dda4
    ldrh r2, [r7, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r5, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    and r6, r1, #0xff
    mov r0, r0, lsr #0x1f
    beq .L_3cc
    ldr r1, _LIT0
    and r3, r5, #0x1
    mov r2, #0x14
    mul r1, r3, r1
    ldr r3, _LIT1
    mul r2, r6, r2
    add r3, r3, r1
    add r3, r3, r2
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_3cc
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    beq .L_3cc
    bl func_ov002_021bcf50
    ldrh r2, [r7, #0x2]
    mov r4, r0
    mov r0, #0x1
    str r4, [sp]
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldrh r1, [r7, #0x4]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x11
    mov r3, r0
    mov r2, r1, lsr #0x17
    mov r1, #0xe
    bl func_ov002_021d8324
    ldrh r0, [r7, #0x2]
    and r1, r4, #0xff
    and r2, r5, #0xff
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0xff
    orr r3, r3, r1, lsl #0x8
    and r1, r6, #0xff
    orr r2, r2, r1, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5c58
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    beq .L_3cc
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c1c48
    cmp r0, #0x0
    bne .L_3cc
    ldrh r2, [r7]
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c194c
    cmp r0, #0x0
    beq .L_3cc
    mov r0, r5
    mov r1, r6
    bl func_ov002_0226b02c
.L_3cc:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
