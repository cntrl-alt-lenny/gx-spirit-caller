; func_ov002_02242f28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_0223de04
        .extern func_ov002_022536e8
        .global func_ov002_02242f28
        .arm
func_ov002_02242f28:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_204
    b .L_34
    b .L_a8
    b .L_dc
    b .L_140
    b .L_16c
    b .L_1a0
.L_34:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x5e
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_a8:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_dc:
    bl func_ov002_021afb74
    mov r6, r0
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    ldr r2, [r5]
    ldr r1, [r6]
    mov r5, r2, lsl #0x12
    mov r2, r0
    ldr r3, [r2]
    mov r1, r1, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r1, lsr #0x1f
    mov r0, r4
    mov r2, #0xe
    add r3, r3, r5, lsr #0x1f
    bl func_ov002_0223de04
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_140:
    ldrh r0, [r4, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_16c:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_021af9d0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_1a0:
    bl func_ov002_021afb74
    mov r6, r0
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    ldr r2, [r5]
    ldr r1, [r6]
    mov ip, r2, lsl #0x12
    mov r2, r0
    ldr r3, [r2]
    mov r1, r1, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r1, r1, lsr #0x1f
    mov r0, r4
    mov r2, #0xe
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_0223de04
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_204:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
