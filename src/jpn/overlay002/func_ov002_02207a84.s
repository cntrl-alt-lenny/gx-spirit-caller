; func_ov002_02207a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_0202b824
        .extern func_ov002_021b8e30
        .extern func_ov002_021b8eec
        .extern func_ov002_021c1e10
        .extern func_ov002_022017dc
        .global func_ov002_02207a84
        .arm
func_ov002_02207a84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    movs r6, r1
    mov r7, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r6
    bl func_ov002_021b8e30
    cmp r0, #0x0
    beq .L_180
    ldrh r1, [r6, #0x2]
    ldrh r2, [r7, #0x2]
    mov r0, r1, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r2, r2, #0x1
    eor r0, r0, r1, lsr #0x1f
    cmp r2, r0
    bne .L_180
    ldrh r0, [r6]
    bl func_0202b824
    cmp r0, #0x16
    bne .L_180
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_180
    ldrh r1, [r7, #0x2]
    ldr r4, _LIT0
    ldr r0, _LIT1
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r3, r2, #0x1
    mla r8, r3, r0, r4
    mov r1, r1, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    ldrh r5, [r8, r1]
    mov r0, #0x1
    mov r4, #0x0
    strh r0, [r8, r1]
    mov r8, r4
.L_b0:
    mov r9, r8
.L_b4:
    cmp r9, #0x5
    bge .L_d0
    mov r0, r4
    mov r1, r9
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_138
.L_d0:
    mov r0, r7
    mov r1, r4
    mov r2, r9
    bl func_ov002_021c1e10
    cmp r0, #0x0
    beq .L_138
    mov r0, r6
    mov r1, r4
    mov r2, r9
    bl func_ov002_022017dc
    cmp r0, #0x0
    beq .L_138
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT1
    ldr r3, _LIT0
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r4, r2, #0x1
    mov r1, r1, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, r4, r0, r3
    strh r5, [r1, r0]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_138:
    add r9, r9, #0x1
    cmp r9, #0xa
    ble .L_b4
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_b0
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT1
    ldr r3, _LIT0
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1a
    and r4, r2, #0x1
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, r4, r0, r3
    strh r5, [r1, r0]
.L_180:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf0c4
_LIT1: .word 0x00000868
