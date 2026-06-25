; func_ov002_021c7f48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1a6
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d0650
        .extern func_0202b8c0
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021c3e40
        .extern func_ov002_021c4158
        .global func_ov002_021c7f48
        .arm
func_ov002_021c7f48:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov sl, r1
    ldr r4, _LIT0
    and r5, sl, #0x1
    mov r9, r2
    mov r1, #0x14
    mul lr, r5, r4
    ldr r2, _LIT1
    mul ip, r9, r1
    add r1, r2, lr
    ldrh r2, [ip, r1]
    mov r8, r3
    ldr r7, [sp, #0x28]
    cmp r2, #0x0
    beq .L_1a8
    ldr r1, _LIT2
.L_44:
    mov r3, r2, lsl #0x3
    add r4, r1, r2, lsl #0x3
    ldrh r5, [r1, r3]
    ldrh r3, [r4, #0x2]
    ldrh r2, [r4, #0x6]
    and r6, r5, #0xff
    mov r3, r3, lsl #0x1c
    mov r5, r5, asr #0x8
    mov r3, r3, lsr #0x1c
    and r5, r5, #0xff
    cmp r3, #0xd
    addls pc, pc, r3, lsl #0x2
    b .L_1a0
    b .L_1a0
    b .L_1a0
    b .L_1a0
    b .L_1a0
    b .L_1a0
    b .L_1a0
    b .L_c8
    b .L_c8
    b .L_1a0
    b .L_1a0
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_b0
.L_b0:
    cmp r8, r6
    cmpeq r7, r5
    bne .L_1a0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_c8:
    cmp r8, r6
    cmpeq r7, r5
    bne .L_1a0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9ecc
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_110
    bge .L_134
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_104
    beq .L_140
    b .L_164
.L_104:
    cmp r0, #0x1280
    beq .L_134
    b .L_164
.L_110:
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_124
    beq .L_134
    b .L_164
.L_124:
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_14c
    b .L_164
.L_134:
    add sp, sp, #0x4
    mov r0, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_140:
    add sp, sp, #0x4
    mov r0, #0x5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_14c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1c
    addne sp, sp, #0x4
    movne r0, #0x5
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_164:
    ldr r0, _LIT0
    ldr r1, _LIT7
    and r2, r6, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8c0
    cmp r0, #0x4
    moveq r0, #0x2
    add sp, sp, #0x4
    movne r0, #0x6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1a0:
    cmp r2, #0x0
    bne .L_44
.L_1a8:
    cmp r9, #0x5
    bge .L_28c
    ldr r2, _LIT8
    add r1, r2, lr
    ldrh r1, [ip, r1]
    cmp r1, #0x0
    beq .L_28c
    ldr r1, _LIT0
    and r3, r8, #0x1
    mul r4, r3, r1
    mov r1, #0x14
    ldr r3, _LIT9
    mul r1, r7, r1
    add r3, r3, r4
    ldr r5, [r1, r3]
    add r4, r2, r4
    mov r3, r5, lsr #0x6
    mov r2, r5, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r5, lsr #0x1
    and r2, r2, #0x1
    ldrh r4, [r1, r4]
    mvn r3, r3
    mvn r1, r2
    and r2, r4, r3
    tst r2, r1
    beq .L_28c
    cmp r7, #0xa
    mov r1, r8
    mov r2, r7
    bne .L_244
    mov r3, sl
    str r9, [sp]
    bl func_ov002_021c3e40
    cmp r0, #0x0
    beq .L_28c
    add sp, sp, #0x4
    mov r0, #0x3
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_244:
    mov r3, sl
    str r9, [sp]
    bl func_ov002_021c4158
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x5
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, _LIT10
    mov r0, r8
    mov r1, r7
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_28c
    cmp sl, r8
    cmpeq r9, r7
    addne sp, sp, #0x4
    movne r0, #0x5
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_28c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a6
_LIT2: .word data_ov002_022d0650
_LIT3: .word 0x0000128a
_LIT4: .word 0x00000ff9
_LIT5: .word 0x00001743
_LIT6: .word 0x00001a7c
_LIT7: .word data_ov002_022cf16c
_LIT8: .word data_ov002_022cf1a4
_LIT9: .word data_ov002_022cf1ac
_LIT10: .word 0x00001905
