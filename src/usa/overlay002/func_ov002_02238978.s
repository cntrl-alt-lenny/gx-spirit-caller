; func_ov002_02238978 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021aff6c
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022535a4
        .extern func_ov002_0227acc8
        .global func_ov002_02238978
        .arm
func_ov002_02238978:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_2f8
    cmp r0, #0x7f
    beq .L_2c4
    cmp r0, #0x80
    bne .L_354
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r4, r0
    blt .L_298
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    mov r4, r0
.L_298:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT0
    mov r1, #0x0
    str r4, [r0, #0x5ac]
    str r1, [r0, #0x5b0]
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_2c4:
    ldrh r0, [r5, #0x2]
    ldr r1, [r1, #0x5ac]
    ldrh r2, [r5]
    cmp r1, #0x20
    movge r1, #0x20
    mov r0, r0, lsl #0x1f
    add r1, r1, #0x6
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    bl func_ov002_021e2a4c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_2f8:
    ldr r2, [r1, #0x5b0]
    ldr r0, [r1, #0x5ac]
    cmp r2, r0
    bge .L_348
    add r0, r2, #0x1
    bl func_ov002_021aff6c
    ldrh r3, [r5, #0x2]
    mov r1, r0
    ldrh r2, [r5]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    ldr r1, _LIT0
    mov r0, #0x7e
    ldr r2, [r1, #0x5b0]
    add r2, r2, #0x1
    str r2, [r1, #0x5b0]
    ldmia sp!, {r3, r4, r5, pc}
.L_348:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_354:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x0000011d
