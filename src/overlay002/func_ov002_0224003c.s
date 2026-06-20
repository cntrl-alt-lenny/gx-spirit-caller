; func_ov002_0224003c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae484
        .extern func_ov002_0223dcc0
        .extern func_ov002_0223fd74
        .extern func_ov002_022575c8
        .extern func_ov002_022577dc
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_02280c40
        .global func_ov002_0224003c
        .arm
func_ov002_0224003c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r7, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_58c
    b .L_2c0
    b .L_408
    b .L_454
    b .L_4cc
    b .L_4f0
    b .L_53c
.L_2c0:
    bl func_ov002_022577dc
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
    bne .L_3e4
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
    bne .L_350
    mov r0, r7
    bl func_ov002_0223dcc0
    add r5, r5, #0x1
.L_350:
    cmp r5, #0x2
    bge .L_3d8
    mov r4, #0x1
    mvn r8, #0x0
.L_360:
    ldrh r0, [r7, #0x2]
    mov r2, r6
    mov r3, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    str r4, [sp]
    bl func_ov002_02280c40
    mov r6, r0
    cmp r6, r8
    ble .L_3cc
    ldrh r1, [r7, #0x2]
    mov r0, r7
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_3cc
    ldrh r1, [r7, #0x2]
    mov r0, r7
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dcc0
.L_3cc:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_360
.L_3d8:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_3e4:
    mov r0, #0x73
    bl func_ov002_021ae484
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_408:
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
    bl func_ov002_0225935c
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_454:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_4b0
    ldr r1, _LIT4
    mov r0, r7
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    mov r0, r7
    bl func_ov002_022577dc
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
.L_4b0:
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x2
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_4cc:
    mov r0, #0x75
    bl func_ov002_021ae484
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_4f0:
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
    bl func_ov002_0225935c
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_53c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_570
    ldr r1, _LIT4
    mov r0, r7
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_570:
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x2
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_58c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022d016c
_LIT5: .word func_ov002_0223fd74
