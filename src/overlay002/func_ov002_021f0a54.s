; func_ov002_021f0a54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d0250
        .extern func_0202b878
        .extern func_0202f2e4
        .extern func_0202f410
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba104
        .extern func_ov002_021c23ac
        .extern func_ov002_021c8940
        .extern func_ov002_021c93cc
        .extern func_ov002_021e797c
        .global func_ov002_021f0a54
        .arm
func_ov002_021f0a54:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x30
    mov r8, r2
    cmp r8, #0x5
    mov r5, r0
    mov r4, r1
    addge sp, sp, #0x30
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r4
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r3, _LIT0
    and r6, r4, #0x1
    mul r7, r6, r3
    mov r0, #0x14
    mul r6, r8, r0
    ldr r3, _LIT1
    add r0, r3, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r5]
    ldr r3, _LIT2
    cmp r0, r3
    bgt .L_a8
    bge .L_17c
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_98
    beq .L_d8
    b .L_370
.L_98:
    add r1, r1, #0x2d
    cmp r0, r1
    beq .L_148
    b .L_370
.L_a8:
    ldr r3, _LIT4
    cmp r0, r3
    bgt .L_c8
    bge .L_308
    sub r3, r3, #0xe2
    cmp r0, r3
    beq .L_248
    b .L_370
.L_c8:
    add r1, r3, #0x1b
    cmp r0, r1
    beq .L_358
    b .L_370
.L_d8:
    mov r0, r4
    mov r1, r8
    bl func_ov002_021c23ac
    cmp r0, #0x0
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT5
    ldrh r0, [r5, #0x4]
    add r1, r1, r7
    add r1, r1, #0x30
    ldr r1, [r1, r6]
    mov r2, r0, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    mov r1, r8
    mov r2, #0x4
    bl func_ov002_021c93cc
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_148:
    mov r0, r4
    mov r1, r8
    bl func_ov002_021c23ac
    cmp r0, #0x0
    addeq sp, sp, #0x30
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT6
    mov r0, r4
    mov r1, r8
    bl func_ov002_021ba104
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_17c:
    mov r0, r4
    mov r1, r8
    bl func_ov002_021c8940
    cmp r0, #0xf
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_23c
    add r0, sp, #0x18
    mov r1, #0x0
    str r1, [r0]
    ldrh r3, [sp, #0x1a]
    mov r2, r4, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x1a]
    ldrh r2, [sp, #0x1a]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bic r2, r2, #0x3e
    orr r2, r2, #0x16
    strh r2, [sp, #0x1a]
    str r1, [r0, #0xc]
    ldrh r2, [sp, #0x1a]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    ldrh r1, [r5, #0x8]
    ldrh r6, [sp, #0x1c]
    bic r3, r2, #0x3000
    strh r1, [sp, #0x18]
    ldrh r5, [r5, #0xa]
    ldr r1, _LIT7
    and r2, r6, r1
    mov r1, r5, lsl #0x17
    orr r5, r2, r1, lsr #0x11
    mov r1, r4
    mov r2, r8
    strh r5, [sp, #0x1c]
    strh r3, [sp, #0x1a]
    bl func_ov002_021e797c
    cmp r0, #0x1
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_23c:
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_248:
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_2fc
    add r0, sp, #0x0
    mov r3, #0x0
    str r3, [r0]
    ldrh r6, [sp, #0x2]
    mov r4, r4, lsl #0x10
    mov r4, r4, lsr #0x10
    bic r6, r6, #0x1
    and r4, r4, #0x1
    orr r4, r6, r4
    strh r4, [sp, #0x2]
    ldrh r4, [sp, #0x2]
    str r3, [r0, #0x4]
    str r3, [r0, #0x8]
    bic r4, r4, #0x3e
    orr r4, r4, #0x16
    strh r4, [sp, #0x2]
    str r3, [r0, #0xc]
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    ldrh r6, [r5, #0xa]
    ldr r3, _LIT8
    ldrh r4, [sp, #0x2]
    mov r6, r6, lsl #0x2
    ldrh r7, [r3, r6]
    ldrh r6, [sp, #0x4]
    ldr r3, _LIT7
    mov r7, r7, lsl #0x13
    mov r7, r7, lsr #0x13
    strh r7, [sp]
    ldrh r5, [r5, #0xa]
    and r6, r6, r3
    bic r4, r4, #0x3000
    mov r3, r5, lsl #0x17
    orr r3, r6, r3, lsr #0x11
    strh r3, [sp, #0x4]
    strh r4, [sp, #0x2]
    bl func_ov002_021e797c
    cmp r0, #0x1
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_2fc:
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_308:
    ldr r0, _LIT5
    add r0, r0, r7
    add r0, r0, r6
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    cmp r0, #0x7
    bne .L_34c
    mov r0, r4
    mov r1, r8
    bl func_ov002_021b9ecc
    bl func_0202f2e4
    cmp r0, #0x0
    addne sp, sp, #0x30
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_34c:
    add sp, sp, #0x30
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_358:
    mov r0, r4
    mov r1, r8
    bl func_ov002_021b9ecc
    bl func_0202f410
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_370:
    mov r0, #0x1
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word 0x00001938
_LIT3: .word 0x000017e1
_LIT4: .word 0x00001a5b
_LIT5: .word data_ov002_022cf16c
_LIT6: .word 0x00001806
_LIT7: .word 0xffff803f
_LIT8: .word data_ov002_022d0250
