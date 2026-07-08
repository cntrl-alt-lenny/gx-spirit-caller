; func_ov002_021cd8f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf0a0
        .extern data_ov002_022cf0a8
        .extern func_ov002_021b939c
        .extern func_ov002_021b98d4
        .extern func_ov002_021b9950
        .extern func_ov002_021c2b74
        .extern func_ov002_021c2c54
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cd8f4
        .arm
func_ov002_021cd8f4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r6, #0x1
    ldrh r5, [r0, #0x4]
    moveq r6, #0x0
    ldrh r4, [r0, #0x2]
    cmp r5, #0x0
    moveq r7, #0x0
    beq .L_27c
    mov r0, r5
    bl func_ov002_021b939c
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
.L_27c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x810]
    cmp r0, #0x0
    beq .L_2a0
    cmp r0, #0x1
    beq .L_364
    cmp r0, #0x2
    beq .L_39c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2a0:
    cmp r4, #0xe
    bne .L_2f8
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b98d4
    ldr r1, _LIT1
    and r2, r6, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_2f8
    mov r1, r5, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2b74
    mov r1, r6
    mov r2, r4
    mov r3, r5
    mov r0, #0x16
    bl func_ov002_0229acd0
.L_2f8:
    cmp r4, #0xf
    bne .L_350
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9950
    ldr r1, _LIT1
    and r2, r6, #0x1
    mul r3, r2, r1
    ldr r1, _LIT3
    ldr r1, [r1, r3]
    sub r1, r1, #0x1
    cmp r1, r0
    beq .L_350
    mov r1, r5, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2c54
    mov r1, r6
    mov r2, r4
    mov r3, r5
    mov r0, #0x16
    bl func_ov002_0229acd0
.L_350:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_364:
    mov r0, #0x16
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, r6
    mov r2, r4
    mov r3, r7
    mov r0, #0x7
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_39c:
    mov r0, #0x7
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0a0
_LIT3: .word data_ov002_022cf0a8
