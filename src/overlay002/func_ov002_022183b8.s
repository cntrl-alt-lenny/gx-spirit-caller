; func_ov002_022183b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae4bc
        .extern func_ov002_021ba294
        .extern func_ov002_021bc618
        .extern func_ov002_021c9df0
        .extern func_ov002_021ca2b8
        .extern func_ov002_021df818
        .extern func_ov002_021e05fc
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0225368c
        .extern func_ov002_0227ac64
        .global func_ov002_022183b8
        .arm
func_ov002_022183b8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x64
    bgt .L_374
    beq .L_67c
    b .L_6ac
.L_374:
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_6ac
    b .L_58c
    b .L_498
    b .L_3f0
    b .L_394
.L_394:
    ldrh r2, [r4]
    ldr r1, _LIT1
    cmp r2, r1
    beq .L_3b4
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_3d0
    b .L_3e4
.L_3b4:
    ldrh r1, [r4, #0x2]
    mov r2, #0x1f4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    b .L_3e4
.L_3d0:
    ldrh r0, [r4, #0x2]
    mov r1, #0x3e8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e05fc
.L_3e4:
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, pc}
.L_3f0:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r1, [r4]
    ldr r0, _LIT2
    cmp r1, r0
    addne r0, r0, #0x30
    cmpne r1, r0
    bne .L_470
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c9df0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
.L_470:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
.L_498:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_4d0
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    bne .L_4dc
.L_4d0:
    add sp, sp, #0x4
    mov r0, #0x64
    ldmia sp!, {r3, r4, pc}
.L_4dc:
    ldrh r2, [r4]
    ldr r0, _LIT3
    cmp r2, r0
    bne .L_504
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x64
    ldmneia sp!, {r3, r4, pc}
.L_504:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_530
    ldr r0, _LIT5
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_580
.L_530:
    ldr r1, _LIT1
    cmp r2, r1
    beq .L_554
    add r0, r1, #0x1
    cmp r2, r0
    addne r0, r1, #0x31
    cmpne r2, r0
    beq .L_56c
    b .L_580
.L_554:
    ldrh r1, [r4, #0x4]
    mov r0, #0x35
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae4bc
    b .L_580
.L_56c:
    ldrh r1, [r4, #0x4]
    mov r0, #0x34
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae4bc
.L_580:
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, pc}
.L_58c:
    ldr r0, _LIT5
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, pc}
    ldr r2, [r1, #0x5ac]
    add r0, r2, #0x1
    str r0, [r1, #0x5ac]
    cmp r2, #0x0
    bne .L_5bc
    bl func_ov002_021e2b3c
.L_5bc:
    ldrh r1, [r4]
    ldr r2, _LIT1
    cmp r1, r2
    beq .L_5e4
    add r0, r2, #0x1
    cmp r1, r0
    addne r0, r2, #0x31
    cmpne r1, r0
    beq .L_62c
    b .L_670
.L_5e4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r4, r0, lsr #0x1f
    mov r0, r4
    bl func_ov002_021ba294
    ldr r3, _LIT6
    ldr r1, _LIT7
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    mov r2, r0
    add r1, r1, #0x260
    mov r3, #0x0
    mov r0, r4
    add r1, r1, r2, lsl #0x2
    mov r2, #0x1
    str r3, [sp]
    bl func_ov002_0227ac64
    b .L_670
.L_62c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r4, r0, lsr #0x1f
    mov r0, r4
    bl func_ov002_021ba294
    ldr r3, _LIT6
    ldr r1, _LIT7
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    mov r3, r0
    add r1, r1, #0x260
    mov r2, #0x0
    mov r0, r4
    add r1, r1, r3, lsl #0x2
    mov r3, #0x1
    str r2, [sp]
    bl func_ov002_0227ac64
.L_670:
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, pc}
.L_67c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    beq .L_6a0
    bl func_ov002_021e2c5c
.L_6a0:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_6ac:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00001339
_LIT2: .word 0x0000133a
_LIT3: .word 0x0000136a
_LIT4: .word data_ov002_022cd744
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022cf16c
_LIT7: .word 0x00000868
