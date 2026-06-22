; func_ov002_021d7ee4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern func_0202e2c8
        .extern func_ov002_021b9a30
        .extern func_ov002_021d479c
        .extern func_ov002_021e278c
        .global func_ov002_021d7ee4
        .arm
func_ov002_021d7ee4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r2
    ldr r2, [r7]
    mov r4, r1
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r8, r0
    mov r0, r4
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021b9a30
    cmp r0, #0x0
    blt .L_2f4
    ldrh r0, [r8, #0x2]
    and r5, r4, #0x1
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r4
    ldr r0, _LIT1
    movne r6, #0x1
    mul r2, r5, r0
    ldr r0, [r7]
    moveq r6, #0x0
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    ldr r4, [r1, r2]
    bl func_0202e2c8
    cmp r0, #0x0
    movne r0, #0xc
    moveq r0, #0xb
    mov r1, r0, lsl #0x1b
    ldr r2, [r7]
    mov r3, r6, lsl #0x10
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r2, r0, lsl #0x16
    orr r0, r5, #0x1e
    orr r0, r0, r2, lsr #0x10
    mov r2, r4, lsl #0x16
    orr r1, r5, r1, lsr #0x1a
    orr r1, r1, r2, lsr #0x10
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r0, #0x3f
    bl func_ov002_021d479c
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2c8
    cmp r0, #0x0
    bne .L_2ec
    ldr r1, [r7]
    ldrh r2, [r8, #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x1f
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    mov r0, r3, lsr #0x1f
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021e278c
.L_2ec:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2f4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf178
_LIT1: .word 0x00000868
