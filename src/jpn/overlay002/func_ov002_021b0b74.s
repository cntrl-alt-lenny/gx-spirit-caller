; func_ov002_021b0b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_ov002_021b0a74
        .extern func_ov002_021b0b24
        .global func_ov002_021b0b74
        .arm
func_ov002_021b0b74:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    mov r4, r1
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r3, [r0, #0x4]
    eor r0, r1, r2, lsr #0x1f
    cmp r3, r0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5]
    bl func_0202b824
    cmp r0, #0x17
    bne .L_124
    mov r0, #0x3a
    mov r1, #0x1
    bl func_ov002_021b0a74
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x21
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldrh r0, [r5]
    bl func_0202b86c
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0x0
    mov r2, #0x0
    ble .L_a4
    ldrh r1, [r5, #-22]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    movne r2, #0x1
    bne .L_10c
.L_a4:
    ldrh r1, [r5]
    ldr r0, _LIT1
    cmp r1, r0
    bne .L_d0
    ldr r0, _LIT2
    ldrh r1, [r5, #0x2]
    ldr r2, [r0, #0xcec]
    mov r0, r1, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    movne r2, #0x1
    moveq r2, #0x0
.L_d0:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1f
    cmpne r0, #0x20
    cmpne r0, #0x21
    bne .L_10c
    ldr r1, [r5, #0x14]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    movne r2, #0x1
    moveq r2, #0x0
.L_10c:
    cmp r2, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x22
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldmia sp!, {r3, r4, r5, pc}
.L_124:
    ldrh r0, [r5]
    bl func_0202b824
    cmp r0, #0x16
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x39
    mov r1, #0x1
    bl func_ov002_021b0a74
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x1f
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0, #0x4]
    ldr r1, [r1, #0xcec]
    eor r0, r0, #0x1
    cmp r1, r0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5]
    bl func_0202b86c
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x20
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word 0x000012c4
_LIT2: .word data_ov002_022d008c
