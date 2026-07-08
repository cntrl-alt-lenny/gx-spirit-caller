; func_ov002_021cff48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c8
        .extern func_02030e50
        .extern func_ov002_021b96f4
        .extern func_ov002_021b9dec
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cff48
        .arm
func_ov002_021cff48:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r6, #0x1
    ldrh r5, [r0, #0x6]
    moveq r6, #0x0
    ldrh r4, [r0, #0x2]
    ldrh r7, [r0, #0x4]
    cmp r5, #0x0
    ble .L_90
    ldr r0, [r0, #0x810]
    cmp r0, #0x0
    bne .L_7c
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b96f4
    and r1, r6, #0xff
    orr r1, r1, #0x1000
    mov r1, r1, lsl #0x10
    mov r3, r0
    mov r2, r5
    mov r1, r1, lsr #0x10
    mov r0, #0x23
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7c:
    mov r0, #0x23
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    beq .L_184
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_90:
    mov r0, r6
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r0, #0x0
    beq .L_184
    bl func_02030e50
    cmp r0, #0x0
    beq .L_184
    cmp r7, #0x0
    beq .L_164
    ldr r0, _LIT0
    ldr r0, [r0, #0x810]
    cmp r0, #0x0
    bne .L_150
    ldr r1, _LIT1
    and r2, r6, #0x1
    mul r5, r2, r1
    mov r0, #0x14
    ldr r2, _LIT2
    ldr r1, _LIT3
    mul ip, r4, r0
    add r3, r2, r5
    add r1, r1, r5
    ldr r0, [r3, ip]
    add r1, r1, #0x30
    add r2, r0, #0x1
    str r2, [r3, ip]
    ldr r3, [r1, ip]
    mov r0, r0, lsl #0x10
    and r5, r6, #0xff
    and r2, r4, #0xff
    mov r1, r3, lsl #0x2
    orr r4, r5, r2, lsl #0x8
    mov r2, r1, lsr #0x18
    mov r1, r4, lsl #0x10
    mov r4, r3, lsl #0x12
    mov r3, r2, lsl #0x1
    mov r0, r0, lsr #0x10
    add r2, r0, #0x1
    mov r1, r1, lsr #0x10
    add r3, r3, r4, lsr #0x1f
    mov r0, #0x23
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_150:
    mov r0, #0x23
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    beq .L_184
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_164:
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT2
    and r3, r6, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    mov r2, #0x0
    str r2, [r1, r0]
.L_184:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c8
_LIT3: .word data_ov002_022cf08c
