; func_ov006_021c3c78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021ce068
        .extern data_ov006_0224f448
        .extern func_02021660
        .extern func_020216b0
        .extern func_02023188
        .extern func_0202b9ec
        .extern OS_SPrintf
        .extern func_020b3870
        .extern func_ov006_021b60a4
        .extern func_ov006_021b6ad8
        .extern func_ov006_021b6d00
        .extern func_ov006_021b6d1c
        .global func_ov006_021c3c78
        .arm
func_ov006_021c3c78:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    str r0, [sp]
    mov r0, #0x0
    movs sl, r1
    str r0, [sp, #0x4]
    beq .L_1848
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
    bl func_ov006_021b6ad8
    mov r1, #0x0
    str r0, [sp, #0x4]
    mov r7, r1
    add r0, sp, #0x38
.L_17d0:
    str r7, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x3
    blt .L_17d0
    ldr r0, [sp, #0x4]
    str r7, [sp, #0x18]
    cmp r0, #0x0
    mvn r0, #0x0
    str r0, [sp, #0x1c]
    beq .L_1848
    ldr r0, _LIT0
    add r2, r5, r4
    mov r1, r6
    bl func_ov006_021b60a4
    mov r1, #0x1
    ldr r0, _LIT0
    mov r2, r1
    bl func_ov006_021b6d00
    str r0, [sp, #0x38]
    ldr r0, _LIT0
    mov r1, #0x2
    mov r2, #0x1
    bl func_ov006_021b6d00
    str r0, [sp, #0x3c]
    ldr r0, _LIT0
    mov r1, #0x3
    mov r2, #0x1
    bl func_ov006_021b6d00
    str r0, [sp, #0x40]
    bl func_02023188
.L_1848:
    ldr r0, [sp]
    mov r1, #0x5
    ldr r0, [r0, #0xc]
    mov r2, #0x0
    bl func_02021660
    mov r1, #0x0
    mov r2, #0x1
    bl func_020216b0
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
.L_18c0:
    cmp r8, #0x50
    movlt r4, #0x0
    movlt r5, r8
    blt .L_18e4
    cmp r8, #0x5f
    movlt r4, #0x1
    sublt r5, r8, #0x50
    movge r4, #0x2
    subge r5, r8, #0x5f
.L_18e4:
    cmp sl, #0x0
    mov r6, #0x0
    beq .L_193c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1928
    add r0, sp, #0x38
    ldr r0, [r0, r4, lsl #0x2]
    cmp r5, r0
    bge .L_1928
    ldr r0, _LIT0
    add r1, r4, #0x1
    mov r2, r5
    mov r3, #0x1
    bl func_ov006_021b6d1c
    mov r6, r0
    b .L_192c
.L_1928:
    mov r6, #0x0
.L_192c:
    ldr r0, [sp, #0x14]
    ldr r1, _LIT1
    mov r2, r6
    bl OS_SPrintf
.L_193c:
    cmp sl, #0x0
    beq .L_1968
    ldr r0, [sp, #0x1c]
    cmp r6, r0
    addeq r7, r7, #0x1
    beq .L_1968
    mov r0, r6
    str r6, [sp, #0x1c]
    mov r7, #0x0
    bl func_0202b9ec
    str r0, [sp, #0x18]
.L_1968:
    ldr r0, [sp]
    mov r1, #0x5
    ldr r0, [r0, #0xc]
    add r2, r8, #0x1
    bl func_02021660
    mov r9, r0
    cmp sl, #0x0
    mov fp, #0xc1
    beq .L_199c
    ldr r0, [sp, #0x18]
    ldr fp, [sp, #0x30]
    cmp r7, r0
    ldrge fp, [sp, #0x34]
.L_199c:
    cmp r6, #0x0
    moveq fp, #0x0
    cmp r4, #0x0
    beq .L_19c0
    cmp r4, #0x1
    beq .L_1a20
    cmp r4, #0x2
    beq .L_1a58
    b .L_1a8c
.L_19c0:
    ldr r0, [sp, #0x2c]
    cmp r0, #0x28
    movle r4, #0xa
    ldrgt r4, [sp, #0x10]
    mov r0, r5
    mov r1, r4
    bl func_020b3870
    mov r6, r1
    mov r0, #0xb4
    mul r0, r6, r0
    sub r1, r4, #0x1
    bl func_020b3870
    add r0, r0, #0x26
    str r0, [sp, #0x28]
    mov r0, r5
    mov r1, r4
    bl func_020b3870
    sub r1, r4, r6
    str r1, [sp, #0x20]
    mov r1, #0x1c
    mul r1, r0, r1
    add r0, r1, #0x13
    str r0, [sp, #0x24]
    b .L_1a8c
.L_1a20:
    ldr r0, [sp, #0xc]
    cmp r0, #0xa
    movle r0, #0xa
    sub r1, r0, #0x1
    mov r0, #0xb4
    mul r0, r5, r0
    bl func_020b3870
    add r0, r0, #0x26
    str r0, [sp, #0x28]
    rsb r0, r5, #0xf
    str r0, [sp, #0x20]
    mov r0, #0x8c
    str r0, [sp, #0x24]
    b .L_1a8c
.L_1a58:
    ldr r0, [sp, #0x8]
    cmp r0, #0xa
    movle r0, #0xa
    sub r1, r0, #0x1
    mov r0, #0xb4
    mul r0, r5, r0
    bl func_020b3870
    add r0, r0, #0x26
    str r0, [sp, #0x28]
    rsb r0, r5, #0x1e
    str r0, [sp, #0x20]
    mov r0, #0xaf
    str r0, [sp, #0x24]
.L_1a8c:
    mov r0, r9
    mov r1, #0x2
    mov r2, r8
    bl func_020216b0
    ldr r2, [sp, #0x28]
    mov r0, r9
    mov r1, #0x3
    bl func_020216b0
    ldr r2, [sp, #0x24]
    mov r0, r9
    mov r1, #0x4
    bl func_020216b0
    mov r0, r9
    mov r1, #0x11
    mov r2, #0x0
    bl func_020216b0
    ldr r2, [sp, #0x20]
    mov r0, r9
    mov r1, #0x12
    bl func_020216b0
    mov r0, r9
    mov r2, fp
    mov r1, #0x0
    bl func_020216b0
    ldr r0, [sp, #0x14]
    add r8, r8, #0x1
    add r0, r0, #0x20
    str r0, [sp, #0x14]
    cmp r8, #0x7d
    blt .L_18c0
    mov r0, #0x1
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_ov006_021ce068
