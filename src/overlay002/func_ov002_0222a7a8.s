; func_ov002_0222a7a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021ca698
        .extern func_ov002_021d59cc
        .extern func_ov002_021d8128
        .extern func_ov002_0223f6c4
        .extern func_ov002_0225368c
        .global func_ov002_0222a7a8
        .arm
func_ov002_0222a7a8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldrh r5, [r4, #0x2]
    ldr r1, _LIT0
    ldrh r3, [r4, #0x4]
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mov r6, r5, lsl #0x1a
    mul r1, r2, r1
    ldr r5, _LIT1
    mov r6, r6, lsr #0x1b
    mov r2, #0x14
    mul r2, r6, r2
    add r5, r5, r1
    add r5, r5, #0x30
    mov r6, r3, lsl #0x11
    ldr r5, [r5, r2]
    mov r6, r6, lsr #0x17
    mov r3, r5, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r5, lsr #0x1f
    cmp r6, r3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, _LIT2
    add r1, r3, r1
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT3
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_118
    cmp r1, #0x7f
    beq .L_100
    cmp r1, #0x80
    bne .L_19c
    mov r1, r0
    bl func_ov002_021ca698
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_ov002_0223f6c4
    ldrh r3, [r4, #0x2]
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_100:
    ldrh r2, [r4]
    mov r1, #0x29
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_118:
    ldr r5, _LIT4
    mov r7, #0x0
    ldr r1, [r5, #0xd44]
    cmp r1, #0x0
    bls .L_160
    mov r6, r7
.L_130:
    add r0, r7, #0x1
    bl func_ov002_021b004c
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, r6
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8128
    ldr r1, [r5, #0xd44]
    add r7, r7, #0x1
    cmp r7, r1
    bcc .L_130
.L_160:
    mov r0, #0x12c
    mul r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r3, #0x12
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d59cc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_19c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022ce288
_LIT4: .word data_ov002_022d016c
