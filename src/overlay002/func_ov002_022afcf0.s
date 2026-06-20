; func_ov002_022afcf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_0200612c
        .extern func_02006164
        .extern func_02006194
        .extern func_020b3870
        .extern func_ov002_022afb8c
        .extern func_ov002_022afc0c
        .global func_ov002_022afcf0
        .arm
func_ov002_022afcf0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrb r0, [r4, #0x24]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_0200612c
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    mov r0, r4
    bl func_ov002_022afc0c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    mov r0, r4
    bl func_ov002_022afc0c
    str r0, [r4, #0xc]
    cmp r0, #0x3
    bne .L_b8
    ldr r0, [r4, #0x14]
    cmp r0, #0x3
    ldreq r0, [r4, #0x18]
    beq .L_b4
    ldr ip, [r4, #0x40]
    ldr r0, [r4, #0x3c]
    ldr r2, [r4, #0x34]
    ldr r1, [r4, #0x30]
    sub r0, r0, ip
    sub r1, r2, r1
    ldr r3, [r4, #0x44]
    mul r2, r1, r0
    sub r1, r3, ip
    add r0, r1, r1, lsr #0x1f
    add r0, r2, r0, asr #0x1
    bl func_020b3870
.L_b4:
    str r0, [r4, #0x18]
.L_b8:
    ldr r2, [sp, #0x4]
    ldr r0, [r4, #0x4]
    ldr r1, [sp]
    sub r2, r2, r0
    str r2, [sp, #0x4]
    ldr r0, [r4, #0x8]
    sub r1, r1, r0
    str r1, [sp]
    ldrb r0, [r4, #0x38]
    cmp r0, #0x0
    strne r1, [sp, #0x4]
    strne r2, [sp]
    mov r0, #0x0
    str r0, [r4, #0x10]
    bl func_02006194
    cmp r0, #0x0
    beq .L_2d4
    ldr r0, [r4, #0x14]
    cmp r0, #0x3
    bne .L_134
    mov r0, #0x3
    str r0, [r4, #0xc]
    ldr r1, [r4, #0x2c]
    ldr r0, [r4, #0x1c]
    ldr r2, [sp]
    add r0, r1, r0
    sub r1, r2, r0
    mov r0, r4
    str r1, [sp]
    bl func_ov002_022afb8c
    b .L_2e8
.L_134:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_1bc
    bl func_02006164
    cmp r0, #0x0
    beq .L_1bc
    ldr r1, [r4, #0xc]
    mov r0, #0x0
    str r1, [r4, #0x14]
    str r0, [r4, #0x20]
    ldr r0, [r4, #0xc]
    cmp r0, #0x3
    bne .L_1bc
    ldr r0, [r4, #0x14]
    cmp r0, #0x3
    ldreq r0, [r4, #0x18]
    beq .L_1a8
    ldr ip, [r4, #0x40]
    ldr r0, [r4, #0x3c]
    ldr r2, [r4, #0x34]
    ldr r1, [r4, #0x30]
    sub r0, r0, ip
    sub r1, r2, r1
    ldr r3, [r4, #0x44]
    mul r2, r1, r0
    sub r1, r3, ip
    add r0, r1, r1, lsr #0x1f
    add r0, r2, r0, asr #0x1
    bl func_020b3870
.L_1a8:
    ldr r1, [r4, #0x2c]
    ldr r2, [sp]
    add r0, r1, r0
    sub r0, r2, r0
    str r0, [r4, #0x1c]
.L_1bc:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x14]
    cmp r0, r1
    bne .L_2e8
    ldr r0, [r4, #0x20]
    tst r0, #0xf
    bne .L_2b0
    add r0, r1, #0x2
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_2b0
    b .L_288
    b .L_22c
    b .L_2b0
    b .L_1fc
    b .L_25c
.L_1fc:
    ldrb r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_2b0
    ldr r1, [r4, #0x3c]
    ldr r0, [r4, #0x44]
    cmp r1, r0
    movlt r1, #0x1
    ldr r0, [r4, #0x3c]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r4, #0x3c]
    b .L_2b0
.L_22c:
    ldrb r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_2b0
    ldr r1, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    cmp r1, r0
    movgt r1, #0x1
    ldr r0, [r4, #0x3c]
    movle r1, #0x0
    sub r0, r0, r1
    str r0, [r4, #0x3c]
    b .L_2b0
.L_25c:
    ldrb r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_2b0
    ldr r2, [r4, #0x3c]
    ldr r1, [r4, #0x48]
    ldr r0, [r4, #0x44]
    add r1, r2, r1
    cmp r1, r0
    movge r1, r0
    str r1, [r4, #0x3c]
    b .L_2b0
.L_288:
    ldrb r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_2b0
    ldr r2, [r4, #0x3c]
    ldr r1, [r4, #0x48]
    ldr r0, [r4, #0x40]
    sub r1, r2, r1
    cmp r1, r0
    movle r1, r0
    str r1, [r4, #0x3c]
.L_2b0:
    ldr r0, [r4, #0xc]
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x20]
    cmp r0, #0x10
    addlt r0, r0, #0x1
    strlt r0, [r4, #0x20]
    movge r0, #0xe
    strge r0, [r4, #0x20]
    b .L_2e8
.L_2d4:
    mov r0, #0x0
    str r0, [r4, #0x14]
    str r0, [r4, #0x18]
    sub r0, r0, #0x1
    str r0, [r4, #0x1c]
.L_2e8:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
