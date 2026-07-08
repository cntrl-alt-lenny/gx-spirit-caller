; func_ov002_02213154 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c194c
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021d7010
        .extern func_ov002_0223de48
        .global func_ov002_02213154
        .arm
func_ov002_02213154:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r8, r0
    ldrh r4, [r8, #0x2]
    ldr r1, _LIT0
    ldrh r3, [r8, #0x4]
    mov r2, r4, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mov r5, r4, lsl #0x1a
    mul r1, r2, r1
    ldr r4, _LIT1
    mov r5, r5, lsr #0x1b
    mov r2, #0x14
    mul r2, r5, r2
    add r4, r4, r1
    add r4, r4, #0x30
    mov r5, r3, lsl #0x11
    ldr r4, [r4, r2]
    mov r5, r5, lsr #0x17
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    cmp r5, r3
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r2, sp, #0x4
    mov r1, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_1a0
    ldrh r2, [r8, #0x2]
    ldr r1, [sp, #0x4]
    mov r0, r1, lsl #0x10
    mov r3, r2, lsl #0x1f
    mov r0, r0, lsr #0x10
    mov r2, r2, lsl #0x1a
    mov r0, r0, asr #0x8
    mov r4, r3, lsr #0x1f
    and r6, r1, #0xff
    cmp r4, r6
    mov r5, r2, lsr #0x1b
    and r7, r0, #0xff
    beq .L_1a0
    ldrh r2, [r8]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c194c
    cmp r0, #0x0
    beq .L_1a0
    ldrh r2, [r8]
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c194c
    cmp r0, #0x0
    beq .L_1a0
    ldrh r2, [r8]
    mov r0, r4
    mov r1, r5
    mov r3, #0x1
    bl func_ov002_021d5a90
    ldrh r2, [r8]
    mov r0, r6
    mov r1, r7
    mov r3, #0x1
    bl func_ov002_021d5a90
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [r8]
    mov r0, r4
    mov r1, r5
    mov r3, #0x5
    bl func_ov002_021d58dc
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r2, [r8]
    mov r0, r6
    mov r1, r7
    mov r3, #0x5
    bl func_ov002_021d58dc
    and r3, r5, #0xff
    and r1, r6, #0xff
    and r0, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r4
    and r1, r4, #0xff
    orr r1, r1, r3, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d7010
.L_1a0:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
