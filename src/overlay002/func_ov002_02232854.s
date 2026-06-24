; func_ov002_02232854 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021bc8c8
        .extern func_ov002_021c1e44
        .extern func_ov002_021d6808
        .extern func_ov002_021debe0
        .extern func_ov002_02210810
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_02232854
        .arm
func_ov002_02232854:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r6, r0
    ldr r3, [r2, #0x5a8]
    cmp r3, #0x7f
    beq .L_120
    cmp r3, #0x80
    bne .L_1a0
    ldrh r0, [r6, #0x6]
    mov r5, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_bc
    mov r4, r5
.L_40:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_98
    mov r0, r6
    mov r1, r5
    bl func_ov002_0223de94
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r6
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_0225764c
    cmp r0, #0x0
    bne .L_a4
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_98:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_a4:
    ldrh r0, [r6, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    cmp r5, r0, lsr #0x18
    mov r0, r0, lsr #0x18
    blt .L_40
.L_bc:
    cmp r0, #0x0
    mov r5, #0x0
    ble .L_114
    mov r4, r5
.L_cc:
    mov r0, r6
    mov r1, r5
    bl func_ov002_0223de94
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r6
    mov r3, r4
    str r4, [sp]
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_021d6808
    ldrh r0, [r6, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    cmp r5, r0, lsr #0x18
    blt .L_cc
.L_114:
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_120:
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1e44
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021debe0
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1a0:
    add r3, r3, #0x2
    str r3, [r2, #0x5a8]
    bl func_ov002_02210810
    cmp r0, #0x0
    subne r0, r0, #0x2
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
