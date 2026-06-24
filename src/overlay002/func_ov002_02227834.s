; func_ov002_02227834 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021b0c04
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bc6c4
        .extern func_ov002_021bd030
        .extern func_ov002_021ca2b8
        .extern func_ov002_021d59cc
        .extern func_ov002_021d5d58
        .extern func_ov002_021ded54
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_0227ac64
        .global func_ov002_02227834
        .arm
func_ov002_02227834:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r8, r0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x7f
    beq .L_534
    cmp r2, #0x80
    bne .L_570
    ldrh r1, [r8, #0xc]
    cmp r1, #0x1
    beq .L_2c4
    cmp r1, #0x2
    beq .L_448
    cmp r1, #0x3
    bne .L_528
.L_2c4:
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_528
    mov r0, r8
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_528
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, asr #0x8
    and r4, r0, #0xff
    mov r0, r8
    mov r1, #0x1
    and r5, r2, #0xff
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    mov r2, #0x1
    and r6, r0, #0xff
    strh r2, [r8, #0xc]
    mov r0, r8
    mov r1, r4
    mov r2, r5
    and r7, r3, #0xff
    bl func_ov002_0225764c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r3, #0x3
    mov r0, r8
    mov r1, r6
    mov r2, r7
    strh r3, [r8, #0xc]
    bl func_ov002_0225764c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT1
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3ecc
    ldr r1, _LIT0
    str r0, [r1, #0x5b0]
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1, #0x5ac]
    blt .L_528
    str r0, [sp]
    mov r0, r8
    mov r1, r4
    mov r2, r5
    mov r3, r4
    bl func_ov002_021ded54
    ldr r0, _LIT0
    ldrh r2, [r8, #0x2]
    ldr r0, [r0, #0x5ac]
    and r1, r4, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r3, r2, lsl #0x1f
    mov r1, r0, lsl #0x10
    and r2, r6, #0xff
    and r0, r7, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0xb
    bl func_ov002_021d5d58
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_43c
    mov r0, #0x30
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_43c:
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_448:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_528
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r8
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_528
    ldr r2, _LIT1
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3ecc
    ldr r1, _LIT0
    str r0, [r1, #0x5b0]
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc6c4
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1, #0x5ac]
    blt .L_528
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    beq .L_528
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    mov r3, #0x0
    add r1, r0, #0x30
    mov r0, #0x14
    str r3, [sp]
    ldrh r2, [r8, #0x2]
    mla r1, r5, r0, r1
    mov r2, r2, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_0227ac64
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_528:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_534:
    ldr r0, [r1, #0x5b0]
    cmp r0, #0x0
    beq .L_564
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r8, #0x2]
    ldr r1, [r1, #0x5ac]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x2
    bl func_ov002_021d59cc
.L_564:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_570:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000fb6
_LIT2: .word data_ov002_022cd73c
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
