; func_ov002_02230064 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c92ec
        .extern func_ov002_021d59cc
        .extern func_ov002_021d90c0
        .extern func_ov002_0226b0f0
        .global func_ov002_02230064
        .arm
func_ov002_02230064:
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
    bl func_ov002_021c92ec
    mov r2, #0x1
    mov r3, r2, lsl r0
    ldrh r1, [r4, #0x2]
    eor r3, r3, #0xff
    mov r0, r1, lsl #0x1f
    ldrh r1, [r4]
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b0f0
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
    bl func_ov002_021d90c0
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
    bl func_ov002_021d59cc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_124:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word data_ov002_022d0e6c
_LIT5: .word data_ov002_022d016c
