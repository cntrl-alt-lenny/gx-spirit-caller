; func_ov002_021ced48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf168
        .extern data_ov002_022cf288
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_0202e2f8
        .extern func_ov002_021b0c04
        .extern func_ov002_021b1f20
        .extern func_ov002_021b91c4
        .extern func_ov002_021b947c
        .extern func_ov002_021baa04
        .extern func_ov002_021bab38
        .extern func_ov002_021c2934
        .extern func_ov002_021c29bc
        .extern func_ov002_021c93f0
        .extern func_ov002_021c97f8
        .extern func_ov002_021c988c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021ced48
        .arm
func_ov002_021ced48:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
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
    ldr r1, _LIT0
    mov r0, r0, lsr #0x10
    ldr r1, [r1, #0x810]
    mov r0, r0, lsl #0x10
    cmp r1, #0x3
    mov r7, r0, lsr #0x10
    addls pc, pc, r1, lsl #0x2
    b .L_14c4
    b .L_fe0
    b .L_100c
    b .L_1040
    b .L_106c
.L_fe0:
    mov r0, #0x2a
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_100c:
    mov r1, r8
    mov r2, r4
    mov r3, r6
    mov r0, #0x2a
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0, #0x810]
    add sp, sp, #0x8
    add r2, r2, #0x1
    str r2, [r0, #0x810]
    str r1, [r0, #0x814]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1040:
    mov r0, #0x2a
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_106c:
    mov r0, r8
    mov r1, r4
    mov r2, r7
    bl func_ov002_021c93f0
    mov r6, r0
    ldr r0, [r6]
    cmp r5, #0xf
    bic r0, r0, #0x100000
    bic r1, r0, #0x20000
    bic r0, r1, #0x80000
    bic r0, r0, #0x40000
    str r0, [r6]
    ldreq r0, [r6]
    biceq r0, r0, #0x200000
    streq r0, [r6]
    cmp r5, #0xe
    bne .L_1208
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_1208
    cmp r4, #0x5
    bge .L_1194
    cmp r5, #0xe
    bne .L_1194
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_1194
    ldr r0, [r6]
    mov r0, r0, lsl #0x12
    cmp r8, r0, lsr #0x1f
    bne .L_111c
    ldr r0, _LIT1
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r1, _LIT2
    ldr r0, [r1, r2]
    orr r0, r0, #0x2000000
    str r0, [r1, r2]
.L_111c:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    cmp r0, #0x8
    blt .L_1150
    ldr r3, _LIT3
    mov ip, #0x0
    mov r0, r8
    mov r1, #0xb
    mov r2, #0x1
    str ip, [sp]
    bl func_ov002_021b1f20
.L_1150:
    ldr r0, [r6]
    mov r1, #0x1
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x3
    mov r2, r1, lsl r0
    ldr r1, _LIT4
    mov r0, #0x0
    bl func_ov002_021c2934
    ldr r1, [r6]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    rsb r1, r0, #0x14c0
    bl func_ov002_021c2934
.L_1194:
    ldr r0, [r6]
    mov r1, #0x1
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x3
    mov r2, r1, lsl r0
    ldr r1, _LIT5
    mov r0, #0x0
    bl func_ov002_021c2934
    ldr r1, [r6]
    mov r0, #0x1
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x3
    mov r2, r0, lsl r1
    ldr r1, _LIT5
    bl func_ov002_021c2934
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_1208
    ldr r0, [r6]
    ldr r1, _LIT6
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c29bc
.L_1208:
    cmp r5, #0xf
    bne .L_1248
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_1248
    ldr r1, _LIT7
    mov r0, #0x0
    mov r2, #0x1
    bl func_ov002_021c2934
    mov r0, #0x1
    ldr r1, _LIT7
    mov r2, r0
    bl func_ov002_021c2934
.L_1248:
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    cmp r8, r0
    bne .L_1264
    mov r0, #0x1e
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_1264:
    ldr r0, _LIT9
    mov r1, r6
    bl func_ov002_021b91c4
    ldrh r1, [sp, #0x6]
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    mov r0, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsl #0x18
    bic r1, r1, #0x3fc0
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97f8
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x6]
    ldrh r0, [sp, #0x6]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c988c
    ldr r1, _LIT0
    ldrh r4, [sp, #0x4]
    ldr r2, [r1, #0x818]
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r2, r5, lsl #0x10
    mov r6, r0, lsr #0x10
    mov r0, r2, lsr #0x10
    bic r4, r4, #0x1
    and r2, r3, #0x1
    ldrh r1, [sp, #0x6]
    orr r2, r4, r2
    strh r2, [sp, #0x4]
    bic r3, r1, #0x4000
    mov r1, r6, lsl #0x1f
    orr r3, r3, r1, lsr #0x11
    ldrh r2, [sp, #0x4]
    mov r0, r0, lsl #0x1b
    cmp r5, #0xd
    bic r1, r2, #0x3e
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x4]
    movne r0, #0x1
    strh r3, [sp, #0x6]
    moveq r0, #0x0
    ldrh r4, [sp, #0x4]
    ldrh r2, [sp, #0x6]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    bic r4, r4, #0x3fc0
    mov r3, r3, lsl #0x18
    orr r3, r4, r3, lsr #0x12
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    strh r3, [sp, #0x4]
    bl func_ov002_021baa04
    cmp r5, #0xf
    ldrneh r0, [sp, #0x4]
    moveq r2, #0x0
    movne r0, r0, lsl #0x12
    movne r2, r0, lsr #0x18
    ldrh r0, [sp, #0x4]
    ldr r3, _LIT9
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021bab38
    ldrh r0, [sp, #0x4]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c97f8
    ldrh r1, [sp, #0x4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x8000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x4]
    ldrh r0, [sp, #0x4]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021c988c
    ldr r1, _LIT0
    ldrh r4, [sp, #0x4]
    ldr r1, [r1, #0x818]
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x18
    mov r3, r0, lsl #0x1f
    bic r4, r4, #0x4000
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    orr r3, r4, r3, lsr #0x11
    strh r3, [sp, #0x4]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    ldrh r2, [sp, #0x6]
    ldrh r3, [sp, #0x4]
    mov r0, #0x18
    orr r1, r1, #0x80000
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_14c4:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf288
_LIT3: .word 0x0000165a
_LIT4: .word 0x000014bf
_LIT5: .word 0x00001361
_LIT6: .word 0x00001574
_LIT7: .word 0x000016da
_LIT8: .word data_ov002_022cd73c
_LIT9: .word data_ov002_022cf168
