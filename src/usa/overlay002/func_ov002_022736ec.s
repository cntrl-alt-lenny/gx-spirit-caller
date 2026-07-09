; func_ov002_022736ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202b0ac
        .extern func_ov002_021ae320
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_022712b8
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .extern func_ov002_0229cd4c
        .global func_ov002_022736ec
        .arm
func_ov002_022736ec:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x200
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_2c8
    b .L_34
    b .L_e4
    b .L_19c
    b .L_20c
.L_34:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_64
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_b4
.L_64:
    ldr r0, _LIT3
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0xda
    bl func_ov002_0229cd4c
    ldr r0, _LIT4
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x100
    add r1, sp, #0x0
    bl func_ov002_0229cd4c
    ldr r0, _LIT0
    add r1, sp, #0x100
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_b4:
    ldr r3, _LIT5
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_e4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    addeq sp, sp, #0x200
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT6
    ldr r2, _LIT7
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT8
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
    ldr r0, _LIT0
    mov r3, #0x1
    strb r3, [r0, #0x8]
    and r2, r4, #0xff
    and r1, r5, #0xff
    orr r1, r2, r1, lsl #0x8
    strh r1, [r0, #0x10]
    ldr r3, _LIT5
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_19c:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_1cc
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_1dc
.L_1cc:
    mov r1, #0x4
    bl func_ov002_021ae320
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_1dc:
    ldr r3, _LIT5
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_20c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_298
    ldr r0, _LIT6
    ldr r2, _LIT7
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT8
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
    ldr r0, _LIT0
    mov r3, #0x2
    and r2, r4, #0xff
    and r1, r5, #0xff
    strb r3, [r0, #0x8]
    orr r1, r2, r1, lsl #0x8
    strh r1, [r0, #0x12]
    add sp, sp, #0x200
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_298:
    ldr r4, _LIT0
    mov r1, #0x0
    ldr r0, [r4, #0x18]
    mov r2, r1
    bic r5, r0, #0xff
    mov r3, r1
    mov r0, #0x29
    str r5, [r4, #0x18]
    bl func_ov002_0229acd0
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_2c8:
    mov r0, #0x0
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_022712b8
_LIT3: .word 0x000013e5
_LIT4: .word 0x000013e7
_LIT5: .word data_ov002_022cd238
_LIT6: .word data_ov002_022d008c
_LIT7: .word data_ov002_022cf08c
_LIT8: .word 0x00000868
