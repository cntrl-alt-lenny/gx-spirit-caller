; func_ov002_022439fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3a4
        .extern func_ov002_0223dbd0
        .extern func_ov002_0223fc8c
        .extern func_ov002_022576f4
        .extern func_ov002_02257790
        .extern func_ov002_022579d0
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_022439fc
        .arm
func_ov002_022439fc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldrh r1, [r7]
    ldr r2, _LIT0
    mov r6, #0x0
    cmp r1, r2
    beq .L_2c
    add r2, r2, #0xa
    cmp r1, r2
    beq .L_3c
    b .L_4c
.L_2c:
    mov r4, #0x2
    mov r5, #0x8d
    mov r0, #0x21
    b .L_4c
.L_3c:
    mov r4, #0x3
    mov r6, #0x1
    mov r5, #0x73
    mov r0, #0x75
.L_4c:
    ldr r2, _LIT1
    ldr r2, [r2, #0x5b8]
    cmp r2, #0x5
    addls pc, pc, r2, lsl #0x2
    b .L_228
    b .L_78
    b .L_104
    b .L_144
    b .L_1c4
    b .L_104
    b .L_144
.L_78:
    mov r0, r7
    bl func_ov002_022576f4
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r6, #0x0
    beq .L_cc
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_c0
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_ec
.L_c0:
    mov r0, r5
    bl func_ov002_021ae3a4
    b .L_ec
.L_cc:
    ldrh r0, [r7, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0xd44]
.L_ec:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_104:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    ldr r2, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_144:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_1ac
    ldr r1, _LIT3
    mov r0, r7
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dbd0
    ldr r1, _LIT4
    mov r0, r7
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x6]
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x18
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT1
    mov r1, #0x3
    str r1, [r0, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1ac:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x2
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c4:
    ldrh r2, [r7, #0x2]
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    ldr r1, [r1, r2, lsl #0x2]
    cmp r1, #0x1
    bne .L_20c
    mov r0, r7
    rsb r1, r2, #0x1
    bl func_ov002_022579d0
    ldrh r1, [r7, #0x6]
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x18
    movgt r1, #0x1
    ldr r0, _LIT3
    movle r1, #0x0
    str r1, [r0, #0xd44]
    b .L_210
.L_20c:
    bl func_ov002_021ae3a4
.L_210:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_228:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000017e2
_LIT1: .word data_ov002_022ce1a8
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022d008c
_LIT4: .word func_ov002_0223fc8c
