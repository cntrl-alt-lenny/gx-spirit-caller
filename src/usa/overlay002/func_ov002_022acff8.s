; func_ov002_022acff8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d19bc
        .extern func_020371b8
        .extern func_ov002_021afa10
        .extern func_ov002_021afae4
        .extern func_ov002_0229f0d0
        .extern func_ov002_022a0e7c
        .extern func_ov002_022a0fec
        .extern func_ov002_022abeec
        .extern func_ov002_022ac8b0
        .extern func_ov002_022aea24
        .global func_ov002_022acff8
        .arm
func_ov002_022acff8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1, #0x54]
    tst r2, #0x1
    beq .L_f0
    ldr r1, [r4, #0x60]
    cmp r1, #0x0
    beq .L_30
    cmp r1, #0x1
    beq .L_9c
    b .L_cc
.L_30:
    bl func_ov002_021afa10
    cmp r0, #0x1
    bgt .L_4c
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    bne .L_7c
.L_4c:
    mov r0, #0x1
    str r0, [r4, #0x14]
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0e7c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    add r1, r4, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f0d0
    ldmia sp!, {r4, pc}
.L_7c:
    rsb r0, r1, #0x0
    cmp r0, #0x5
    ldmleia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    add r1, r4, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f0d0
    ldmia sp!, {r4, pc}
.L_9c:
    ldr r1, [r4, #0x14]
    cmp r1, #0x0
    ldmltia sp!, {r4, pc}
    ldr r1, [r4, #0x20]
    bl func_ov002_022a0e7c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    add r1, r4, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f0d0
    ldmia sp!, {r4, pc}
.L_cc:
    sub r1, r1, #0x2
    bl func_ov002_022ac8b0
    mov r0, #0x3a
    mov r2, #0x0
    sub r1, r0, #0x3b
    mov r3, #0x1
    str r2, [r4, #0x60]
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_f0:
    tst r2, #0x2
    beq .L_160
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    blt .L_114
    add r0, r4, #0x198
    add r0, r0, r1, lsl #0x5
    str r1, [r4, #0x14]
    bl func_ov002_0229f0d0
.L_114:
    bl func_ov002_021afa10
    cmp r0, #0x1
    bgt .L_130
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    ldmneia sp!, {r4, pc}
.L_130:
    mov r0, #0x2
    str r0, [r4, #0x14]
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0e7c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    add r1, r4, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f0d0
    ldmia sp!, {r4, pc}
.L_160:
    tst r2, #0x400
    beq .L_180
    ldr r0, _LIT1
    bl func_ov002_022aea24
    ldr r0, _LIT2
    mov r1, #0x2
    str r1, [r0, #0xd0]
    ldmia sp!, {r4, pc}
.L_180:
    tst r2, #0x4
    beq .L_1b8
    ldr r1, [r4, #0x64]
    add r1, r1, #0x1
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    add r1, r2, r1, ror #0x1d
    bl func_ov002_022ac8b0
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_1b8:
    ldrh r0, [r1, #0x56]
    tst r0, #0x20
    beq .L_2b0
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_1dc
    cmp r0, #0x1
    beq .L_21c
    b .L_284
.L_1dc:
    ldr r0, [r4, #0x20]
    subs r0, r0, #0x1
    str r0, [r4, #0x20]
    bpl .L_1f8
    bl func_ov002_021afae4
    sub r0, r0, #0x1
    str r0, [r4, #0x20]
.L_1f8:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0fec
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_21c:
    bl func_ov002_021afa10
    cmp r0, #0x1
    bgt .L_238
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    ldmneia sp!, {r4, pc}
.L_238:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x14]
    cmp r0, #0x1
    bne .L_26c
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022abeec
    cmp r0, #0x0
    movgt r0, #0x2
    strgt r0, [r4, #0x14]
.L_26c:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_284:
    sub r0, r0, #0x1
    str r0, [r4, #0x60]
    cmp r0, #0x2
    movlt r0, #0x9
    strlt r0, [r4, #0x60]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_2b0:
    tst r0, #0x10
    beq .L_3a4
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_2d0
    cmp r0, #0x1
    beq .L_310
    b .L_378
.L_2d0:
    bl func_ov002_021afae4
    ldr r1, [r4, #0x20]
    add r1, r1, #0x1
    cmp r1, r0
    str r1, [r4, #0x20]
    movge r0, #0x0
    strge r0, [r4, #0x20]
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0fec
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_310:
    bl func_ov002_021afa10
    cmp r0, #0x1
    bgt .L_32c
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    ldmneia sp!, {r4, pc}
.L_32c:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x14]
    cmp r0, #0x1
    bne .L_360
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022abeec
    cmp r0, #0x0
    movgt r0, #0x2
    strgt r0, [r4, #0x14]
.L_360:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_378:
    add r0, r0, #0x1
    str r0, [r4, #0x60]
    cmp r0, #0x9
    movgt r0, #0x2
    strgt r0, [r4, #0x60]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_3a4:
    tst r0, #0x40
    beq .L_400
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_3c4
    cmp r0, #0x1
    beq .L_3e4
    ldmia sp!, {r4, pc}
.L_3c4:
    mov r0, #0x38
    mov ip, #0x2
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    str ip, [r4, #0x60]
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_3e4:
    mov r0, #0x38
    mov r2, #0x0
    sub r1, r0, #0x39
    mov r3, #0x3
    str r2, [r4, #0x60]
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_400:
    tst r0, #0x80
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_420
    cmp r0, #0x1
    ldmeqia sp!, {r4, pc}
    b .L_47c
.L_420:
    mov r0, #0x1
    str r0, [r4, #0x60]
    bl func_ov002_021afa10
    cmp r0, #0x1
    bgt .L_444
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    bne .L_464
.L_444:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022abeec
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r0, #0x1
    str r0, [r4, #0x14]
.L_464:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_020371b8
    ldmia sp!, {r4, pc}
.L_47c:
    mov r0, #0x38
    mov r2, #0x0
    sub r1, r0, #0x39
    mov r3, #0x3
    str r2, [r4, #0x60]
    bl func_020371b8
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_ov002_022d19bc
_LIT2: .word data_ov002_022d0e4c
