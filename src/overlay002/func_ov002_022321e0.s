; func_ov002_022321e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_0202eac8
        .extern func_0202f578
        .extern func_ov002_021ae400
        .extern func_ov002_021b422c
        .extern func_ov002_021bb950
        .extern func_ov002_021bc000
        .extern func_ov002_021d873c
        .extern func_ov002_021de408
        .extern func_ov002_021e7584
        .extern func_ov002_022577dc
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0229cf10
        .global func_ov002_022321e0
        .arm
func_ov002_022321e0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x100
    mov r7, r0
    ldrh r6, [r7]
    ldr r1, _LIT0
    mov r4, #0x0
    cmp r6, r1
    mov r5, #0x1
    bgt .L_50
    cmp r6, r1
    bge .L_8c
    sub r0, r1, #0x148
    cmp r6, r0
    bgt .L_40
    ldreqh r4, [r7, #0xc]
    b .L_15c
.L_40:
    sub r0, r1, #0x17
    cmp r6, r0
    beq .L_70
    b .L_15c
.L_50:
    cmp r6, #0x1a80
    bgt .L_60
    beq .L_d0
    b .L_15c
.L_60:
    add r0, r1, #0x77
    cmp r6, r0
    beq .L_ac
    b .L_15c
.L_70:
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc000
    mov r4, r0
    b .L_15c
.L_8c:
    ldrh r0, [r7, #0x4]
    mov r1, r6
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b422c
    mov r4, r0
    mov r5, #0x0
    b .L_15c
.L_ac:
    mov r0, r4
    mov r1, r6
    bl func_ov002_021bb950
    mov r4, r0
    mov r1, r6
    mov r0, r5
    bl func_ov002_021bb950
    add r4, r4, r0
    b .L_15c
.L_d0:
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc000
    ldrh r4, [r7, #0x2]
    ldr r1, _LIT3
    ldrh r3, [r7, #0x4]
    mov r2, r4, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mov r5, r4, lsl #0x1a
    mul r1, r2, r1
    ldr r4, _LIT4
    mov r5, r5, lsr #0x1b
    mov r2, #0x14
    add r4, r4, r1
    mul r2, r5, r2
    add r4, r4, #0x30
    ldr r4, [r4, r2]
    mov r5, r3, lsl #0x11
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    mov r4, r0
    cmp r3, r5, lsr #0x17
    bne .L_158
    ldr r0, _LIT5
    add r0, r0, r1
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    subne r4, r4, #0x1
.L_158:
    mov r5, #0x0
.L_15c:
    ldr r1, _LIT6
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x7c
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_318
    b .L_2f8
    b .L_270
    b .L_318
    b .L_230
    b .L_188
.L_188:
    mov r0, #0x0
    strh r0, [r7, #0xa]
    cmp r4, #0x0
    addle sp, sp, #0x100
    strh r0, [r7, #0x8]
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    str r4, [r1, #0x5ac]
    bl func_ov002_022577dc
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x0
    beq .L_1dc
    ldr r1, _LIT6
    ldr r1, [r1, #0x5ac]
    cmp r0, r1
    addlt sp, sp, #0x100
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_1dc:
    cmp r5, #0x0
    beq .L_210
    ldr r1, _LIT6
    add r0, sp, #0x0
    ldr r2, [r1, #0x5ac]
    mov r1, #0x71
    bl func_ov002_0229cf10
    ldrh r0, [r7, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    b .L_224
.L_210:
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
.L_224:
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_230:
    ldr r1, _LIT8
    mov r0, r7
    bl func_ov002_02257878
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x7c
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    ldr r2, _LIT8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_270:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_2cc
    ldr r1, _LIT9
    add r5, r7, #0x8
    ldr r0, [r1, #0xd70]
    ldr r2, [r1, #0xd74]
    mov r4, r0, lsl #0x1
    ldr r1, [r1, #0xd78]
    ldrh r3, [r5, r4]
    add r1, r2, r1
    mov r2, #0x1
    orr r2, r3, r2, lsl r1
    strh r2, [r5, r4]
    bl func_ov002_021d873c
    ldr r0, _LIT6
    add sp, sp, #0x100
    ldr r1, [r0, #0x5ac]
    subs r1, r1, #0x1
    str r1, [r0, #0x5ac]
    movne r0, #0x7f
    moveq r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2cc:
    cmp r5, #0x0
    bne .L_2ec
    ldr r0, _LIT6
    ldr r0, [r0, #0x5ac]
    cmp r4, r0
    addne sp, sp, #0x100
    movne r0, #0x7c
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_2ec:
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2f8:
    ldrh r2, [r7, #0x8]
    ldrh r1, [r7, #0xa]
    mov r0, r7
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021de408
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_318:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00001a28
_LIT1: .word func_0202eac8
_LIT2: .word func_0202f578
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
_LIT5: .word data_ov002_022cf1a4
_LIT6: .word data_ov002_022ce288
_LIT7: .word 0x00000119
_LIT8: .word func_ov002_021e7584
_LIT9: .word data_ov002_022d016c
