; func_ov002_02224f98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_0202e2f8
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc618
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ff3bc
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225368c
        .extern func_ov002_0225764c
        .extern func_ov002_0226b054
        .extern func_ov002_0227adb8
        .global func_ov002_02224f98
        .arm
func_ov002_02224f98:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x6e
    bgt .L_28
    bge .L_28c
    cmp r2, #0x64
    beq .L_2a8
    b .L_2c0
.L_28:
    sub r2, r2, #0x7c
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_2c0
    b .L_234
    b .L_214
    b .L_17c
    b .L_2c0
    b .L_4c
.L_4c:
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r0, r4
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_174
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
    beq .L_174
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9ecc
    ldr r1, _LIT0
    mov r5, r0
    str r5, [r1, #0x5ac]
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_0202e234
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    strh r0, [r4, #0xa]
    ldrh r5, [r4, #0xa]
    ldrh r0, [r4, #0x2]
    cmp r5, #0x0
    bne .L_12c
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x6e
    ldmia sp!, {r4, r5, r6, pc}
.L_12c:
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r5, r0
    blt .L_154
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    mov r5, r0
.L_154:
    strh r5, [r4, #0xa]
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_174:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_17c:
    ldrh r2, [r4]
    ldr r0, _LIT2
    cmp r2, r0
    beq .L_19c
    ldr r0, _LIT3
    cmp r2, r0
    beq .L_1e4
    b .L_20c
.L_19c:
    ldrh r1, [r4, #0xa]
    cmp r1, #0x2
    movhi r0, #0x2
    movls r0, r1
    cmp r0, #0x20
    bge .L_1c0
    cmp r1, #0x2
    movhi r1, #0x2
    b .L_1c4
.L_1c0:
    mov r1, #0x20
.L_1c4:
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT0
    add r1, r1, #0x27
    mov r4, r3, lsl #0x1f
    ldr r3, [r0, #0x5ac]
    mov r0, r4, lsr #0x1f
    bl func_ov002_021af9d0
    b .L_20c
.L_1e4:
    ldrh r1, [r4, #0xa]
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT0
    cmp r1, #0x20
    movcs r1, #0x20
    mov r4, r3, lsl #0x1f
    ldr r3, [r0, #0x5ac]
    add r1, r1, #0x6
    mov r0, r4, lsr #0x1f
    bl func_ov002_021af9d0
.L_20c:
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_214:
    mov r1, #0x0
    ldr r0, _LIT4
    strh r1, [r4, #0x8]
    ldr r0, [r0, #0xd44]
    strh r0, [r4, #0xa]
    bl func_ov002_021e2b3c
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, pc}
.L_234:
    ldrh r1, [r4, #0x8]
    ldrh r0, [r4, #0xa]
    cmp r1, r0
    bcs .L_280
    add r0, r1, #0x1
    bl func_ov002_021b004c
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldrh r2, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    ldrh r1, [r4, #0x8]
    mov r0, #0x7c
    add r1, r1, #0x1
    strh r1, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
.L_280:
    bl func_ov002_021e2c5c
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_28c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_2a8:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000011d
_LIT2: .word 0x0000157a
_LIT3: .word 0x00001978
_LIT4: .word data_ov002_022d016c
