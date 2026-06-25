; func_ov002_02231b88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1e44
        .extern func_ov002_021d59cc
        .extern func_ov002_021d7100
        .extern func_ov002_02257ab8
        .extern func_ov002_0226b034
        .global func_ov002_02231b88
        .arm
func_ov002_02231b88:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r1, [r2, #0x5a8]
    cmp r1, #0x7c
    beq .L_f4
    cmp r1, #0x7d
    beq .L_d8
    cmp r1, #0x80
    bne .L_248
    ldrh r5, [r4, #0x2]
    ldr r1, _LIT1
    ldrh ip, [r4, #0x4]
    mov r2, r5, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r3, r2, #0x1
    mov lr, r5, lsl #0x1a
    mul r1, r3, r1
    ldr r5, _LIT2
    mov lr, lr, lsr #0x1b
    mov r3, #0x14
    add r5, r5, r1
    mul r3, lr, r3
    add r5, r5, #0x30
    ldr lr, [r5, r3]
    mov r5, ip, lsl #0x11
    mov ip, lr, lsl #0x2
    mov ip, ip, lsr #0x18
    mov lr, lr, lsl #0x12
    mov ip, ip, lsl #0x1
    mov r5, r5, lsr #0x17
    add ip, ip, lr, lsr #0x1f
    cmp r5, ip
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr ip, _LIT3
    add r1, ip, r1
    ldrh r1, [r3, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    rsb r1, r2, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r2, r0, lsr #0x1f
    rsb r0, r2, #0x1
    bl func_ov002_0226b034
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_d8:
    ldr r1, _LIT4
    mov r0, #0x7c
    ldrh r1, [r1, #0xb0]
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    str r1, [r2, #0x5ac]
    ldmia sp!, {r3, r4, r5, pc}
.L_f4:
    ldrh r1, [r4, #0x2]
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r4
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, [r1, #0x5ac]
    rsb r1, r3, #0x1
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    ldrh r2, [r4]
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, [r0, #0x5ac]
    rsb r0, r3, #0x1
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r3, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldrh r1, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d59cc
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r3, #0x5
    mov r1, r1, lsl #0x1f
    mov ip, r1, lsr #0x1f
    str ip, [sp]
    ldr r1, [r0, #0x5ac]
    ldrh r2, [r4]
    rsb r0, ip, #0x1
    bl func_ov002_021d59cc
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x1a
    ldr r2, [r1, #0x5ac]
    mov r1, r3, lsr #0x1b
    rsb r3, r0, #0x1
    and r4, r0, #0xff
    and r1, r1, #0xff
    orr r1, r4, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d7100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_248:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word data_ov002_022d0e6c
