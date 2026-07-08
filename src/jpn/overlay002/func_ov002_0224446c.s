; func_ov002_0224446c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0170
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021afac0
        .extern func_ov002_0223dd14
        .extern func_ov002_0223de04
        .extern func_ov002_02253600
        .extern func_ov002_02257bc0
        .global func_ov002_0224446c
        .arm
func_ov002_0224446c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r6, [r5, #0x2]
    ldr r2, _LIT0
    mov r4, r1
    mov r3, r6, lsl #0x11
    ldr r1, [r2, #0x5b4]
    mov r6, r6, lsl #0x1f
    mov r2, r3, lsr #0x1f
    cmp r1, #0x3
    eor r6, r2, r6, lsr #0x1f
    addls pc, pc, r1, lsl #0x2
    b .L_170
    b .L_44
    b .L_84
    b .L_b0
    b .L_11c
.L_44:
    ldrh r1, [r5]
    mov r0, r6
    mov r2, #0x0
    bl func_ov002_02253600
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, #0x5e
    bl func_ov002_021ae320
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_84:
    ldrh r2, [r5]
    mov r0, r6
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af8f0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_b0:
    bl func_ov002_021afa94
    mov r7, r0
    bl func_ov002_021afac0
    mov r6, r0
    bl func_ov002_021afa94
    mov r4, r0
    bl func_ov002_021afa94
    ldr r3, [r4]
    mov ip, r0
    mov r4, r3, lsl #0x12
    ldr r3, [ip]
    ldr r1, [r7]
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r3, r3, lsl #0x1
    mov r2, r6
    mov r1, r1, lsr #0x1f
    mov r0, r5
    add r3, r3, r4, lsr #0x1f
    bl func_ov002_0223dd14
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_11c:
    mov r1, #0x0
    bl func_ov002_0223de04
    mov r2, r0, lsl #0x2
    ldr r1, _LIT1
    mov r0, r5
    ldrh r2, [r1, r2]
    mov r1, r4
    mov r2, r2, lsl #0x13
    mov r2, r2, lsr #0x13
    strh r2, [r5]
    bl func_ov002_02257bc0
    ldr r1, _LIT2
    cmp r0, #0x0
    strh r1, [r5]
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5b4]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_170:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0170
_LIT2: .word 0x00001935
