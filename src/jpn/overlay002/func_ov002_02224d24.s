; func_ov002_02224d24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021de820
        .extern func_ov002_021ff37c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0226aec4
        .extern func_ov002_0227acc8
        .global func_ov002_02224d24
        .arm
func_ov002_02224d24:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r3, [r2, #0x5a8]
    cmp r3, #0x7e
    beq .L_130
    cmp r3, #0x7f
    beq .L_c0
    cmp r3, #0x80
    bne .L_16c
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_b8
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_b8
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    ldr r3, _LIT0
    mov r0, r0, lsl #0x12
    mov ip, r0, lsr #0x1f
    mov r0, r6
    mov r1, r4
    mov r2, r5
    str ip, [r3, #0x5ac]
    bl func_ov002_021de820
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_b8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_c0:
    ldrh r3, [r6, #0x2]
    ldr r0, [r2, #0x5ac]
    mov r2, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    cmp r2, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldrh r2, [r6, #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x4000
    mov r0, r0, lsl #0x1f
    orr r2, r2, r0, lsr #0x11
    mov r0, r6
    strh r2, [r6, #0x2]
    bl func_ov002_021ff37c
    ldrh r1, [r6, #0x2]
    cmp r0, #0x0
    bic r0, r1, #0x4000
    strh r0, [r6, #0x2]
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldrh r1, [r6]
    ldr r0, [r0, #0x5ac]
    bl func_ov002_0226aec4
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_130:
    ldr r0, [r2, #0x5ac]
    ldr r3, _LIT2
    ldr r1, _LIT1
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    ldr r1, _LIT3
    ldrh r2, [r6]
    add r4, r3, #0x120
    ldrh r1, [r1, #0xb0]
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    add r1, r4, r1, lsl #0x2
    bl func_ov002_0227acc8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_16c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d0d8c
