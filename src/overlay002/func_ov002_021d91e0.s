; func_ov002_021d91e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_020310d8
        .extern func_ov002_021b9e00
        .extern func_ov002_021b9ecc
        .extern func_ov002_021baca8
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021e30b4
        .global func_ov002_021d91e0
        .arm
func_ov002_021d91e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    mov r8, r1
    mov r7, r2
    bl func_ov002_021b9e00
    mov r4, r0
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9ecc
    bl func_020310d8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r7, #0x0
    ble .L_1a0
    ldr r2, _LIT0
    and r3, r9, #0x1
    mov r1, #0x14
    mul r6, r3, r2
    mul r5, r8, r1
    ldr r2, _LIT1
    add r1, r2, r6
    ldr r1, [r5, r1]
    mov r1, r1, lsr #0x6
    tst r1, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r4, r0
    bge .L_a4
    cmp r9, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r7, lsl #0x10
    mov r2, r0, asr #0x10
    orr r1, r1, #0x3c
    mov r0, r1, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
.L_a4:
    ldr r2, _LIT2
    mov r0, r9
    mov r1, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_114
    cmp r4, #0x5
    bge .L_114
    add r0, r4, r7
    cmp r0, #0x5
    blt .L_114
    ldr r0, _LIT3
    ldr r2, _LIT4
    ldr r0, [r0, #0xcec]
    mov ip, #0x0
    cmp r0, r9
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x1
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x2
    mov r3, r0, lsl #0x10
    mov r0, r9
    mov r1, r8
    mov r3, r3, lsr #0x10
    str ip, [sp]
    bl func_ov002_021d59cc
.L_114:
    ldr r2, _LIT5
    mov r0, r9
    mov r1, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r4, #0x4
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r0, r4, r7
    cmp r0, #0x4
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT6
    mov r0, r9, lsl #0x1f
    add r1, r1, r6
    add r1, r1, #0x30
    ldr r1, [r1, r5]
    and r4, r0, #-2147483648
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x13
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    mov r3, r8, lsl #0x10
    mov r2, r2, lsr #0x13
    orr r4, r4, #0x200000
    and r0, r3, #0x1f0000
    orr r3, r4, r0
    mov r0, r2, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1a0:
    cmp r4, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r9, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r7, lsl #0x10
    mov r2, r0, asr #0x10
    orr r1, r1, #0x3c
    mov r0, r1, lsl #0x10
    mov r1, r8, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word 0x00001817
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x0000181a
_LIT5: .word 0x000016de
_LIT6: .word data_ov002_022cf16c
