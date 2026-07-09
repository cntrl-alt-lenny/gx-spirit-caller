; func_ov002_0221662c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021e267c
        .extern func_ov002_021e26d0
        .extern func_ov002_022591d0
        .extern func_ov002_0226afa4
        .extern func_ov002_0226ea58
        .extern func_ov002_02271988
        .extern func_ov002_02290b8c
        .global func_ov002_0221662c
        .arm
func_ov002_0221662c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r1, r0, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r4, #0x2]
    mov r7, r0, lsl #0x11
    ldr r5, _LIT0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov r2, r1, lsl #0x1a
    mul r1, r3, r5
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    ldr r6, _LIT1
    mul r2, r3, r2
    add r8, r6, r1
    add r3, r8, #0x30
    ldr r3, [r3, r2]
    mov r7, r7, lsr #0x17
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r7, r2
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r3, _LIT2
    ldr r2, [r3, #0xd0]
    tst r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r2, [r4, #0xc]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT3
    ldr r2, [r2, #0x5a8]
    sub r2, r2, #0x77
    cmp r2, #0x9
    addls pc, pc, r2, lsl #0x2
    b .L_260
    b .L_250
    b .L_228
    b .L_260
    b .L_260
    b .L_260
    b .L_260
    b .L_1f8
    b .L_1b4
    b .L_170
    b .L_e0
.L_e0:
    ldr r2, _LIT4
    mov r8, #0x0
    ldr r1, [r2, r1]
    mov r7, r8
    cmp r1, #0x0
    bls .L_154
    mov r9, r8
.L_fc:
    and r1, r0, #0x1
    mla r2, r1, r5, r6
    add r1, r2, #0x120
    ldr r2, [r1, r9]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_0226ea58
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    add r7, r7, #0x1
    addne r8, r8, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r5, r6
    ldr r1, [r1, #0xc]
    add r9, r9, #0x4
    cmp r7, r1
    bcc .L_fc
.L_154:
    cmp r8, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, #0x27
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_170:
    ldr r0, _LIT5
    ldr r1, _LIT6
    ldrh r2, [r0, #0x16]
    bic r2, r2, #0x30
    strh r2, [r0, #0x16]
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_1a4
    bl func_ov002_02290b8c
    b .L_1ac
.L_1a4:
    mov r0, #0x6
    bl func_ov002_022591d0
.L_1ac:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b4:
    ldr r0, [r3, #0xd50]
    cmp r0, #0x0
    moveq r0, #0x80
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r3, #0xd64]
    cmp r0, #0x4
    cmpne r0, #0x6
    movne r0, #0x7f
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r0, #0x4
    moveq r0, #0x1
    mov r1, #0x0
    movne r0, #0x0
    mov r2, r1
    bl func_ov002_02271988
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1f8:
    ldr r1, _LIT5
    ldrh r1, [r1, #0x16]
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1f
    movne r0, #0x7f
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r4]
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_228:
    mov r1, #0x1
    bl func_ov002_021e26d0
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afa4
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_250:
    mov r1, #0x0
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_260:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022ce1a8
_LIT4: .word data_ov002_022cf098
_LIT5: .word data_ov002_022cd220
_LIT6: .word data_ov002_022cd664
