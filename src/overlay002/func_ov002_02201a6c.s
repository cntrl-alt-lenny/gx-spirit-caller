; func_ov002_02201a6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e234
        .extern func_ov002_021b947c
        .extern func_ov002_021c93f0
        .global func_ov002_02201a6c
        .arm
func_ov002_02201a6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    cmpne r0, #0x1b
    bne .L_b0
    ldr r1, [r4, #0x14]
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bhi .L_b0
    mov r0, r1, lsl #0x8
    movs r0, r0, lsr #0x1f
    moveq r0, r1, lsl #0x9
    moveq r0, r0, lsr #0x1c
    cmpeq r0, #0xe
    bne .L_b0
    mov r0, r1, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r0, lsr #0x10
    mov r3, r2, asr #0x8
    mov r2, r1, lsl #0x10
    and r0, r0, #0xff
    and r1, r3, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021c93f0
    ldr r1, [r0]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x12
    mov r2, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    bne .L_b0
    mov r0, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_b0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
