; func_ov002_02234b64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021d70f0
        .extern func_ov002_021e0f5c
        .extern func_ov002_021e277c
        .extern func_ov002_022106c4
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_022903f0
        .global func_ov002_02234b64
        .arm
func_ov002_02234b64:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, _LIT0
    ldrh r2, [r5, #0x2]
    ldr r0, [r1, #0x5a8]
    mov r2, r2, lsl #0x1f
    sub r0, r0, #0x7c
    cmp r0, #0x4
    mov r4, r2, lsr #0x1f
    addls pc, pc, r0, lsl #0x2
    b .L_1a8
    b .L_194
    b .L_16c
    b .L_dc
    b .L_88
    b .L_40
.L_40:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    str r0, [r1, #0x5b0]
    ldrh r3, [r5, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r3, r3, lsl #0x1f
    mov r4, r3, lsr #0x1f
    and r3, r4, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_88:
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_cc
    ldrh r1, [r5]
    ldr r2, _LIT4
    mov r0, r4
    bl func_ov002_022903f0
    b .L_d4
.L_cc:
    ldr r0, _LIT4
    bl func_ov002_02259204
.L_d4:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_dc:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_154
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT5
    ldr r0, _LIT1
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT6
    and r3, r3, #0x1
    mla r0, r3, r0, r2
    ldr r1, [r1, #0xd78]
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x12
    cmp r4, r0, lsr #0x1f
    ldrne r0, _LIT0
    movne r2, #0x1
    strne r2, [r0, #0x5b0]
    ldr r0, _LIT0
    mov r2, #0x1
    ldr r3, [r0, #0x5ac]
    add r3, r3, #0x1
    str r3, [r0, #0x5ac]
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d70f0
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_154:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    movne r0, #0x7d
    moveq r0, #0x80
    ldmia sp!, {r3, r4, r5, pc}
.L_16c:
    mov r0, r4
    bl func_ov002_021e277c
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b0]
    cmp r0, #0x0
    beq .L_18c
    rsb r0, r4, #0x1
    bl func_ov002_021e277c
.L_18c:
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, pc}
.L_194:
    ldr r1, [r1, #0x5ac]
    mov r0, r4
    bl func_ov002_021e0f5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cd664
_LIT4: .word func_ov002_022106c4
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022cf08c
