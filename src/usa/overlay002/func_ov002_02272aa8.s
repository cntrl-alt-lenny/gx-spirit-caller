; func_ov002_02272aa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .extern func_ov002_02270508
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .extern func_ov002_0229cd4c
        .global func_ov002_02272aa8
        .arm
func_ov002_02272aa8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x200
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x18
    beq .L_28
    cmp r1, #0x1
    beq .L_dc
    b .L_16c
.L_28:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_58
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_ac
.L_58:
    mov r0, r2, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0xd1
    bl func_ov002_0229cd4c
    ldr r0, _LIT3
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
.L_ac:
    ldr r3, _LIT4
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
.L_dc:
    bl func_ov002_0225930c
    cmp r0, #0x0
    addeq sp, sp, #0x200
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT5
    ldr r2, _LIT6
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT7
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
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
.L_16c:
    mov r0, #0x0
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_02270508
_LIT3: .word 0x000010bc
_LIT4: .word data_ov002_022cd238
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022cf08c
_LIT7: .word 0x00000868
