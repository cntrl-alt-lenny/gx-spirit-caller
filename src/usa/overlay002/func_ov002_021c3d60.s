; func_ov002_021c3d60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022bdedc
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern func_0202e558
        .extern func_0202ecb0
        .extern func_ov002_021b9dec
        .global func_ov002_021c3d60
        .arm
func_ov002_021c3d60:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    ldr r5, _LIT1
    and r6, r1, #0x1
    mla r5, r6, r4, r5
    mov r4, #0x14
    mla r4, r2, r4, r5
    ldr r2, [r4, #0x30]
    mov r7, r3
    mov r4, #0x0
    mov r2, r2, lsl #0x13
    cmp r7, r1
    mov r1, r2, lsr #0x13
    movne r2, #0x1
    moveq r2, r4
    ldr r3, [r0, #0x24]
    add r2, r2, #0x1
    and r2, r3, r2
    cmp r2, #0x0
    ldr r6, [sp, #0x18]
    mov r5, r4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, _LIT2
    cmp r1, r3
    bgt .L_f0
    bge .L_230
    sub r2, r3, #0x4
    cmp r1, r2
    bgt .L_c0
    bge .L_1e0
    ldr r3, _LIT3
    cmp r1, r3
    bgt .L_b0
    sub r2, r3, #0x5
    subs r2, r1, r2
    addpl pc, pc, r2, lsl #0x2
    b .L_2d8
    b .L_17c
    b .L_17c
    b .L_17c
    b .L_17c
    b .L_17c
    b .L_17c
.L_b0:
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_154
    b .L_2d8
.L_c0:
    sub r2, r3, #0x2
    cmp r1, r2
    bgt .L_e0
    bge .L_208
    sub r2, r3, #0x3
    cmp r1, r2
    beq .L_1f4
    b .L_2d8
.L_e0:
    sub r2, r3, #0x1
    cmp r1, r2
    beq .L_21c
    b .L_2d8
.L_f0:
    ldr r3, _LIT5
    cmp r1, r3
    bgt .L_124
    bge .L_26c
    sub r2, r3, #0x254
    cmp r1, r2
    bgt .L_114
    beq .L_244
    b .L_2d8
.L_114:
    sub r2, r3, #0x92
    cmp r1, r2
    beq .L_258
    b .L_2d8
.L_124:
    ldr r2, _LIT6
    cmp r1, r2
    bgt .L_144
    bge .L_28c
    sub r2, r2, #0x238
    cmp r1, r2
    beq .L_1b8
    b .L_2d8
.L_144:
    add r2, r2, #0x30
    cmp r1, r2
    beq .L_1cc
    b .L_2d8
.L_154:
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT7
    and r3, r7, #0x1
    mul r1, r6, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    addne r5, r5, #0x1f4
    b .L_2d8
.L_17c:
    ldr r6, [r0, #0x4]
    cmp r6, #0x0
    beq .L_2d8
    cmp r6, #0x14
    bgt .L_2d8
    rsb r0, r3, #0x5
    ldr r2, _LIT8
    add r1, r1, r0
    mov r0, #0x30
    mla r0, r1, r0, r2
    mov r1, r6, lsl #0x1
    ldrsh r0, [r1, r0]
    add r4, r4, r0
    add r5, r5, r0
    b .L_2d8
.L_1b8:
    ldr r0, [r0, #0x4]
    cmp r0, #0x10
    addeq r4, r4, #0xc8
    addeq r5, r5, #0xc8
    b .L_2d8
.L_1cc:
    ldr r0, [r0, #0x4]
    cmp r0, #0x9
    addeq r4, r4, #0x12c
    addeq r5, r5, #0x12c
    b .L_2d8
.L_1e0:
    ldr r0, [r0, #0xc]
    tst r0, #0x20
    addne r4, r4, #0x1f4
    subne r5, r5, #0x190
    b .L_2d8
.L_1f4:
    ldr r0, [r0, #0xc]
    tst r0, #0x8
    addne r4, r4, #0x1f4
    subne r5, r5, #0x190
    b .L_2d8
.L_208:
    ldr r0, [r0, #0xc]
    tst r0, #0x10
    addne r4, r4, #0x1f4
    subne r5, r5, #0x190
    b .L_2d8
.L_21c:
    ldr r0, [r0, #0xc]
    tst r0, #0x40
    addne r4, r4, #0x1f4
    subne r5, r5, #0x190
    b .L_2d8
.L_230:
    ldr r0, [r0, #0xc]
    tst r0, #0x2
    addne r4, r4, #0x1f4
    subne r5, r5, #0x190
    b .L_2d8
.L_244:
    ldr r0, [r0, #0xc]
    tst r0, #0x4
    addne r4, r4, #0x1f4
    subne r5, r5, #0x190
    b .L_2d8
.L_258:
    ldr r0, [r0, #0xc]
    tst r0, #0x8
    addne r4, r4, #0xc8
    addne r5, r5, #0xc8
    b .L_2d8
.L_26c:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    bl func_0202e558
    cmp r0, #0x0
    addne r4, r4, #0x1f4
    addne r5, r5, #0x1f4
    b .L_2d8
.L_28c:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r1, _LIT9
    cmp r0, r1
    beq .L_2d4
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r6, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202ecb0
    cmp r0, #0x0
    beq .L_2d8
.L_2d4:
    add r4, r4, #0x1f4
.L_2d8:
    mov r0, r5, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r4, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00001348
_LIT3: .word 0x000010f5
_LIT4: .word 0x00001323
_LIT5: .word 0x0000159d
_LIT6: .word 0x00001a77
_LIT7: .word data_ov002_022cf0c2
_LIT8: .word data_ov002_022bdedc
_LIT9: .word 0x000019fd
