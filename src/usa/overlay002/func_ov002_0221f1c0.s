; func_ov002_0221f1c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021afac0
        .extern func_ov002_021b3ef8
        .extern func_ov002_021bcf50
        .extern func_ov002_021d46ac
        .extern func_ov002_021d8324
        .extern func_ov002_021d8fd0
        .extern func_ov002_021df5e4
        .extern func_ov002_021df728
        .extern func_ov002_021e1a34
        .extern func_ov002_021e26d0
        .extern func_ov002_021e277c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .global func_ov002_0221f1c0
        .arm
func_ov002_0221f1c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldrh r0, [r8, #0x2]
    mov r1, r0, lsl #0x1f
    mov r4, r1, lsr #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r4
    mov r5, r1, lsr #0x1b
    bl func_ov002_021bcf50
    mov sl, #0x14
    ldrh r2, [r8, #0x4]
    ldr r3, _LIT0
    ldr r6, _LIT1
    and ip, r4, #0x1
    mla r7, ip, r3, r6
    mul r9, r5, sl
    mov r1, r2, lsl #0x1d
    mov r6, r0
    movs r0, r1, lsr #0x1f
    ldr r7, [r9, r7]
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r1, [r8, #0x2]
    mov ip, r2, lsl #0x11
    ldr r9, _LIT2
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r1, lsl #0x1a
    and lr, r0, #0x1
    mov r2, r2, lsr #0x1b
    mla r9, lr, r3, r9
    mul sl, r2, sl
    add r9, r9, #0x30
    ldr r9, [r9, sl]
    mov sl, ip, lsr #0x17
    mov ip, r9, lsl #0x2
    mov ip, ip, lsr #0x18
    mov r9, r9, lsl #0x12
    mov ip, ip, lsl #0x1
    add r9, ip, r9, lsr #0x1f
    cmp sl, r9
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, r1, lsl #0x12
    movs r1, r1, lsr #0x1e
    bne .L_f4
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x5f
    mov r0, r0, lsl #0x10
    mov r1, #0x0
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_f4:
    cmp r7, #0x3
    addls pc, pc, r7, lsl #0x2
    b .L_130
    b .L_110
    b .L_118
    b .L_120
    b .L_128
.L_110:
    ldr r9, _LIT3
    b .L_13c
.L_118:
    add r9, r3, #0xc30
    b .L_13c
.L_120:
    ldr r9, _LIT4
    b .L_13c
.L_128:
    ldr r9, _LIT5
    b .L_13c
.L_130:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_13c:
    ldr r1, _LIT6
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x64
    bgt .L_154
    beq .L_3d4
    b .L_3e8
.L_154:
    sub r1, r1, #0x76
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_3e8
    b .L_3bc
    b .L_3a8
    b .L_390
    b .L_3e8
    b .L_3e8
    b .L_3e8
    b .L_31c
    b .L_234
    b .L_1f8
    b .L_1dc
    b .L_190
.L_190:
    ldrh r1, [r8]
    mov r2, r9
    bl func_ov002_022535a4
    cmp r0, #0x0
    bne .L_1c4
    ldrh r0, [r8, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0xc
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1c4:
    mov r0, r4
    mov r1, #0xf6
    bl func_ov002_021ae320
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1dc:
    ldrh r2, [r8]
    mov r3, r9
    mov r1, #0x6
    bl func_ov002_021af8f0
    add sp, sp, #0xc
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_1f8:
    bl func_ov002_021afac0
    cmp r0, #0xb
    beq .L_210
    cmp r0, #0xd
    beq .L_21c
    b .L_228
.L_210:
    add sp, sp, #0xc
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_21c:
    add sp, sp, #0xc
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_228:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_234:
    bl func_ov002_021afa94
    mov r9, r0
    bl func_ov002_021afa94
    ldr r2, [r9]
    mov r1, r5
    mov r3, r2, lsl #0x12
    ldr r2, [r0]
    mov r0, r4
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r5, r2, r3, lsr #0x1f
    add r2, r7, #0x1
    bl func_ov002_021d8fd0
    str r6, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, r4
    mov r1, #0xb
    mov r2, r5
    mov r3, r4
    bl func_ov002_021d8324
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x5f
    add r1, r7, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
    ldr r2, _LIT7
    mov r0, r4
    mov r3, r5
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_300
    ldr r1, _LIT7
    mov r0, r4
    bl func_ov002_021df5e4
    mov r0, r8
    mov r1, r4
    mov r2, #0x7d0
    bl func_ov002_021df728
.L_300:
    cmp r7, #0x3
    beq .L_310
    mov r0, r4
    bl func_ov002_021e277c
.L_310:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_31c:
    mov r0, r4
    mov r1, r5
    add r2, r7, #0x1
    bl func_ov002_021d8fd0
    mov r1, r9, lsl #0x10
    mov r0, r4
    mov r2, r6
    mov r1, r1, lsr #0x10
    bl func_ov002_021e1a34
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x5f
    add r1, r7, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
    cmp r7, #0x3
    beq .L_384
    mov r0, r4
    bl func_ov002_021e277c
.L_384:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_390:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021e26d0
    add sp, sp, #0xc
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_3a8:
    rsb r0, r4, #0x1
    bl func_ov002_0226af64
    add sp, sp, #0xc
    mov r0, #0x76
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_3bc:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021e26d0
    add sp, sp, #0xc
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_3d4:
    mov r0, r4
    bl func_ov002_021e277c
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_3e8:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c8
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00001497
_LIT4: .word 0x00001499
_LIT5: .word 0x0000149a
_LIT6: .word data_ov002_022ce1a8
_LIT7: .word 0x00001379
