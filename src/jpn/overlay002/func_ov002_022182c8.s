; func_ov002_022182c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3dc
        .extern func_ov002_021ba1b4
        .extern func_ov002_021bc538
        .extern func_ov002_021c9d10
        .extern func_ov002_021ca1d8
        .extern func_ov002_021df728
        .extern func_ov002_021e050c
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022535a4
        .extern func_ov002_0227ab74
        .global func_ov002_022182c8
        .arm
func_ov002_022182c8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x64
    bgt .L_24
    beq .L_32c
    b .L_35c
.L_24:
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_35c
    b .L_23c
    b .L_148
    b .L_a0
    b .L_44
.L_44:
    ldrh r2, [r4]
    ldr r1, _LIT1
    cmp r2, r1
    beq .L_64
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_80
    b .L_94
.L_64:
    ldrh r1, [r4, #0x2]
    mov r2, #0x1f4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    b .L_94
.L_80:
    ldrh r0, [r4, #0x2]
    mov r1, #0x3e8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e050c
.L_94:
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, pc}
.L_a0:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r1, [r4]
    ldr r0, _LIT2
    cmp r1, r0
    addne r0, r0, #0x30
    cmpne r1, r0
    bne .L_120
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c9d10
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
.L_120:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
.L_148:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_180
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    bne .L_18c
.L_180:
    add sp, sp, #0x4
    mov r0, #0x64
    ldmia sp!, {r3, r4, pc}
.L_18c:
    ldrh r2, [r4]
    ldr r0, _LIT3
    cmp r2, r0
    bne .L_1b4
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x64
    ldmneia sp!, {r3, r4, pc}
.L_1b4:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_1e0
    ldr r0, _LIT5
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_230
.L_1e0:
    ldr r1, _LIT1
    cmp r2, r1
    beq .L_204
    add r0, r1, #0x1
    cmp r2, r0
    addne r0, r1, #0x31
    cmpne r2, r0
    beq .L_21c
    b .L_230
.L_204:
    ldrh r1, [r4, #0x4]
    mov r0, #0x35
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae3dc
    b .L_230
.L_21c:
    ldrh r1, [r4, #0x4]
    mov r0, #0x34
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae3dc
.L_230:
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, pc}
.L_23c:
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
    bne .L_26c
    bl func_ov002_021e2a4c
.L_26c:
    ldrh r1, [r4]
    ldr r2, _LIT1
    cmp r1, r2
    beq .L_294
    add r0, r2, #0x1
    cmp r1, r0
    addne r0, r2, #0x31
    cmpne r1, r0
    beq .L_2dc
    b .L_320
.L_294:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r4, r0, lsr #0x1f
    mov r0, r4
    bl func_ov002_021ba1b4
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
    bl func_ov002_0227ab74
    b .L_320
.L_2dc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r4, r0, lsr #0x1f
    mov r0, r4
    bl func_ov002_021ba1b4
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
    bl func_ov002_0227ab74
.L_320:
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, pc}
.L_32c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    beq .L_350
    bl func_ov002_021e2b6c
.L_350:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_35c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001339
_LIT2: .word 0x0000133a
_LIT3: .word 0x0000136a
_LIT4: .word data_ov002_022cd664
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022cf08c
_LIT7: .word 0x00000868
