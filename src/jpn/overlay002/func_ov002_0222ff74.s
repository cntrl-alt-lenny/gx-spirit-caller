; func_ov002_0222ff74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021c920c
        .extern func_ov002_021d58dc
        .extern func_ov002_021d8fd0
        .extern func_ov002_0226b000
        .global func_ov002_0222ff74
        .arm
func_ov002_0222ff74:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_c8
    cmp r0, #0x80
    bne .L_124
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT1
    ldr r5, _LIT2
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov lr, r2, lsl #0x1a
    mul r2, r3, r1
    add r5, r5, r2
    mov r1, lr, lsr #0x1b
    mov r3, #0x14
    mul r3, r1, r3
    add r5, r5, #0x30
    ldrh ip, [r4, #0x4]
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
    add r2, ip, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c920c
    mov r2, #0x1
    mov r3, r2, lsl r0
    ldrh r1, [r4, #0x2]
    eor r3, r3, #0xff
    mov r0, r1, lsl #0x1f
    ldrh r1, [r4]
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b000
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_c8:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT4
    mov r3, r1, lsl #0x1f
    ldrh r2, [r0, #0xb2]
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8fd0
    ldr r0, _LIT5
    mov r3, #0x3
    ldr r0, [r0, #0xce8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d58dc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_124:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c4
_LIT4: .word data_ov002_022d0d8c
_LIT5: .word data_ov002_022d008c
