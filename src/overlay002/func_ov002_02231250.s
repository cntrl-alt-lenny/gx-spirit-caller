; func_ov002_02231250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bd030
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1d28
        .extern func_ov002_021d5d48
        .extern func_ov002_021d7054
        .extern func_ov002_021de480
        .extern func_ov002_02210104
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_0226b11c
        .global func_ov002_02231250
        .arm
func_ov002_02231250:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldrh r2, [r7, #0x2]
    mov r2, r2, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x2
    bne .L_1e0
    bl func_ov002_02210104
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1e0:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_328
    mov r0, r7
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_328
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    cmp r0, #0x0
    blt .L_308
    ldrh r1, [r7, #0x2]
    and r4, r0, #0xff
    mov r2, r1, lsl #0x1f
    mov r0, r1, lsl #0x1a
    mov r1, r2, lsr #0x1f
    mov r0, r0, lsr #0x1b
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    orr r1, r1, r4, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d7054
    ldrh r0, [r7, #0x2]
    and r2, r5, #0xff
    and r1, r6, #0xff
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0xff
    orr r3, r3, r4, lsl #0x8
    orr r2, r2, r1, lsl #0x8
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d5d48
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    beq .L_328
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c1d28
    cmp r0, #0x0
    bne .L_328
    ldrh r2, [r7]
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    beq .L_328
    mov r0, r5
    mov r1, r6
    bl func_ov002_0226b11c
    b .L_328
.L_308:
    ldrh r0, [r7, #0x2]
    ldrh r3, [r7]
    mov r2, #0x0
    mov r4, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021de480
.L_328:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
