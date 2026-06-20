; func_ov002_02235e0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021ae514
        .extern func_ov002_021c2f24
        .extern func_ov002_021d90c0
        .extern func_ov002_021f4260
        .extern func_ov002_02210104
        .extern func_ov002_0222a9d0
        .extern func_ov002_0226b0d0
        .global func_ov002_02235e0c
        .arm
func_ov002_02235e0c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x6
    bne .L_250
    ldrh r1, [r4]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    ldr r3, _LIT0
    ldr r1, [r3, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_278
    b .L_1ec
    b .L_1b8
    b .L_100
    b .L_58
.L_58:
    ldrh r5, [r4, #0x2]
    ldr r1, _LIT1
    ldrh r4, [r4, #0x4]
    mov r2, r5, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mov r6, r5, lsl #0x1a
    mul r1, r2, r1
    ldr r5, _LIT2
    mov r6, r6, lsr #0x1b
    mov r2, #0x14
    mul r2, r6, r2
    add r5, r5, r1
    add r5, r5, #0x30
    mov r6, r4, lsl #0x11
    ldr r5, [r5, r2]
    mov r6, r6, lsr #0x17
    mov r4, r5, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r4, r4, lsl #0x1
    add r4, r4, r5, lsr #0x1f
    cmp r6, r4
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r4, _LIT3
    add r1, r4, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r0, #0x0
    addeq sp, sp, #0x8
    mov r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    str r0, [r3, #0x5ac]
    str r0, [r3, #0x5b0]
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_100:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_154
    ldr r1, [r3, #0x5b0]
    mov r2, #0x0
    mov r0, #0x1
.L_128:
    tst r1, r0, lsl r2
    bne .L_144
    ldr r1, _LIT5
    add sp, sp, #0x8
    str r2, [r1, #0xd44]
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_144:
    add r2, r2, #0x1
    cmp r2, #0x3
    blt .L_128
    b .L_1ac
.L_154:
    ldrh r0, [r4]
    mov r1, #0x0
    bl func_ov002_021f4260
    mov r6, r0
    ldrh r0, [r4]
    mov r1, #0x1
    bl func_ov002_021f4260
    mov r5, r0
    ldrh r0, [r4]
    mov r1, #0x2
    bl func_ov002_021f4260
    mov r1, r6
    mov r2, r5
    mov r3, r0
    mov r0, #0x0
    str r0, [sp]
    ldr r4, _LIT0
    ldr r0, _LIT6
    ldr r4, [r4, #0x5b0]
    mvn r4, r4
    str r4, [sp, #0x4]
    bl func_ov002_021ae514
.L_1ac:
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_1b8:
    ldr r0, _LIT5
    ldr r1, [r0, #0xd44]
    strh r1, [r4, #0xc]
    ldrh r3, [r4, #0x2]
    ldr r2, [r0, #0xd44]
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b0d0
    add sp, sp, #0x8
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_1ec:
    ldrh r1, [r4, #0xc]
    ldr ip, [r3, #0x5b0]
    mov r2, #0x1
    orr r1, ip, r2, lsl r1
    str r1, [r3, #0x5b0]
    ldr r1, _LIT0
    cmp r0, #0x3
    ldr r2, [r1, #0x5ac]
    movgt r0, #0x3
    add r2, r2, #0x1
    cmp r2, r0
    str r2, [r1, #0x5ac]
    addlt sp, sp, #0x8
    movlt r0, #0x7f
    ldmltia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    ldr r2, [r1, #0x5b0]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d90c0
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_250:
    cmp r3, #0xf
    bne .L_264
    bl func_ov002_0222a9d0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_264:
    cmp r3, #0x16
    bne .L_278
    bl func_ov002_02210104
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_278:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word data_ov002_022cd744
_LIT5: .word data_ov002_022d016c
_LIT6: .word 0x00000103
