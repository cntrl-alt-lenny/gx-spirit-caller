; func_ov002_022274c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c4bbc
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ca1e8
        .extern func_ov002_021ca1f0
        .extern func_ov002_021d58dc
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0227acc8
        .global func_ov002_022274c0
        .arm
func_ov002_022274c0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x60
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_180
    cmp r1, #0x80
    bne .L_26c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    addeq sp, sp, #0x60
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    addeq sp, sp, #0x60
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_26c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_26c
    add r2, sp, #0x34
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c4bbc
    ldrh r0, [r4, #0x2]
    ldr r1, [sp, #0x3c]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1f0
    cmp r0, #0x0
    beq .L_26c
    ldrh r0, [r4, #0x2]
    ldr r1, [sp, #0x38]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1e8
    cmp r0, #0x0
    beq .L_26c
    mov r2, #0x0
    sub r0, r2, #0x2000
    and r0, r0, #0x0
    add r3, sp, #0x4
    orr r1, r0, #0x208
    orr r1, r1, #0x1400
    str r2, [r3]
    str r1, [sp, #0x4]
    ldrh r0, [r4, #0x2]
    bic r1, r1, #0x2000
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x12
    str r0, [sp, #0x4]
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc5e4
    ldr r2, _LIT0
    add r1, sp, #0x4
    str r0, [r2, #0x5ac]
    ldrh r3, [r4, #0x2]
    ldrh r0, [r4]
    mov r2, #0x1
    mov r4, r3, lsl #0x1f
    mov r3, r0, lsl #0x10
    mov r0, r4, lsr #0x1f
    orr r3, r3, #0x1
    bl func_ov002_0227acc8
    add sp, sp, #0x60
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_180:
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    add r2, sp, #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c4bbc
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x18]
    and r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0, lsl #0x4
    ldr r2, [sp, #0xc]
    and r0, r0, #0xff
    and r1, r2, #0xff
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    ldr r2, _LIT1
    mov r3, r1, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r0, r3, lsr #0x1f
    mov r3, #0x5
    bl func_ov002_021d58dc
    ldr r1, [sp, #0x1c]
    ldr r0, _LIT2
    ldr r2, _LIT1
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r3, r1, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r0, r3, lsr #0x1f
    mov r3, #0x5
    bl func_ov002_021d58dc
    ldr r1, [sp, #0x20]
    ldr r0, _LIT2
    ldr r2, _LIT1
    cmp r1, r0
    movgt r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r3, r1, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r0, r3, lsr #0x1f
    mov r3, #0x5
    bl func_ov002_021d58dc
.L_26c:
    mov r0, #0x0
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001608
_LIT2: .word 0x0000ffff
