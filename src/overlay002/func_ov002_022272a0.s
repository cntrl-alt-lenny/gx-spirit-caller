; func_ov002_022272a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021b9b64
        .extern func_ov002_021c38c4
        .extern func_ov002_021d7c1c
        .extern func_ov002_021df818
        .extern func_ov002_021e278c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02257b48
        .extern func_ov002_0226afb4
        .global func_ov002_022272a0
        .arm
func_ov002_022272a0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7e
    beq .L_268
    cmp r2, #0x7f
    beq .L_23c
    cmp r2, #0x80
    bne .L_364
    bl func_ov002_02257b48
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226afb4
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_23c:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb2]
    strh r0, [r4, #0x8]
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afb4
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_268:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb2]
    strh r0, [r4, #0xa]
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e278c
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0xa]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e278c
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c38c4
    ldrh r2, [r4, #0x2]
    ldrh r1, [r4, #0xa]
    mov r6, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c38c4
    mov r5, r0
    bl func_ov002_021e2b3c
    cmp r6, r5
    ble .L_324
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x3e8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    ldrh r0, [r4, #0xa]
    bl func_ov002_021b9b64
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021d7c1c
    b .L_360
.L_324:
    bge .L_360
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x3e8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df818
    ldrh r0, [r4, #0x8]
    bl func_ov002_021b9b64
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d7c1c
.L_360:
    bl func_ov002_021e2c5c
.L_364:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
