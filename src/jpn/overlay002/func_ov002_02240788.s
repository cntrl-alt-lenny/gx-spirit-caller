; func_ov002_02240788 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021b9dec
        .extern func_ov002_0223dbd0
        .extern func_ov002_0223dda4
        .extern func_ov002_0223f4cc
        .extern func_ov002_022574e0
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0228de2c
        .global func_ov002_02240788
        .arm
func_ov002_02240788:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5b8]
    mov r5, r1
    cmp r2, #0x0
    beq .L_1dc
    cmp r2, #0x1
    beq .L_2c0
    cmp r2, #0x2
    beq .L_2e4
    b .L_310
.L_1dc:
    bl func_ov002_022576f4
    cmp r0, #0x1
    ble .L_258
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_224
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_0228de2c
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0x5b8]
    b .L_2b8
.L_224:
    ldr r1, _LIT2
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b8]
    add r1, r1, #0x1
    str r1, [r0, #0x5b8]
    b .L_2b8
.L_258:
    mov r6, #0x0
    mov r5, r6
.L_260:
    mov r7, r5
.L_264:
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_2a0
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_0223dbd0
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2a0:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_264
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_260
.L_2b8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2c0:
    bl func_ov002_0223f4cc
    cmp r0, #0x0
    beq .L_2dc
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b8]
    add r1, r1, #0x1
    str r1, [r0, #0x5b8]
.L_2dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2e4:
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b9dec
    strh r0, [r4, #0xc]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_310:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word 0x0000010f
_LIT3: .word func_ov002_022574e0
