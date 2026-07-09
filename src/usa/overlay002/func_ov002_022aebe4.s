; func_ov002_022aebe4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1830
        .extern func_020060f4
        .extern func_02006110
        .extern func_02006160
        .extern func_02006178
        .extern func_0202cdd0
        .extern func_020371b8
        .extern func_ov002_02259338
        .extern func_ov002_0225968c
        .extern func_ov002_022a15ec
        .extern func_ov002_022ae2f4
        .extern func_ov002_022ae44c
        .extern func_ov002_022ae608
        .extern func_ov002_022ae884
        .extern func_ov002_022aea24
        .extern func_ov002_022aeab0
        .extern func_ov002_022aeb08
        .global func_ov002_022aebe4
        .arm
func_ov002_022aebe4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    ldrh r0, [r5]
    cmp r0, #0x0
    beq .L_80
    ldr r0, _LIT0
    ldrh r1, [r5, #0x2]
    ldrh r2, [r0, #0x90]
    strh r2, [sp]
    cmp r1, r2
    beq .L_80
    ldrh r3, [sp]
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r2, r2, lsl #0x12
    strh r3, [r5, #0x2]
    mvn r3, #0x0
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    str r3, [r5, #0x2c]
    bl func_ov002_02259338
    mov r1, r0
    mov r0, r5
    bl func_ov002_022ae608
    ldr r0, _LIT1
    ldr r1, [r0, #0xd4]
    ldr r0, _LIT1
    cmp r1, #0x1
    movlt r1, #0x1
    str r1, [r0, #0xd4]
.L_80:
    mvn r0, #0x0
    str r0, [r5, #0x38]
    ldrh r0, [r5]
    cmp r0, #0x0
    bne .L_118
    ldr r0, _LIT1
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, pc}
    bl func_02006178
    cmp r0, #0x0
    beq .L_e8
    add r0, sp, #0x18
    add r1, sp, #0x14
    bl func_020060f4
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0x14]
    mov r0, r5
    bl func_ov002_022ae44c
    add sp, sp, #0x1c
    str r0, [r5, #0x38]
    ldmia sp!, {r4, r5, pc}
.L_e8:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x52]
    tst r0, #0x2
    movne r0, #0x3
    addne sp, sp, #0x1c
    strne r0, [r5, #0x38]
    ldmneia sp!, {r4, r5, pc}
    tst r0, #0x1
    movne r0, #0x2
    add sp, sp, #0x1c
    strne r0, [r5, #0x38]
    ldmia sp!, {r4, r5, pc}
.L_118:
    ldr r0, [r5, #0x44]
    cmp r0, #0x0
    ble .L_198
    subs r0, r0, #0x1
    addne sp, sp, #0x1c
    str r0, [r5, #0x44]
    ldmneia sp!, {r4, r5, pc}
    ldr r0, [r5, #0x2c]
    add r0, r5, r0, lsl #0x2
    ldr r3, [r0, #0x1c]
    cmp r3, #0x0
    addlt sp, sp, #0x1c
    ldmltia sp!, {r4, r5, pc}
    cmp r3, #0xd
    addge sp, sp, #0x1c
    ldmgeia sp!, {r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_0225968c
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_022ae884
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd0]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, pc}
.L_198:
    mov r1, #0x0
    ldr r0, _LIT1
    str r1, [r5, #0x40]
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    movgt r1, #0x1
    cmp r1, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT3
    bl func_ov002_022a15ec
    cmp r0, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, pc}
    bl func_02006178
    cmp r0, #0x0
    bne .L_1e8
    bl func_02006160
    cmp r0, #0x0
    beq .L_288
.L_1e8:
    add r0, sp, #0x10
    add r1, sp, #0xc
    bl func_02006110
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    mov r0, r5
    bl func_ov002_022ae44c
    str r0, [r5, #0x38]
    cmp r0, #0x0
    blt .L_288
    add r0, sp, #0x10
    add r1, sp, #0xc
    bl func_020060f4
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0xc]
    mov r0, r5
    bl func_ov002_022ae44c
    ldr r1, [r5, #0x38]
    cmp r1, r0
    bne .L_288
    mov r0, #0x1
    str r0, [r5, #0x40]
    bl func_02006160
    cmp r0, #0x0
    beq .L_288
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    beq .L_26c
    cmp r0, #0x1
    beq .L_278
    cmp r0, #0x4
    beq .L_280
    b .L_288
.L_26c:
    mov r0, r5
    bl func_ov002_022aea24
    b .L_288
.L_278:
    bl func_0202cdd0
    b .L_288
.L_280:
    mov r0, r5
    bl func_ov002_022aeab0
.L_288:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd0]
    cmp r0, #0x1
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, pc}
    ldr r4, [r5, #0x2c]
    bl func_02006178
    cmp r0, #0x0
    bne .L_2b8
    bl func_02006160
    cmp r0, #0x0
    beq .L_368
.L_2b8:
    add r0, sp, #0x8
    add r1, sp, #0x4
    bl func_02006110
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0x4]
    mov r0, r5
    bl func_ov002_022ae2f4
    cmp r0, #0x0
    blt .L_488
    add r0, sp, #0x8
    add r1, sp, #0x4
    bl func_020060f4
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0x4]
    mov r0, r5
    bl func_ov002_022ae2f4
    cmp r0, #0x0
    bne .L_31c
    ldr r1, [r5, #0x3c]
    cmp r1, #0x0
    beq .L_31c
    ldr r1, [r5, #0x1c]
    cmp r1, #0x0
    cmpne r1, #0x1
    moveq r0, #0x1
.L_31c:
    cmp r0, #0x0
    blt .L_358
    subs r0, r0, #0x1
    str r0, [r5, #0x2c]
    bmi .L_488
    mov r0, #0x1
    str r0, [r5, #0x40]
    bl func_02006160
    cmp r0, #0x0
    beq .L_488
    ldr r1, [r5, #0x2c]
    mov r0, r5
    bl func_ov002_022aeb08
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, pc}
.L_358:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd0]
    b .L_488
.L_368:
    ldr r0, _LIT2
    ldrh r1, [r0, #0x56]
    tst r1, #0x60
    beq .L_3c0
    ldr r3, _LIT4
    mov lr, #0x0
    mov r2, #0x3
.L_384:
    ldr r0, [r5, #0x2c]
    add ip, r0, #0x2
    smull r0, r1, r3, ip
    add r1, r1, ip, lsr #0x1f
    smull r0, r1, r2, r1
    sub r1, ip, r0
    str r1, [r5, #0x2c]
    add r0, r5, r1, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bge .L_488
    add lr, lr, #0x1
    cmp lr, #0x3
    blt .L_384
    b .L_488
.L_3c0:
    tst r1, #0x90
    beq .L_420
    ldr r0, [r5, #0x2c]
    ldr r3, _LIT4
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r5, #0x2c]
    mov lr, #0x0
    mov r2, #0x3
.L_3e4:
    ldr r0, [r5, #0x2c]
    add ip, r0, #0x1
    smull r0, r1, r3, ip
    add r1, r1, ip, lsr #0x1f
    smull r0, r1, r2, r1
    sub r1, ip, r0
    str r1, [r5, #0x2c]
    add r0, r5, r1, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bge .L_488
    add lr, lr, #0x1
    cmp lr, #0x3
    blt .L_3e4
    b .L_488
.L_420:
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_44c
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r5, #0x2c]
    ldr r1, [r5, #0x2c]
    mov r0, r5
    bl func_ov002_022aeb08
    b .L_488
.L_44c:
    tst r0, #0x2
    beq .L_488
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd0]
    ldr lr, [r0, #0xd4]
    mov r0, #0x42
    cmp lr, #0x4
    ldr ip, _LIT1
    movlt lr, #0x4
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    str lr, [ip, #0xd4]
    bl func_020371b8
.L_488:
    ldr r0, [r5, #0x2c]
    cmp r4, r0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x38
    mov r4, #0x2
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x3
    str r4, [r5, #0x30]
    bl func_020371b8
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov002_022d1830
_LIT1: .word data_ov002_022d0e4c
_LIT2: .word data_02104acc
_LIT3: .word data_ov002_022d10dc
_LIT4: .word 0x55555556
