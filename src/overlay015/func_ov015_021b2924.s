; func_ov015_021b2924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_02006164
        .extern func_02006194
        .extern func_0207ec28
        .extern func_ov015_021b27d8
        .global func_ov015_021b2924
        .arm
func_ov015_021b2924:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r0, r1
    mov r6, r2
    bl func_0207ec28
    mov r4, #0x0
    mov r5, r4
    str r0, [sp]
    bl func_02006194
    cmp r0, #0x0
    beq .L_a4
    add r0, sp, #0x8
    add r1, sp, #0x4
    bl func_02006110
    ldrsh r2, [r7, #0x1c]
    ldr r1, [sp, #0x8]
    cmp r1, r2
    blt .L_a4
    ldrh r0, [r7, #0x20]
    add r0, r2, r0
    cmp r1, r0
    bgt .L_a4
    ldrsh r2, [r7, #0x1e]
    ldr r1, [sp, #0x4]
    cmp r1, r2
    blt .L_a4
    ldrh r0, [r7, #0x22]
    add r0, r2, r0
    cmp r1, r0
    bgt .L_a4
    ldr r0, [r7, #0xc]
    cmp r0, #0x0
    bne .L_9c
    bl func_02006164
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r7, #0x10]
    b .L_a4
.L_9c:
    mov r0, #0x1
    str r0, [r7, #0x10]
.L_a4:
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_bc
    cmp r0, #0x1
    beq .L_114
    b .L_1a0
.L_bc:
    ldr r0, [r7, #0x10]
    cmp r0, #0x1
    ldr r0, [r7, #0xc]
    bne .L_e8
    cmp r0, #0x0
    ldreq r0, [r7, #0x18]
    cmpeq r0, #0x2
    mov r0, #0x1
    moveq r5, #0x1
    str r0, [r7, #0xc]
    b .L_1a0
.L_e8:
    cmp r0, #0x1
    bne .L_108
    ldr r0, [r7, #0x18]
    cmp r0, #0x1
    mov r0, #0x2
    moveq r5, #0x1
    str r0, [r7, #0xc]
    b .L_1a0
.L_108:
    mov r0, #0x0
    str r0, [r7, #0xc]
    b .L_1a0
.L_114:
    ldr r0, [r7, #0x10]
    cmp r0, #0x1
    ldr r0, [r7, #0xc]
    bne .L_164
    cmp r0, #0x0
    bne .L_144
    ldr r0, [r7, #0x18]
    cmp r0, #0x2
    mov r0, #0x3
    moveq r5, #0x1
    str r0, [r7, #0xc]
    b .L_1a0
.L_144:
    cmp r0, #0x1
    bne .L_1a0
    ldr r0, [r7, #0x18]
    cmp r0, #0x2
    mov r0, #0x2
    moveq r5, #0x1
    str r0, [r7, #0xc]
    b .L_1a0
.L_164:
    cmp r0, #0x3
    bne .L_184
    ldr r0, [r7, #0x18]
    cmp r0, #0x1
    mov r0, #0x1
    moveq r5, #0x1
    str r0, [r7, #0xc]
    b .L_1a0
.L_184:
    cmp r0, #0x2
    bne .L_1a0
    ldr r0, [r7, #0x18]
    cmp r0, #0x1
    mov r0, #0x0
    moveq r5, #0x1
    str r0, [r7, #0xc]
.L_1a0:
    cmp r5, #0x1
    bne .L_1c0
    ldr r0, [r7, #0x18]
    cmp r0, #0x0
    ble .L_1c0
    ldr r0, [r7, #0xc]
    ldr r1, [r7, #0x14]
    blx r1
.L_1c0:
    mov r3, #0x0
    add r2, sp, #0x0
    mov r0, r7
    mov r1, r6
    str r3, [r7, #0x10]
    bl func_ov015_021b27d8
    add r0, r4, r0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
