; func_ov002_02239a78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3a4
        .extern func_ov002_021c8400
        .extern func_ov002_021d864c
        .extern func_ov002_021de8d0
        .extern func_ov002_021e7494
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_02257790
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_02239a78
        .arm
func_ov002_02239a78:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_1ec
    b .L_1d4
    b .L_170
    b .L_13c
    b .L_b8
    b .L_34
.L_34:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_b0
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_b0
    mov r2, #0x0
    strh r2, [r4, #0xa]
    mov r0, r5
    mov r1, r6
    strh r2, [r4, #0x8]
    bl func_ov002_021c8400
    strh r0, [r4, #0xc]
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_b0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_b8:
    ldr r1, _LIT1
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x7c
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    bne .L_100
    ldrh r0, [r4, #0x2]
    mov r1, #0x61
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_134
.L_100:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_12c
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_134
.L_12c:
    mov r0, #0x75
    bl func_ov002_021ae3a4
.L_134:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_13c:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x7c
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_170:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_1cc
    ldr r1, _LIT2
    add ip, r4, #0x8
    ldr r0, [r1, #0xd70]
    ldr r2, [r1, #0xd74]
    mov r4, r0, lsl #0x1
    ldr r1, [r1, #0xd78]
    ldrh r3, [ip, r4]
    add r1, r2, r1
    mov r2, #0x1
    orr r2, r3, r2, lsl r1
    strh r2, [ip, r4]
    bl func_ov002_021d864c
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x2
    movlt r0, #0x7f
    movge r0, #0x7c
    ldmia sp!, {r4, r5, r6, pc}
.L_1cc:
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_1d4:
    ldrh r2, [r4, #0x8]
    ldrh r1, [r4, #0xa]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021de8d0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1ec:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_021e7494
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cd664
