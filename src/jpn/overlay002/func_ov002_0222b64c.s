; func_ov002_0222b64c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021c22cc
        .extern func_ov002_021d7b2c
        .extern func_ov002_021dec2c
        .extern func_ov002_021df728
        .global func_ov002_0222b64c
        .arm
func_ov002_0222b64c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r5, _LIT0
    mov r4, r0
    ldr r1, [r5, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_164
    b .L_13c
    b .L_e0
    b .L_88
    b .L_30
.L_30:
    mov r7, #0x0
    str r7, [r5, #0x5ac]
    mov r6, r7
.L_3c:
    mov r8, r6
.L_40:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021c22cc
    cmp r0, #0x0
    ldrne r0, [r5, #0x5ac]
    add r8, r8, #0x1
    addne r0, r0, #0x1
    strne r0, [r5, #0x5ac]
    cmp r8, #0xa
    ble .L_40
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_3c
    mov r0, r4
    mvn r1, #0x0
    bl func_ov002_021dec2c
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_88:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r4, r3, r1
    ldr r1, [r2, r4]
    cmp r1, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT3
    mov r2, #0x0
    add r1, r1, r4
    add r1, r1, #0x120
    bl func_ov002_021d7b2c
    mov r1, r5
    ldr r2, [r1, #0x5ac]
    mov r0, #0x7f
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e0:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r4, r3, r1
    ldr r1, [r2, r4]
    cmp r1, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT3
    mov r2, #0x0
    add r1, r1, r4
    add r1, r1, #0x120
    bl func_ov002_021d7b2c
    mov r1, r5
    ldr r2, [r1, #0x5ac]
    mov r0, #0x7e
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_13c:
    ldr r3, [r5, #0x5ac]
    mov r1, #0x12c
    ldrh r4, [r4, #0x2]
    mul r2, r3, r1
    mov r1, r4, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_164:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
