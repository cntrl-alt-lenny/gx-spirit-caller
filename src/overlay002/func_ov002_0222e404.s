; func_ov002_0222e404 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021de4b0
        .extern func_ov002_021debe0
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e96a0
        .extern func_ov002_021ebe88
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_0222e404
        .arm
func_ov002_0222e404:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r2, [r6]
    ldr r0, _LIT0
    cmp r2, r0
    beq .L_30
    add r0, r0, #0x19
    cmp r2, r0
    ldreq r4, _LIT1
    moveq r1, #0x8e
    moveq r5, #0x2
    b .L_3c
.L_30:
    ldr r4, _LIT2
    mov r1, #0x62
    mov r5, #0x1
.L_3c:
    ldr r0, _LIT3
    ldr r2, [r0, #0x5a8]
    sub r2, r2, #0x7c
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_1c4
    b .L_1b8
    b .L_158
    b .L_11c
    b .L_ec
    b .L_68
.L_68:
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_1c4
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    mov r0, r6
    mov r1, r5
    mov r2, r7
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_1c4
    mov r0, r6
    mov r1, r5
    mov r2, r7
    bl func_ov002_021debe0
    cmp r0, #0x0
    beq .L_1c4
    mov r0, r6
    mov r1, r4
    bl func_ov002_02257878
    cmp r0, #0x0
    movne r0, #0x7f
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_ec:
    mov r0, r6
    mov r1, r4
    bl func_ov002_02257878
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021e2b3c
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_11c:
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    bne .L_138
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
.L_138:
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_158:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_1a0
    ldr r1, _LIT4
    mov r0, r6
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021de4b0
    ldr r0, _LIT3
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, r5
    movlt r0, #0x7e
    movge r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1a0:
    ldr r0, _LIT3
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    movne r0, #0x7c
    moveq r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b8:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000179f
_LIT1: .word func_ov002_021ebe88
_LIT2: .word func_ov002_021e96a0
_LIT3: .word data_ov002_022ce288
_LIT4: .word data_ov002_022d016c
