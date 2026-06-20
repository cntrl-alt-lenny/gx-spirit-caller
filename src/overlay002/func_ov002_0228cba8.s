; func_ov002_0228cba8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b8c0
        .extern func_ov002_021b00d0
        .global func_ov002_0228cba8
        .arm
func_ov002_0228cba8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    mov r0, r4, lsl #0x4
    add r5, r0, #0x5
    mov r7, #0x0
    mov r3, #0x5
    add r0, sp, #0x0
    mov r2, #0x1
.L_24:
    tst r1, r2, lsl r5
    strne r3, [r0, r7, lsl #0x2]
    add r3, r3, #0x1
    addne r7, r7, #0x1
    cmp r3, #0xa
    add r5, r5, #0x1
    ble .L_24
    sub r6, r7, #0x1
    cmp r6, #0x0
    ble .L_74
    add r5, sp, #0x0
.L_50:
    add r0, r6, #0x1
    bl func_ov002_021b00d0
    ldr r2, [r5, r6, lsl #0x2]
    ldr r1, [r5, r0, lsl #0x2]
    str r1, [r5, r6, lsl #0x2]
    sub r6, r6, #0x1
    str r2, [r5, r0, lsl #0x2]
    cmp r6, #0x0
    bgt .L_50
.L_74:
    cmp r7, #0x0
    mov r9, #0x0
    ble .L_ec
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r8, r1, r0, r2
    add r5, sp, #0x0
    mov sl, #0x14
.L_98:
    ldr r6, [r5, r9, lsl #0x2]
    mla r2, r6, sl, r8
    ldr r1, [r2, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    beq .L_e0
    ldr r0, [r2, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8c0
    cmp r0, #0x2
    cmpne r0, #0x3
    cmpne r0, #0x4
    bne .L_e0
    add sp, sp, #0x2c
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_e0:
    add r9, r9, #0x1
    cmp r9, r7
    blt .L_98
.L_ec:
    cmp r7, #0x0
    mov r1, #0x0
    ble .L_148
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r4, #0x1
    mla r8, r2, r0, r3
    add r6, sp, #0x0
    mov r2, #0x14
.L_110:
    ldr r0, [r6, r1, lsl #0x2]
    mla r5, r0, r2, r8
    ldrh r3, [r5, #0x38]
    cmp r3, #0x0
    beq .L_13c
    ldr r5, [r5, #0x40]
    mov r3, r5, lsr #0x2
    orr r3, r3, r5, lsr #0x1
    tst r3, #0x1
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_13c:
    add r1, r1, #0x1
    cmp r1, r7
    blt .L_110
.L_148:
    cmp r7, #0x0
    mov r1, #0x0
    ble .L_1a0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r2, r4, #0x1
    mla r8, r2, r0, r3
    add r6, sp, #0x0
    mov r2, #0x14
.L_16c:
    ldr r0, [r6, r1, lsl #0x2]
    mla r5, r0, r2, r8
    ldrh r3, [r5, #0x38]
    cmp r3, #0x0
    bne .L_194
    ldr r3, [r5, #0x40]
    mov r3, r3, lsr #0x14
    tst r3, #0x1
    addne sp, sp, #0x2c
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_194:
    add r1, r1, #0x1
    cmp r1, r7
    blt .L_16c
.L_1a0:
    cmp r7, #0x0
    mov r5, #0x0
    ble .L_1e8
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r4, #0x1
    mla r4, r1, r0, r2
    add r3, sp, #0x0
    mov r1, #0x14
.L_1c4:
    ldr r0, [r3, r5, lsl #0x2]
    mla r2, r0, r1, r4
    ldrh r2, [r2, #0x38]
    cmp r2, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    add r5, r5, #0x1
    cmp r5, r7
    blt .L_1c4
.L_1e8:
    cmp r7, #0x0
    addle sp, sp, #0x2c
    mvnle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r7
    bl func_ov002_021b00d0
    add r1, sp, #0x0
    ldr r0, [r1, r0, lsl #0x2]
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
