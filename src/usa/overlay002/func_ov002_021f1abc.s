; func_ov002_021f1abc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_0202e1e0
        .extern func_02031084
        .extern func_ov002_021b9d20
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1e10
        .global func_ov002_021f1abc
        .arm
func_ov002_021f1abc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    mov r7, r2
    mov r9, r0
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9dec
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT0
    and r2, r8, #0x1
    mov r0, #0x14
    mul r6, r2, r1
    mul r5, r7, r0
    ldr r1, _LIT1
    add r0, r1, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, _LIT2
    ldrh r0, [r9, #0x4]
    add r1, r1, r6
    add r1, r1, #0x30
    ldr r1, [r1, r5]
    mov r2, r0, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_c4
    cmp r7, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_c4:
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_e0
    cmp r7, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_e0:
    ldr r0, _LIT3
    add r0, r0, r6
    ldr r0, [r5, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9d20
    mov r5, r0
    mov r0, r4
    bl func_02031084
    cmp r5, r0
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0cc
