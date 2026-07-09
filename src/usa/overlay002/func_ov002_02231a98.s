; func_ov002_02231a98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d0d8c
        .extern func_ov002_021c194c
        .extern func_ov002_021c1d64
        .extern func_ov002_021d58dc
        .extern func_ov002_021d7010
        .extern func_ov002_022579d0
        .extern func_ov002_0226af44
        .global func_ov002_02231a98
        .arm
func_ov002_02231a98:
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
    bl func_ov002_022579d0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r2, r0, lsr #0x1f
    rsb r0, r2, #0x1
    bl func_ov002_0226af44
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
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c194c
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
    bl func_ov002_021c1d64
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
    bl func_ov002_021c194c
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
    bl func_ov002_021d58dc
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r3, #0x5
    mov r1, r1, lsl #0x1f
    mov ip, r1, lsr #0x1f
    str ip, [sp]
    ldr r1, [r0, #0x5ac]
    ldrh r2, [r4]
    rsb r0, ip, #0x1
    bl func_ov002_021d58dc
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
    bl func_ov002_021d7010
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_248:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c4
_LIT4: .word data_ov002_022d0d8c
