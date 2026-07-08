; func_ov002_02216090 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021de318
        .extern func_ov002_02215f14
        .extern func_ov002_02257564
        .extern func_ov002_0225761c
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_02216090
        .arm
func_ov002_02216090:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r2, [r1, #0x5a8]
    sub r2, r2, #0x78
    cmp r2, #0x8
    addls pc, pc, r2, lsl #0x2
    b .L_198
    b .L_188
    b .L_198
    b .L_198
    b .L_198
    b .L_198
    b .L_198
    b .L_148
    b .L_9c
    b .L_58
.L_58:
    ldrh r2, [r4, #0x6]
    mov r1, #0x0
    bic r2, r2, #0xff00
    strh r2, [r4, #0x6]
    bl func_ov002_02215f14
    strh r0, [r4, #0x8]
    ldrh r1, [r4, #0x8]
    ldr r0, _LIT1
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x6]
    mov r0, #0x7f
    bic r1, r1, #0xff00
    orr r1, r1, #0x100
    strh r1, [r4, #0x6]
    ldmia sp!, {r4, pc}
.L_9c:
    bl func_ov002_022576f4
    cmp r0, #0x1
    ble .L_130
    ldrh r1, [r4]
    cmp r1, #0x1540
    beq .L_cc
    ldr r0, _LIT2
    cmp r1, r0
    addne r0, r0, #0x16c
    cmpne r1, r0
    beq .L_e4
    b .L_fc
.L_cc:
    mov r0, r4
    bl func_ov002_0225761c
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_e4:
    ldrh r0, [r4, #0x2]
    mov r1, #0x6d
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    b .L_110
.L_fc:
    ldrh r0, [r4, #0x2]
    mov r1, #0x62
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
.L_110:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_130:
    mov r0, r4
    bl func_ov002_0225761c
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_148:
    bl func_ov002_0225930c
    cmp r0, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT4
    mov r3, #0x1
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r2, r1
    add r0, r1, r0, lsl #0x4
    mov r2, r3, lsl r0
    ldr r1, _LIT0
    mov r0, #0x78
    str r2, [r1, #0x5ac]
    ldmia sp!, {r4, pc}
.L_188:
    ldr r1, [r1, #0x5ac]
    bl func_ov002_021de318
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_198:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x0000ffff
_LIT2: .word 0x000017f2
_LIT3: .word func_ov002_02257564
_LIT4: .word data_ov002_022d008c
