; func_ov002_02221b24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern func_0202b8a8
        .extern func_ov002_021ae400
        .extern func_ov002_021b947c
        .extern func_ov002_021c33e4
        .extern func_ov002_021c84e0
        .extern func_ov002_021ca2b8
        .extern func_ov002_021d873c
        .extern func_ov002_021de8fc
        .extern func_ov002_021e7584
        .extern func_ov002_021ff3bc
        .extern func_ov002_0220e650
        .extern func_ov002_0223def4
        .extern func_ov002_022577dc
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_02221b24
        .arm
func_ov002_02221b24:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r2, [r2, #0x5a8]
    sub r2, r2, #0x7b
    cmp r2, #0x5
    addls pc, pc, r2, lsl #0x2
    b .L_210
    b .L_1f4
    b .L_1d8
    b .L_158
    b .L_124
    b .L_fc
    b .L_38
.L_38:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_f4
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223def4
    mov r4, r0
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, asr #0x8
    mov r0, r0, lsl #0x10
    and r1, r1, #0xff
    cmp r1, #0xe
    mov r2, r0, lsr #0x10
    bne .L_f4
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_f4
    ldr r0, _LIT1
    mov r1, r4, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    strh r0, [r6, #0xc]
    ldrh r1, [r6, #0x8]
    mov r0, r6
    strh r1, [r6, #0xe]
    bl func_ov002_022577dc
    cmp r0, #0x0
    movne r0, #0x7f
    ldmneia sp!, {r4, r5, r6, pc}
.L_f4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_fc:
    mov r0, #0x0
    strh r0, [r6, #0xa]
    strh r0, [r6, #0x8]
    ldrh r0, [r6, #0x2]
    mov r1, #0x46
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_124:
    ldr r1, _LIT2
    bl func_ov002_02257878
    cmp r0, #0x0
    moveq r0, #0x7c
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_158:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_1d0
    ldr r0, _LIT3
    add ip, r6, #0x8
    ldr r4, [r0, #0xd70]
    ldr r2, [r0, #0xd74]
    mov r3, r4, lsl #0x1
    ldr r0, [r0, #0xd78]
    ldrh r1, [ip, r3]
    add r5, r2, r0
    mov r0, #0x1
    orr r2, r1, r0, lsl r5
    mov r0, r4
    mov r1, r5
    strh r2, [ip, r3]
    bl func_ov002_021c84e0
    ldrh r2, [r6, #0xc]
    mov r1, r5
    sub r2, r2, r0
    mov r0, r4
    strh r2, [r6, #0xc]
    bl func_ov002_021d873c
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    subs r1, r1, #0x1
    str r1, [r0, #0x5ac]
    movne r0, #0x7e
    moveq r0, #0x7c
    ldmia sp!, {r4, r5, r6, pc}
.L_1d0:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_1d8:
    ldrh r3, [r6, #0x8]
    ldrh r1, [r6, #0xa]
    mov r2, #0x0
    orr r1, r3, r1, lsl #0x10
    bl func_ov002_021de8fc
    mov r0, #0x7b
    ldmia sp!, {r4, r5, r6, pc}
.L_1f4:
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    beq .L_210
    ldrh r1, [r6, #0xe]
    mov r0, r6
    strh r1, [r6, #0x8]
    bl func_ov002_0220e650
.L_210:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0250
_LIT2: .word func_ov002_021e7584
_LIT3: .word data_ov002_022d016c
