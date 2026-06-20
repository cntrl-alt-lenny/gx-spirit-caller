; func_ov002_02236228 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_0202b9b0
        .extern func_0202e2c8
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bbda8
        .extern func_ov002_021e1870
        .extern func_ov002_021e286c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0223f6c4
        .extern func_ov002_0225368c
        .extern func_ov002_0225764c
        .extern func_ov002_0226b054
        .global func_ov002_02236228
        .arm
func_ov002_02236228:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x64
    bgt .L_20
    beq .L_1dc
    b .L_204
.L_20:
    sub r1, r1, #0x78
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_204
    b .L_198
    b .L_204
    b .L_204
    b .L_204
    b .L_204
    b .L_154
    b .L_12c
    b .L_204
    b .L_54
.L_54:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_124
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_124
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9ecc
    strh r0, [r4, #0xa]
    mov r0, r4
    bl func_ov002_0223f6c4
    ldrh r3, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, r0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    bne .L_108
    ldrh r0, [r4, #0xa]
    bl func_0202e2c8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x78
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    ldrh r0, [r4, #0x2]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_124:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_12c:
    bl func_ov002_0223f6c4
    ldrh r1, [r4, #0x2]
    mov r3, r0
    ldrh r2, [r4]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x6
    bl func_ov002_021af9d0
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_154:
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldrh r2, [r4, #0x2]
    mov r0, r0, lsl #0x2
    ldr r1, [r5]
    mov r3, r2, lsl #0x1f
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r0, r3, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_021e1870
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_198:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0xa]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbda8
    mov r5, r0
    ldrh r0, [r4, #0xa]
    bl func_0202b9b0
    cmp r5, r0
    bge .L_1d4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
.L_1d4:
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_1dc:
    ldrh r0, [r4, #0xa]
    bl func_0202e2c8
    cmp r0, #0x0
    bne .L_1fc
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
.L_1fc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_204:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
