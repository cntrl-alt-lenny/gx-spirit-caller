; func_ov006_021c3b6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cdf48
        .extern data_ov006_0224f328
        .extern func_0202160c
        .extern func_0202165c
        .extern func_02023134
        .extern func_0202b998
        .extern func_02091554
        .extern func_020b377c
        .extern func_ov006_021b5fa4
        .extern func_ov006_021b69d8
        .extern func_ov006_021b6c00
        .extern func_ov006_021b6c1c
        .global func_ov006_021c3b6c
        .arm
func_ov006_021c3b6c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    str r0, [sp]
    mov r0, #0x0
    movs sl, r1
    str r0, [sp, #0x4]
    beq .L_e0
    ldr r0, [sp]
    mov r3, #0x0
    ldr r1, [r0, #0x64]
    cmp r1, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x4]
    ldr r0, [sp]
    add r0, r0, r1, lsl #0x4
    ldr r1, [sp, #0x4]
    ldr r5, [r0, #0xa0]
    ldr r4, [r0, #0x9c]
    ldr r0, _LIT0
    add r2, r5, r4
    mov r6, r1
    bl func_ov006_021b69d8
    mov r1, #0x0
    str r0, [sp, #0x4]
    mov r7, r1
    add r0, sp, #0x38
.L_68:
    str r7, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x3
    blt .L_68
    ldr r0, [sp, #0x4]
    str r7, [sp, #0x18]
    cmp r0, #0x0
    mvn r0, #0x0
    str r0, [sp, #0x1c]
    beq .L_e0
    ldr r0, _LIT0
    add r2, r5, r4
    mov r1, r6
    bl func_ov006_021b5fa4
    mov r1, #0x1
    ldr r0, _LIT0
    mov r2, r1
    bl func_ov006_021b6c00
    str r0, [sp, #0x38]
    ldr r0, _LIT0
    mov r1, #0x2
    mov r2, #0x1
    bl func_ov006_021b6c00
    str r0, [sp, #0x3c]
    ldr r0, _LIT0
    mov r1, #0x3
    mov r2, #0x1
    bl func_ov006_021b6c00
    str r0, [sp, #0x40]
    bl func_02023134
.L_e0:
    ldr r0, [sp]
    mov r1, #0x5
    ldr r0, [r0, #0xc]
    mov r2, #0x0
    bl func_0202160c
    mov r1, #0x0
    mov r2, #0x1
    bl func_0202165c
    ldr r0, [sp, #0x38]
    mov r8, #0x0
    str r0, [sp, #0x2c]
    ldr r0, [sp, #0x3c]
    str r0, [sp, #0xc]
    ldr r0, [sp]
    add r0, r0, #0xbc
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x2c]
    add r1, r0, #0x3
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x40]
    str r0, [sp, #0x8]
    mov r0, #0xc1
    orr r0, r0, #0x200
    str r0, [sp, #0x30]
    mov r0, #0xc1
    orr r0, r0, #0x204
    str r0, [sp, #0x34]
.L_158:
    cmp r8, #0x50
    movlt r4, #0x0
    movlt r5, r8
    blt .L_17c
    cmp r8, #0x5f
    movlt r4, #0x1
    sublt r5, r8, #0x50
    movge r4, #0x2
    subge r5, r8, #0x5f
.L_17c:
    cmp sl, #0x0
    mov r6, #0x0
    beq .L_1d4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1c0
    add r0, sp, #0x38
    ldr r0, [r0, r4, lsl #0x2]
    cmp r5, r0
    bge .L_1c0
    ldr r0, _LIT0
    add r1, r4, #0x1
    mov r2, r5
    mov r3, #0x1
    bl func_ov006_021b6c1c
    mov r6, r0
    b .L_1c4
.L_1c0:
    mov r6, #0x0
.L_1c4:
    ldr r0, [sp, #0x14]
    ldr r1, _LIT1
    mov r2, r6
    bl func_02091554
.L_1d4:
    cmp sl, #0x0
    beq .L_200
    ldr r0, [sp, #0x1c]
    cmp r6, r0
    addeq r7, r7, #0x1
    beq .L_200
    mov r0, r6
    str r6, [sp, #0x1c]
    mov r7, #0x0
    bl func_0202b998
    str r0, [sp, #0x18]
.L_200:
    ldr r0, [sp]
    mov r1, #0x5
    ldr r0, [r0, #0xc]
    add r2, r8, #0x1
    bl func_0202160c
    mov r9, r0
    cmp sl, #0x0
    mov fp, #0xc1
    beq .L_234
    ldr r0, [sp, #0x18]
    ldr fp, [sp, #0x30]
    cmp r7, r0
    ldrge fp, [sp, #0x34]
.L_234:
    cmp r6, #0x0
    moveq fp, #0x0
    cmp r4, #0x0
    beq .L_258
    cmp r4, #0x1
    beq .L_2b8
    cmp r4, #0x2
    beq .L_2f0
    b .L_324
.L_258:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x28
    movle r4, #0xa
    ldrgt r4, [sp, #0x10]
    mov r0, r5
    mov r1, r4
    bl func_020b377c
    mov r6, r1
    mov r0, #0xb4
    mul r0, r6, r0
    sub r1, r4, #0x1
    bl func_020b377c
    add r0, r0, #0x26
    str r0, [sp, #0x28]
    mov r0, r5
    mov r1, r4
    bl func_020b377c
    sub r1, r4, r6
    str r1, [sp, #0x20]
    mov r1, #0x1c
    mul r1, r0, r1
    add r0, r1, #0x13
    str r0, [sp, #0x24]
    b .L_324
.L_2b8:
    ldr r0, [sp, #0xc]
    cmp r0, #0xa
    movle r0, #0xa
    sub r1, r0, #0x1
    mov r0, #0xb4
    mul r0, r5, r0
    bl func_020b377c
    add r0, r0, #0x26
    str r0, [sp, #0x28]
    rsb r0, r5, #0xf
    str r0, [sp, #0x20]
    mov r0, #0x8c
    str r0, [sp, #0x24]
    b .L_324
.L_2f0:
    ldr r0, [sp, #0x8]
    cmp r0, #0xa
    movle r0, #0xa
    sub r1, r0, #0x1
    mov r0, #0xb4
    mul r0, r5, r0
    bl func_020b377c
    add r0, r0, #0x26
    str r0, [sp, #0x28]
    rsb r0, r5, #0x1e
    str r0, [sp, #0x20]
    mov r0, #0xaf
    str r0, [sp, #0x24]
.L_324:
    mov r0, r9
    mov r1, #0x2
    mov r2, r8
    bl func_0202165c
    ldr r2, [sp, #0x28]
    mov r0, r9
    mov r1, #0x3
    bl func_0202165c
    ldr r2, [sp, #0x24]
    mov r0, r9
    mov r1, #0x4
    bl func_0202165c
    mov r0, r9
    mov r1, #0x11
    mov r2, #0x0
    bl func_0202165c
    ldr r2, [sp, #0x20]
    mov r0, r9
    mov r1, #0x12
    bl func_0202165c
    mov r0, r9
    mov r2, fp
    mov r1, #0x0
    bl func_0202165c
    ldr r0, [sp, #0x14]
    add r8, r8, #0x1
    add r0, r0, #0x20
    str r0, [sp, #0x14]
    cmp r8, #0x7d
    blt .L_158
    mov r0, #0x1
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word data_ov006_021cdf48
