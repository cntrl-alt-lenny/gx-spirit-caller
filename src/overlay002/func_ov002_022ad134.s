; func_ov002_022ad134 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1a9c
        .extern func_02037208
        .extern func_ov002_021afaf0
        .extern func_ov002_021afbc4
        .extern func_ov002_0229f1e0
        .extern func_ov002_022a0f8c
        .extern func_ov002_022a10fc
        .extern func_ov002_022ac028
        .extern func_ov002_022ac9ec
        .extern func_ov002_022aeb60
        .global func_ov002_022ad134
        .arm
func_ov002_022ad134:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1, #0x54]
    tst r2, #0x1
    beq .L_934
    ldr r1, [r4, #0x60]
    cmp r1, #0x0
    beq .L_874
    cmp r1, #0x1
    beq .L_8e0
    b .L_910
.L_874:
    bl func_ov002_021afaf0
    cmp r0, #0x1
    bgt .L_890
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    bne .L_8c0
.L_890:
    mov r0, #0x1
    str r0, [r4, #0x14]
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0f8c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    add r1, r4, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f1e0
    ldmia sp!, {r4, pc}
.L_8c0:
    rsb r0, r1, #0x0
    cmp r0, #0x5
    ldmleia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    add r1, r4, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f1e0
    ldmia sp!, {r4, pc}
.L_8e0:
    ldr r1, [r4, #0x14]
    cmp r1, #0x0
    ldmltia sp!, {r4, pc}
    ldr r1, [r4, #0x20]
    bl func_ov002_022a0f8c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    add r1, r4, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f1e0
    ldmia sp!, {r4, pc}
.L_910:
    sub r1, r1, #0x2
    bl func_ov002_022ac9ec
    mov r0, #0x3a
    mov r2, #0x0
    sub r1, r0, #0x3b
    mov r3, #0x1
    str r2, [r4, #0x60]
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_934:
    tst r2, #0x2
    beq .L_9a4
    ldr r1, [r4, #0x1c]
    cmp r1, #0x0
    blt .L_958
    add r0, r4, #0x198
    add r0, r0, r1, lsl #0x5
    str r1, [r4, #0x14]
    bl func_ov002_0229f1e0
.L_958:
    bl func_ov002_021afaf0
    cmp r0, #0x1
    bgt .L_974
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    ldmneia sp!, {r4, pc}
.L_974:
    mov r0, #0x2
    str r0, [r4, #0x14]
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a0f8c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    add r1, r4, #0x198
    add r0, r1, r0, lsl #0x5
    bl func_ov002_0229f1e0
    ldmia sp!, {r4, pc}
.L_9a4:
    tst r2, #0x400
    beq .L_9c4
    ldr r0, _LIT1
    bl func_ov002_022aeb60
    ldr r0, _LIT2
    mov r1, #0x2
    str r1, [r0, #0xd0]
    ldmia sp!, {r4, pc}
.L_9c4:
    tst r2, #0x4
    beq .L_9fc
    ldr r1, [r4, #0x64]
    add r1, r1, #0x1
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    add r1, r2, r1, ror #0x1d
    bl func_ov002_022ac9ec
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_9fc:
    ldrh r0, [r1, #0x56]
    tst r0, #0x20
    beq .L_af4
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_a20
    cmp r0, #0x1
    beq .L_a60
    b .L_ac8
.L_a20:
    ldr r0, [r4, #0x20]
    subs r0, r0, #0x1
    str r0, [r4, #0x20]
    bpl .L_a3c
    bl func_ov002_021afbc4
    sub r0, r0, #0x1
    str r0, [r4, #0x20]
.L_a3c:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a10fc
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_a60:
    bl func_ov002_021afaf0
    cmp r0, #0x1
    bgt .L_a7c
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    ldmneia sp!, {r4, pc}
.L_a7c:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x14]
    cmp r0, #0x1
    bne .L_ab0
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022ac028
    cmp r0, #0x0
    movgt r0, #0x2
    strgt r0, [r4, #0x14]
.L_ab0:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_ac8:
    sub r0, r0, #0x1
    str r0, [r4, #0x60]
    cmp r0, #0x2
    movlt r0, #0x9
    strlt r0, [r4, #0x60]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_af4:
    tst r0, #0x10
    beq .L_be8
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_b14
    cmp r0, #0x1
    beq .L_b54
    b .L_bbc
.L_b14:
    bl func_ov002_021afbc4
    ldr r1, [r4, #0x20]
    add r1, r1, #0x1
    cmp r1, r0
    str r1, [r4, #0x20]
    movge r0, #0x0
    strge r0, [r4, #0x20]
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022a10fc
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_b54:
    bl func_ov002_021afaf0
    cmp r0, #0x1
    bgt .L_b70
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    ldmneia sp!, {r4, pc}
.L_b70:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x14]
    cmp r0, #0x1
    bne .L_ba4
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022ac028
    cmp r0, #0x0
    movgt r0, #0x2
    strgt r0, [r4, #0x14]
.L_ba4:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_bbc:
    add r0, r0, #0x1
    str r0, [r4, #0x60]
    cmp r0, #0x9
    movgt r0, #0x2
    strgt r0, [r4, #0x60]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_be8:
    tst r0, #0x40
    beq .L_c44
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_c08
    cmp r0, #0x1
    beq .L_c28
    ldmia sp!, {r4, pc}
.L_c08:
    mov r0, #0x38
    mov ip, #0x2
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    str ip, [r4, #0x60]
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_c28:
    mov r0, #0x38
    mov r2, #0x0
    sub r1, r0, #0x39
    mov r3, #0x3
    str r2, [r4, #0x60]
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_c44:
    tst r0, #0x80
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_c64
    cmp r0, #0x1
    ldmeqia sp!, {r4, pc}
    b .L_cc0
.L_c64:
    mov r0, #0x1
    str r0, [r4, #0x60]
    bl func_ov002_021afaf0
    cmp r0, #0x1
    bgt .L_c88
    ldr r1, [r4, #0x4]
    mvn r0, #0x47
    cmp r1, r0
    bne .L_ca8
.L_c88:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022ac028
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    add r0, r0, #0x1
    str r0, [r4, #0x14]
.L_ca8:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    bl func_02037208
    ldmia sp!, {r4, pc}
.L_cc0:
    mov r0, #0x38
    mov r2, #0x0
    sub r1, r0, #0x39
    mov r3, #0x3
    str r2, [r4, #0x60]
    bl func_02037208
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov002_022d1a9c
_LIT2: .word data_ov002_022d0f2c
