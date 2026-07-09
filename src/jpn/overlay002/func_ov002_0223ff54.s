; func_ov002_0223ff54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_0223dbd0
        .extern func_ov002_0223fc8c
        .extern func_ov002_022574e0
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_02280b30
        .global func_ov002_0223ff54
        .arm
func_ov002_0223ff54:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r7, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_304
    b .L_38
    b .L_180
    b .L_1cc
    b .L_244
    b .L_268
    b .L_2b4
.L_38:
    bl func_ov002_022576f4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldrh r2, [r7, #0x2]
    ldr r0, _LIT1
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_15c
    ldr r3, _LIT2
    mov r4, r2, lsl #0x1a
    ldr r0, _LIT3
    and r2, r1, #0x1
    mla r3, r2, r0, r3
    mov r2, r4, lsr #0x1b
    mov r0, #0x14
    ldrh r4, [r7, #0x4]
    mul r0, r2, r0
    add r3, r3, #0x30
    ldr r3, [r3, r0]
    mov r5, #0x0
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r4, r4, lsl #0x11
    add r0, r0, r3, lsr #0x1f
    cmp r0, r4, lsr #0x17
    sub r6, r5, #0x1
    bne .L_c8
    mov r0, r7
    bl func_ov002_0223dbd0
    add r5, r5, #0x1
.L_c8:
    cmp r5, #0x2
    bge .L_150
    mov r4, #0x1
    mvn r8, #0x0
.L_d8:
    ldrh r0, [r7, #0x2]
    mov r2, r6
    mov r3, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    str r4, [sp]
    bl func_ov002_02280b30
    mov r6, r0
    cmp r6, r8
    ble .L_144
    ldrh r1, [r7, #0x2]
    mov r0, r7
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_144
    ldrh r1, [r7, #0x2]
    mov r0, r7
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dbd0
.L_144:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_d8
.L_150:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_15c:
    mov r0, #0x73
    bl func_ov002_021ae3a4
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_180:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    ldr r2, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_1cc:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_228
    ldr r1, _LIT4
    mov r0, r7
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dbd0
    mov r0, r7
    bl func_ov002_022576f4
    cmp r0, #0x1
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_228:
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x2
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_244:
    mov r0, #0x75
    bl func_ov002_021ae3a4
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_268:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    ldr r2, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_2b4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_2e8
    ldr r1, _LIT4
    mov r0, r7
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dbd0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_2e8:
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x2
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_304:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022d008c
_LIT5: .word func_ov002_0223fc8c
