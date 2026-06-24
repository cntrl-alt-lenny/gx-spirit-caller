; func_ov002_0221dda4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1e44
        .extern func_ov002_021d59cc
        .extern func_ov002_021d7100
        .extern func_ov002_021e2d94
        .extern func_ov002_02257b48
        .extern func_ov002_0226b034
        .global func_ov002_0221dda4
        .arm
func_ov002_0221dda4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r4, r0
    ldr r3, [r2, #0x5a8]
    sub r3, r3, #0x7b
    cmp r3, #0x5
    addls pc, pc, r3, lsl #0x2
    b .L_278
    b .L_22c
    b .L_d0
    b .L_b0
    b .L_78
    b .L_54
    b .L_3c
.L_3c:
    bl func_ov002_02257b48
    cmp r0, #0x0
    movne r0, #0x7f
    add sp, sp, #0x4
    moveq r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_54:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r0
    bl func_ov002_0226b034
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, pc}
.L_78:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb0]
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    str r0, [r2, #0x5ac]
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r2, r0, lsr #0x1f
    rsb r0, r2, #0x1
    bl func_ov002_0226b034
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, pc}
.L_b0:
    ldr r1, _LIT1
    add sp, sp, #0x4
    ldrh r1, [r1, #0xb0]
    mov r0, #0x7c
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    str r1, [r2, #0x5b0]
    ldmia sp!, {r3, r4, pc}
.L_d0:
    ldrh r1, [r4, #0x2]
    ldr r2, [r2, #0x5ac]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021c1e44
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    ldrh r2, [r4]
    mov r3, r1, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r0, r3, lsr #0x1f
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r4
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, [r1, #0x5b0]
    rsb r1, r3, #0x1
    bl func_ov002_021c1e44
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    ldrh r2, [r4]
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, [r0, #0x5b0]
    rsb r0, r3, #0x1
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    ldr ip, _LIT0
    mov r3, #0x5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldrh r2, [r4]
    ldr r1, [ip, #0x5ac]
    bl func_ov002_021d59cc
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r3, #0x5
    mov r1, r1, lsl #0x1f
    mov ip, r1, lsr #0x1f
    str ip, [sp]
    ldr r1, [r0, #0x5b0]
    ldrh r2, [r4]
    rsb r0, ip, #0x1
    bl func_ov002_021d59cc
    ldr r0, _LIT0
    ldrh r3, [r4, #0x2]
    ldr r1, [r0, #0x5ac]
    ldr r2, [r0, #0x5b0]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r4, r0, #0xff
    and r1, r1, #0xff
    orr r1, r4, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d7100
    add sp, sp, #0x4
    mov r0, #0x7b
    ldmia sp!, {r3, r4, pc}
.L_22c:
    ldrh r0, [r4, #0x2]
    ldr r1, [r2, #0x5ac]
    mov r2, #0x15
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_021e2d94
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r2, #0x15
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, [r0, #0x5b0]
    rsb r0, r3, #0x1
    mov r3, #0x1
    bl func_ov002_021e2d94
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_278:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
