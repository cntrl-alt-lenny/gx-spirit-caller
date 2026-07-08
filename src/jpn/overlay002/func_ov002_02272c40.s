; func_ov002_02272c40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_02270ab0
        .extern func_ov002_022719c4
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .global func_ov002_02272c40
        .arm
func_ov002_02272c40:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    bne .L_129c
    bl func_ov002_022719c4
    ldmia sp!, {r3, r4, r5, pc}
.L_129c:
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x18
    beq .L_12b8
    cmp r1, #0x1
    beq .L_1324
    b .L_13ac
.L_12b8:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_12e8
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_12f8
.L_12e8:
    mov r1, #0x12
    bl func_ov002_021ae320
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_12f8:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_1324:
    bl func_ov002_0225930c
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    ldr r2, _LIT5
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT6
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    add r5, r5, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r3, lsr #0x1f
    mov r2, r5
    mov r0, #0x28
    bl func_ov002_0229acd0
    ldr r1, _LIT0
    mov r0, #0x1
    and r3, r4, #0xff
    and r2, r5, #0xff
    strb r0, [r1, #0x8]
    orr r2, r3, r2, lsl #0x8
    strh r2, [r1, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
.L_13ac:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_02270ab0
_LIT3: .word data_ov002_022cd238
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cf08c
_LIT6: .word 0x00000868
