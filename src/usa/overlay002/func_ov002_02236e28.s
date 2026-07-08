; func_ov002_02236e28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_0202e2a4
        .extern func_ov002_021c1008
        .extern func_ov002_021de588
        .extern func_ov002_021e267c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02236e28
        .arm
func_ov002_02236e28:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    mov r1, r3, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x3
    bne .L_1e4
    mov r1, r3, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, _LIT0
    and r2, r2, #0x1
    mul r1, r2, r1
    mov r6, r3, lsl #0x1a
    ldr r2, _LIT1
    mov r6, r6, lsr #0x1b
    add r5, r2, r1
    mov r2, #0x14
    ldrh r3, [r4, #0x4]
    mul r2, r6, r2
    add r5, r5, #0x30
    mov r3, r3, lsl #0x11
    ldr r5, [r5, r2]
    mov r6, r3, lsr #0x17
    mov r3, r5, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r5, lsr #0x1f
    cmp r6, r3
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r3, _LIT2
    add r3, r3, r1
    ldrh r3, [r2, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r3, _LIT3
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_1dc
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r6, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_1dc
    ldr r0, _LIT0
    and r1, r6, #0x1
    mul sl, r1, r0
    mov r0, #0x14
    mul r9, r7, r0
    ldr r1, _LIT1
    mov r2, r7
    add r0, r1, sl
    add r5, r0, #0x30
    ldr r8, [r5, r9]
    mov r0, r4
    mov r1, r8, lsl #0x2
    mov r3, r1, lsr #0x18
    mov ip, r8, lsl #0x12
    mov r8, r3, lsl #0x1
    mov r1, r6
    mov r3, #0x2000
    add r8, r8, ip, lsr #0x1f
    bl func_ov002_021de588
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r5, r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_1dc
    ldr r1, _LIT3
    ldr r0, _LIT2
    add r5, r1, sl
    add r3, r0, sl
    mov r0, r6
    mov r1, r7
    mov r2, #0x1
    ldrh r5, [r9, r5]
    ldrh r6, [r9, r3]
    bl func_ov002_021c1008
    mov r0, r0, lsl #0x2
    ldrh r1, [r4, #0x2]
    add r0, r0, r8, lsl #0x3
    add r0, r0, r5, lsl #0x1
    add r0, r6, r0
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    ldrh r1, [r4]
    mov r2, #0x41
    bl func_ov002_021e267c
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e267c
.L_1dc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1e4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
