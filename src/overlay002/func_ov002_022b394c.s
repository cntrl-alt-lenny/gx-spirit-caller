; func_ov002_022b394c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov002_022cd73c
        .extern func_02006194
        .extern func_ov002_021ca6f8
        .extern func_ov002_022b32c8
        .extern func_ov002_022b3434
        .extern func_ov002_022b3448
        .extern func_ov002_022b36f0
        .global func_ov002_022b394c
        .arm
func_ov002_022b394c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_34
    ldr r0, [r4, #0x8]
    cmp r0, #0x4
    addlt r0, r0, #0x1
    strlt r0, [r4, #0x8]
    blt .L_4c
.L_34:
    cmp r1, #0x0
    bne .L_4c
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r4, #0x8]
.L_4c:
    ldr r0, [r4, #0x18]
    add r0, r0, #0x1
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_a4
    mov r6, #0x0
    mov r5, r6
.L_6c:
    add r1, r4, r6, lsl #0x2
    ldr r0, [r1, #0x3c]
    cmp r0, #0x0
    ble .L_98
    subs r0, r0, #0x1
    str r0, [r1, #0x3c]
    bne .L_98
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_022b32c8
.L_98:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_6c
.L_a4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_ov002_021ca6f8
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x64]
    beq .L_dc
    bl func_02006194
    cmp r0, #0x0
    ldreq r0, _LIT1
    ldreqh r0, [r0, #0x52]
    cmpeq r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x64]
.L_dc:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r4, #0x5c]
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x54]
    cmp r1, #0x80
    ble .L_114
    sub r0, r1, #0x8
    str r0, [r4, #0x54]
    cmp r0, #0x80
    moveq r0, #0x20
    streq r0, [r4, #0x5c]
    b .L_218
.L_114:
    bne .L_1e4
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    ldreq r0, [r4, #0x48]
    cmpeq r0, #0x0
    beq .L_1e4
    mov r1, #0x0
    mov r0, #0x64
    mov ip, r1
    mov lr, r1
.L_13c:
    add r2, r4, r1, lsl #0x2
    ldr r3, [r2, #0x44]
    cmp r3, #0x0
    beq .L_1d4
    movge r2, r3
    rsblt r2, r3, #0x0
    cmp r2, #0x64
    movge r2, r0
    cmp r3, #0x0
    ble .L_1a0
    ldr r3, [r4, #0x58]
    cmp r3, #0x0
    addeq r3, r4, r1, lsl #0x2
    ldreq r3, [r3, #0x24]
    cmpeq r3, #0x0
    beq .L_18c
    add r5, r4, r1, lsl #0x2
    ldr r3, [r5, #0x24]
    add r3, r3, r2
    str r3, [r5, #0x24]
.L_18c:
    add r5, r4, r1, lsl #0x2
    ldr r3, [r5, #0x44]
    sub r2, r3, r2
    str r2, [r5, #0x44]
    b .L_1d4
.L_1a0:
    add r5, r4, r1, lsl #0x2
    ldr r3, [r5, #0x24]
    sub r3, r3, r2
    cmp r3, #0x0
    strle lr, [r5, #0x24]
    strle lr, [r5, #0x44]
    ble .L_1d4
    movlt r3, ip
    add r5, r4, r1, lsl #0x2
    str r3, [r5, #0x24]
    ldr r3, [r5, #0x44]
    add r2, r3, r2
    str r2, [r5, #0x44]
.L_1d4:
    add r1, r1, #0x1
    cmp r1, #0x2
    blt .L_13c
    b .L_218
.L_1e4:
    cmp r1, #0x0
    beq .L_218
    ldr r0, [r4, #0x58]
    cmp r0, #0x5
    moveq r0, #0x0
    ldrne r0, [r4, #0x54]
    subne r0, r0, #0x10
    str r0, [r4, #0x54]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x50]
    streq r0, [r4, #0x4c]
.L_218:
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_2ac
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq .L_240
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_278
    b .L_2ac
.L_240:
    mov r6, #0x0
    mov r5, #0x1
.L_248:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_268
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_022b36f0
.L_268:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_248
    b .L_2ac
.L_278:
    mov r6, #0x0
    mov r5, #0x2
.L_280:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_2a0
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_022b36f0
.L_2a0:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_280
.L_2ac:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_2d8
    cmp r0, #0x80
    bne .L_2cc
    ldr r1, [r4, #0xc]
    mov r0, r4
    bl func_ov002_022b3434
.L_2cc:
    ldr r0, [r4, #0x1c]
    sub r0, r0, #0x4
    str r0, [r4, #0x1c]
.L_2d8:
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r0, #0x80
    bne .L_2f8
    ldr r1, [r4, #0x10]
    mov r0, r4
    bl func_ov002_022b3448
.L_2f8:
    ldr r0, [r4, #0x20]
    sub r0, r0, #0x8
    str r0, [r4, #0x20]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_02104bac
