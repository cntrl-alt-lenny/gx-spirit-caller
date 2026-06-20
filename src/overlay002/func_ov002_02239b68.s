; func_ov002_02239b68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae484
        .extern func_ov002_021c84e0
        .extern func_ov002_021d873c
        .extern func_ov002_021de9c0
        .extern func_ov002_021e7584
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_02239b68
        .arm
func_ov002_02239b68:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_2e0
    b .L_2c8
    b .L_264
    b .L_230
    b .L_1ac
    b .L_128
.L_128:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_1a4
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_1a4
    mov r2, #0x0
    strh r2, [r4, #0xa]
    mov r0, r5
    mov r1, r6
    strh r2, [r4, #0x8]
    bl func_ov002_021c84e0
    strh r0, [r4, #0xc]
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_1a4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1ac:
    ldr r1, _LIT1
    bl func_ov002_02257878
    cmp r0, #0x0
    moveq r0, #0x7c
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    bne .L_1f4
    ldrh r0, [r4, #0x2]
    mov r1, #0x61
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_228
.L_1f4:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_220
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_228
.L_220:
    mov r0, #0x75
    bl func_ov002_021ae484
.L_228:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_230:
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
    bl func_ov002_0225935c
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_264:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_2c0
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
    bl func_ov002_021d873c
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x2
    movlt r0, #0x7f
    movge r0, #0x7c
    ldmia sp!, {r4, r5, r6, pc}
.L_2c0:
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_2c8:
    ldrh r2, [r4, #0x8]
    ldrh r1, [r4, #0xa]
    orr r1, r2, r1, lsl #0x10
    bl func_ov002_021de9c0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2e0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_021e7584
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd744
