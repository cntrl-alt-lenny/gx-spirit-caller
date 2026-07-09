; func_ov002_022355a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_0202b86c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021bcf50
        .extern func_ov002_021d58dc
        .extern func_ov002_021d6624
        .extern func_ov002_021d8324
        .extern func_ov002_021de390
        .extern func_ov002_021df618
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a2c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .global func_ov002_022355a0
        .arm
func_ov002_022355a0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_24
    beq .L_248
    b .L_264
.L_24:
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_264
    b .L_228
    b .L_264
    b .L_264
    b .L_264
    b .L_264
    b .L_198
    b .L_dc
    b .L_b4
    b .L_58
.L_58:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_98
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0xc
    mov r0, #0x78
    ldmia sp!, {r4, r5, pc}
.L_98:
    mov r0, r0, lsl #0x1f
    mov r1, #0x5e
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r4, r5, pc}
.L_b4:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    add sp, sp, #0xc
    mov r0, #0x7e
    ldmia sp!, {r4, r5, pc}
.L_dc:
    bl func_ov002_021afa94
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b86c
    cmp r0, #0x2
    ldrh r0, [r4, #0x2]
    bne .L_124
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r3, r2
    mov r0, r0, lsr #0x1f
    mov r1, #0xa
    bl func_ov002_021de390
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0x5ac]
    b .L_138
.L_124:
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcf50
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
.L_138:
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r1, [r1, #0x5ac]
    stmia sp, {r1, r2}
    str r2, [sp, #0x8]
    ldrh r1, [r4, #0x2]
    ldr r0, [r0]
    ldr r2, [r5]
    mov r0, r0, lsl #0x2
    mov r3, r1, lsl #0x1f
    mov r1, r0, lsr #0x18
    mov r0, r3, lsr #0x1f
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r2, r1, r2, lsr #0x1f
    mov r3, r0
    mov r1, #0xd
    bl func_ov002_021d8324
    add sp, sp, #0xc
    mov r0, #0x7d
    ldmia sp!, {r4, r5, pc}
.L_198:
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    ldr r1, [r1, #0x5ac]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_021d58dc
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r2, #0x1
    mov r3, r1, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r0, r3, lsr #0x1f
    bl func_ov002_021d6624
    bl func_ov002_021afa94
    ldrh r1, [r4, #0x2]
    ldr r0, [r0]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x13
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x13
    bl func_ov002_021df618
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    ldr r1, [r1, #0x5ac]
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d6624
    add sp, sp, #0xc
    mov r0, #0x64
    ldmia sp!, {r4, r5, pc}
.L_228:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    add sp, sp, #0xc
    mov r0, #0x64
    ldmia sp!, {r4, r5, pc}
.L_248:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_264:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
