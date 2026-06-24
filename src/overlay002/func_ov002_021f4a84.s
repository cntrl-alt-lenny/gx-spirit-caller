; func_ov002_021f4a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae4bc
        .extern func_ov002_021df62c
        .extern func_ov002_021fdc08
        .extern func_ov002_02257b48
        .extern func_ov002_0226b094
        .extern func_ov002_0227ddf8
        .global func_ov002_021f4a84
        .arm
func_ov002_021f4a84:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r3, [r6, #0x2]
    ldr r2, _LIT0
    mov r5, r1
    mov r4, r3, lsl #0x1f
    ldr r1, [r2, #0x5b4]
    mov ip, r4, lsr #0x1f
    mov r2, r3, lsl #0x11
    cmp r1, #0x0
    eor r4, ip, r2, lsr #0x1f
    beq .L_44
    cmp r1, #0x1
    beq .L_148
    cmp r1, #0x2
    beq .L_21c
    b .L_224
.L_44:
    bl func_ov002_021fdc08
    cmp r0, #0x0
    beq .L_64
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_021ae400
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_64:
    mov r0, r6
    mov r1, r5
    bl func_ov002_02257b48
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_a0
    mov r0, r6
    bl func_ov002_0227ddf8
    ldr r1, _LIT3
    str r0, [r1, #0xd44]
    b .L_130
.L_a0:
    ldrh r3, [r6]
    ldr r2, _LIT4
    mov r0, #0xfa
    cmp r3, r2
    bgt .L_dc
    bge .L_100
    sub r1, r2, #0x11
    cmp r3, r1
    bgt .L_cc
    moveq r0, #0x17
    b .L_120
.L_cc:
    sub r1, r2, #0x8
    cmp r3, r1
    moveq r0, #0x18
    b .L_120
.L_dc:
    ldr r1, _LIT5
    cmp r3, r1
    bgt .L_f0
    moveq r0, #0x2f
    b .L_120
.L_f0:
    rsb r1, r1, #0x2b80
    cmp r3, r1
    beq .L_108
    b .L_120
.L_100:
    mov r0, #0x18
    b .L_120
.L_108:
    ldrh r1, [r6, #0x2]
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xe
    addeq r0, r0, #0x4f
    movne r0, #0x148
.L_120:
    ldrh r1, [r6, #0x4]
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae4bc
.L_130:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_148:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    bne .L_1f8
    ldrh r3, [r6]
    ldr r2, _LIT6
    cmp r3, r2
    bgt .L_1a8
    bge .L_1e0
    ldr r1, _LIT7
    cmp r3, r1
    bgt .L_180
    beq .L_1e0
    b .L_1d4
.L_180:
    sub r0, r2, #0x120
    cmp r3, r0
    bgt .L_1d4
    add r0, r1, #0x384
    cmp r3, r0
    blt .L_1d4
    subne r0, r2, #0x120
    cmpne r3, r0
    beq .L_1e0
    b .L_1d4
.L_1a8:
    add r0, r2, #0x91
    cmp r3, r0
    bgt .L_1c8
    bge .L_1e0
    add r0, r2, #0x1e
    cmp r3, r0
    beq .L_1e0
    b .L_1d4
.L_1c8:
    add r0, r2, #0x13c
    cmp r3, r0
    beq .L_1e0
.L_1d4:
    ldr r1, _LIT8
    rsb r0, r4, #0x1
    bl func_ov002_0226b094
.L_1e0:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_1f8:
    ldrh r1, [r6, #0x4]
    mov r3, r3, lsl #0x1a
    mov r0, ip
    mov r2, r1, lsl #0x11
    mov r1, r3, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df62c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_21c:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_224:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000107
_LIT2: .word data_ov002_022cd744
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x000010e7
_LIT5: .word 0x00001294
_LIT6: .word 0x000018ec
_LIT7: .word 0x00001445
_LIT8: .word 0x000010d6
