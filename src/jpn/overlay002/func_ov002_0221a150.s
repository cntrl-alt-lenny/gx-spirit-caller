; func_ov002_0221a150 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021c9b68
        .extern func_ov002_021e2500
        .extern func_ov002_0220e428
        .extern func_ov002_02253600
        .extern func_ov002_0226aec4
        .global func_ov002_0221a150
        .arm
func_ov002_0221a150:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldrh r1, [r6, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_1a0
    b .L_17c
    b .L_14c
    b .L_58
    b .L_44
.L_44:
    bl func_ov002_0220e428
    cmp r0, #0x0
    movne r0, #0x7f
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_58:
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021c9b68
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r6, #0x2]
    mov r5, #0x0
    ldr r7, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mul r2, r1, r7
    ldr r1, _LIT2
    mov r4, r5
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bls .L_104
    ldr r8, _LIT3
.L_c8:
    ldrh r1, [r6]
    mov r2, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r5, #0x1
    bne .L_104
    ldrh r0, [r6, #0x2]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r7, r8
    ldr r1, [r1, #0xc]
    cmp r4, r1
    bcc .L_c8
.L_104:
    cmp r5, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_13c
    ldr r0, _LIT5
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_144
.L_13c:
    mov r0, #0x2d
    bl func_ov002_021ae3a4
.L_144:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_14c:
    ldr r0, _LIT5
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aec4
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_17c:
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT6
    mov r2, #0x0
    mov r3, r1, lsl #0x1f
    ldrh r1, [r0, #0xb0]
    mov r0, r3, lsr #0x1f
    bl func_ov002_021e2500
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022cd664
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022d0d8c
