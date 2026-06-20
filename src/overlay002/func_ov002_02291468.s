; func_ov002_02291468 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b3618
        .extern func_ov002_021bac38
        .extern func_ov002_021bbf50
        .extern func_ov002_021bcf00
        .extern func_ov002_022812ac
        .extern func_ov002_022815a4
        .global func_ov002_02291468
        .arm
func_ov002_02291468:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bac38
    cmp r0, #0x0
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x3
    bcs .L_128
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r0, #0x0
    beq .L_128
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bcf00
    cmp r0, #0x0
    ble .L_128
    mov r5, #0x0
    ldr r4, _LIT2
    ldr r8, _LIT3
    mov r6, r5
    mov r9, r5
.L_80:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r0, r0, #0x1
    mla r1, r0, r8, r4
    add r2, r1, r6
    ldr r0, [r2, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_dc
    ldrh r1, [r2, #0x38]
    cmp r1, #0x0
    bne .L_c8
    ldr r1, [r2, #0x40]
    mov r1, r1, lsr #0x8
    tst r1, #0x1
    beq .L_dc
.L_c8:
    mov r1, r9
    bl func_ov002_022815a4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_dc:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r6, r6, #0x14
    blt .L_80
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r5, r0, lsr #0x1f
    mov r0, r5
    mov r1, r5
    bl func_ov002_022812ac
    mov r4, r0
    mov r0, r5
    rsb r1, r5, #0x1
    bl func_ov002_022812ac
    sub r0, r4, r0
    cmp r0, #0xfa0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_128:
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bac38
    movs r1, r0
    bmi .L_1b0
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3618
    ldr r1, _LIT5
    cmp r0, r1
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    and r3, r0, #0xff
    ldr r1, _LIT3
    ldr r2, _LIT2
    and r3, r3, #0x1
    mla r2, r3, r1, r2
    mov r0, r0, asr #0x8
    and r1, r0, #0xff
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r1, [r0, #0x30]
    ldr r0, _LIT6
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    cmp r1, r0
    ldrne r0, _LIT7
    cmpne r1, r0
    bne .L_1b0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00001366
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
_LIT4: .word 0x0000137d
_LIT5: .word 0x0000ffff
_LIT6: .word 0x00000fd6
_LIT7: .word 0x000011e4
