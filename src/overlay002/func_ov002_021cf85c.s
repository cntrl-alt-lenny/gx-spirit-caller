; func_ov002_021cf85c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf180
        .extern data_ov002_022cf188
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_ov002_021b947c
        .extern func_ov002_021c2c54
        .extern func_ov002_021c2d34
        .extern func_ov002_021c9504
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021cf85c
        .arm
func_ov002_021cf85c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r8, #0x1
    ldrh r6, [r0, #0x6]
    ldrh r4, [r0, #0x2]
    ldrh r5, [r0, #0x4]
    mov r0, r6
    moveq r8, #0x0
    bl func_ov002_021b947c
    and r1, r0, #0xff
    cmp r1, r8
    mvn r7, #0x0
    bne .L_1d58
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, r4
    moveq r0, r0, lsr #0x10
    moveq r0, r0, lsl #0x10
    moveq r7, r0, lsr #0x10
.L_1d58:
    ldr r0, _LIT0
    ldr r0, [r0, #0x810]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    b .L_1d7c
    b .L_1e38
    b .L_1e70
    b .L_1f04
.L_1d7c:
    cmp r4, #0xe
    bne .L_1dd0
    cmp r7, #0x0
    blt .L_1dd0
    ldr r0, _LIT1
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    sub r0, r0, #0x1
    cmp r7, r0
    beq .L_1dd0
    mov r1, r6, lsl #0x10
    mov r0, r8
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2c54
    mov r1, r8
    mov r2, r4
    mov r3, r6
    mov r0, #0x16
    bl func_ov002_0229ade0
.L_1dd0:
    cmp r4, #0xf
    bne .L_1e24
    cmp r7, #0x0
    blt .L_1e24
    ldr r0, _LIT1
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    sub r0, r0, #0x1
    cmp r7, r0
    beq .L_1e24
    mov r1, r6, lsl #0x10
    mov r0, r8
    mov r1, r1, lsr #0x10
    bl func_ov002_021c2d34
    mov r1, r8
    mov r2, r4
    mov r3, r6
    mov r0, #0x16
    bl func_ov002_0229ade0
.L_1e24:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1e38:
    mov r0, #0x16
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r1, r8
    mov r2, r5
    mov r0, #0x43
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1e70:
    mov r0, #0x43
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r7, #0x0
    blt .L_1ea8
    cmp r4, #0xa
    bgt .L_1ec4
    mov r0, r8
    mov r1, r4
    mov r2, r7
    bl func_ov002_021c9504
    cmp r0, #0x0
    bne .L_1ec4
.L_1ea8:
    and r0, r8, #0x1
    orr r1, r0, #0x20
    mov r2, r5
    mov r3, r6
    mov r0, #0x20
    bl func_ov002_0229ade0
    b .L_1ef0
.L_1ec4:
    and r1, r8, #0x1
    mov r0, r4, lsl #0x1b
    mov r2, r7, lsl #0x18
    orr r0, r1, r0, lsr #0x1a
    orr r0, r0, r2, lsr #0x12
    mov r0, r0, lsl #0x10
    mov r2, r5
    mov r3, r6
    mov r1, r0, lsr #0x10
    mov r0, #0x20
    bl func_ov002_0229ade0
.L_1ef0:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1f04:
    mov r0, #0x20
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT4
    ldr r1, [r0, #0xcf8]
    cmp r1, #0x2
    bne .L_1f44
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT5
    ldr r0, [r1, r2]
    orr r0, r0, #0x100000
    str r0, [r1, r2]
.L_1f44:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf180
_LIT3: .word data_ov002_022cf188
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cf288
