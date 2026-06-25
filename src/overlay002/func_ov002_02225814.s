; func_ov002_02225814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022d0e6c
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_020305d8
        .extern func_ov002_021ae400
        .extern func_ov002_021ae430
        .extern func_ov002_021ba5e0
        .extern func_ov002_021bc618
        .extern func_ov002_021c988c
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca440
        .extern func_ov002_021d87dc
        .extern func_ov002_021df708
        .extern func_ov002_021e13f4
        .extern func_ov002_021e2818
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0226b054
        .extern func_ov002_0226b298
        .extern func_ov002_0227adb8
        .extern func_ov002_0229cf10
        .global func_ov002_02225814
        .arm
func_ov002_02225814:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x100
    ldr r3, _LIT0
    mov r8, r0
    ldr r0, [r3, #0x5a8]
    cmp r0, #0x7c
    bgt .L_48
    bge .L_294
    cmp r0, #0x64
    bgt .L_300
    cmp r0, #0x62
    blt .L_300
    beq .L_2e4
    cmp r0, #0x63
    beq .L_2c4
    cmp r0, #0x64
    beq .L_2a4
    b .L_300
.L_48:
    cmp r0, #0x7d
    bgt .L_58
    beq .L_130
    b .L_300
.L_58:
    cmp r0, #0x80
    bgt .L_300
    cmp r0, #0x7e
    blt .L_300
    beq .L_120
    cmp r0, #0x7f
    beq .L_e8
    cmp r0, #0x80
    bne .L_300
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021ba5e0
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x64
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b298
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e8:
    ldr r1, _LIT3
    add r0, sp, #0x0
    ldrh r2, [r1, #0xb0]
    mov r1, #0x130
    str r2, [r3, #0x5ac]
    bl func_ov002_0229cf10
    ldrh r0, [r8, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae430
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_120:
    bl func_ov002_021e2b3c
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_130:
    ldrh r2, [r8, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r6, r2, lsr #0x1f
    and r3, r6, #0x1
    mul r2, r3, r0
    ldr r0, [r1, r2]
    cmp r0, #0x0
    beq .L_288
    ldr r1, _LIT4
    mov r0, r6
    add r4, r1, r2
    ldr r2, [r4, #0x260]
    mov r1, r2, lsl #0x13
    mov r7, r1, lsr #0x13
    mov r2, r2, lsl #0x12
    mov r1, r7
    mov r5, r2, lsr #0x1f
    bl func_ov002_021df708
    mov r0, r6
    mov r1, #0xd
    mov r2, #0x0
    bl func_ov002_021c988c
    cmp r0, #0x0
    bne .L_1a0
    mov r0, r6
    bl func_ov002_021e2818
.L_1a0:
    mov r0, r6
    bl func_ov002_021d87dc
    mov r0, r7
    bl func_0202e234
    cmp r0, #0x0
    beq .L_26c
    mov r0, r7
    bl func_020305d8
    cmp r0, #0x0
    beq .L_26c
    mov r0, r7
    bl func_0202b8a8
    ldr r1, _LIT0
    ldr r1, [r1, #0x5ac]
    cmp r1, r0
    bne .L_1f4
    mov r0, r6
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021e13f4
    b .L_288
.L_1f4:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_258
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    beq .L_258
    ldrh r0, [r8, #0x2]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_258
    mov r0, r5
    add r1, r4, #0x260
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227adb8
    b .L_288
.L_258:
    mov r0, r6
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021e13f4
    b .L_288
.L_26c:
    mov r0, r6
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_021e13f4
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_288:
    add sp, sp, #0x100
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_294:
    bl func_ov002_021e2c5c
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2a4:
    ldrh r0, [r8, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x100
    mov r0, #0x63
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2c4:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    add sp, sp, #0x100
    mov r0, #0x62
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2e4:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_300:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word data_ov002_022cf16c
