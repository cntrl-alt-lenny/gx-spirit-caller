; func_ov002_02202d5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_0202e234
        .extern func_ov002_021b8ecc
        .extern func_ov002_021c1ef0
        .extern func_ov002_022018cc
        .extern func_ov002_0223de94
        .global func_ov002_02202d5c
        .arm
func_ov002_02202d5c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r1
    mov r5, r0
    beq .L_f0
    mov r0, r4
    bl func_ov002_021b8ecc
    cmp r0, #0x0
    beq .L_f0
    ldrh r1, [r4, #0x2]
    ldrh r2, [r5, #0x2]
    mov r0, r1, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    cmp r2, r0
    beq .L_f0
    ldrh r0, [r4]
    bl func_0202e234
    cmp r0, #0x0
    bne .L_f0
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    ldrh r1, [r5, #0x2]
    and r0, r0, #0xff
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_f0
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0x4
    bhi .L_f0
    mov r6, #0x0
.L_a0:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    beq .L_e4
    ldrh r1, [r5, #0x2]
    mov r0, r4
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022018cc
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r4, r5, r6, pc}
.L_e4:
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_a0
.L_f0:
    ldrh r2, [r5, #0x2]
    mov r0, r2, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    ldreq r0, _LIT0
    ldreq r1, [r0, #0x8]
    cmpeq r1, #0x0
    bne .L_130
    ldr r1, [r0]
    mov r2, r2, lsl #0x1f
    cmp r1, r2, lsr #0x1f
    beq .L_130
    ldr r0, [r0, #0x4]
    cmp r0, r2, lsr #0x1f
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_130:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd3f4
